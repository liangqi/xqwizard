function getGlobalText() {
  text.value = JS.global.text;
}

function setGlobalText() {
  JS.global.text = text.value;
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
  popAll(VB.GetAllSettings("XQWizard", "Gui"));
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
  if (JS.global == null) {
    JS.global = {};
  }
  if (typeof JS.global.text != "string") {
    JS.global.text = "null";
  }
  text.value = JS.global.text;
}