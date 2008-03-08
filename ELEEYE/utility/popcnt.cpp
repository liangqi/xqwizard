char PopCnt16[65536];

void PopCntInit(void) {
  int i, n;
  for (i = 0; i < 65536; i ++) {
    n = ((i >> 1) & 0x5555) + (i & 0x5555);
    n = ((n >> 2) & 0x3333) + (n & 0x3333);
    n = ((n >> 4) & 0x0f0f) + (n & 0x0f0f);
    PopCnt16[i] = (n >> 8) + (n & 0x00ff);    
  }
}
