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
  uint32 Low, Mid, Hi;
  BitBoard(void) {
  }
  BitBoard(uint32 LowPart, uint32 MidPart, uint32 HiPart) {
    Low = LowPart;
    Mid = MidPart;
    Hi = HiPart;
  }
  int operator ==(BitBoard Operand) const {
    return Low == Operand.Low && Mid == Operand.Mid && Hi == Operand.Hi;
  }
  int operator !=(BitBoard Operand) const {
    return Low != Operand.Low || Mid != Operand.Mid || Hi != Operand.Hi;
  }
  BitBoard operator ~(void) const {
    return BitBoard(~Low, ~Mid, ~Hi);
  }
  BitBoard operator &(BitBoard Operand) const {
    return BitBoard(Low & Operand.Low, Mid & Operand.Mid, Hi & Operand.Hi);
  }
  BitBoard operator |(BitBoard Operand) const {
    return BitBoard(Low | Operand.Low, Mid | Operand.Mid, Hi | Operand.Hi);
  }
  BitBoard operator ^(BitBoard Operand) const {
    return BitBoard(Low ^ Operand.Low, Mid ^ Operand.Mid, Hi ^ Operand.Hi);
  }
  BitBoard operator <<(uint32 Count) const {
    if (Count < 32) {
      return BitBoard(Low << Count, Shld(Mid, Low, Count), Shld(Hi, Mid, Count));
    } else if (Count < 64) {
      return BitBoard(0, Low << (Count - 32), Shld(Mid, Low, Count - 32));
    } else if (Count < 96) {
      return BitBoard(0, 0, Low << (Count - 64));
    } else {
      return BitBoard(0, 0, 0);
    }
  }
  BitBoard operator >>(uint32 Count) const {
    if (Count < 32) {
      return BitBoard(Shrd(Low, Mid, Count), Shrd(Mid, Hi, Count), Hi >> Count);
    } else if (Count < 64) {
      return BitBoard(Shrd(Mid, Hi, Count - 32), Hi >> (Count - 32), 0);
    } else if (Count < 96) {
      return BitBoard(Hi >> (Count - 64), 0, 0);
    } else {
      return BitBoard(0, 0, 0);
    }
  }
  BitBoard operator &=(BitBoard Operand) {
    Low &= Operand.Low;
    Mid &= Operand.Mid;
    Hi &= Operand.Hi;
    return *this;
  }
  BitBoard operator |=(BitBoard Operand) {
    Low |= Operand.Low;
    Mid |= Operand.Mid;
    Hi |= Operand.Hi;
    return *this;
  }
  BitBoard operator ^=(BitBoard Operand) {
    Low ^= Operand.Low;
    Mid ^= Operand.Mid;
    Hi ^= Operand.Hi;
    return *this;
  }
  BitBoard operator <<=(uint32 Count) {
    if (Count < 32) {
      Hi = Shld(Hi, Mid, Count);
      Mid = Shld(Mid, Low, Count);
      Low = Low << Count;
    } else if (Count < 64) {
      Hi = Shld(Mid, Low, Count - 32);
      Mid = Low << (Count - 32);
      Low = 0;
    } else if (Count < 96) {
      Hi = Low << (Count - 64);
      Mid = Low = 0;
    } else {
      Hi = Mid = Low = 0;
    }
    return *this;
  }
  BitBoard operator >>=(uint32 Count) {
    if (Count < 32) {
      Low = Shrd(Low, Mid, Count);
      Mid = Shrd(Mid, Hi, Count);
      Hi = Hi >> Count;
    } else if (Count < 64) {
      Low = Shrd(Mid, Hi, Count - 32);
      Mid = Hi >> (Count - 32);
      Hi = 0;
    } else if (Count < 96) {
      Low = Hi >> (Count - 64);
      Mid = Hi = 0;
    } else {
      Low = Mid = Hi = 0;
    }
    return *this;
  }
};

inline uint32 CheckSum(BitBoard Operand) {
  uint32 Temp;
  Temp = Operand.Low ^ Operand.Mid ^ Operand.Hi;
  Temp = (Temp & 0xffff) ^ (Temp >> 16);
  return (Temp & 0xff) ^ (Temp >> 8);
}

inline BitBoard Duplicate(uint32 Operand) {
  uint32 Temp;
  Temp = Operand ^ (Operand << 8);
  Temp = Temp ^ (Temp << 16);
  return BitBoard(Temp, Temp, Temp);
}

inline int PopCnt(BitBoard Operand) {
  return PopCnt(Operand.Low) + PopCnt(Operand.Mid) + PopCnt(Operand.Hi);
}

inline int Bsf(BitBoard Operand) {
  if (Operand.Low) {
    return Bsf(Operand.Low);
  } else if (Operand.Mid) {
    return Bsf(Operand.Mid) + 32;
  } else {
    return Bsf(Operand.Hi) + 64;
  }
}

inline int Bsr(BitBoard Operand) {
  if (Operand.Hi) {
    return Bsr(Operand.Hi) + 64;
  } else if (Operand.Mid) {
    return Bsr(Operand.Mid) + 32;
  } else {
    return Bsr(Operand.Low);
  }
}

#endif
