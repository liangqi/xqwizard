var Browser = {
  global:{},
  parent:null,
  appPath:null,
  open:function(htmlFile, callback) {
    var newForm = Form.NewInstance();
    newForm.Param = {global:Browser.global, parent:Form, onLoad:callback};
    newForm.WebBrowser.Navigate2(htmlFile);
    return newForm;
  },
  onLoad:function() {
    var path = Form.App.Path;
    if (path.substr(path.length - 1, 1) != "\\") {
      path += "\\";
    }
    Browser.appPath = path;
    if (Form.Param != null) {
      if (typeof Form.Param.global == "object") {
        Browser.global = Form.Param.global;
      }
      if (typeof Form.Param.parent == "object") {
        Browser.parent = Form.Param.parent;
      }
      if (typeof Form.Param.onLoad == "function") {
        Form.Param.onLoad();
      }
    }
  },
  getDocument:function(another) {
    return another.WebBrowser.Document;
  },
  getWindow:function(another) {
    return Browser.getDocument(another).parentWindow;
  }
};