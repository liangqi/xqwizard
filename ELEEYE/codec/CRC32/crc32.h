#include "../../base/base.h"

#ifndef CRC32_H
#define CRC32_H

extern uint32_t dwCrc32Table[256];

struct Crc32 {
  uint32_t dwCrc32;
  void Reset(void) {
    dwCrc32 = ~0;
  }
  void Update(uint8_t uc) {
    dwCrc32 = dwCrc32Table[(uint8_t) dwCrc32 ^ uc] ^ (dwCrc32 >> 8);
  }
  void Update(const uint8_t *lpuc, int nLen);
  uint32_t Digest(void) {
    return ~dwCrc32;
  }
};

void InitCrc32Table(void);

#endif
