var SQUARE_SIZE = 57;
var PIECE_NAME = [
  "oo", null, null, null, null, null, null, null,
  "rk", "ra", "rb", "rn", "rr", "rc", "rp", null,
  "bk", "ba", "bb", "bn", "br", "bc", "bp", null,
];

var imgSquares = [];
var pos = new Position();
var sqSelected = 0;
var mvLast = 0;

function clickSquare(sq) {
  var pc = pos.squares[sq];
  if ((pc & SIDE_TAG(pos.sdPlayer)) != 0) {
    playSound("click");
    if (mvLast != 0) {
      drawSquare(SRC(mvLast), false);
      drawSquare(DST(mvLast), false);
    }
    if (sqSelected) {
      drawSquare(sqSelected, false);
    }
    drawSquare(sq, true);
    sqSelected = sq;
  } else if (sqSelected > 0) {
    var mv = MOVE(sqSelected, sq);
    if (pos.legalMove(mv)) {
      if (pos.makeMove(mv)) {
        drawSquare(sqSelected, true);
        drawSquare(sq, true);
        sqSelected = 0;
        mvLast = mv;
        playSound(pos.inCheck() ? "check" :
            pos.captured() ? "capture" : "move");
      } else {
        playSound("illegal");
      }
    }
  }
}

function drawSquare(sq, selected) {
  imgSquares[sq].style.backgroundImage = "url(images/" +
      PIECE_NAME[pos.squares[sq]] + (selected ? "s" : "") + ".gif)";
}

function flushBoard() {
  for (var sq = 0; sq < 256; sq ++) {
    if (IN_BOARD(sq)) {
      drawSquare(sq, false);
    }
  }
}

var dummy;

function playSound(soundFile) {
  try {
    new Audio("sounds/" + soundFile + ".wav").play();
  } catch (e) {
    dummy.innerHTML= "<embed src=\"sounds/" + soundFile +
        ".wav\" hidden=\"true\" autostart=\"true\" loop=\"false\" />";
  }
}

function main() {
  pos.fromFen("rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1");
  for (var sq = 0; sq < 256; sq ++) {
    if (!IN_BOARD(sq)) {
      imgSquares.push(null);
      continue;
    }
    var div = document.createElement("div");
    div.style.left = 3 + (FILE_X(sq) - 3) * SQUARE_SIZE;
    div.style.top = 3 + (RANK_Y(sq) - 3) * SQUARE_SIZE;
    div.style.width = SQUARE_SIZE;
    div.style.height = SQUARE_SIZE;
    div.onclick = function(sq_) {
      return function() {
        clickSquare(sq_);
      }
    } (sq);
    document.body.appendChild(div);
    imgSquares.push(div);
  }
  flushBoard();

  dummy = document.createElement("div");
  dummy.style.position = "absolute";
  document.body.appendChild(dummy);
}