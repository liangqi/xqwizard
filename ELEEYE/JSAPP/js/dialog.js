var GWL_EX_STYLE = -20;
var WS_EX_LAYERED = 0x80000;
var LWA_COLORKEY = 1;
var LWA_ALPHA = 2;

var WM_NCLBUTTONDOWN = 0xA1;
var HTCAPTION = 2;
var HTBOTTOMRIGHT = 0x11;

var fnSendMessage;

function clickCaption() {
  JS.callProc(fnSendMessage, VB.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0);
}

function clickBorderRightBottom() {
  JS.callProc(fnSendMessage, VB.hWnd, WM_NCLBUTTONDOWN, HTBOTTOMRIGHT, 0);
}

function main() {
  fnSendMessage = VB.GetProcAddress(JS.win32.modUser, "SendMessageA");
  lblCaption.innerHTML = "Test";
  var fnSetLayeredWindowAttributes = VB.GetProcAddress(JS.win32.modUser, "SetLayeredWindowAttributes");
  var dwExStyle = JS.callProc(JS.win32.fnGetWindowLong, VB.hWnd, GWL_EX_STYLE);
  JS.callProc(JS.win32.fnSetWindowLong, VB.hWnd, GWL_EX_STYLE, dwExStyle | WS_EX_LAYERED);
  if (fnSetLayeredWindowAttributes != 0) {
    // Not Available under Windows 95/98
    JS.callProc(fnSetLayeredWindowAttributes, VB.hWnd, 0xFF00FF, 0, LWA_COLORKEY);
  }
  setButton(imgClose, {
    alt:"Close",
    img:"images/close.gif",
    imgOver:"images/close_over.gif",
    imgPress:"images/close_press.gif",
    onClick:function() {
      VB.Unload(VB);
    }
  });

  JS.show(STYLE_DIALOG_NOTITLE, 344, 370);
}