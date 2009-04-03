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

var Browser = {
  // Open a new Window
  open:function(htmlFile, style, callback) {
    var newForm = Form.NewInstance();
    Browser.setStyle(style);
    newForm.Param = {global:Browser.global, parent:Form, onLoad:callback};
    newForm.WebBrowser.Navigate2(Browser.appPath + htmlFile);
    return newForm;
  },

  // Retrieve "window.document" of another Window
  getDocument:function(another) {
    return another.WebBrowser.Document;
  },

  // Retrieve "window" of another Window
  getWindow:function(another) {
    return Browser.getDocument(another).parentWindow;
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
    Form.CallProc(Browser.fnSetWindowLong, [Form.hWnd, GWL_STYLE, dwStyle]);
    Form.CallProc(Browser.fnSetWindowPos,
        [Form.hWnd, 0, 0, 0, 0, 0, SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_FRAMECHANGED]);
  },

  // Popup a Context Menu
  popupMenu:function(arrMenu, x, y, callback) {
    Browser.__clickMenu__ = callback;
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
    Form.PopupMenu(Form.Menu, 0, x * Browser.twipsPerPixelX, y * Browser.twipsPerPixelY);
    for (var i = arrMenu.length - 1; i > 0; i --) {
      Form.Unload(Form.MenuItem(i));
    }
  },

  // Popup an Info Dialog
  info:function(text, caption) {
    Form.CallProc(Browser.fnMessageBox, [Form.hWnd, text, caption, MB_ICONINFORMATION]);
  },

  // Popup an Exclaim Dialog
  warn:function(text, caption) {
    Form.CallProc(Browser.fnMessageBox, [Form.hWnd, text, caption, MB_ICONEXCLAMATION]);
  },

  // Popup an Error Dialog
  error:function(text, caption) {
    Form.CallProc(Browser.fnMessageBox, [Form.hWnd, text, caption, MB_ICONSTOP]);
  },

  // Popup a Question Dialog
  confirm:function(text, caption) {
    return Form.CallProc(Browser.fnMessageBox,
        [Form.hWnd, text, caption, MB_ICONQUESTION + MB_OKCANCEL]) == IDOK;
  },

  // Called in ""
  __get__:function(arr, index) {
    return arr[index];
  },

  // Called in "DocumentComplete"
  __init__:function() {
    // Windows APIs
    Browser.modKernel = Form.LoadLibrary("KERNEL32.DLL");
    Browser.modUser = Form.LoadLibrary("USER32.DLL");
    Browser.fnMessageBox = Form.GetProcAddress(Browser.modUser, "MessageBoxA");
    Browser.fnSetWindowLong = Form.GetProcAddress(Browser.modUser, "SetWindowLongA");
    Browser.fnSetWindowPos = Form.GetProcAddress(Browser.modUser, "SetWindowPos");

    // appPath
    var path = Form.App.Path;
    if (path.substr(path.length - 1, 1) != "\\") {
      path += "\\";
    }
    Browser.appPath = path;

    // twipsPerPixelX & twipsPerPixelY
    Browser.twipsPerPixelX = Form.Screen.TwipsPerPixelX;
    Browser.twipsPerPixelY = Form.Screen.TwipsPerPixelY;

    // global, parent
    if (Form.Param != null) {
      Browser.global = (typeof Form.Param.global == "object" ? Form.Param.global : null);
      Browser.parent = (typeof Form.Param.parent == "object" ? Form.Param.parent : null);
      if (typeof Form.Param.onLoad == "function") {
        Form.Param.onLoad();
      }
    }
  }
};