"use strict";

var BOARD_WIDTH = 521;
var BOARD_HEIGHT = 577;
var SQUARE_SIZE = 57;
var SQUARE_LEFT = (BOARD_WIDTH - SQUARE_SIZE * 9) >> 1;
var SQUARE_TOP = (BOARD_HEIGHT - SQUARE_SIZE * 10) >> 1;
var THINKING_SIZE = 32;
var THINKING_LEFT = (BOARD_WIDTH - THINKING_SIZE) >> 1;
var THINKING_TOP = (BOARD_HEIGHT - THINKING_SIZE) >> 1;
var MAX_STEP = 8;
var PIECE_NAME = [
  "oo", null, null, null, null, null, null, null,
  "rk", "ra", "rb", "rn", "rr", "rc", "rp", null,
  "bk", "ba", "bb", "bn", "br", "bc", "bp", null,
];

function SQ_X(sq) {
  return SQUARE_LEFT + (FILE_X(sq) - 3) * SQUARE_SIZE;
}

function SQ_Y(sq) {
  return SQUARE_TOP + (RANK_Y(sq) - 3) * SQUARE_SIZE;
}

function MOVE_PX(src, dst, step) {
  return Math.floor((src * step + dst * (MAX_STEP - step)) / MAX_STEP + .5) + "px";
}

