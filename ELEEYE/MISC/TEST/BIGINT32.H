#include "../../utility/x86asm.h"

#ifndef BIGINT32_H
#define BIGINT32_H

uint32 BigIntAdd(uint32 *lpDst, const uint32 *lpSrc1, const uint32 *lpSrc2, uint32 nLen);
uint32 BigIntSub(uint32 *lpDst, const uint32 *lpSrc1, const uint32 *lpSrc2, uint32 nLen);
uint32 BigIntInc(uint32 *lp, uint32 nLen);
uint32 BigIntDec(uint32 *lp, uint32 nLen);
void BigIntMul(uint32 *lpDst, const uint32 *lpSrc1, const uint32 *lpSrc2, uint32 nLen1, uint32 nLen2);

#endif
