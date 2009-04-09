var GWL_EX_STYLE = -20;
var WS_EX_LAYERED = 0x80000;
var LWA_COLORKEY = 1;
var LWA_ALPHA = 2;

var dragStart = null;

function startDrag() {
  dragStart = {x:event.x, y:event.y};
  alert(dragStart);
}

function main() {
  VB.Caption = "Dialog Test";
  var fnSetLayeredWindowAttributes = VB.GetProcAddress(JS.win32.modUser, "SetLayeredWindowAttributes");
  var dwExStyle = JS.callProc(JS.win32.fnGetWindowLong, GWL_EX_STYLE);
  JS.callProc(JS.win32.fnSetWindowLong, GWL_EX_STYLE, dwExStyle | WS_EX_LAYERED);
  JS.callProc(fnSetLayeredWindowAttributes, VB.hWnd, 0xFF00FF, 0, LWA_COLORKEY);
  JS.show(STYLE_DIALOG_NOTITLE, 343, 370);
}