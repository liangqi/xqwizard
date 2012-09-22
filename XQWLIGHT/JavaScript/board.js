"use strict";

var BOARD_WIDTH = 521;
var BOARD_HEIGHT = 577;
var SQUARE_SIZE = 57;
var SQUARE_LEFT = (BOARD_WIDTH - SQUARE_SIZE * 9) >> 1;
var SQUARE_TOP = (BOARD_HEIGHT - SQUARE_SIZE * 10) >> 1;
var THINKING_SIZE = 32;
var THINKING_LEFT = (BOARD_WIDTH - THINKING_SIZE) >> 1;
var THINKING_TOP = (BOARD_HEIGHT - THINKING_SIZE) >> 1;
var PIECE_NAME = [
  "oo", null, null, null, null, null, null, null,
  "rk", "ra", "rb", "rn", "rr", "rc", "rp", null,
  "bk", "ba", "bb", "bn", "br", "bc", "bp", null,
];

function Board(container, images, sounds) {
  this.pos = new Position();
  this.pos.fromFen("rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1");
  this.search = null;
  this.imgSquares = [];
  this.sqSelected = 0;
  this.mvLast = 0;
  this.millis = 0;
  this.computer = -1;

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
    div.style.left = SQUARE_LEFT + (FILE_X(sq) - 3) * SQUARE_SIZE;
    div.style.top = SQUARE_TOP + (RANK_Y(sq) - 3) * SQUARE_SIZE;
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
    try {
      new Audio(sounds + soundFile + ".wav").play();
    } catch (e) {
      dummy.innerHTML= "<embed src=\"" + sounds + soundFile +
          ".wav\" hidden=\"true\" autostart=\"true\" loop=\"false\" />";
    }
  }

  this.setHashLevel = function(hashLevel) {
    this.search = hashLevel == 0 ? null : new Search(this.pos, hashLevel);
  }

  this.setMillis = function(millis) {
    this.millis = millis;
  }

  this.setComputer = function(computer) {
    this.computer = computer;
  }

  this.clickSquare = function(sq) {
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
      var mv = MOVE(this.sqSelected, sq);
      if (this.pos.legalMove(mv)) {
        if (this.pos.makeMove(mv)) {
          this.drawSquare(this.sqSelected, true);
          this.drawSquare(sq, true);
          this.sqSelected = 0;
          this.mvLast = mv;
          this.playSound(this.pos.inCheck() ? "check" :
              this.pos.captured() ? "capture" : "move");
          if (this.search != null && this.pos.sdPlayer == this.computer) {
            this.thinking.style.visibility = "visible";
            setTimeout(function() {
              var mv = board.search.searchMain(LIMIT_DEPTH, board.millis);
              board.pos.makeMove(mv);
              board.flushBoard();
              board.thinking.style.visibility = "hidden";
            }, 256);
          }
        } else {
          this.playSound("illegal");
        }
      }
    }
  }

  this.drawSquare = function(sq, selected) {
    this.imgSquares[sq].style.backgroundImage = "url(" + images + 
        PIECE_NAME[this.pos.squares[sq]] + (selected ? "s" : "") + ".gif)";
  }

  this.flushBoard = function() {
    for (var sq = 0; sq < 256; sq ++) {
      if (IN_BOARD(sq)) {
        this.drawSquare(sq, false);
      }
    }
  }

  this.flushBoard();
}