function getGlobalText() {
  text.value = Global.text;
}

function setGlobalText() {
  Global.text = text.value;
}

function newWindow() {
  JS.open("DEFAULT.HTM", STYLE_DIALOG, function() {
    JS.info("Loaded!", "Test");
  });
}

var arrTrayMenu = [
  {caption:"Open", checked:true},
  {caption:"-"},
  {caption:"Exit"}
];

function VB_ClickMenu(index) {
  JS.info(VB.MenuItem(index).Caption, "Test");
}

function popupMenu() {
  JS.popupMenu(arrTrayMenu, -5, -5);
}

function callProc() {
  alert(JS.confirm("Confirm", "Continue?"));
}

function callTest() {
  VB.CallPrevWndProc(123456, 0, 0, 0);
}

function callParent() {
  if (JS.parent != null) {
    JS.getWindow(JS.parent).onEvent({text:text.value});
  }
}

function onEvent(obj) {
  JS.info(obj.text + "/" + text.value, "Test");
}

function popAll(obj) {
  var s = "";
  for (var key in obj) {
    s += key + ":" + obj[key] + ", ";
  }
  alert(s);
}

function popAllAttr(obj) {
  var s = "";
  for (var key in obj) {
    s += key + ", ";
  }
  alert(s);
}

function VB_Resize() {
  alert("Resize");
}

function VB_Unload() {
  if (!JS.confirm("Close?", "Unload")) {
    return true;
  }
  JS.restoreWndProc(VB.hWnd);
  return false;
}

function main() {
  document.body.style.backgroundColor =
      JS.getHtmlColor(JS.callProc(JS.win32.fnGetSysColor, COLOR_BTNFACE));

  if (typeof Global.text != "string") {
    Global.text = "null";
  }
  text.value = Global.text;

  JS.setNewWndProc(VB.hWnd, function(hWnd, uMsg, wParam, lParam) {
    if (uMsg == WM_TRAY) {
      if (lParam == WM_LBUTTONUP) {
        VB.WindowState = 0;
        VB.Show
        return false;
      } else if (lParam == WM_RBUTTONUP) {
        JS.popupMenu(arrTrayMenu);
        return false;
      }
    }
    return JS.callProc(JS.win32.fnCallWindowProc, JS.getPrevWndProc(hWnd), hWnd, uMsg, wParam, lParam);
  });
}