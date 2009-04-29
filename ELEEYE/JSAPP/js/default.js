var arrTrayMenu = [
  {caption:"Open", bold:true},
  {caption:"-"},
  {caption:"Exit"}
];

var hIcon;

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

var prevWndProc, newWndProc;

function VB_Unload() {
  if (!JS.confirm("Exit?", "Test")) {
    return false;
  }
  if (VB.WindowState == 1) {
    JS.deleteTrayIcon(VB.hWnd);
  }
  JS.callProc(JS.win32.fnSetWindowLong, VB.hWnd, GWL_WNDPROC, prevWndProc);
  VB.Free(newWndProc);
  return true;
}

function onRightClick() {
  JS.popupMenu([{caption:"No Context Menu", enabled:false}]);
  return false;
}

function openDialog() {
  JS.openDialog(JS.appPath + "dialog.htm");
}

var IDI_WARNING = 0x7F03;
var LR_DEFAULTSIZE = 0x40;
var LR_SHARED = 0x8000;
var IMAGE_ICON = 1;

var wndProcContext; // Prevent Release

function main() {
  VB.Caption = "Test";
  hIcon = JS.callProc(JS.win32.fnLoadImage, 0, IDI_WARNING, IMAGE_ICON, 0, 0, LR_DEFAULTSIZE | LR_SHARED);
  document.body.style.backgroundColor =
      JS.getHtmlColor(JS.callProc(JS.win32.fnGetSysColor, COLOR_BTNFACE));

  prevWndProc = JS.callProc(JS.win32.fnGetWindowLong, VB.hWnd, GWL_WNDPROC);
  wndProcContext = {callback:function(lpParam) {
    var hWnd = VB.GetMem4(lpParam);
    var uMsg = VB.GetMem4(lpParam + 4);
    var wParam = VB.GetMem4(lpParam + 8);
    var lParam = VB.GetMem4(lpParam + 12);

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
    return JS.callProc(JS.win32.fnCallWindowProc, prevWndProc, hWnd, uMsg, wParam, lParam);
  }};
  newWndProc = VB.Alloc(CALLBACK_SIZE);
  JS.callProc(JS.win32.fnPrepareCallback, newWndProc, VB.GenericCallback, VB.ObjPtr(wndProcContext), 16);
  JS.callProc(JS.win32.fnSetWindowLong, VB.hWnd, GWL_WNDPROC, newWndProc);

  JS.show(STYLE_FIXED, 336, 336);
}