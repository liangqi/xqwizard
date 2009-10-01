<?php
  require_once "./board_conf.php";

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