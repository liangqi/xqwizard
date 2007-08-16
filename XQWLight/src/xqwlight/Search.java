/*
Search.java - Source Code for XiangQi Wizard Light, Part II

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.0, Last Modified: Aug. 2007
Copyright (C) 2004-2007 www.elephantbase.net

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
package xqwlight;

public class Search {
	public static final int[] SHELL_STEP = {0, 1, 4, 13, 40, 121, 364, 1093};

	public static void shellSort(int[] mvs, int[] vls, int from, int to) {
		int stepLevel = 1;
		while (SHELL_STEP[stepLevel] < to - from) {
			stepLevel ++;
		}
		stepLevel --;
		while (stepLevel > 0) {
			int step = SHELL_STEP[stepLevel];
			for (int i = from + step; i < to; i ++) {
				int mvBest = mvs[i];
				int vlBest = vls[i];
				int j = i - step;
				while (j >= from && vlBest > vls[j]) {
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

	public static final int HASH_SIZE = 16384;
	public static final int HASH_ALPHA = 1;
	public static final int HASH_BETA = 2;
	public static final int HASH_PV = 3;
	public static final int LIMIT_DEPTH = 64;
	public static final int NULL_DEPTH = 2;
	public static final int MAX_GEN_MOVES = Position.MAX_GEN_MOVES;
	public static final int MATE_VALUE = Position.MATE_VALUE;
	public static final int WIN_VALUE = Position.WIN_VALUE;
	public static final int UNKNOWN_VALUE = MATE_VALUE + 1;

	public static class HashItem {
		public int zobristLock0, zobristLock1;
		public int depth, flag, vl, mv;

		public boolean hit(Position pos) {
			return zobristLock0 == pos.zobristLock0 && zobristLock1 == pos.zobristLock1;
		}

		public void set(Position pos, int flag, int depth, int vl, int mv) {
			zobristLock0 = pos.zobristLock0;
			zobristLock1 = pos.zobristLock1;
			this.flag = flag;
			this.depth = depth;
			if (vl > WIN_VALUE) {
				this.vl = vl + pos.distance;
			} else if (vl < -WIN_VALUE) {
				this.vl = vl - pos.distance;
			} else {
				this.vl = vl;
			}
			this.mv = mv;
		}

		public void reset() {
			zobristLock0 = zobristLock1 = 0;
			depth = flag = vl = mv = 0;
		}
	}

	public Position pos;
	public HashItem[] hashTable = new HashItem[HASH_SIZE];
	public int allNodes, mvResult;
	public int[] historyTable = new int[65536];
	public int[][] mvKiller = new int[LIMIT_DEPTH][2];

	public Search() {
		for (int i = 0; i < HASH_SIZE; i ++) {
			hashTable[i] = new HashItem();
		}
	}

	public HashItem getHashItem() {
		return hashTable[pos.zobristKey & (HASH_SIZE - 1)];
	}
	
	public int probeHash(int vlAlpha, int vlBeta, int depth, int[] mv) {
		HashItem hash = getHashItem();
		if (!hash.hit(pos)) {
			return UNKNOWN_VALUE;
		}
		mv[0] = hash.mv;
		boolean mate = false;
		if (hash.vl > WIN_VALUE) {			
			hash.vl -= pos.distance;
			mate = true;
		} else if (hash.vl < -WIN_VALUE) {
			hash.vl += pos.distance;
			mate = true;
		}
		if (hash.depth >= depth || mate) {
			if (hash.flag == HASH_BETA) {
				return (hash.vl >= vlBeta ? hash.vl : UNKNOWN_VALUE);
			} else if (hash.flag == HASH_ALPHA) {
				return (hash.vl <= vlAlpha ? hash.vl : UNKNOWN_VALUE);
			} else {
				return hash.vl;
			}
		} else {
			return UNKNOWN_VALUE;
		}
	}

	public void recordHash(int flag, int vl, int depth, int mv) {
		HashItem hash = getHashItem();
		if (hash.depth > depth) {
			return;
		}
		hash.set(pos, flag, depth, vl, mv);
	}

	public class SortItem {
		public static final int PHASE_HASH = 0;
		public static final int PHASE_KILLER_1 = 1;
		public static final int PHASE_KILLER_2 = 2;
		public static final int PHASE_GEN_MOVES = 3;
		public static final int PHASE_REST = 4;

		public int index, moves, phase;
		public int mvHash, mvKiller1, mvKiller2;
		public int[] mvs, vls;

		public SortItem(int mvHash) {
			this.mvHash = mvHash;
			this.mvKiller1 = mvKiller[pos.distance][1];
			this.mvKiller2 = mvKiller[pos.distance][2];
		}

		public int next() {
			if (phase == PHASE_HASH) {
				phase = PHASE_KILLER_1;
				if (mvHash > 0) {
					return mvHash;
				}
			}
			if (phase == PHASE_KILLER_1) {
				phase = PHASE_KILLER_2;
				if (mvKiller1 != mvHash && mvKiller1 > 0 && pos.legalMove(mvKiller1)) {
					return mvKiller1;
				}
			}
			if (phase == PHASE_KILLER_2) {
				phase = PHASE_GEN_MOVES;
				if (mvKiller2 != mvHash && mvKiller2 > 0 && pos.legalMove(mvKiller2)) {
					return mvKiller2;
				}
			}
			if (phase == PHASE_GEN_MOVES) {
				phase = PHASE_REST;
				mvs = new int[MAX_GEN_MOVES];
				vls = new int[MAX_GEN_MOVES];
				moves = pos.generateAllMoves(mvs);
				for (int i = 0; i < moves; i ++) {
					vls[i] = historyTable[mvs[i]];
				}
				shellSort(mvs, vls, 0, moves);
				index = 0;
			}
			while (index < moves) {
				int mv = mvs[index];
				index ++;
				if (mv != mvHash && mv != mvKiller1 && mv != mvKiller2) {
					return mv;
				}
			}
			return 0;
		}
	}

	public int searchQuiesc(int vlAlpha, int vlBeta) {
		allNodes ++;
		int vl = pos.mateValue();
		if (vl >= vlBeta) {
			return vl;
		}
		int vlRep = pos.isRep();
		if (vlRep > 0) {
			return pos.repValue(vlRep);
		}
		if (pos.distance == LIMIT_DEPTH) {
			return pos.evaluate();
		}
		int vlBest = -MATE_VALUE;
		int vlAlphaLocal = vlAlpha;
		int genMoves;
		int[] mvs = new int[MAX_GEN_MOVES];
		if (pos.inCheck()) {
			genMoves = pos.generateAllMoves(mvs);
			int[] vls = new int[MAX_GEN_MOVES];
			for (int i = 0; i < genMoves; i ++) {
				vls[i] = historyTable[mvs[i]];
			}
			shellSort(mvs, vls, 0, genMoves);
		} else {
			vl = pos.evaluate();
			if (vl > vlBest) {
				if (vl >= vlBeta) {
					return vl;
				}
				vlBest = vl;
				vlAlphaLocal = Math.max(vl, vlAlphaLocal);
			}
			int[] vls = new int[MAX_GEN_MOVES];
			genMoves = pos.generateMoves(mvs, vls);
			shellSort(mvs, vls, 0, genMoves);
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
			vl = -searchQuiesc(-vlBeta, -vlAlphaLocal);
			if (vl > vlBest) {
				if (vl >= vlBeta) {
					return vl;
				}
				vlBest = vl;
				vlAlphaLocal = Math.max(vl, vlAlphaLocal);
			}
		}
		return vlBest == -MATE_VALUE ? pos.mateValue() : vlBest;
	}

	public int searchNoNull(int vlAlpha, int vlBeta, int depth) {
		return searchFull(vlAlpha, vlBeta, depth, true);
	}

	public int searchFull(int vlAlpha, int vlBeta, int depth) {
		return searchFull(vlAlpha, vlBeta, depth, false);
	}

	public int searchFull(int vlAlpha, int vlBeta, int depth, boolean noNull) {
		if (depth <= 0) {
			return searchQuiesc(vlAlpha, vlBeta);
		}
		allNodes ++;
		int vl = pos.mateValue();
		if (vl >= vlBeta) {
			return vl;
		}
		int vlRep = pos.isRep();
		if (vlRep > 0) {
			return pos.repValue(vlRep);
		}
		int[] mvHash = new int[1];
		vl = probeHash(vlAlpha, vlBeta, depth, mvHash);
		if (vl != UNKNOWN_VALUE) {
			return vl;
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
		int vlAlphaLocal = vlAlpha;
		int mvBest = 0;
		SortItem sort = new SortItem(mvHash[0]);
		int mv;
		while ((mv = sort.next()) > 0) {
			if (!pos.makeMove(mv)) {
				continue;
			}
			int newDepth = pos.inCheck() ? depth : depth - 1;
			if (vlBest == -MATE_VALUE) {
				vl = -searchFull(-vlBeta, -vlAlphaLocal, newDepth);
			} else {
				vl = -searchFull(-vlAlphaLocal - 1, -vlAlphaLocal, newDepth);
				if (vl > vlAlphaLocal && vl < vlBeta) {
					vl = -searchFull(-vlBeta, -vlAlphaLocal, newDepth);
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
				if (vl > vlAlphaLocal) {
					vlAlphaLocal = vl;
					hashFlag = HASH_PV;
					mvBest = mv;
				}
			}
		}
		if (pos.distance == 0) {
			mvResult = mv;
		}
		if (vlBest == -MATE_VALUE) {
			return pos.mateValue();
		} else {
			recordHash(hashFlag, vlBest, depth, mvBest);
			if (mvBest > 0) {
				historyTable[mvBest] += depth * depth;
				int[] killers = mvKiller[pos.distance];
				if (killers[0] != mvBest) {
					killers[1] = killers[0];
					killers[0] = mvBest;
				}
			}
			return vlBest;
		}
	}

	public void searchMain(int seconds) {
		mvResult = pos.bookMove();
		if (mvResult > 0) {
			pos.makeMove(mvResult);
			if (pos.isRep(3) == 0) {
				pos.undoMakeMove();
				return;
			}
			pos.undoMakeMove();
		}
		int vl = 0;
		int[] mvs = new int[MAX_GEN_MOVES];
		int genMoves = pos.generateAllMoves(mvs);
		for (int i = 0; i < genMoves; i ++) {
			if (pos.makeMove(mvs[i])) {
				pos.undoMakeMove();
				mvResult = mvs[i];
				vl ++;
			}
		}
		if (vl == 1) {
			return;
		}
		for (int i = 0; i < HASH_SIZE; i ++) {
			hashTable[i].reset();
		}
		for (int i = 0; i < LIMIT_DEPTH; i ++) {
			mvKiller[i][0] = mvKiller[i][1] = 0;
		}
		for (int i = 0; i < 65536; i ++) {
			historyTable[i] = 0;
		}
		pos.distance = 0;
		allNodes = 0;
		long timer = System.currentTimeMillis();
		for (int i = 0; i <= LIMIT_DEPTH; i ++) {
			vl = searchNoNull(-MATE_VALUE, MATE_VALUE, i);
			if (vl > WIN_VALUE || vl < -WIN_VALUE) {
				break;
			}
			if (System.currentTimeMillis() - timer > seconds * 1000) {
				break;
			}
		}
	}
}