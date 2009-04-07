var arrTrayMenu = [
  {caption:"Open", bold:true},
  {caption:"-"},
  {caption:"Exit"}
];

function VB_Resize() {
  if (VB.WindowState == 1) {
    JS.addTrayIcon(VB.hWnd, hIcon, "Test");
    VB.Hide();
  } else {
    JS.deleteTrayIcon(VB.hWnd);
  }
}

function VB_ClickMenu(index) {
  switch (VB.MenuItem(index).Caption) {
  case "Open":
    VB.WindowState = 0;
    VB.Show();
    break;
  case "Exit":
    VB.Unload(VB);
    break;
  }
}

function VB_Unload() {
  if (!JS.confirm("Exit?", "Test")) {
    return true;
  }
  if (VB.WindowState == 1) {
    JS.deleteTrayIcon(VB.hWnd);
  }
  JS.restoreWndProc(VB.hWnd);
  return false;
}

function onRightClick() {
  JS.openDialog(JS.appPath + "DIALOG.HTM");
  return false;
}

var IDI_WARNING = 0x7F03;
var LR_DEFAULTSIZE = 0x40;
var LR_SHARED = 0x8000;
var IMAGE_ICON = 1;

var hIcon;

function main() {
  VB.Caption = "Test";
  hIcon = JS.callProc(JS.win32.fnLoadImage, 0, IDI_WARNING, IMAGE_ICON, 0, 0, LR_DEFAULTSIZE | LR_SHARED);
  JS.setStyle(STYLE_FIXED);
  document.body.style.backgroundColor =
      JS.getHtmlColor(JS.callProc(JS.win32.fnGetSysColor, COLOR_BTNFACE));

  JS.setNewWndProc(VB.hWnd, function(hWnd, uMsg, wParam, lParam) {
    if (uMsg == WM_TRAY) {
      if (lParam == WM_LBUTTONUP) {
        VB.WindowState = 0;
        VB.Show();
        return false;
      } else if (lParam == WM_RBUTTONUP) {
        JS.popupMenu(arrTrayMenu);
        return false;
      }
    }
    return JS.callProc(JS.win32.fnCallWindowProc, JS.getPrevWndProc(hWnd), hWnd, uMsg, wParam, lParam);
  });
}