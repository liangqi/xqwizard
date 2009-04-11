function setButton(objImage, objButton) {
  objImage.alt = objButton.alt;
  objImage.src = objButton.img;
  objImage.onmouseover = function() {
    objImage.src = objButton.imgOver;
  };
  objImage.onmouseout = function() {
    objImage.src = objButton.img;
  };
  objImage.onmousedown = function() {
    objImage.src = objButton.imgPress
  };
  objImage.onmouseup = function() {
    objImage.src = objButton.imgOver;
  };
  objImage.onclick = function() {
    objButton.onClick();
  };
}