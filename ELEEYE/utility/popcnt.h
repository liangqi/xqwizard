#ifndef POPCNT_H
#define POPCNT_H

extern char PopCnt16[65536];

void PopCntInit(void);

inline int PopCnt(uint32 Operand) {
  return PopCnt16[Operand >> 16] + PopCnt16[Operand & 0xffff];
}

#ifdef NOT_DEFINED // Deprecated

inline int PopCnt(uint32 Operand) {
  uint32 n;
  n = ((Operand >> 1) & 0x55555555) + (Operand & 0x55555555);
  n = ((n >> 2) & 0x33333333) + (n & 0x33333333);
  n = ((n >> 4) & 0x0f0f0f0f) + (n & 0x0f0f0f0f);
  n = ((n >> 8) & 0x00ff00ff) + (n & 0x00ff00ff);
  return (n >> 16) + (n & 0x0000ffff);
}

#endif

#endif
