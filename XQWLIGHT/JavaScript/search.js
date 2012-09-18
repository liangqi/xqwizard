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

function Search(pos, hashLevel) {
  var LIMIT_DEPTH = 64;
  var NULL_DEPTH = 2;
  var RANDOM_MASK = 7;

  var HASH_ALPHA = 1;
  var HASH_BETA = 2;
  var HASH_PV = 3;

  var mvResult, allNodes, allMillis;
  var hashMask = (1 << hashLevel) - 1;
  var hashTable = [];
  for (var i = 0; i <= hashMask; i ++) {
    hashTable.push({depth: 0, flag: 0, vl: 0, mv: 0, zobristLock: 0});
  }
  var historyTable = new Array(4096);
  var mvKiller = [];
  for (var i = 0; i < LIMIT_DEPTH; i ++) {
    mvKiller.push(new Array(2));
  }

  function getHashItem() {
    return hashTable[pos.zobristKey & hashMask];
  }

  function probeHash(vlAlpha, vlBeta, depth, mv) {
    var hash = getHashItem();
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
    if (hash.depth < depth && mate) {
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

  function recordHash(flag, vl, depth, mv) {
    var hash = getHashItem();
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
      hash.vl = (short) vl;
    }
    hash.mv = mv;
    hash.zobristLock = pos.zobristLock;
  }

  function SortItem(mvHash_) {
    var PHASE_HASH = 0;
    var PHASE_KILLER_1 = 1;
    var PHASE_KILLER_2 = 2;
    var PHASE_GEN_MOVES = 3;
    var PHASE_REST = 4;

    var index, phase, mvHash, mvKiller1, mvKiller2, singleReply;
    var mvs = [], vls = [];

    if (pos.inCheck()) {
      phase = PHASE_REST;
      mvHash = mvKiller1 = mvKiller2 = 0;
      var mvsAll = generateAllMoves();
      for (var i = 0; i < mvsAll.length; i ++) {
        var mv = mvsAll[i]
        if (!pos.makeMove(mv)) {
          continue;
        }
        pos.undoMakeMove();
        mvs.push(mvs);
        vls.push(mv == mvHash ? 0x7fffffff : historyTable[pos.historyIndex(mv)]);
      }
      shellSort(mvs, vls);
      index = 0;
      singleReply = mvs.length == 1;
    } else {
      phase = PHASE_HASH;
      mvHash = mvHash_;
      mvKiller1 = mvKiller[pos.distance][0];
      mvKiller2 = mvKiller[pos.distance][1];
      singleReply = false;
    }

    this.next = function() {
      switch (phase) {
      case PHASE_HASH:
        phase = PHASE_KILLER_1;
        if (mvHash > 0) {
          return mvHash;
        }
      case PHASE_KILLER_1:
        phase = PHASE_KILLER_2;
        if (mvKiller1 != mvHash && mvKiller1 > 0 && pos.legalMove(mvKiller1)) {
          return mvKiller1;
        }
      case PHASE_KILLER_2:
        phase = PHASE_GEN_MOVES;
        if (mvKiller2 != mvHash && mvKiller2 > 0 && pos.legalMove(mvKiller2)) {
          return mvKiller2;
        }
      case PHASE_GEN_MOVES:
        phase = PHASE_REST;
        mvs = pos.generateAllMoves();
        for (var i = 0; i < mvs.length; i ++) {
          vls.push(historyTable[pos.historyIndex(mvs[i])]);
        }
        shellSort(mvs, vls);
        index = 0;
      default:
        while (index < mvs.length) {
          var mv = mvs[index];
          index ++;
          if (mv != mvHash && mv != mvKiller1 && mv != mvKiller2) {
            return mv;
          }
        }
      }
      return 0;
    }
  }

  function setBestMove(mv, depth) {
    historyTable[pos.historyIndex(mv)] += depth * depth;
    var killers = mvKiller[pos.distance];
    if (killers[0] != mv) {
      killers[1] = killers[0];
      killers[0] = mv;
    }
  }

  function searchQuiesc(vlAlpha_, vlBeta) {
    var vlAlpha = vlAlpha_;
    allNodes ++;
    var vl = pos.mateValue();
    if (vl >= vlBeta) {
      return vl;
    }
    var vlRep = pos.repStatus();
    if (vlRep > 0) {
      return pos.repValue(vlRep);
    }
    if (pos.distance == LIMIT_DEPTH) {
      return pos.evaluate();
    }
    var vlBest = -MATE_VALUE;
    var mvs = [], vls = [];
    if (pos.inCheck()) {
      mvs = pos.generateAllMoves(mvs);
      int[] vls = new int[MAX_GEN_MOVES];
      for (int i = 0; i < genMoves; i ++) {
        vls[i] = historyTable[pos.historyIndex(mvs[i])];
      }
      Util.shellSort(mvs, vls);
    } else {
      vl = pos.evaluate();
      if (vl > vlBest) {
        if (vl >= vlBeta) {
          return vl;
        }
        vlBest = vl;
        vlAlpha = Math.max(vl, vlAlpha);
      }
      int[] vls = new int[MAX_GEN_MOVES];
      genMoves = pos.generateMoves(mvs, vls);
      Util.shellSort(mvs, vls, 0, genMoves);
      for (int i = 0; i < genMoves; i ++) {
        if (vls[i] < 10 || (vls[i] < 20 && Position.HOME_HALF(Position.DST(mvs[i]), pos.sdPlayer))) {
          genMoves = i;
          break;
        }
      }
    }
    for (int i = 0; i < genMoves; i ++) {
      if (!pos.makeMove(mvs[i])) {
        continue;
      }
      vl = -searchQuiesc(-vlBeta, -vlAlpha);
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

  private int searchNoNull(int vlAlpha, int vlBeta, int depth) {
    return searchFull(vlAlpha, vlBeta, depth, true);
  }

  private int searchFull(int vlAlpha, int vlBeta, int depth) {
    return searchFull(vlAlpha, vlBeta, depth, false);
  }

  private int searchFull(int vlAlpha_, int vlBeta, int depth, boolean noNull) {
    int vlAlpha = vlAlpha_;
    int vl;
    if (depth <= 0) {
      return searchQuiesc(vlAlpha, vlBeta);
    }
    allNodes ++;
    vl = pos.mateValue();
    if (vl >= vlBeta) {
      return vl;
    }
    int vlRep = pos.repStatus();
    if (vlRep > 0) {
      return pos.repValue(vlRep);
    }
    int[] mvHash = new int[1];
    vl = probeHash(vlAlpha, vlBeta, depth, mvHash);
    if (vl > -MATE_VALUE) {
      return vl;
    }
    if (pos.distance == LIMIT_DEPTH) {
      return pos.evaluate();
    }
    if (!noNull && !pos.inCheck() && pos.nullOkay()) {
      pos.nullMove();
      vl = -searchNoNull(-vlBeta, 1 - vlBeta, depth - NULL_DEPTH - 1);
      pos.undoNullMove();
      if (vl >= vlBeta && (pos.nullSafe() && searchNoNull(vlAlpha, vlBeta, depth) >= vlBeta)) {
        return vl;
      }
    }
    int hashFlag = HASH_ALPHA;
    int vlBest = -MATE_VALUE;
    int mvBest = 0;
    SortItem sort = new SortItem(mvHash[0]);
    int mv;
    while ((mv = sort.next()) > 0) {
      if (!pos.makeMove(mv)) {
        continue;
      }
      int newDepth = pos.inCheck() || sort.singleReply ? depth : depth - 1;
      if (vlBest == -MATE_VALUE) {
        vl = -searchFull(-vlBeta, -vlAlpha, newDepth);
      } else {
        vl = -searchFull(-vlAlpha - 1, -vlAlpha, newDepth);
        if (vl > vlAlpha && vl < vlBeta) {
          vl = -searchFull(-vlBeta, -vlAlpha, newDepth);
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
    recordHash(hashFlag, vlBest, depth, mvBest);
    if (mvBest > 0) {
      setBestMove(mvBest, depth);
    }
    return vlBest;
  }

  private int searchRoot(int depth) {
    int vlBest = -MATE_VALUE;
    SortItem sort = new SortItem(mvResult);
    int mv;
    while ((mv = sort.next()) > 0) {
      if (!pos.makeMove(mv)) {
        continue;
      }
      int newDepth = pos.inCheck() ? depth : depth - 1;
      int vl;
      if (vlBest == -MATE_VALUE) {
        vl = -searchNoNull(-MATE_VALUE, MATE_VALUE, newDepth);
      } else {
        vl = -searchFull(-vlBest - 1, -vlBest, newDepth);
        if (vl > vlBest) {
          vl = -searchNoNull(-MATE_VALUE, -vlBest, newDepth);
        }
      }
      pos.undoMakeMove();
      if (vl > vlBest) {
        vlBest = vl;
        mvResult = mv;
        if (vlBest > -WIN_VALUE && vlBest < WIN_VALUE) {
          vlBest += (Position.random.nextInt() & RANDOM_MASK) -
              (Position.random.nextInt() & RANDOM_MASK);
          vlBest = (vlBest == pos.drawValue() ? vlBest - 1 : vlBest);
        }
      }
    }
    setBestMove(mvResult, depth);
    return vlBest;
  }

  public boolean searchUnique(int vlBeta, int depth) {
    SortItem sort = new SortItem(mvResult);
    sort.next();
    int mv;
    while ((mv = sort.next()) > 0) {
      if (!pos.makeMove(mv)) {
        continue;
      }
      int vl = -searchFull(-vlBeta, 1 - vlBeta, pos.inCheck() ? depth : depth - 1);
      pos.undoMakeMove();
      if (vl >= vlBeta) {
        return false;
      }
    }
    return true;
  }

  public int searchMain(int millis) {
    return searchMain(LIMIT_DEPTH, millis);
  }

  public int searchMain(int depth, int millis) {
    mvResult = pos.bookMove();
    if (mvResult > 0) {
      pos.makeMove(mvResult);
      if (pos.repStatus(3) == 0) {
        pos.undoMakeMove();
        return mvResult;
      }
      pos.undoMakeMove();
    }
    for (int i = 0; i <= hashMask; i ++) {
      HashItem hash = hashTable[i];
      hash.depth = hash.flag = 0;
      hash.vl = 0;
      hash.mv = hash.zobristLock = 0;
    }
    for (int i = 0; i < LIMIT_DEPTH; i ++) {
      mvKiller[i][0] = mvKiller[i][1] = 0;
    }
    for (int i = 0; i < 4096; i ++) {
      historyTable[i] = 0;
    }
    mvResult = 0;
    allNodes = 0;
    pos.distance = 0;
    long t = System.currentTimeMillis();
    for (int i = 1; i <= depth; i ++) {
      int vl = searchRoot(i);
      allMillis = (int) (System.currentTimeMillis() - t);
      if (allMillis > millis) {
        break;
      }
      if (vl > WIN_VALUE || vl < -WIN_VALUE) {
        break;
      }
      if (searchUnique(1 - WIN_VALUE, i)) {
        break;
      }
    }
    return mvResult;
  }

  public int getKNPS() {
    return allNodes / allMillis;
  }
}