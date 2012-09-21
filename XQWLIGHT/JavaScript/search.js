"use strict";

var SHELL_STEP = [0, 1, 4, 13, 40, 121, 364, 1093];

function shellSort(mvs, vls) {
  var stepLevel = 1;
  while (SHELL_STEP[stepLevel] < mvs.length) {
    stepLevel ++;
  }
  stepLevel --;
  while (stepLevel > 0) {
    var step = SHELL_STEP[stepLevel];
    for (var i = step; i < mvs.length; i ++) {
      var mvBest = mvs[i];
      var vlBest = vls[i];
      var j = i - step;
      while (j >= 0 && vlBest > vls[j]) {
        mvs[j + step] = mvs[j];
        vls[j + step] = vls[j];
        j -= step;
      }
      mvs[j + step] = mvBest;
      vls[j + step] = vlBest;
    }
    stepLevel --;
  }
}

var PHASE_HASH = 0;
var PHASE_KILLER_1 = 1;
var PHASE_KILLER_2 = 2;
var PHASE_GEN_MOVES = 3;
var PHASE_REST = 4;

function SortItem(mvHash, pos, killerTable, historyTable) {
  this.mvs = [];
  this.vls = [];
  this.mvHash = this.mvKiller1 = this.mvKiller2 = 0;
  this.phase = PHASE_HASH;
  this.index = 0;
  this.singleReply = false;

  if (pos.inCheck()) {
    this.phase = PHASE_REST;
    var mvsAll = pos.generateMoves(null);
    for (var i = 0; i < mvsAll.length; i ++) {
      var mv = mvsAll[i]
      if (!pos.makeMove(mv)) {
        continue;
      }
      pos.undoMakeMove();
      this.mvs.push(mv);
      this.vls.push(mv == mvHash ? 0x7fffffff :
          historyTable[pos.historyIndex(mv)]);
    }
    shellSort(this.mvs, this.vls);
    this.singleReply = this.mvs.length == 1;
  } else {
    this.mvHash = mvHash;
    this.mvKiller1 = killerTable[pos.distance][0];
    this.mvKiller2 = killerTable[pos.distance][1];
  }

  this.next = function() {
    switch (this.phase) {
    case PHASE_HASH:
      this.phase = PHASE_KILLER_1;
      if (this.mvHash > 0) {
        return this.mvHash;
      }
      // No Break
    case PHASE_KILLER_1:
      this.phase = PHASE_KILLER_2;
      if (this.mvKiller1 != this.mvHash && this.mvKiller1 > 0 &&
          pos.legalMove(this.mvKiller1)) {
        return this.mvKiller1;
      }
      // No Break
    case PHASE_KILLER_2:
      this.phase = PHASE_GEN_MOVES;
      if (this.mvKiller2 != this.mvHash && this.mvKiller2 > 0 &&
          pos.legalMove(this.mvKiller2)) {
        return this.mvKiller2;
      }
      // No Break
    case PHASE_GEN_MOVES:
      this.phase = PHASE_REST;
      this.mvs = pos.generateMoves(null);
      this.vls = [];
      for (var i = 0; i < this.mvs.length; i ++) {
        this.vls.push(historyTable[pos.historyIndex(this.mvs[i])]);
      }
      shellSort(this.mvs, this.vls);
      this.index = 0;
      // No Break
    default:
      while (this.index < this.mvs.length) {
        var mv = this.mvs[this.index];
        this.index ++;
        if (mv != this.mvHash && mv != this.mvKiller1 && mv != this.mvKiller2) {
          return mv;
        }
      }
    }
    return 0;
  }
}

var LIMIT_DEPTH = 64;
var NULL_DEPTH = 2;
var RANDOMNESS = 8;

var HASH_ALPHA = 1;
var HASH_BETA = 2;
var HASH_PV = 3;

