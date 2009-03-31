function getGlobalText() {
  text.value = Browser.GlobalMap.text;
}

function setGlobalText() {
  Browser.GlobalMap.text = text.value;
}

function newWindow() {
  var newBrowser = Browser.NewInstance();
  newBrowser.Load(Browser.Path + "DEFAULT.HTM");
  newBrowser.Form.Show();
  setTimeout(function () {
    newBrowser.Window.onEvent({text:text.value});
  }, 5000);
}

function closeWindow() {
  Browser.CloseWindow();
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
  if (typeof Browser.GlobalMap.text != "string") {
    Browser.GlobalMap.text = "ABCDEFG";
  }
  text.value = Browser.GlobalMap.text;
}