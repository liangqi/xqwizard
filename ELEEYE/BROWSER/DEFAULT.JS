function getGlobalText() {
  text.value = Browser.global.text;
}

function setGlobalText() {
  Browser.global.text = text.value;
}

function newWindow() {
  var newForm = Browser.open("DEFAULT.HTM", STYLE_DIALOG, function() {
    Browser.info("Loaded!", "Test");
  });
  newForm.Show();
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
  Browser.popupMenu(arrMyMenu, 20, 20, function(index) {
    Browser.info(Form.MenuItem(index).Caption, "Test");
  });
}

function callParent() {
  if (Browser.parent != null) {
    Browser.getWindow(Browser.parent).onEvent({text:text.value});
  }
}

function closeWindow() {
  Form.UnloadObject(Form);
}

function onClose() {
  alert("CLOSE!");
}

function onEvent(obj) {
  Browser.info(obj.text + "/" + text.value, "Test");
}

function popAllAttr(obj) {
  var s = "";
  for (var key in obj) {
    s += key + ", ";
  }
  alert(s);
}

function main() {
  if (Browser.global == null) {
    Browser.global = {};
  }
  if (typeof Browser.global.text != "string") {
    Browser.global.text = "null";
  }
  text.value = Browser.global.text;
}