function Search(pos, hashLevel) {
  this.hashMask = (1 << hashLevel) - 1;

  this.getHashItem = function() {
    return this.hashTable[pos.zobristKey & this.hashMask];
  }

  this.probeHash = function(vlAlpha, vlBeta, depth, mv) {
    var hash = this.getHashItem();
    if (hash.zobristLock != pos.zobristLock) {
      mv[0] = 0;
      return -MATE_VALUE;
    }
    mv[0] = hash.mv;
    var mate = false;
    if (hash.vl > WIN_VALUE) {
      if (hash.vl <= BAN_VALUE) {
        return -MATE_VALUE;
      }
      hash.vl -= pos.distance;
      mate = true;
    } else if (hash.vl < -WIN_VALUE) {
      if (hash.vl >= -BAN_VALUE) {
        return -MATE_VALUE;
      }
      hash.vl += pos.distance;
      mate = true;
    } else if (hash.vl == pos.drawValue()) {
      return -MATE_VALUE;
    }
    if (hash.depth < depth && !mate) {
      return -MATE_VALUE;
    }
    if (hash.flag == HASH_BETA) {
      return (hash.vl >= vlBeta ? hash.vl : -MATE_VALUE);
    }
    if (hash.flag == HASH_ALPHA) {
      return (hash.vl <= vlAlpha ? hash.vl : -MATE_VALUE);
    }
    return hash.vl;
  }

  this.recordHash = function(flag, vl, depth, mv) {
    var hash = this.getHashItem();
    if (hash.depth > depth) {
      return;
    }
    hash.flag = flag;
    hash.depth = depth;
    if (vl > WIN_VALUE) {
      if (mv == 0 && vl <= BAN_VALUE) {
        return;
      }
      hash.vl = vl + pos.distance;
    } else if (vl < -WIN_VALUE) {
      if (mv == 0 && vl >= -BAN_VALUE) {
        return;
      }
      hash.vl = vl - pos.distance;
    } else if (vl == pos.drawValue() && mv == 0) {
      return;
    } else {
      hash.vl = vl;
    }
    hash.mv = mv;
    hash.zobristLock = pos.zobristLock;
  }

  this.setBestMove = function(mv, depth) {
    this.historyTable[pos.historyIndex(mv)] += depth * depth;
    var mvsKiller = this.killerTable[pos.distance];
    if (mvsKiller[0] != mv) {
      mvsKiller[1] = mvsKiller[0];
      mvsKiller[0] = mv;
    }
  }

  this.searchQuiesc = function(vlAlpha_, vlBeta) {
    var vlAlpha = vlAlpha_;
    this.allNodes ++;
    var vl = pos.mateValue();
    if (vl >= vlBeta) {
      return vl;
    }
    var vlRep = pos.repStatus(1);
    if (vlRep > 0) {
      return pos.repValue(vlRep);
    }
    if (pos.distance == LIMIT_DEPTH) {
      return pos.evaluate();
    }
    var vlBest = -MATE_VALUE;
    var mvs = [], vls = [];
    if (pos.inCheck()) {
      mvs = pos.generateMoves(null);
      for (var i = 0; i < mvs.length; i ++) {
        vls.push(this.historyTable[pos.historyIndex(mvs[i])]);
      }
      shellSort(mvs, vls);
    } else {
      vl = pos.evaluate();
      if (vl > vlBest) {
        if (vl >= vlBeta) {
          return vl;
        }
        vlBest = vl;
        vlAlpha = Math.max(vl, vlAlpha);
      }
      mvs = pos.generateMoves(vls);
      shellSort(mvs, vls);
      for (var i = 0; i < mvs.length; i ++) {
        if (vls[i] < 10 || (vls[i] < 20 && HOME_HALF(DST(mvs[i]), pos.sdPlayer))) {
          mvs.length = i;
          break;
        }
      }
    }
    for (var i = 0; i < mvs.length; i ++) {
      if (!pos.makeMove(mvs[i])) {
        continue;
      }
      vl = -this.searchQuiesc(-vlBeta, -vlAlpha);
      pos.undoMakeMove();
      if (vl > vlBest) {
        if (vl >= vlBeta) {
          return vl;
        }
        vlBest = vl;
        vlAlpha = Math.max(vl, vlAlpha);
      }
    }
    return vlBest == -MATE_VALUE ? pos.mateValue() : vlBest;
  }

  this.searchFull = function(vlAlpha_, vlBeta, depth, noNull) {
    var vlAlpha = vlAlpha_;
    if (depth <= 0) {
      return this.searchQuiesc(vlAlpha, vlBeta);
    }
    this.allNodes ++;
    var vl = pos.mateValue();
    if (vl >= vlBeta) {
      return vl;
    }
    var vlRep = pos.repStatus(1);
    if (vlRep > 0) {
      return pos.repValue(vlRep);
    }
    var mvHash = [0];
    vl = this.probeHash(vlAlpha, vlBeta, depth, mvHash);
    if (vl > -MATE_VALUE) {
      return vl;
    }
    if (pos.distance == LIMIT_DEPTH) {
      return pos.evaluate();
    }
    if (!noNull && !pos.inCheck() && pos.nullOkay()) {
      pos.nullMove();
      vl = -this.searchFull(-vlBeta, 1 - vlBeta, depth - NULL_DEPTH - 1, true);
      pos.undoNullMove();
      if (vl >= vlBeta && (pos.nullSafe() ||
          this.searchFull(vlAlpha, vlBeta, depth - NULL_DEPTH, true) >= vlBeta)) {
        return vl;
      }
    }
    var hashFlag = HASH_ALPHA;
    var vlBest = -MATE_VALUE;
    var mvBest = 0;
    var sort = new SortItem(mvHash[0], pos, this.killerTable, this.historyTable);
    var mv;
    while ((mv = sort.next()) > 0) {
      if (!pos.makeMove(mv)) {
        continue;
      }
      var newDepth = pos.inCheck() || sort.singleReply ? depth : depth - 1;
      if (vlBest == -MATE_VALUE) {
        vl = -this.searchFull(-vlBeta, -vlAlpha, newDepth, false);
      } else {
        vl = -this.searchFull(-vlAlpha - 1, -vlAlpha, newDepth, false);
        if (vl > vlAlpha && vl < vlBeta) {
          vl = -this.searchFull(-vlBeta, -vlAlpha, newDepth, false);
        }
      }
      pos.undoMakeMove();
      if (vl > vlBest) {
        vlBest = vl;
        if (vl >= vlBeta) {
          hashFlag = HASH_BETA;
          mvBest = mv;
          break;
        }
        if (vl > vlAlpha) {
          vlAlpha = vl;
          hashFlag = HASH_PV;
          mvBest = mv;
        }
      }
    }
    if (vlBest == -MATE_VALUE) {
      return pos.mateValue();
    }
    this.recordHash(hashFlag, vlBest, depth, mvBest);
    if (mvBest > 0) {
      this.setBestMove(mvBest, depth);
    }
    return vlBest;
  }

  this.searchRoot = function(depth) {
    var vlBest = -MATE_VALUE;
    var sort = new SortItem(this.mvResult, pos, this.killerTable, this.historyTable);
    var mv;
    while ((mv = sort.next()) > 0) {
      if (!pos.makeMove(mv)) {
        continue;
      }
      var newDepth = pos.inCheck() ? depth : depth - 1;
      var vl;
      if (vlBest == -MATE_VALUE) {
        vl = -this.searchFull(-MATE_VALUE, MATE_VALUE, newDepth, true);
      } else {
        vl = -this.searchFull(-vlBest - 1, -vlBest, newDepth, false);
        if (vl > vlBest) {
          vl = -this.searchFull(-MATE_VALUE, -vlBest, newDepth, true);
        }
      }
      pos.undoMakeMove();
      if (vl > vlBest) {
        vlBest = vl;
        this.mvResult = mv;
        if (vlBest > -WIN_VALUE && vlBest < WIN_VALUE) {
          vlBest += Math.floor(Math.random() * RANDOMNESS) -
              Math.floor(Math.random() * RANDOMNESS);
          vlBest = (vlBest == pos.drawValue() ? vlBest - 1 : vlBest);
        }
      }
    }
    this.setBestMove(this.mvResult, depth);
    return vlBest;
  }

  this.searchUnique = function(vlBeta, depth) {
    var sort = new SortItem(this.mvResult, pos, this.killerTable, this.historyTable);
    sort.next();
    var mv;
    while ((mv = sort.next()) > 0) {
      if (!pos.makeMove(mv)) {
        continue;
      }
      var vl = -this.searchFull(-vlBeta, 1 - vlBeta,
          pos.inCheck() ? depth : depth - 1, false);
      pos.undoMakeMove();
      if (vl >= vlBeta) {
        return false;
      }
    }
    return true;
  }

  this.searchMain = function(depth, millis) {
    this.mvResult = pos.bookMove();
    if (this.mvResult > 0) {
      pos.makeMove(this.mvResult);
      if (pos.repStatus(3) == 0) {
        pos.undoMakeMove();
        return this.mvResult;
      }
      pos.undoMakeMove();
    }
    this.hashTable = [];
    for (var i = 0; i <= this.hashMask; i ++) {
      this.hashTable.push({depth: 0, flag: 0, vl: 0, mv: 0, zobristLock: 0});
    }
    this.killerTable = [];
    for (var i = 0; i < LIMIT_DEPTH; i ++) {
      this.killerTable.push([0, 0]);
    }
    this.historyTable = [];
    for (var i = 0; i < 4096; i ++) {
      this.historyTable.push(0);
    }
    this.mvResult = 0;
    this.allNodes = 0;
    pos.distance = 0;
    var t = new Date().getTime();
    for (var i = 1; i <= depth; i ++) {
      var vl = this.searchRoot(i);
      this.allMillis = new Date().getTime() - t;
      if (this.allMillis > millis) {
        break;
      }
      if (vl > WIN_VALUE || vl < -WIN_VALUE) {
        break;
      }
      if (this.searchUnique(1 - WIN_VALUE, i)) {
        break;
      }
    }
    return this.mvResult;
  }

  this.getKNPS = function() {
    return this.allNodes / this.allMillis;
  }
}