#ifndef X86ASM_H
#define X86ASM_H

#ifdef _MSC_VER

#define FORMAT_I64 "I64"

typedef signed __int64 sint64;     // ll
typedef unsigned __int64 uint64;   // qw

#else

#define FORMAT_I64 "ll"

typedef signed long long sint64;   // ll
typedef unsigned long long uint64; // qw

#endif

typedef signed long sint32;        // l
typedef unsigned long uint32;      // dw
typedef signed short sint16;       // s
typedef unsigned short uint16;     // w
typedef signed char sint8;         // c
typedef unsigned char uint8;       // uc

inline uint32 LOW_LONG(uint64 Operand) {
  return (uint32) Operand;
}

inline uint32 HIGH_LONG(uint64 Operand) {
  return (uint32) (Operand >> 32);
}

inline uint64 MAKE_LONG_LONG(uint32 LowLong, uint32 HighLong) {
  return (uint64) LowLong | ((uint64) HighLong << 32);
}

#ifdef _MSC_VER

#pragma warning(disable: 4035)

__forceinline int Exchange(volatile int *Target, int Value) {
  __asm {
    mov ebx, Target;
    mov eax, Value;
    xchg [ebx], eax;
  }
}

__forceinline int CompareExchange(volatile int *Destination, int Exchange, int Comperand) {
  __asm {
    mov ebx, Destination;
    mov edx, Exchange;
    mov eax, Comperand;
    cmpxchg [ebx], edx;
  }
}

__forceinline int ExchangeAdd(volatile int *Addend, int Increment) {
  __asm {
    mov ebx, Addend;
    mov eax, Increment;
    xadd [ebx], eax;
  }
}

__forceinline int Bsf(uint32 Operand) {
  __asm {
    bsf eax, Operand;
  }
}

__forceinline int Bsr(uint32 Operand) {
  __asm {
    bsr eax, Operand;
  }
}

__forceinline uint64 TimeStampCounter(void) {
  __asm {
    rdtsc;
  }
}

__forceinline uint64 LongMul(uint32 Multiplier, uint32 Multiplicand) {
  __asm {
    mov eax, Multiplier;
    mul Multiplicand;
  }
}

__forceinline uint64 LongSqr(uint32 Multiplier) {
  __asm {
    mov eax, Multiplier;
    mul Multiplier;
  }
}

__forceinline uint32 LongDiv(uint64 Dividend, uint32 Divisor) {
  __asm {
    mov eax, dword ptr Dividend[0];
    mov edx, dword ptr Dividend[4];
    div Divisor;
  }
}

__forceinline uint32 LongMod(uint64 Dividend, uint32 Divisor) {
  __asm {
    mov eax, dword ptr Dividend[0];
    mov edx, dword ptr Dividend[4];
    div Divisor;
    mov eax, edx;
  }
}

__forceinline uint32 LongMulDiv(uint32 Multiplier, uint32 Multiplicand, uint32 Divisor) {
  __asm {
    mov eax, Multiplier;
    mul Multiplicand;
    div Divisor;
  }
}

__forceinline uint32 LongMulMod(uint32 Multiplier, uint32 Multiplicand, uint32 Divisor) {
  __asm {
    mov eax, Multiplier;
    mul Multiplicand;
    div Divisor;
    mov eax, edx;
  }
}

__forceinline uint32 Shld(uint32 HighLong, uint32 LowLong, uint32 Count) {
  __asm {
    mov eax, HighLong;
    mov edx, LowLong;
    mov ecx, Count;
    shld eax, edx, cl;
  }
}

__forceinline uint32 Shrd(uint32 LowLong, uint32 HighLong, uint32 Count) {
  __asm {
    mov eax, LowLong;
    mov edx, HighLong;
    mov ecx, Count;
    shrd eax, edx, cl;
  }
}

#pragma warning(default: 4035)

#else

static __inline__ int Exchange(volatile int *Target, int Value) {
  int eax, ebx;
  asm __volatile__ (
    "xchgl %0, (%1)" "\n\t"
    : "=a" (eax), "=b" (ebx)
    : "0" (Value), "1" (Target)
  );
  return eax;
}

static __inline__ int CompareExchange(volatile int *Destination, int Exchange, int Comperand) {
  int eax, ebx, edx;
    asm __volatile__ (
    "cmpxchgl %2, (%1)" "\n\t"
    : "=a" (eax), "=b" (ebx), "=d" (edx)
    : "0" (Comperand), "1" (Destination), "2" (Exchange)
  );
  return eax;
}

static __inline__ int ExchangeAdd(volatile int *Addend, int Increment) {
  int eax, ebx;
  asm __volatile__ (
    "xaddl %0, (%1)" "\n\t"
    : "=a" (eax), "=b" (ebx)
    : "0" (Increment), "1" (Addend)
  );
  return eax;
}

