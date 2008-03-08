#include "base.h"
#include "fraction.h"

int AutoReduce = 1;
int DefaultPrecision = DEFAULT_PRECISION;

void Fraction::Reduce(void) {
  int TempNum, TempDen;
  if (Den < 0) {
    Den = -Den;
    Num = -Num;
  }
  TempNum = ABS(Num);
  TempDen = Den;
  while (TempNum != 0 && TempDen != 0) {
    if (TempNum > TempDen) {
      TempNum %= TempDen;
    } else {
      TempDen %= TempNum;
    }
  }
  if (TempNum == 0) {
    TempNum = TempDen;
  }
  Num /= TempNum;
  Den /= TempNum;
}

const int MAX_PRECISION = 32;

Fraction::Fraction(double Arg, int Precision) {
  int i, TempNum, TempDen;
  double Remainder;
  int Series[MAX_PRECISION];
  Remainder = Arg;
  for (i = 0; i <= Precision; i ++) {
    Series[i] = (int) (Remainder + (Remainder < 0 ? -0.5 : 0.5));
    Remainder -= Series[i];
    Remainder = 1.0 / Remainder;
  }
  TempNum = Series[Precision];
  TempDen = 1;
  for (i = Precision - 1; i >= 0; i --) {
    Swap(TempNum, TempDen);
    TempNum += TempDen * Series[i];
  }
  if (TempDen < 0) {
    Num = -TempNum;
    Den = -TempDen;
  } else {
    Num = TempNum;
    Den = TempDen;
  }
}
