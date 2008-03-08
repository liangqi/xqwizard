#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../../utility/base.h"
#include "../../utility/popcnt.h"

const unsigned long MAX_DIVISOR = 65536;
const unsigned long TABLE_LEN = MAX_DIVISOR / 16 * MAX_DIVISOR;

int main(void) {
  unsigned long i, j, k;
  unsigned char *ucPrimeTable;
  TimerStruct tbTimer;

  ucPrimeTable = new unsigned char[TABLE_LEN];
  tbTimer.Init();
  printf("Generating prime numbers below %d^2...\n", (int) MAX_DIVISOR);
  PopCntInit();
  memset(ucPrimeTable, 0xff, TABLE_LEN);
  k = 4;
  for (i = 3; i < MAX_DIVISOR; i += 2) {
    if (i > k) {
      printf("Numbers below %d are sifted, using %dms.\n", (int) k, tbTimer.GetTimer());
      k <<= 1;
    }
    if (ucPrimeTable[i / 16] & (1 << ((i / 2) % 8))) {
      for (j = i * 3 / 2; j < TABLE_LEN * 8; j += i) {
        ucPrimeTable[j / 8] &= ~(1 << (j % 8));
      }
    }
  }
  j = 0;
  for (i = 0; i < TABLE_LEN; i ++) {    
    j += PopCnt16[ucPrimeTable[i]];
  }
  printf("Numbers below %d are sifted, using %dms.\n", (int) MAX_DIVISOR, tbTimer.GetTimer());
  printf("There are %d prime numbers below %d^2.\n", (int) j, (int) MAX_DIVISOR);
  delete[] ucPrimeTable;
  return 0;
}
