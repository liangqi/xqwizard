<?php
  session_start();
  session_register("ejew_value");

  if (isset($_GET["act"]) && $_GET["act"] == "ejew") {
    $img_height = 50;
    $img_width = 20;

    $ejew = sprintf("%04X", mt_rand(0, 0xFFFF));
    $_SESSION["ejew_value"] = $ejew;

    $img = imagecreate($img_height, $img_width);
    imagecolorallocate($img, 200, 200, 200);
    for ($i = 0; $i < 100; $i ++) {
      imagestring($img, 0, mt_rand(0, $img_height), mt_rand(0, $img_width), "*",
          imagecolorallocate($img, mt_rand(200, 255), mt_rand(200, 255), mt_rand(200, 255)));
    }
    imagerectangle($img, 0, 0, $img_height - 1, $img_width - 1,
        imagecolorallocate($img, 0, 0, 0));
    for ($i = 0; $i < strlen($ejew); $i ++) {
      imagestring($img, 5, $i * $img_height / 5 + 6, mt_rand(1, $img_width / 10), $ejew[$i],
          imagecolorallocate($img, mt_rand(0, 100), mt_rand(0, 150), mt_rand(0, 200)));
    }

    Header("Content-type: image/gif");
    imagegif($img);
    imagedestroy($img);
  }
?>