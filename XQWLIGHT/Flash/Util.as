package {
	public class Util {
		public static function binarySearch(vl:int, vls:Array, nFrom:int, nTo:int):int {
			var vlLow:int = nFrom;
			var vlHigh:int = nTo - 1;
			while (vlLow <= vlHigh) {
				var vlMid:int = (vlLow + vlHigh) / 2;
				if (vls[vlMid] < vl) {
					vlLow = vlMid + 1;
				} else if (vls[vlMid] > vl) {
					vlHigh = vlMid - 1;
				} else {
					return vlMid;
				}
			}
			return -1;
		}

		private static const cnShellStep:Array = new Array(0, 1, 4, 13, 40, 121, 364, 1093);

		public static function shellSort(mvs:Array, vls:Array, nFrom:int, nTo:int):void {
			var nStepLevel:int = 1;
			while (cnShellStep[nStepLevel] < nTo - nFrom) {
				nStepLevel ++;
			}
			nStepLevel --;
			while (nStepLevel > 0) {
				var nStep:int = cnShellStep[nStepLevel];
				var i:int;
				for (i = nFrom + nStep; i < nTo; i ++) {
					var mvBest:int = mvs[i];
					var vlBest:int = vls[i];
					var j:int = i - nStep;
					while (j >= nFrom && vlBest > vls[j]) {
						mvs[j + nStep] = mvs[j];
						vls[j + nStep] = vls[j];
						j -= nStep;
					}
					mvs[j + nStep] = mvBest;
					vls[j + nStep] = vlBest;
				}
				nStepLevel --;
			}
		}
	}
}