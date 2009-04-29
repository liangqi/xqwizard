// GetWindowLong
var GWL_STYLE		= -16;
var GWL_WNDPROC		= -4;

// SetWindowLong - GWL_STYLE
var WS_MAXIMIZEBOX	= 0x10000;
var WS_MINIMIZEBOX	= 0x20000;
var WS_THICKFRAME	= 0x40000;
var WS_SYSMENU		= 0x80000;
var WS_CAPTION		= 0xC00000;
var WS_VISIBLE		= 0x10000000;

// SetWindowPos
var SWP_NOSIZE		= 1;
var SWP_NOMOVE		= 2;
var SWP_NOZORDER	= 4;
var SWP_FRAMECHANGED	= 0x20;

// RemoveMenu
var SC_SIZE		= 0xF000;
var SC_MINIMIZE		= 0xF020;
var SC_MAXIMIZE		= 0xF030;
var SC_RESTORE		= 0xF120;

// GetSysColor
var COLOR_SCROLLBAR	= 0;
var COLOR_BACKGROUND	= 1;
var COLOR_ACTIVECAPTION	= 2;
var COLOR_INACTIVECAPTION = 3;
var COLOR_MENU		= 4;
var COLOR_WINDOW	= 5;
var COLOR_WINDOWFRAME	= 6;
var COLOR_MENUTEXT	= 7;
var COLOR_WINDOWTEXT	= 8;
var COLOR_CAPTIONTEXT	= 9;
var COLOR_ACTIVEBORDER	= 10;
var COLOR_INACTIVEBORDER = 11;
var COLOR_APPWORKSPACE	= 12;
var COLOR_HIGHLIGHT	= 13;
var COLOR_HIGHLIGHTTEXT	= 14;
var COLOR_BTNFACE	= 15;
var COLOR_BTNSHADOW	= 16;
var COLOR_GRAYTEXT	= 17;
var COLOR_BTNTEXT	= 18;
var COLOR_INACTIVECAPTIONTEXT = 19;
var COLOR_BTNHIGHLIGHT	= 20;
var COLOR_3DDKSHADOW	= 21;
var COLOR_3DLIGHT	= 22;
var COLOR_INFOTEXT	= 23;
var COLOR_INFOBK	= 24;
var COLOR_HOTLIGHT	= 26;
var COLOR_GRADIENTACTIVECAPTION = 27;
var COLOR_GRADIENTINACTIVECAPTION = 28;
var COLOR_DESKTOP	= COLOR_BACKGROUND;
var COLOR_3DFACE	= COLOR_BTNFACE;
var COLOR_3DSHADOW	= COLOR_BTNSHADOW;
var COLOR_3DHIGHLIGHT	= COLOR_BTNHIGHLIGHT;
var COLOR_3DHILIGHT	= COLOR_BTNHIGHLIGHT;
var COLOR_BTNHILIGHT	= COLOR_BTNHIGHLIGHT;

// MessageBox
var MB_ICONSTOP		= 16;
var MB_ICONQUESTION	= 32;
var MB_ICONEXCLAMATION	= 48;
var MB_ICONINFORMATION	= 64;
var MB_OKCANCEL		= 1;
var MB_ABORTRETRYIGNORE	= 2;
var MB_YESNOCANCEL	= 3;
var MB_YESNO		= 4;
var MB_RETRYCANCEL	= 5;

// MessageBox - Return Value
var IDOK		= 1;
var IDCANCEL		= 2;

// NotifyIcon
var NIM_ADD		= 0;
var NIM_MODIFY		= 1;
var NIM_DELETE		= 2;
var NIF_MESSAGE		= 1;
var NIF_ICON		= 2;
var NIF_TIP		= 4;
var NID_SIZE		= 88;
var WM_TRAY		= 0x401;
var WM_LBUTTONUP        = 0x202;
var WM_RBUTTONUP        = 0x205;

// Window Style
var STYLE_FIXED_NOTITLE	= 0;
var STYLE_FIXED		= 1;
var STYLE_SIZABLE_NOTITLE = 2;
var STYLE_SIZABLE	= 3;
var STYLE_DIALOG_NOTITLE = 4;
var STYLE_DIALOG	= 5;

var Global;

