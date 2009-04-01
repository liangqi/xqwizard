var Browser = {
  appPath:function() {
    var path = Form.App.Path;
    if (path.substr(path.length - 1, 1) != "\\") {
      path += "\\";
    }
    return path;
  },
  open:function(htmlFile, callback) {
    var newForm = Form.NewInstance({global:Browser.global, onLoad:callback});
    newForm.WebBrowser.Navigate2(htmlFile);
    return newForm;
  },
  onLoad:function() {
    if (Form.Param != null) {
      if (typeof Form.Param.global == "object") {
        Browser.global = Form.Param.global;
      }
      if (typeof Form.Param.callback == "function") {
        callback();
      }
    }
  },
  global:{}
}