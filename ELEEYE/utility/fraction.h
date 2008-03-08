#include "base.h"

#ifndef FRACTION_H
#define FRACTION_H

const Bool SKIP_REDUCE = TRUE;
const int DEFAULT_PRECISION = 4;

extern int AutoReduce, DefaultPrecision;

struct Fraction {
  int Num, Den;
  void Reduce(void);
  Fraction(void) {
  }
  Fraction(int Arg1, int Arg2 = 1, Bool SkipReduce = FALSE) {
    Num = Arg1;
    Den = Arg2;
    if (AutoReduce && !SkipReduce) {
      Reduce();
    }
  }
  Fraction(double Arg, int Precision = DefaultPrecision);
  Fraction operator +(void) const {
    return *this;
  }
  operator int(void) const {
    return Num / Den;
  }
  operator double(void) const {
    return (double) Num / Den;
  }
  Fraction operator -(void) const {
    return Fraction(-Num, Den, SKIP_REDUCE);
  }
  int operator <(Fraction Arg) const {
    return Den * Arg.Den < 0 ? Num * Arg.Den > Arg.Num * Den : Num * Arg.Den < Arg.Num * Den;
  }
  int operator <=(Fraction Arg) const {
    return Den * Arg.Den < 0 ? Num * Arg.Den >= Arg.Num * Den : Num * Arg.Den <= Arg.Num * Den;
  }
  int operator >(Fraction Arg) const {
    return Den * Arg.Den < 0 ? Num * Arg.Den < Arg.Num * Den : Num * Arg.Den > Arg.Num * Den;
  }
  int operator >=(Fraction Arg) const {
    return Den * Arg.Den < 0 ? Num * Arg.Den <= Arg.Num * Den : Num * Arg.Den >= Arg.Num * Den;
  }
  int operator ==(Fraction Arg) const {
    return Num * Arg.Den == Arg.Num * Den;
  }
  int operator !=(Fraction Arg) const {
    return Num * Arg.Den != Arg.Num * Den;
  }
  int operator <(int Arg) const {
    return Den < 0 ? Num > Arg * Den : Num < Arg * Den;
  }
  int operator <=(int Arg) const {
    return Den < 0 ? Num >= Arg * Den : Num <= Arg * Den;
  }
  int operator >(int Arg) const {
    return Den < 0 ? Num < Arg * Den : Num > Arg * Den;
  }
  int operator >=(int Arg) const {    
    return Den < 0 ? Num <= Arg * Den : Num >= Arg * Den;
  }
  int operator ==(int Arg) const {
    return Num == Arg * Den;
  }
  int operator !=(int Arg) const {
    return Num != Arg * Den;
  }
  Fraction operator +(Fraction Arg) const {
    return Fraction(Num * Arg.Den + Arg.Num * Den, Den * Arg.Den);
  }
  Fraction operator -(Fraction Arg) const {
    return Fraction(Num * Arg.Den - Arg.Num * Den, Den * Arg.Den);
  }
  Fraction operator *(Fraction Arg) const {
    return Fraction(Num * Arg.Num, Den * Arg.Den);
  }
  Fraction operator /(Fraction Arg) const {
    return Fraction(Num * Arg.Den, Arg.Num * Den);
  }
  Fraction operator +(int Arg) const {
    return Fraction(Num + Arg * Den, Den, SKIP_REDUCE);
  }
  Fraction operator -(int Arg) const {
    return Fraction(Num - Arg * Den, Den, SKIP_REDUCE);
  }
  Fraction operator *(int Arg) const {
    return Fraction(Num * Arg, Den);
  }
  Fraction operator /(int Arg) const {
    return Fraction(Num, Den * Arg);
  }
  Fraction &operator +=(Fraction Arg) {
    Num *= Arg.Den;
    Num += Arg.Num * Den;
    Den *= Arg.Den;
    if (AutoReduce) {
      Reduce();
    }
    return *this;
  }
  Fraction &operator -=(Fraction Arg) {
    Num *= Arg.Den;
    Num -= Arg.Num * Den;
    Den *= Arg.Den;
    if (AutoReduce) {
      Reduce();
    }
    return *this;
  }
  Fraction &operator *=(Fraction Arg) {
    Num *= Arg.Num;
    Den *= Arg.Den;
    if (AutoReduce) {
      Reduce();
    }
    return *this;
  }
  Fraction &operator /=(Fraction Arg) {
    Num *= Arg.Den;
    Den *= Arg.Num;
    if (AutoReduce) {
      Reduce();
    }
    return *this;
  }
  Fraction &operator +=(int Arg) {
    Num += Arg * Den;
    return *this;
  }
  Fraction &operator -=(int Arg) {
    Num -= Arg * Den;
    return *this;
  }
  Fraction &operator *=(int Arg) {
    Num *= Arg;
    if (AutoReduce) {
      Reduce();
    }
    return *this;
  }
  Fraction &operator /=(int Arg) {
    Den *= Arg;
    if (AutoReduce) {
      Reduce();
    }
    return *this;
  }
  Fraction operator ++(void) {
    Num += Den;
    return *this;
  }
  Fraction operator --(void) {
    Num -= Den;
    return *this;
  }
};

inline int operator <(int Arg1, Fraction Arg2) {
  return Arg2.Den < 0 ? Arg1 * Arg2.Den > Arg2.Num : Arg1 * Arg2.Den < Arg2.Num;
}

inline int operator <=(int Arg1, Fraction Arg2) {
  return Arg2.Den < 0 ? Arg1 * Arg2.Den >= Arg2.Num : Arg1 * Arg2.Den <= Arg2.Num;
}

inline int operator >(int Arg1, Fraction Arg2) {
  return Arg2.Den < 0 ? Arg1 * Arg2.Den < Arg2.Num : Arg1 * Arg2.Den > Arg2.Num;
}

inline int operator >=(int Arg1, Fraction Arg2) {
  return Arg2.Den < 0 ? Arg1 * Arg2.Den <= Arg2.Num : Arg1 * Arg2.Den >= Arg2.Num;
}

inline int operator ==(int Arg1, Fraction Arg2) {
  return Arg1 * Arg2.Den == Arg2.Num;
}

inline int operator !=(int Arg1, Fraction Arg2) {
  return Arg1 * Arg2.Den != Arg2.Num;
}

inline Fraction operator +(int Arg1, Fraction Arg2) {
  return Fraction(Arg1 * Arg2.Den + Arg2.Num, Arg2.Den, SKIP_REDUCE);
}

inline Fraction operator -(int Arg1, Fraction Arg2) {
  return Fraction(Arg1 * Arg2.Den - Arg2.Num, Arg2.Den, SKIP_REDUCE);
}

inline Fraction operator *(int Arg1, Fraction Arg2) {
  return Fraction(Arg1 * Arg2.Num, Arg2.Den);
}

inline Fraction operator /(int Arg1, Fraction Arg2) {
  return Fraction(Arg1 * Arg2.Den, Arg2.Num);
}

#endif
