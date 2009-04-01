function getGlobalText() {
  text.value = Browser.global.text;
}

function setGlobalText() {
  Browser.global.text = text.value;
}

function newWindow() {
  var newForm = Browser.open(Browser.appPath + "DEFAULT.HTM", function() {
    alert("Loaded!");
  });
  newForm.Show();
}

function onClickMenuItem(index) {
  alert(Form.MenuItem(index).Caption);
}

function popupMenu() {
  Form.MenuItem(0).Caption = "Menu Item 1";
  Form.Load(Form.MenuItem(1));
  Form.MenuItem(1).Caption = "-";
  Form.Load(Form.MenuItem(2));
  Form.MenuItem(2).Caption = "Menu Item 2";
  Form.Load(Form.MenuItem(3));
  Form.MenuItem(3).Caption = "Menu Item 3";
  Form.PopupMenu(Form.Menu, 0, 150, 150);
}

function callParent() {
  if (Browser.parent != null) {
    Browser.getWindow(Browser.parent).onEvent({text:text.value});
  }
}

function closeWindow() {
  Form.UnloadObject(Form);
}

function popAllAttr(obj) {
  var s = "";
  for (var key in obj) {
    s += key + ", ";
  }
  alert(s);
}

function onEvent(obj) {
  alert(obj.text + "/" + text.value);
}

function main() {
  Browser.onLoad();
  if (typeof Browser.global.text != "string") {
    Browser.global.text = "null";
  }
  text.value = Browser.global.text;
}