/*
Search.java - Source Code for XiangQi Wizard Light, Part II

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.13, Last Modified: Dec. 2007
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
	public static final int HASH_SIZE = 4096;
	public static final int HASH_ALPHA = 1;
	public static final int HASH_BETA = 2;
	public static final int HASH_PV = 3;
	public static final int LIMIT_DEPTH = 64;
	public static final int NULL_DEPTH = 2;
	public static final int RANDOM_MASK = 7;
	public static final int MAX_GEN_MOVES = Position.MAX_GEN_MOVES;
	public static final int MATE_VALUE = Position.MATE_VALUE;
	public static final int BAN_VALUE = Position.BAN_VALUE;
	public static final int WIN_VALUE = Position.WIN_VALUE;

	public static class HashItem {
		public byte depth, flag;
		public short vl;
		public int mv, zobristLock;
	}

	public Position pos = new Position();
	public int allNodes, mvResult;
	public int[] historyTable = new int[4096];
	public int[][] mvKiller = new int[LIMIT_DEPTH][2];

	public HashItem[] hashTable = new HashItem[HASH_SIZE];

	{
		for (int i = 0; i < HASH_SIZE; i ++) {
			hashTable[i] = new HashItem();
		}
	}

	public HashItem getHashItem() {
		return hashTable[pos.zobristKey & (HASH_SIZE - 1)];
	}

	public int probeHash(int vlAlpha, int vlBeta, int depth, int[] mv) {
		HashItem hash = getHashItem();
		if (hash.zobristLock != pos.zobristLock) {
			mv[0] = 0;
			return -MATE_VALUE;
		}
		mv[0] = hash.mv;
		boolean mate = false;
		if (hash.vl > WIN_VALUE) {
			if (hash.vl < Position.BAN_VALUE) {
				return -MATE_VALUE;
			}
			hash.vl -= pos.distance;
			mate = true;
		} else if (hash.vl < -WIN_VALUE) {
			if (hash.vl > -BAN_VALUE) {
				return -MATE_VALUE;
			}
			hash.vl += pos.distance;
			mate = true;
		} else if (hash.vl == pos.drawValue()) {
			return -MATE_VALUE;
		}
		if (hash.depth >= depth || mate) {
			if (hash.flag == HASH_BETA) {
				return (hash.vl >= vlBeta ? hash.vl : -MATE_VALUE);
			} else if (hash.flag == HASH_ALPHA) {
				return (hash.vl <= vlAlpha ? hash.vl : -MATE_VALUE);
			}
			return hash.vl;
		}
		return -MATE_VALUE;
	}

	public void recordHash(int flag, int vl, int depth, int mv) {
		HashItem hash = getHashItem();
		if (hash.depth > depth) {
			return;
		}
		hash.flag = (byte) flag;
		hash.depth = (byte) depth;
		if (vl > WIN_VALUE) {
			if (mv == 0 && vl <= BAN_VALUE) {
				return;
			}
			hash.vl = (short) (vl + pos.distance);
		} else if (vl < -WIN_VALUE) {
			if (mv == 0 && vl >= -BAN_VALUE) {
				return;
			}
			hash.vl = (short) (vl - pos.distance);
		} else if (vl == pos.drawValue() && mv == 0) {
			return;
		} else {
			hash.vl = (short) vl;
		}
		hash.mv = mv;
		hash.zobristLock = pos.zobristLock;
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
			this.mvKiller1 = mvKiller[pos.distance][0];
			this.mvKiller2 = mvKiller[pos.distance][1];
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
					vls[i] = historyTable[pos.historyIndex(mvs[i])];
				}
				Util.shellSort(mvs, vls, 0, moves);
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

	public void setBestMove(int mv, int depth) {
		historyTable[pos.historyIndex(mv)] += depth * depth;
		int[] killers = mvKiller[pos.distance];
		if (killers[0] != mv) {
			killers[1] = killers[0];
			killers[0] = mv;
		}
	}

	public int searchQuiesc(int vlAlpha_, int vlBeta) {
		int vlAlpha = vlAlpha_;
		allNodes ++;
		int vl = pos.mateValue();
		if (vl >= vlBeta) {
			return vl;
		}
		int vlRep = pos.repStatus();
		if (vlRep > 0) {
			return pos.repValue(vlRep);
		}
		if (pos.distance == LIMIT_DEPTH) {
			return pos.evaluate();
		}
		int vlBest = -MATE_VALUE;
		int genMoves;
		int[] mvs = new int[MAX_GEN_MOVES];
		if (pos.inCheck()) {
			genMoves = pos.generateAllMoves(mvs);
			int[] vls = new int[MAX_GEN_MOVES];
			for (int i = 0; i < genMoves; i ++) {
				vls[i] = historyTable[pos.historyIndex(mvs[i])];
			}
			Util.shellSort(mvs, vls, 0, genMoves);
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

	public int searchNoNull(int vlAlpha, int vlBeta, int depth) {
		return searchFull(vlAlpha, vlBeta, depth, true);
	}

	public int searchFull(int vlAlpha, int vlBeta, int depth) {
		return searchFull(vlAlpha, vlBeta, depth, false);
	}

	public int searchFull(int vlAlpha_, int vlBeta, int depth, boolean noNull) {
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
			int newDepth = pos.inCheck() ? depth : depth - 1;
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
		} else {
			recordHash(hashFlag, vlBest, depth, mvBest);
			if (mvBest > 0) {
				setBestMove(mvBest, depth);
			}
			return vlBest;
		}
	}

	public int searchRoot(int depth) {
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

	public void searchMain(int seconds) {
		mvResult = pos.bookMove();
		if (mvResult > 0) {
			pos.makeMove(mvResult);
			if (pos.repStatus(3) == 0) {
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
		pos.distance = 0;
		allNodes = 0;
		long timer = System.currentTimeMillis();
		for (int i = 1; i <= LIMIT_DEPTH; i ++) {
			vl = searchRoot(i);
			if (vl > WIN_VALUE || vl < -WIN_VALUE) {
				break;
			}
			if (System.currentTimeMillis() - timer > seconds * 1000) {
				break;
			}
		}
	}
}