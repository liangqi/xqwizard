<?php
  session_start();
  session_register("ejew_value");

  if (isset($_GET["act"]) && $_GET["act"] == "ejew") {
    $img_height = 50;
    $img_width = 20;

    $ejew = sprintf("%04X", mt_rand(0, 0xFFFF));
    $_SESSION["ejew_value"] = $ejew;

    $aimg = imageCreate($img_height, $img_width);
    ImageColorAllocate($aimg, 200, 200, 200);
    $black = ImageColorAllocate($aimg, 0, 0, 0);

    for ($i = 1; $i <= 100; $i ++) {
      imageString($aimg, 0, mt_rand(1, $img_height), mt_rand(1, $img_width), "*", imageColorAllocate($aimg, mt_rand(200, 255), mt_rand(200, 255), mt_rand(200, 255)));
    }
    ImageRectangle($aimg, 0, 0, $img_height - 1, $img_width - 1, $black);

    for ($i = 0; $i < strlen($ejew); $i ++) {
      imageString($aimg, 5, $i * $img_height / 5 + 6, mt_rand(1, $img_width / 10), $ejew[$i], imageColorAllocate($aimg, mt_rand(0, 100), mt_rand(0, 150), mt_rand(0, 200)));
    }
    Header("Content-type: image/png");
    ImagePng($aimg);
    ImageDestroy($aimg);
  }
?>