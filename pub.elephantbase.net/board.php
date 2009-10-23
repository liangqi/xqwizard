<?php
  require_once "./board_style.php";

  $fen = isset($_GET["fen"]) ? $_GET["fen"] :
      "rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1";
  $size = isset($_GET["size"]) ? $_GET["size"] : 0;
  $board = isset($_GET["board"]) ? $_GET["board"] : 0;
  $pieces = isset($_GET["pieces"]) ? $_GET["pieces"] : 0;

  $char_piece = array(
    'K'=>PIECE_KING,
    'A'=>PIECE_ADVISOR,
    'B'=>PIECE_BISHOP,
    'N'=>PIECE_KNIGHT,
    'R'=>PIECE_ROOK,
    'C'=>PIECE_CANNON,
    'P'=>PIECE_PAWN,
  );

  // 把字符转换为棋子
  function char2Piece($c) {
    global $char_piece;

    $uc = (ord($c) > ord('Z') ? chr(ord($c) - ord('a') + ord('A')) : $c);
    if (!isset($char_piece[$uc])) {
      return 0;
    }
    return ($uc == $c ? PIECE_RED : PIECE_BLACK) + $char_piece[$uc];
  }

  // 把字符转换为数字
  function char2Digit($c) {
    $n = ord($c) - ord('0');
    return $n >= 1 && $n <= 9 ? $n : 0;
  }

  // 初始化棋盘格子
  $pcSquares = array();
  for ($i = 0; $i < 10; $i ++) {
    $pcSquares[$i] = array();
    for ($j = 0; $j < 9; $j ++) {
      $pcSquares[$i][$j] = 0;
    }
  }

  // 解析FEN串，读入"pcSquares"
  $j = 0;
  $k = 0;
  for ($i = 0; $i < strlen($fen); $i ++) {
    $c = $fen[$i];
    if ($c == ' ') {
      break;
    } else if ($c == '/') {
      $j ++;
      if ($j == 10) {
        break;
      }
      $k = 0;
    } else {
      $n = char2Digit($c);
      if ($n == 0) {
        if ($k < 9) {
          $pcSquares[$j][$k] = char2Piece($c);
          $k ++;
        }
      } else {
        for ($m = 0; $m < $n; $m ++) {
          if ($k < 9) {
            $pcSquares[$j][$k] = 0;
            $k ++;
          }
        }
      }
    }
  }

  // 开始绘制棋盘
  $board_style = $board_styles[isset($board_styles[$size]) ? $size : 0];
  $imgBoard = $board_style->getBoardImage($board);
  $imgPieces = $board_style->getPieceImages($pieces);

  $imgPiece = $imgPieces[PIECE_RED + PIECE_KING];

  $gif = imagecreatetruecolor($board_style->width, $board_style->height);
  imagecopy($gif, $imgBoard, 0, 0, 0, 0, $board_style->width, $board_style->height);
  for ($i = 0; $i < 10; $i ++) {
    for ($j = 0; $j < 9; $j ++) {
      list($x, $y) = $board_style->getCoord($i, $j);
      $pc = $pcSquares[$i][$j];
      if ($pc > 0) {
        imagecopy($gif, $imgPieces[$pc], $x, $y, 0, 0, $board_style->size, $board_style->size);
      }
    }
  }
  Header("Content-type: image/gif");
  imagegif($gif);

  imagedestroy($gif);
  imagedestroy($imgBoard);
  destroyPieceImages($imgPieces);
?>