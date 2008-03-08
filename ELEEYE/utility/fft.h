#ifndef FFT_H
#define FFT_H

#include "complex.h"

void MakExp(complex *lpExp, int nLen);
void Fft(complex *lpDst, const complex *lpSrc, const complex *lpExp, int nLen);

struct RealFft {
  int nLen;
  complex *lpTemp, *lpExp, *lpExp2;

  RealFft(void) {
  }

  RealFft(int nLenParam) {
    init(nLenParam);
  }

  ~RealFft(void) {
    delete[] lpTemp;
    delete[] lpExp;
    delete[] lpExp2;
  }

  void init(int nLenParam) {
    nLen = (nLenParam < 0 ? -nLenParam : nLenParam);
    lpTemp = new complex[nLen];
    lpExp = new complex[nLen / 2];
    lpExp2 = new complex[nLen / 4];
    MakExp(lpExp, nLenParam);
    MakExp(lpExp2, nLenParam / 2);
  }

  void exec(complex *lpDst, const double *lpSrc);
};

struct InvRealFft {
  RealFft rf;
  complex *lpTemp2;

  InvRealFft(void) {
  }

  InvRealFft(int nLenParam) {
    init(nLenParam);
  }

  ~InvRealFft(void) {
    delete[] lpTemp2;
  }

  void init(int nLenParam) {
    rf.init(-nLenParam);
    lpTemp2 = new complex[rf.nLen];
  }

  void exec(double *lpDst, const complex *lpSrc);
};

#endif
