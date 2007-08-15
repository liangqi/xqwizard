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
	public static final int HASH_SIZE = 16384;
	public static final int HASH_ALPHA = 1;
	public static final int HASH_BETA = 2;
	public static final int HASH_PV = 3;
	public static final int LIMIT_DEPTH = 64;
	public static final int NULL_DEPTH = 2;
	public static final int UNKNOWN_VALUE = Position.MATE_VALUE + 1;

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
			if (vl > Position.WIN_VALUE) {
				this.vl = vl + pos.distance;
			} else if (vl < -Position.WIN_VALUE) {
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
	public int[] history = new int[65536];
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
		if (hash.vl > Position.WIN_VALUE) {			
			hash.vl -= pos.distance;
			mate = true;
		} else if (hash.vl < -Position.WIN_VALUE) {
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

	public static class SortItem {
		public static final int PHASE_HASH = 0;
		public static final int PHASE_KILLER_1 = 1;
		public static final int PHASE_KILLER_2 = 2;
		public static final int PHASE_GEN_MOVES = 3;
		public static final int PHASE_REST = 4;
	}
}