var JS = {
  // Retrieve "window.document" of another Window
  getDocument:function(another) {
    return another.WebBrowser.Document;
  },

  // Retrieve "window" of another Window
  getWindow:function(another) {
    return JS.getDocument(another).parentWindow;
  },

  updateWindow:function() {
    JS.callProc(JS.win32.fnUpdateWindow, VB.hWnd);
  },

  // Open a new Window
  openWindow:function(htmlFile, param) {
    var newWindow = VB.NewInstance(param);
    newWindow.WebBrowser.Navigate2(JS.appPath + htmlFile);
    return newWindow;
  },

  // Open a new Dialog (Modal)
  openDialog:function(htmlFile, param) {
    if (param == null) {
      param = {};
    }
    var newWindow = VB.NewInstance(param);
    newWindow.Param.ownerWindow = VB;
    newWindow.WebBrowser.Navigate2(JS.appPath + htmlFile);
    JS.dialogLoaded = false;
    while (!JS.dialogLoaded) {
      VB.Idle();
    }
    newWindow.Show(1, VB);
    JS.updateWindow();
  },

  // Change Style
  setStyle:function(style) {
    var hWnd = VB.hWnd;
    var dwStyle = JS.callProc(JS.win32.fnGetWindowLong, hWnd, GWL_STYLE) & WS_VISIBLE;
    switch (style) {
    case STYLE_FIXED_NOTITLE:
      break;
    case STYLE_FIXED:
      dwStyle |= WS_MINIMIZEBOX | WS_SYSMENU | WS_CAPTION;
      break;
    case STYLE_SIZABLE_NOTITLE:
      dwStyle |= WS_THICKFRAME;
      break;
    case STYLE_SIZABLE:
      dwStyle |= WS_MINIMIZEBOX | WS_MAXIMIZEBOX | WS_SYSMENU | WS_CAPTION | WS_THICKFRAME;
      break;
    case STYLE_DIALOG_NOTITLE:
      break;
    case STYLE_DIALOG:
      dwStyle |= WS_SYSMENU | WS_CAPTION;
      break;
    }
    JS.callProc(JS.win32.fnSetWindowLong, hWnd, GWL_STYLE, dwStyle);
    JS.callProc(JS.win32.fnSetWindowPos,
        hWnd, 0, 0, 0, 0, 0, SWP_NOSIZE | SWP_NOMOVE | SWP_NOZORDER | SWP_FRAMECHANGED);
    var hMenu = JS.callProc(JS.win32.fnGetSystemMenu, hWnd, false);
    if (style == STYLE_FIXED_NOTITLE || style == STYLE_FIXED) {
      JS.callProc(JS.win32.fnRemoveMenu, hMenu, SC_MAXIMIZE, 0);
    } else if (style == STYLE_DIALOG_NOTITLE || style == STYLE_DIALOG) {
      JS.callProc(JS.win32.fnRemoveMenu, hMenu, SC_RESTORE, 0);
      JS.callProc(JS.win32.fnRemoveMenu, hMenu, SC_SIZE, 0);
      JS.callProc(JS.win32.fnRemoveMenu, hMenu, SC_MINIMIZE, 0);
      JS.callProc(JS.win32.fnRemoveMenu, hMenu, SC_MAXIMIZE, 0);
    }
  },

  // Show Window (Non-Modal) or Dialog (Modal)
  show:function(style, clientWidth, clientHeight) {
    JS.setStyle(style);
    VB.Resize(clientWidth, clientHeight);
    if (VB.Param != null && typeof VB.Param.ownerWindow == "object") {
      JS.getWindow(VB.Param.ownerWindow).JS.dialogLoaded = true;
    } else {
      VB.Show();
    }
  },

  // Popup a Context Menu
  popupMenu:function(arrMenu, x, y) {
    if (JS.inPopupMenu) {
      return;
    }
    JS.inPopupMenu = true;
    if (x == null) {
      x = VB.Error;
    }
    if (y == null) {
      y = VB.Error;
    }
    var bold = -1;
    for (var i = 0; i < arrMenu.length; i ++) {
      var menuDesc = arrMenu[i];
      var menuItem = VB.MenuItem(i);
      if (i > 0) {
        VB.Load(VB.MenuItem(i));
      }
      VB.MenuItem(i).Checked = (typeof menuDesc.checked == "boolean" ? menuDesc.checked : false);
      VB.MenuItem(i).Enabled = (typeof menuDesc.enabled == "boolean" ? menuDesc.enabled : true);
      VB.MenuItem(i).Caption = menuDesc.caption;
      if (typeof menuDesc.bold == "boolean" && menuDesc.bold) {
        bold = i;
      }
    }
    VB.PopupMenu(VB.Menu, 0, x, y, bold == -1 ? VB.Error : VB.MenuItem(bold));
    for (var i = arrMenu.length - 1; i > 0; i --) {
      VB.Unload(VB.MenuItem(i));
    }
    JS.inPopupMenu = false;
  },

  // Popup an Info Dialog
  info:function(text, caption) {
    JS.callProc(JS.win32.fnMessageBox, VB.hWnd, text, caption, MB_ICONINFORMATION);
    JS.updateWindow();
  },

  // Popup an Exclaim Dialog
  warn:function(text, caption) {
    JS.callProc(JS.win32.fnMessageBox, VB.hWnd, text, caption, MB_ICONEXCLAMATION);
    JS.updateWindow();
  },

  // Popup an Error Dialog
  error:function(text, caption) {
    JS.callProc(JS.win32.fnMessageBox, VB.hWnd, text, caption, MB_ICONSTOP);
    JS.updateWindow();
  },

  // Popup a Question Dialog
  confirm:function(text, caption) {
    var retVal = JS.callProc(JS.win32.fnMessageBox, VB.hWnd, text, caption, MB_ICONQUESTION | MB_OKCANCEL) == IDOK;
    JS.updateWindow();
    return retVal;
  },

  // Sleep
  sleep:function(millisec) {
    JS.callProc(JS.win32.fnSleep, millisec);
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
      var item = arguments[1 + i];
      switch (typeof item) {
      case "number":
        VB.PutMem4(lpData, item);
        break;
      case "boolean":
        VB.PutMem4(lpData, item ? 1 : 0);
        break;
      case "string":
        arrStrings[i] = VB.AllocStr(item);
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

  // Add Tray Icon
  addTrayIcon:function(hWnd, hIcon, szTip) {
    var lpNid = VB.Alloc(NID_SIZE);
    VB.PutMem4(lpNid, NID_SIZE);
    VB.PutMem4(lpNid + 4, hWnd);
    VB.PutMem4(lpNid + 8, 0);
    VB.PutMem4(lpNid + 12, NIF_MESSAGE | NIF_ICON | NIF_TIP);
    VB.PutMem4(lpNid + 16, WM_TRAY);
    VB.PutMem4(lpNid + 20, hIcon);
    VB.PutStr(lpNid + 24, szTip);
    JS.callProc(JS.win32.fnNotifyIcon, NIM_ADD, lpNid);
    VB.Free(lpNid);
  },

  // Delete Tray Icon
  deleteTrayIcon:function(hWnd) {
    var lpNid = VB.Alloc(NID_SIZE);
    VB.PutMem4(lpNid, NID_SIZE);
    VB.PutMem4(lpNid + 4, hWnd);
    VB.PutMem4(lpNid + 8, 0);
    VB.PutMem4(lpNid + 12, 0);
    JS.callProc(JS.win32.fnNotifyIcon, NIM_DELETE, lpNid);
    VB.Free(lpNid);
  },

  // Get HTML Color Format
  getHtmlColor:function(color) {
    var colorHex = (16777216 + color).toString(16).substring(1, 7);
    var colorHexRR = colorHex.substring(4, 6);
    var colorHexGG = colorHex.substring(2, 4);
    var colorHexBB = colorHex.substring(0, 2);
    return "#" + colorHexRR + colorHexGG + colorHexBB;
  },

  // Called in "WebBrowser_DocumentComplete"
  initJS:function() {
    // Windows APIs
    JS.win32 = {};

    var modKernel = VB.LoadLibrary("KERNEL32.DLL");
    JS.win32.modKernel = modKernel;
    JS.win32.fnSleep = VB.GetProcAddress(modKernel, "Sleep");

    var modUser = VB.LoadLibrary("USER32.DLL");
    JS.win32.modUser = modUser;
    JS.win32.fnMessageBox = VB.GetProcAddress(modUser, "MessageBoxA");
    JS.win32.fnGetWindowLong = VB.GetProcAddress(modUser, "GetWindowLongA");
    JS.win32.fnSetWindowLong = VB.GetProcAddress(modUser, "SetWindowLongA");
    JS.win32.fnSetWindowPos = VB.GetProcAddress(modUser, "SetWindowPos");
    JS.win32.fnUpdateWindow = VB.GetProcAddress(modUser, "UpdateWindow");
    JS.win32.fnCallWindowProc = VB.GetProcAddress(modUser, "CallWindowProcA");
    JS.win32.fnGetSystemMenu = VB.GetProcAddress(modUser, "GetSystemMenu");
    JS.win32.fnRemoveMenu = VB.GetProcAddress(modUser, "RemoveMenu");
    JS.win32.fnGetSysColor = VB.GetProcAddress(modUser, "GetSysColor");
    JS.win32.fnLoadImage = VB.GetProcAddress(modUser, "LoadImageA");

    var modShell = VB.LoadLibrary("SHELL32.DLL");
    JS.win32.modShell = modShell;
    JS.win32.fnNotifyIcon = VB.GetProcAddress(modShell, "Shell_NotifyIconA");

    // appPath
    var lpFileName = VB.Alloc(1024);
    JS.callProc(VB.GetProcAddress(JS.win32.modKernel, "GetModuleFileNameA"), 0, lpFileName, 1024);
    var appPath = VB.GetStr(lpFileName);
    VB.Free(lpFileName);
    JS.appPath = appPath.substring(0, appPath.lastIndexOf("\\") + 1);

    // Callback API
    var modCallProc = VB.LoadLibrary(JS.appPath + "CALLPROC.DLL");
    JS.win32.fnPrepareCallback = VB.GetProcAddress(modCallProc, "_PrepareCallback@16");

    // commandLine
    JS.commandLine = VB.GetStr(JS.callProc(VB.GetProcAddress(JS.win32.modKernel, "GetCommandLineA")));

    // popupMenu Status
    JS.inPopupMenu = false;

    // Global
    if (VB.Global_ == null) {
      VB.Global_ = {};
    }
    Global = VB.Global_;

    // Call Main Routine
    main();
  }
};