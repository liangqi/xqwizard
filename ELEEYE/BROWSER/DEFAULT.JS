function getGlobalText() {
  text.value = Browser.global.text;
}

function setGlobalText() {
  Browser.global.text = text.value;
}

function newWindow() {
  var newForm = Browser.open(Browser.appPath() + "DEFAULT.HTM", function() {
    alert("Loaded!");
  });
  newForm.Show();
  newForm.BorderStyle = 3;
/*
  setTimeout(function () {
    newForm.WebBrowser.Document.parentWindow.onEvent({text:text.value});
  }, 5000);
*/
}

function closeWindow() {
  Form.MenuItem(0).Caption = "ABC";
  Form.LoadObject(Form.MenuItem(1));
  Form.LoadObject(Form.MenuItem(2));
  Form.LoadObject(Form.MenuItem(3));
  Form.MenuItem(1).Caption = "-";
  Form.MenuItem(2).Caption = "GHI";
  Form.MenuItem(3).Caption = "FFF";
  Form.PopupMenu(Form.Menu, 0, 150, 150);
  // Form.UnloadObject(Form);
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