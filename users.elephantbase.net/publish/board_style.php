<?php
  define("PIECE_RED", 8);
  define("PIECE_BLACK", 16);
  define("PIECE_KING", 0);
  define("PIECE_ADVISOR", 1);
  define("PIECE_BISHOP", 2);
  define("PIECE_KNIGHT", 3);
  define("PIECE_ROOK", 4);
  define("PIECE_CANNON", 5);
  define("PIECE_PAWN", 6);

  define("SIZE_MINI", 0);
  define("SIZE_PRINT", 1);
  define("SIZE_SMALL", 2);
  define("SIZE_LARGE", 3);

  define("MINI_BOARD", 0);
  define("MINI_PIECES_SIMP", 0);
  define("MINI_PIECES_TRAD", 1);

  define("PRINT_BOARD", 0);
  define("PRINT_PIECES_SIMP", 0);
  define("PRINT_PIECES_TRAD", 1);

  define("SMALL_BOARD_WOOD", 0);
  define("SMALL_BOARD_GREEN", 1);
  define("SMALL_BOARD_WHITE", 2);
  define("SMALL_BOARD_SHEET", 3);
  define("SMALL_BOARD_CANVAS", 4);
  define("SMALL_BOARD_DROPS", 5);
  define("SMALL_BOARD_CLOUDS", 6);
  define("SMALL_BOARD_XQSTUDIO", 7);
  define("SMALL_BOARD_MOVESKY", 8);
  define("SMALL_BOARD_MRSJ", 9);
  define("SMALL_BOARD_ZMBL", 10);
  define("SMALL_BOARD_QIANHONG", 11);
  define("SMALL_PIECES_WOOD", 0);
  define("SMALL_PIECES_DELICATE", 1);
  define("SMALL_PIECES_POLISH", 2);
  define("SMALL_PIECES_XQSTUDIO", 3);
  define("SMALL_PIECES_MOVESKY", 4);
  define("SMALL_PIECES_MRSJ", 5);
  define("SMALL_PIECES_ZMBL", 6);

  define("LARGE_BOARD_WOOD", 0);
  define("LARGE_BOARD_GREEN", 1);
  define("LARGE_BOARD_WHITE", 2);
  define("LARGE_BOARD_SHEET", 3);
  define("LARGE_BOARD_CANVAS", 4);
  define("LARGE_BOARD_DROPS", 5);
  define("LARGE_BOARD_QIANHONG", 6);
  define("LARGE_PIECES_WOOD", 0);
  define("LARGE_PIECES_DELICATE", 1);
  define("LARGE_PIECES_POLISH", 2);

  $mini_board = array(
    MINI_BOARD=>"board",
  );

  $mini_pieces = array(
    MINI_PIECES_SIMP=>"simp",
    MINI_PIECES_TRAD=>"trad",
  );

  $print_board = array(
    PRINT_BOARD=>"board",
  );

  $print_pieces = array(
    PRINT_PIECES_SIMP=>"simp",
    PRINT_PIECES_TRAD=>"trad",
  );

  $small_board = array(
    SMALL_BOARD_WOOD=>"wood",
    SMALL_BOARD_GREEN=>"green",
    SMALL_BOARD_WHITE=>"white",
    SMALL_BOARD_SHEET=>"sheet",
    SMALL_BOARD_CANVAS=>"canvas",
    SMALL_BOARD_DROPS=>"drops",
    SMALL_BOARD_CLOUDS=>"clouds",
    SMALL_BOARD_XQSTUDIO=>"xqstudio",
    SMALL_BOARD_MOVESKY=>"movesky",
    SMALL_BOARD_MRSJ=>"mrsj",
    SMALL_BOARD_ZMBL=>"zmbl",
    SMALL_BOARD_QIANHONG=>"qianhong",
  );

  $small_pieces = array(
    SMALL_PIECES_WOOD=>"wood",
    SMALL_PIECES_DELICATE=>"delicate",
    SMALL_PIECES_POLISH=>"polish",
    SMALL_PIECES_XQSTUDIO=>"xqstudio",
    SMALL_PIECES_MOVESKY=>"movesky",
    SMALL_PIECES_MRSJ=>"mrsj",
    SMALL_PIECES_ZMBL=>"zmbl",
  );

  $large_board = array(
    LARGE_BOARD_WOOD=>"wood",
    LARGE_BOARD_GREEN=>"green",
    LARGE_BOARD_WHITE=>"white",
    LARGE_BOARD_SHEET=>"sheet",
    LARGE_BOARD_CANVAS=>"canvas",
    LARGE_BOARD_DROPS=>"drops",
    LARGE_BOARD_QIANHONG=>"qianhong",
  );

  $large_pieces = array(
    LARGE_PIECES_WOOD=>"wood",
    LARGE_PIECES_DELICATE=>"delicate",
    LARGE_PIECES_POLISH=>"polish",
  );

  $piece_name = array(
    (PIECE_RED + PIECE_KING)=>"rk",
    (PIECE_RED + PIECE_ADVISOR)=>"ra",
    (PIECE_RED + PIECE_BISHOP)=>"rb",
    (PIECE_RED + PIECE_KNIGHT)=>"rn",
    (PIECE_RED + PIECE_ROOK)=>"rr",
    (PIECE_RED + PIECE_CANNON)=>"rc",
    (PIECE_RED + PIECE_PAWN)=>"rp",
    (PIECE_BLACK + PIECE_KING)=>"bk",
    (PIECE_BLACK + PIECE_ADVISOR)=>"ba",
    (PIECE_BLACK + PIECE_BISHOP)=>"bb",
    (PIECE_BLACK + PIECE_KNIGHT)=>"bn",
    (PIECE_BLACK + PIECE_ROOK)=>"br",
    (PIECE_BLACK + PIECE_CANNON)=>"bc",
    (PIECE_BLACK + PIECE_PAWN)=>"bp",
  );

  class BoardStyle {
    var $width;
    var $height;
    var $left;
    var $top;
    var $span;
    var $size;
    var $images_folder;
    var $board_array;
    var $pieces_array;

    function BoardStyle($width, $height, $left, $top, $span, $size, $folder, $board, $pieces) {
      $this->width = $width;
      $this->height = $height;
      $this->left = $left;
      $this->top = $top;
      $this->span = $span;
      $this->size = $size;
      $this->folder = $folder;
      $this->board = $board;
      $this->pieces = $pieces;
    }

    function getBoardImage($board) {
      $file = $this->board[isset($this->board[$board]) ? $board : 0];
      return imagecreatefromgif(sprintf("./images_%s/%s.gif", $this->folder, $file));
    }

    function getPieceImages($pieces) {
      global $piece_name;

      $piecesFolder = $this->pieces[isset($this->pieces[$pieces]) ? $pieces : 0];
      $piecesFolder = sprintf("./images_%s/%s/", $this->folder, $piecesFolder);
      $pieceImages = array();
      foreach ($piece_name as $key=>$value) {
        $pieceImages[$key] = imagecreatefromgif($piecesFolder . $value . ".gif");
      }
      return $pieceImages;
    }

    function getPieceImage($piecesFolder, $index) {
      $pieceName = $this->piece_name[$index];
      return $pieceName ? $piecesFolder + $pieceName + ".gif" : null;
    }
  }

  function destroyPieceImages($pieceImages) {
    foreach ($pieceImages as $value) {
      imagedestroy($value);
    }
  }

  $board_styles = array(
    SIZE_MINI=>new BoardStyle(216, 240, 0, 0, 24, 24, "m", $mini_board, $mini_pieces),
    SIZE_PRINT=>new BoardStyle(354, 454, 0, 32, 36, 34, "p", $print_board, $print_pieces),
    SIZE_SMALL=>new BoardStyle(377, 417, 8, 8, 40, 41, "s", $small_board, $small_pieces),
    SIZE_LARGE=>new BoardStyle(521, 577, 8, 8, 56, 57, "l", $large_board, $large_pieces),
  );
?>