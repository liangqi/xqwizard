var GWL_STYLE = -16;
var GWL_WNDPROC = -4;

var WS_MAXIMIZEBOX = 0x10000;
var WS_MINIMIZEBOX = 0x20000;
var WS_THICKFRAME = 0x40000;
var WS_SYSMENU = 0x80000;
var WS_CAPTION = 0xC00000;
var WS_VISIBLE = 0x10000000;

var SWP_NOSIZE = 1;
var SWP_NOMOVE = 2;
var SWP_NOZORDER = 4;
var SWP_FRAMECHANGED = 0x20;

var MB_ICONSTOP = 16;
var MB_ICONQUESTION = 32;
var MB_ICONEXCLAMATION = 48;
var MB_ICONINFORMATION = 64;
var MB_OKCANCEL = 1;
var MB_ABORTRETRYIGNORE = 2;
var MB_YESNOCANCEL = 3;
var MB_YESNO = 4;
var MB_RETRYCANCEL = 5;

var IDOK = 1;
var IDCANCEL = 2;

var STYLE_NONE = 0;
var STYLE_FIXED = 1;
var STYLE_SIZABLE = 2;
var STYLE_DIALOG = 3;

var Global;

var JS = {
  // Open a new Window
  open:function(htmlFile, style, callback) {
    var newWindow = VB.NewInstance({parent:VB, onLoad:callback});
    JS.setStyle(style);
    newWindow.WebBrowser.Navigate2(JS.appPath + htmlFile);
    if (style == STYLE_DIALOG) {
      newWindow.Show(1, VB);
    } else {
      newWindow.Show(0);
    }
    return newWindow;
  },

  // Retrieve "window.document" of another Window
  getDocument:function(another) {
    return another.WebBrowser.Document;
  },

  // Retrieve "window" of another Window
  getWindow:function(another) {
    return JS.getDocument(another).parentWindow;
  },

  // Change Style
  setStyle:function(style) {
    var dwStyle = 0;
    switch (style) {
    case STYLE_NONE:
      dwStyle = WS_THICKFRAME + WS_VISIBLE;
      break;
    case STYLE_FIXED:
      dwStyle = WS_MINIMIZEBOX + WS_SYSMENU + WS_CAPTION + WS_VISIBLE;
      break;
    case STYLE_SIZABLE:
      dwStyle = WS_MINIMIZEBOX + WS_MAXIMIZEBOX + WS_SYSMENU + WS_CAPTION + WS_THICKFRAME + WS_VISIBLE;
      break;
    case STYLE_DIALOG:
      dwStyle = WS_SYSMENU + WS_CAPTION + WS_VISIBLE;
      break;
    }
    JS.callProc(JS.win32.fnSetWindowLong, VB.hWnd, GWL_STYLE, dwStyle);
    JS.callProc(JS.win32.fnSetWindowPos,
        VB.hWnd, 0, 0, 0, 0, 0, SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_FRAMECHANGED);
  },

  // Popup a Context Menu
  popupMenu:function(arrMenu, x, y, callback) {
    JS.__clickMenu__ = callback;
    for (var i = 0; i < arrMenu.length; i ++) {
      var menuDesc = arrMenu[i];
      var menuItem = VB.MenuItem(i);
      if (i > 0) {
        VB.Load(VB.MenuItem(i));
      }
      VB.MenuItem(i).Checked = (typeof menuDesc.checked == "boolean" ? menuDesc.checked : false);
      VB.MenuItem(i).Enabled = (typeof menuDesc.enabled == "boolean" ? menuDesc.enabled : true);
      VB.MenuItem(i).Caption = menuDesc.caption;
    }
    VB.PopupMenu(VB.Menu, 0, x, y);
    for (var i = arrMenu.length - 1; i > 0; i --) {
      VB.Unload(VB.MenuItem(i));
    }
  },

  // Popup an Info Dialog
  info:function(text, caption) {
    JS.callProc(JS.win32.fnMessageBox, VB.hWnd, text, caption, MB_ICONINFORMATION);
  },

  // Popup an Exclaim Dialog
  warn:function(text, caption) {
    JS.callProc(JS.win32.fnMessageBox, VB.hWnd, text, caption, MB_ICONEXCLAMATION);
  },

  // Popup an Error Dialog
  error:function(text, caption) {
    JS.callProc(JS.win32.fnMessageBox, VB.hWnd, text, caption, MB_ICONSTOP);
  },

  // Popup a Question Dialog
  confirm:function(text, caption) {
    return JS.callProc(JS.win32.fnMessageBox, VB.hWnd, text, caption, MB_ICONQUESTION + MB_OKCANCEL) == IDOK;
  },

  // Allocate memory blocks for an Array
  allocArray:function(arr) {
    var lpArray = VB.Alloc(arr.length * 4);
    for (var i = 0; i < arr.length; i ++) {
      PutMem4(lpArray + i * 4, arr[i]);
    }
    return lpArray;
  },

  // Call Win32 API
  callProc:function() {
    var lpProc = arguments[0];
    if (lpProc == 0) {
      throw new Error("Invalid Function Address!");
    }
    if (arguments.length == 1) {
      return VB.CallProc(lpProc, 0, 0);
    }
    var paramLen = arguments.length - 1;
    var lpParams = VB.Alloc(paramLen * 4);
    var lpData = lpParams;
    var arrStrings = new Array(paramLen);
    for (var i = 0; i < paramLen; i ++) {
      arrStrings[i] = 0;
      var item = arguments[i + 1];
      switch (typeof item) {
      case "number":
        VB.PutMem4(lpData, item);
        break;
      case "boolean":
        VB.PutMem4(lpData, item ? 1 : 0);
        VB.StrDup();
        break;
      case "string":
        arrStrings[i] = VB.StrDup(item);
        VB.PutMem4(lpData, arrStrings[i]);
        break;
      default:
        VB.PutMem4(lpData, 0);
      }
      lpData += 4;
    }
    var retVal = VB.CallProc(lpProc, lpParams, paramLen * 4);
    for (var i = 0; i < paramLen; i ++) {
      if (arrStrings[i] != 0) {
        VB.Free(arrStrings[i]);
      }
    }
    return retVal;
  },

  // Set New User-Defined WndProc
  setNewWndProc:function(hWnd, wndProc) {
    Global.wndProcs["new_" + hWnd] = wndProc;
    var lpPrev = Global.wndProcs["lpPrev_" + hWnd];
    if (typeof lpPrev == "number") {
      JS.callProc(JS.win32.fnSetWindowLong, hWnd, GWL_WNDPROC, VB.NewWndProc);
    } else {
      Global.wndProcs["lpPrev_" + hWnd] =
          JS.callProc(JS.win32.fnSetWindowLong, hWnd, GWL_WNDPROC, VB.NewWndProc);
    }
  },

  // Remove User-Defined WndProc
  restoreWndProc:function(hWnd) {
    var lpPrev = Global.wndProcs["lpPrev_" + hWnd];
    if (typeof lpPrev == "number") {
      JS.callProc(JS.win32.fnSetWindowLong, hWnd, GWL_WNDPROC, lpPrev);
      delete Global.wndProcs["lpPrev_" + hWnd];
    }
  },

  // Get Default WndProc
  getPrevWndProc:function(hWnd) {
    return Global.wndProcs["lpPrev_" + hWnd];
  },

  // Called in "DocumentComplete"
  __init__:function() {
    // Windows APIs
    JS.win32 = {};
    JS.win32.modKernel = VB.LoadLibrary("KERNEL32.DLL");
    var modUser = VB.LoadLibrary("USER32.DLL");
    JS.win32.modUser = modUser;
    JS.win32.fnMessageBox = VB.GetProcAddress(modUser, "MessageBoxA");
    JS.win32.fnSetWindowLong = VB.GetProcAddress(modUser, "SetWindowLongA");
    JS.win32.fnSetWindowPos = VB.GetProcAddress(modUser, "SetWindowPos");
    JS.win32.fnCallWindowProc = VB.GetProcAddress(modUser, "CallWindowProcA");

    // appPath
    var lpFileName = VB.Alloc(1024);
    JS.callProc(VB.GetProcAddress(JS.win32.modKernel, "GetModuleFileNameA"), 0, lpFileName, 1024);
    var appPath = VB.GetStr(lpFileName);
    VB.Free(lpFileName);
    JS.appPath = appPath.substring(0, appPath.lastIndexOf("\\") + 1);

    // Global_, parent, onLoad
    if (VB.Global_ == null) {
      VB.Global_ = {};
    }
    Global = VB.Global_;
    if (Global.wndProcs == null) {
      Global.wndProcs = {};
    }
    if (VB.Param != null) {
      JS.parent = (typeof VB.Param.parent == "object" ? VB.Param.parent : null);
      if (typeof VB.Param.onLoad == "function") {
        VB.Param.onLoad();
      }
    }
  }
};