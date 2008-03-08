#include "base.h"

#ifndef CRC32_H
#define CRC32_H

extern uint32 dwCrc32Table[256];

struct Crc32 {
  uint32 dwCrc32;
  void Reset(void) {
    dwCrc32 = ~0;
  }
  void Update(uint8 uc) {
    dwCrc32 = dwCrc32Table[(uint8) dwCrc32 ^ uc] ^ (dwCrc32 >> 8);
  }
  void Update(const uint8 *lpuc, int nLen);
  uint32 Digest(void) {
    return ~dwCrc32;
  }
};

void InitCrc32Table(void);

#endif
