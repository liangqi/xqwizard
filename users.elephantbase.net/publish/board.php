<?php
  define("SIZE_MINI", 0);
  define("SIZE_PRINT", 1);
  define("SIZE_SMALL", 2);
  define("SIZE_LARGE", 3);

  $fen = $_GET["fen"];
  $size = $_GET["size"];
  $boardType = $_GET["board"];
  $piecesType = $_GET["pieces"];

  $gif = imagecreatetruecolor(521, 577);
  $board = imagecreatefromgif("images_l/wood.gif");
  $piece = imagecreatefromgif("images_l/wood/rk.gif");
  imagecopy($gif, $board, 0, 0, 0, 0, 521, 577);
  imagecopy($gif, $piece, 0, 0, 0, 0, 57, 57);
  Header("Content-type: image/gif");
  imagegif($gif);
  imagedestroy($gif);
?>