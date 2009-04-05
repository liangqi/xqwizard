function getGlobalText() {
  text.value = Global.text;
}

function setGlobalText() {
  Global.text = text.value;
}

function newWindow() {
  JS.open("DEFAULT.HTM", STYLE_FIXED, function() {
    JS.info("Loaded!", "Test");
  });
}

var arrMyMenu = [
  {caption:"Menu Item 1", checked:true},
  {caption:"Menu Item 2", enabled:false},
  {caption:"-"},
  {caption:"-"},
  {caption:"Menu Item 3", checked:false, enabled:true},
  {caption:"Menu Item 4", checked:true, enabled:false}
];

function popupMenu() {
  JS.popupMenu(arrMyMenu, 20, 20, function(index) {
    JS.info(VB.MenuItem(index).Caption, "Test");
  });
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

function closeWindow() {
  VB.Unload(VB);
}

function onClose() {
  JS.restoreWndProc(VB.hWnd);
  alert("CLOSE!");
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

function main() {
  if (typeof Global.text != "string") {
    Global.text = "null";
  }
  text.value = Global.text;
  JS.setNewWndProc(VB.hWnd, function(hWnd, uMsg, wParam, lParam) {
    return JS.callProc(JS.win32.fnCallWindowProc, JS.getPrevWndProc(hWnd), hWnd, uMsg, wParam, lParam);
  });
}