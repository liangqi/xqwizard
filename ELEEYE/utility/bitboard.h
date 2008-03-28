#include "x86asm.h"
#include "popcnt.h"

#ifndef BITBOARD_H
#define BITBOARD_H

// Basic BitBoard Operations, including:
// 1. Assign Operations: Use Constructors
// 2. Comparison Operations: ==, !=
// 3. Bit Operations: ~, &, |, ^
// 4. Shift Operations: <<, >>

// Advanced BitBoard Operations, including:
// 1. CheckSum (Fold) and Duplicate (Un-Fold)
// 2. MSB, LSB and Count

struct BitBoard {
  uint32 dwLow, dwMid, dwHi;
  BitBoard(void) {
  }
  BitBoard(uint32 dwLowPart, uint32 dwMidPart, uint32 dwHiPart) {
    dwLow = dwLowPart;
    dwMid = dwMidPart;
    dwHi = dwHiPart;
  }
  int operator ==(BitBoard bb) const {
    return dwLow == bb.dwLow && dwMid == bb.dwMid && dwHi == bb.dwHi;
  }
  int operator !=(BitBoard bb) const {
    return dwLow != bb.dwLow || dwMid != bb.dwMid || dwHi != bb.dwHi;
  }
  BitBoard operator ~(void) const {
    return BitBoard(~dwLow, ~dwMid, ~dwHi);
  }
  BitBoard operator &(BitBoard bb) const {
    return BitBoard(dwLow & bb.dwLow, dwMid & bb.dwMid, dwHi & bb.dwHi);
  }
  BitBoard operator |(BitBoard bb) const {
    return BitBoard(dwLow | bb.dwLow, dwMid | bb.dwMid, dwHi | bb.dwHi);
  }
  BitBoard operator ^(BitBoard bb) const {
    return BitBoard(dwLow ^ bb.dwLow, dwMid ^ bb.dwMid, dwHi ^ bb.dwHi);
  }
  BitBoard operator <<(uint32 Count) const {
    if (Count < 32) {
      return BitBoard(dwLow << Count, Shld(dwMid, dwLow, Count), Shld(dwHi, dwMid, Count));
    } else if (Count < 64) {
      return BitBoard(0, dwLow << (Count - 32), Shld(dwMid, dwLow, Count - 32));
    } else if (Count < 96) {
      return BitBoard(0, 0, dwLow << (Count - 64));
    } else {
      return BitBoard(0, 0, 0);
    }
  }
  BitBoard operator >>(uint32 Count) const {
    if (Count < 32) {
      return BitBoard(Shrd(dwLow, dwMid, Count), Shrd(dwMid, dwHi, Count), dwHi >> Count);
    } else if (Count < 64) {
      return BitBoard(Shrd(dwMid, dwHi, Count - 32), dwHi >> (Count - 32), 0);
    } else if (Count < 96) {
      return BitBoard(dwHi >> (Count - 64), 0, 0);
    } else {
      return BitBoard(0, 0, 0);
    }
  }
  BitBoard operator &=(BitBoard bb) {
    dwLow &= bb.dwLow;
    dwMid &= bb.dwMid;
    dwHi &= bb.dwHi;
    return *this;
  }
  BitBoard operator |=(BitBoard bb) {
    dwLow |= bb.dwLow;
    dwMid |= bb.dwMid;
    dwHi |= bb.dwHi;
    return *this;
  }
  BitBoard operator ^=(BitBoard bb) {
    dwLow ^= bb.dwLow;
    dwMid ^= bb.dwMid;
    dwHi ^= bb.dwHi;
    return *this;
  }
  BitBoard operator <<=(uint32 Count) {
    if (Count < 32) {
      dwHi = Shld(dwHi, dwMid, Count);
      dwMid = Shld(dwMid, dwLow, Count);
      dwLow = dwLow << Count;
    } else if (Count < 64) {
      dwHi = Shld(dwMid, dwLow, Count - 32);
      dwMid = dwLow << (Count - 32);
      dwLow = 0;
    } else if (Count < 96) {
      dwHi = dwLow << (Count - 64);
      dwMid = dwLow = 0;
    } else {
      dwHi = dwMid = dwLow = 0;
    }
    return *this;
  }
  BitBoard operator >>=(uint32 Count) {
    if (Count < 32) {
      dwLow = Shrd(dwLow, dwMid, Count);
      dwMid = Shrd(dwMid, dwHi, Count);
      dwHi = dwHi >> Count;
    } else if (Count < 64) {
      dwLow = Shrd(dwMid, dwHi, Count - 32);
      dwMid = dwHi >> (Count - 32);
      dwHi = 0;
    } else if (Count < 96) {
      dwLow = dwHi >> (Count - 64);
      dwMid = dwHi = 0;
    } else {
      dwLow = dwMid = dwHi = 0;
    }
    return *this;
  }
}; // bb

inline uint32 CheckSum(BitBoard bb) {
  uint32 Temp;
  Temp = bb.dwLow ^ bb.dwMid ^ bb.dwHi;
  Temp = (Temp & 0xffff) ^ (Temp >> 16);
  return (Temp & 0xff) ^ (Temp >> 8);
}

inline BitBoard Duplicate(uint32 bb) {
  uint32 Temp;
  Temp = bb ^ (bb << 8);
  Temp = Temp ^ (Temp << 16);
  return BitBoard(Temp, Temp, Temp);
}

inline int PopCnt(BitBoard bb) {
  return PopCnt(bb.dwLow) + PopCnt(bb.dwMid) + PopCnt(bb.dwHi);
}

inline int Bsf(BitBoard bb) {
  if (bb.dwLow) {
    return Bsf(bb.dwLow);
  } else if (bb.dwMid) {
    return Bsf(bb.dwMid) + 32;
  } else {
    return Bsf(bb.dwHi) + 64;
  }
}

inline int Bsr(BitBoard bb) {
  if (bb.dwHi) {
    return Bsr(bb.dwHi) + 64;
  } else if (bb.dwMid) {
    return Bsr(bb.dwMid) + 32;
  } else {
    return Bsr(bb.dwLow);
  }
}

#endif
