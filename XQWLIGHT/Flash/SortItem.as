package {
	public class SortItem {
		private static final int PHASE_HASH = 0;
		private static final int PHASE_KILLER_1 = 1;
		private static final int PHASE_KILLER_2 = 2;
		private static final int PHASE_GEN_MOVES = 3;
		private static final int PHASE_REST = 4;

		private int index, moves, phase;
		private int mvHash, mvKiller1, mvKiller2;
		private int[] mvs, vls;

		SortItem(int mvHash) {
			phase = PHASE_HASH;
			this.mvHash = mvHash;
			this.mvKiller1 = mvKiller[pos.distance][0];
			this.mvKiller2 = mvKiller[pos.distance][1];
		}

		int next() {
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
}