static __inline__ int Bsf(uint32 Operand) {
  int eax;
  asm __volatile__ (
    "bsfl %0, %0" "\n\t"
    : "=a" (eax)
    : "0" (Operand)
  );
  return eax;
}

static __inline__ int Bsr(uint32 Operand) {
  int eax;
  asm __volatile__ (
    "bsrl %0, %0" "\n\t"
    : "=a" (eax)
    : "0" (Operand)
  );
  return eax;
}

static __inline__ uint64 TimeStampCounter(void) {
  uint32 eax, edx;
  asm __volatile__ (
    "rdtsc" "\n\t"
    : "=a" (eax), "=d" (edx)
    :
  );
  return MAKE_LONG_LONG(eax, edx);
}

static __inline__ uint64 LongMul(uint32 Multiplier, uint32 Multiplicand) {
  uint32 eax, edx;
  asm __volatile__ (
    "mull %1" "\n\t"
    : "=a" (eax), "=d" (edx)
    : "0" (Multiplier), "1" (Multiplicand)
  );
  return MAKE_LONG_LONG(eax, edx);
}

static __inline__ uint64 LongSqr(uint32 Multiplier) {
  uint32 eax, edx;
  asm __volatile__ (
    "mull %1" "\n\t"
    : "=a" (eax), "=d" (edx)
    : "0" (Multiplier), "1" (Multiplier)
  );
  return MAKE_LONG_LONG(eax, edx);
}

static __inline__ uint32 LongDiv(uint64 Dividend, uint32 Divisor) {
  uint32 eax, edx, dummy;
  asm __volatile__ (
    "divl %2" "\n\t"
    : "=a" (eax), "=d" (edx), "=g" (dummy)
    : "0" (LOW_LONG(Dividend)), "1" (HIGH_LONG(Dividend)), "2" (Divisor)
  );
  return eax;
}

static __inline__ uint32 LongMod(uint64 Dividend, uint32 Divisor) {
  uint32 eax, edx, dummy;
  asm __volatile__ (
    "divl %2"     "\n\t"
    : "=a" (eax), "=d" (edx), "=g" (dummy)
    : "0" (LOW_LONG(Dividend)), "1" (HIGH_LONG(Dividend)), "2" (Divisor)
  );
  return edx;
}

static __inline__ uint32 LongMulDiv(uint32 Multiplier, uint32 Multiplicand, uint32 Divisor) {
  uint32 eax, edx, dummy;
  asm __volatile__ (
    "mull %1" "\n\t"
    "divl %2" "\n\t"
    : "=a" (eax), "=d" (edx), "=g" (dummy)
    : "0" (Multiplier), "1" (Multiplicand), "2" (Divisor)
  );
  return eax;
}

static __inline__ uint32 LongMulMod(uint32 Multiplier, uint32 Multiplicand, uint32 Divisor) {
  uint32 eax, edx, dummy;
  asm __volatile__ (
    "mull %1"     "\n\t"
    "divl %2"     "\n\t"
    : "=a" (eax), "=d" (edx), "=g" (dummy)
    : "0" (Multiplier), "1" (Multiplicand), "2" (Divisor)
  );
  return edx;
}

static __inline uint32 Shld(uint32 High, uint32 Low, uint32 Count) {
  uint32 eax, edx, ecx;
  asm __volatile__ (
    "shldl %%cl, %1, %0" "\n\t"
    : "=a" (eax), "=d" (edx), "=c" (ecx)
    : "0" (High), "1" (Low), "2" (Count)
  );
  return eax;
}

static __inline uint32 Shrd(uint32 Low, uint32 High, uint32 Count) {
  uint32 eax, edx, ecx;
  asm __volatile__ (
    "shrdl %%cl, %1, %0" "\n\t"
    : "=a" (eax), "=d" (edx), "=c" (ecx)
    : "0" (Low), "1" (High), "2" (Count)
  );
  return eax;
}

#endif

inline uint64 LongShl(uint64 Operand, uint32 Count) {
  if (Count < 32) {
    return MAKE_LONG_LONG(LOW_LONG(Operand) << Count, Shld(HIGH_LONG(Operand), LOW_LONG(Operand), Count));
  } else if (Count < 64) {
    return MAKE_LONG_LONG(0, LOW_LONG(Operand) << (Count - 32));
  } else {
    return MAKE_LONG_LONG(0, 0);
  }
}

inline uint64 LongShr(uint64 Operand, uint32 Count) {
  if (Count < 32) {
    return MAKE_LONG_LONG(Shrd(LOW_LONG(Operand), HIGH_LONG(Operand), Count), HIGH_LONG(Operand) >> Count);
  } else if (Count < 64) {
    return MAKE_LONG_LONG(HIGH_LONG(Operand) >> (Count - 32), 0);
  } else {
    return MAKE_LONG_LONG(0, 0);
  }
}

#endif
