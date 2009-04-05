var GWL_STYLE = -16;

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

var JS = {
  // Open a new Window
  open:function(htmlFile, style, callback) {
    var newForm = Form.NewInstance({global:JS.global, parent:Form, onLoad:callback});
    JS.setStyle(style);
    newForm.WebBrowser.Navigate2(JS.appPath + htmlFile);
    if (style == STYLE_DIALOG) {
      newForm.Show(1, Form);
    } else {
      newForm.Show(0);
    }
    return newForm;
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
    JS.callProc(JS.fnSetWindowLong, Form.hWnd, GWL_STYLE, dwStyle);
    JS.callProc(JS.fnSetWindowPos,
        Form.hWnd, 0, 0, 0, 0, 0, SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_FRAMECHANGED);
  },

  // Popup a Context Menu
  popupMenu:function(arrMenu, x, y, callback) {
    JS.__clickMenu__ = callback;
    for (var i = 0; i < arrMenu.length; i ++) {
      var menuDesc = arrMenu[i];
      var menuItem = Form.MenuItem(i);
      if (i > 0) {
        Form.Load(Form.MenuItem(i));
      }
      Form.MenuItem(i).Checked = (typeof menuDesc.checked == "boolean" ? menuDesc.checked : false);
      Form.MenuItem(i).Enabled = (typeof menuDesc.enabled == "boolean" ? menuDesc.enabled : true);
      Form.MenuItem(i).Caption = menuDesc.caption;
    }
    Form.PopupMenu(Form.Menu, 0, x, y);
    for (var i = arrMenu.length - 1; i > 0; i --) {
      Form.Unload(Form.MenuItem(i));
    }
  },

  // Popup an Info Dialog
  info:function(text, caption) {
    JS.callProc(JS.fnMessageBox, Form.hWnd, text, caption, MB_ICONINFORMATION);
  },

  // Popup an Exclaim Dialog
  warn:function(text, caption) {
    JS.callProc(JS.fnMessageBox, Form.hWnd, text, caption, MB_ICONEXCLAMATION);
  },

  // Popup an Error Dialog
  error:function(text, caption) {
    JS.callProc(JS.fnMessageBox, Form.hWnd, text, caption, MB_ICONSTOP);
  },

  // Popup a Question Dialog
  confirm:function(text, caption) {
    return JS.callProc(JS.fnMessageBox, Form.hWnd, text, caption, MB_ICONQUESTION + MB_OKCANCEL) == IDOK;
  },

  // Allocate memory blocks for an Array
  allocArray:function(arr) {
    var lpArray = Form.Alloc(arr.length * 4);
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
      return Form.CallProc(lpProc, 0, 0);
    }
    var paramLen = arguments.length - 1;
    var lpParams = Form.Alloc(paramLen * 4);
    var lpData = lpParams;
    var arrStrings = new Array(paramLen);
    for (var i = 0; i < paramLen; i ++) {
      arrStrings[i] = 0;
      var item = arguments[i + 1];
      switch (typeof item) {
      case "number":
        Form.PutMem4(lpData, item);
        break;
      case "boolean":
        Form.PutMem4(lpData, item ? 1 : 0);
        Form.StrDup();
        break;
      case "string":
        arrStrings[i] = Form.StrDup(item);
        Form.PutMem4(lpData, arrStrings[i]);
        break;
      default:
        arrIsString.push(false);
      }
      lpData += 4;
    }
    var retVal = Form.CallProc(lpProc, lpParams, paramLen * 4);
    for (var i = 0; i < paramLen; i ++) {
      if (arrStrings[i] != 0) {
        Form.Free(arrStrings[i]);
      }
    }
    return retVal;
  },

  // Called in "DocumentComplete"
  __init__:function() {
    // Windows APIs
    JS.modKernel = Form.LoadLibrary("KERNEL32.DLL");
    JS.modUser = Form.LoadLibrary("USER32.DLL");
    JS.fnMessageBox = Form.GetProcAddress(JS.modUser, "MessageBoxA");
    JS.fnSetWindowLong = Form.GetProcAddress(JS.modUser, "SetWindowLongA");
    JS.fnSetWindowPos = Form.GetProcAddress(JS.modUser, "SetWindowPos");

    // appPath
    var lpFileName = Form.Alloc(1024);
    JS.callProc(Form.GetProcAddress(JS.modKernel, "GetModuleFileNameA"), 0, lpFileName, 1024);
    var appPath = Form.GetStr(lpFileName);
    Form.Free(lpFileName);
    JS.appPath = appPath.substring(0, appPath.lastIndexOf("\\") + 1);

    // global, parent
    if (Form.Param != null) {
      JS.global = (typeof Form.Param.global == "object" ? Form.Param.global : null);
      JS.parent = (typeof Form.Param.parent == "object" ? Form.Param.parent : null);
      if (typeof Form.Param.onLoad == "function") {
        Form.Param.onLoad();
      }
    }
  }
};