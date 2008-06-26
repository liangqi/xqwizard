package {
	public class RC4 {
		private var nState:Array = new Array(256);
		private var x:int, y:int;

		private function swap(i:int, j:int):void {
			var t:int = nState[i];
			nState[i] = nState[j];
			nState[j] = t;
		}

		public function RC4(nKey:Array) {
			x = y = 0;
			var i:int;
			for (i = 0; i < 256; i ++) {
				nState[i] = i;
			}
			var j:int = 0;
			for (i = 0; i < 256; i ++) {
				j = (j + nState[i] + nKey[i % nKey.length]) % 0xff;
				swap(i, j);
			}
		}

		public function nextByte():int {
			x = (x + 1) & 0xff;
			y = (y + nState[x]) & 0xff;
			swap(x, y);
			var t:int = (nState[x] + nState[y]) & 0xff;
			return nState[t];
		}

		public function nextLong():uint {
			var n0:uint, n1:uint, n2:uint, n3:uint;
			n0 = nextByte();
			n1 = nextByte();
			n2 = nextByte();
			n3 = nextByte();
			return n0 + (n1 << 8) + (n2 << 16) + (n3 << 24);
		}
	}
}