function Board(container, images, sounds) {
  this.pos = new Position();
  this.pos.fromFen("rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1");
  this.animated = true;
  this.sound = false;
  this.search = null;
  this.imgSquares = [];
  this.sqSelected = 0;
  this.mvLast = 0;
  this.millis = 0;
  this.computer = -1;
  this.busy = false;

  container.style.position = "relative";
  container.style.width = BOARD_WIDTH + "px";
  container.style.height = BOARD_HEIGHT + "px";
  container.style.background = "url(" + images + "board.jpg)";
  var board = this;
  for (var sq = 0; sq < 256; sq ++) {
    if (!IN_BOARD(sq)) {
      this.imgSquares.push(null);
      continue;
    }
    var div = document.createElement("div");
    div.style.position = "absolute";
    div.style.left = SQ_X(sq);
    div.style.top = SQ_Y(sq);
    div.style.width = SQUARE_SIZE;
    div.style.height = SQUARE_SIZE;
    div.onclick = function(sq_) {
      return function() {
        board.clickSquare(sq_);
      }
    } (sq);
    container.appendChild(div);
    this.imgSquares.push(div);
  }

  this.thinking = document.createElement("img");
  this.thinking.style.visibility = "hidden";
  this.thinking.style.position = "absolute";
  this.thinking.style.left = THINKING_LEFT + "px";
  this.thinking.style.top = THINKING_TOP + "px";
  this.thinking.src = images + "thinking.gif";
  container.appendChild(this.thinking);

  this.dummy = document.createElement("div");
  this.dummy.style.position = "absolute";
  container.appendChild(this.dummy);

  this.playSound = function(soundFile) {
    if (!this.sound) {
      return;
    }
    try {
      new Audio(sounds + soundFile + ".wav").play();
    } catch (e) {
      this.dummy.innerHTML= "<embed src=\"" + sounds + soundFile +
          ".wav\" hidden=\"true\" autostart=\"true\" loop=\"false\" />";
    }
  }

  this.setSearch = function(hashLevel) {
    this.search = hashLevel == 0 ? null : new Search(this.pos, hashLevel);
  }

  this.flipped = function(sq) {
    return this.computer == 0 ? SQUARE_FLIP(sq) : sq;
  }

  this.addMove = function(mv) {
    if (!this.pos.legalMove(mv)) {
      return;
    }
    if (!this.pos.makeMove(mv)) {
      this.playSound("illegal");
      return;
    }
    this.busy = true;
    if (!this.animated) {
      this.postAddMove(mv);
      return;
    }
    var step = MAX_STEP - 1;
    var sqSrc = this.flipped(SRC(mv));
    var xSrc = SQ_X(sqSrc);
    var ySrc = SQ_Y(sqSrc);
    var sqDst = this.flipped(DST(mv));
    var xDst = SQ_X(sqDst);
    var yDst = SQ_Y(sqDst);
    var timer = setInterval(function() {
      if (step == 0) {
        clearInterval(timer);
        board.imgSquares[sqSrc].style.left = xSrc + "px";
        board.imgSquares[sqSrc].style.top = ySrc + "px";
        board.postAddMove(mv);
      } else {
        board.imgSquares[sqSrc].style.left = MOVE_PX(xSrc, xDst, step);
        board.imgSquares[sqSrc].style.top = MOVE_PX(ySrc, yDst, step);
        step --;
      }
    }, 16);
  }

  this.postAddMove = function(mv) {
    if (this.mvLast > 0) {
      this.drawSquare(SRC(this.mvLast), false);
      this.drawSquare(DST(this.mvLast), false);
    }
    this.drawSquare(SRC(mv), true);
    this.drawSquare(DST(mv), true);
    this.sqSelected = 0;
    this.mvLast = mv;
    if (this.pos.isMate()) {
      if (1 - this.pos.sdPlayer == this.computer) {
        this.playSound("loss");
        setTimeout(function() {
          alert("请再接再厉！");
        }, 250);
      } else {
        this.playSound("win");
        setTimeout(function() {
          alert("祝贺你取得胜利！");
        }, 250);
      }
      return;
    }
    if (1 - this.pos.sdPlayer == this.computer) {
      this.playSound(this.pos.inCheck() ? "check2" :
          this.pos.captured() ? "capture2" : "move2");
    } else {
      this.playSound(this.pos.inCheck() ? "check" :
          this.pos.captured() ? "capture" : "move");
    }
    this.response();
  }

  this.response = function() {
    if (this.search == null || this.pos.sdPlayer != this.computer) {
      this.busy = false;
      return;
    }
    this.thinking.style.visibility = "visible";
    setTimeout(function() {
      board.addMove(board.search.searchMain(LIMIT_DEPTH, board.millis));
      board.thinking.style.visibility = "hidden";
    }, 250);
  }

  this.clickSquare = function(sq_) {
    if (this.busy) {
      return;
    }
    var sq = this.flipped(sq_);
    var pc = this.pos.squares[sq];
    if ((pc & SIDE_TAG(this.pos.sdPlayer)) != 0) {
      this.playSound("click");
      if (this.mvLast != 0) {
        this.drawSquare(SRC(this.mvLast), false);
        this.drawSquare(DST(this.mvLast), false);
      }
      if (this.sqSelected) {
        this.drawSquare(this.sqSelected, false);
      }
      this.drawSquare(sq, true);
      this.sqSelected = sq;
    } else if (this.sqSelected > 0) {
      this.addMove(MOVE(this.sqSelected, sq));
    }
  }

  this.drawSquare = function(sq, selected) {
    this.imgSquares[this.flipped(sq)].style.backgroundImage = "url(" + images +
        PIECE_NAME[this.pos.squares[sq]] + (selected ? "s" : "") + ".gif)";
  }

  this.flushBoard = function() {
    for (var sq = 0; sq < 256; sq ++) {
      if (IN_BOARD(sq)) {
        this.drawSquare(sq, false);
      }
    }
  }

  this.restart = function(fen) {
    this.pos.fromFen(fen);
    this.flushBoard();
    this.response();
  }

  this.retract = function() {
    if (this.pos.mvList.length > 1) {
      this.pos.undoMakeMove();
    }
    if (this.pos.mvList.length > 1) {
      this.pos.undoMakeMove();
    }
    this.flushBoard();
    this.response();
  }

  this.setSound = function(sound) {
    this.sound = sound;
    if (sound) {
      this.playSound("click");
    }
  }

  this.flushBoard();
}