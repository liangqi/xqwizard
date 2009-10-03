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

  define("MINI_LEFT", 0);
  define("MINI_TOP", 0);
  define("MINI_SPAN", 24);
  define("MINI_SIZE", 24);
  define("MINI_BOARD", 0);
  define("MINI_PIECES_SIMP", 0);
  define("MINI_PIECES_TRAD", 1);

  define("PRINT_LEFT", 0);
  define("PRINT_TOP", 20);
  define("PRINT_SPAN", 36);
  define("PRINT_SIZE", 36);
  define("PRINT_BOARD", 0);
  define("PRINT_PIECES_SIMP", 0);
  define("PRINT_PIECES_TRAD", 1);

  define("SMALL_LEFT", 12);
  define("SMALL_TOP", 12);
  define("SMALL_SPAN", 40);
  define("SMALL_SIZE", 40);
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

  define("LARGE_LEFT", 12);
  define("LARGE_TOP", 12);
  define("LARGE_SPAN", 56);
  define("LARGE_SIZE", 56);
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
    MINI_BOARD=>"board",
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
    null, null, null, null, null, null, null, null,
    "rk", "ra", "rb", "rn", "rr", "rc", "rp", null,
    "ba", "ba", "bb", "bn", "br", "bc", "bp", null,
  );

  class BoardStyle {
    var $left;
    var $top;
    var $span;
    var $size;
    var $images_folder;
    var $board_array;
    var $pieces_array;

    function BoardStyle($left, $top, $span, $size, $folder, $board, $pieces) {
      $this->left = $left;
      $this->top = $top;
      $this->span = $span;
      $this->size = $size;
      $this->folder = $folder;
      $this->board = $board;
      $this->pieces = $pieces;
    }

    function getBoardImage($board) {
      $file = $this->board[$board];
      if (!$file) {
        $file = $this->board[0];
      }
      return imagecreatefromgif(sprintf("./images_%s/%s.gif", $this->folder, $file));
    }

    function getPieceImages($pieces) {
      $piecesFolder = $this->pieces[$pieces];
      if (!$piecesFolder) {
        $piecesFolder = $this->pieces[0];
      }
      $piecesFolder = sprintf("./images_%s/%s/", $this->folder, $piecesFolder);
      $pieceImages = array();
      for ($i = 8; $i < 24; $i ++) {
        if ($piece_name[$i]) {
          
        }
      }
    }

    function getPieceImage($piecesFolder, $index) {
      $pieceName = $this->piece_name[$index];
      return $pieceName ? $piecesFolder + $pieceName + ".gif" : null;
    }
  }

  $board_style = array(
    SIZE_MINI=>new BoardStyle(MINI_LEFT, MINI_TOP, MINI_SPAN, MINI_SIZE, "m", $mini_board, $mini_pieces),
    SIZE_PRINT=>new BoardStyle(PRINT_LEFT, PRINT_TOP, PRINT_SPAN, PRINT_SIZE, "p", $small_board, $small_pieces),
    SIZE_SMALL=>new BoardStyle(SMALL_LEFT, SMALL_TOP, SMALL_SPAN, SMALL_SIZE, "s", $print_board, $print_pieces),
    SIZE_LARGE=>new BoardStyle(LARGE_LEFT, LARGE_TOP, LARGE_SPAN, LARGE_SIZE, "l", $large_board, $large_pieces),
  );

  var_dump($board_style);
?>