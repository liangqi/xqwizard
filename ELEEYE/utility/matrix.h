#include <string.h>

#ifndef MATRIX_H
#define MATRIX_H

struct Matrix {
  int Row, Col;
  double *Elements; // Don't Use It!

  double *operator [](int Index) {
    return Elements + (Index * Col);
  }

  const double *operator [](int Index) const {
    return Elements + (Index * Col);
  }

  Matrix(void) {
    Elements = NULL;
  }

  Matrix(int RowLen, int ColLen) {
    Row = RowLen;
    Col = ColLen;
    Elements = new double[Row * Col];
    memset(Elements, 0, Row * Col * sizeof(double));
  }

  Matrix(const Matrix &Matr) {
    Row = Matr.Row;
    Col = Matr.Col;
    Elements = new double[Row * Col];
    memcpy(Elements, Matr.Elements, Row * Col * sizeof(double));
  }

  ~Matrix(void) {
    if (Elements != NULL) {
      delete[] Elements;
      Elements = NULL;
    }
  }

  Matrix &operator =(const Matrix &Matr) {
    if (Elements != Matr.Elements) {
      if (Elements != NULL) {
        delete[] Elements;
        Elements = NULL;
      }
      Row = Matr.Row;
      Col = Matr.Col;
      Elements = new double[Row * Col];
      memcpy(Elements, Matr.Elements, Row * Col * sizeof(double));
    }
    return *this;
  }

  void Load(int DstRow, int DstCol, const Matrix &Src, int SrcRow, int SrcCol, int RowLen, int ColLen) {
    int i, j;
    for (i = 0; i < RowLen; i ++) {
      for (j = 0; j < ColLen; j ++) {
        (*this)[DstRow + i][DstCol + j] = Src[SrcRow + i][SrcCol + j];
      }
    }
  }

  Matrix Merge(const Matrix &DownLeft, const Matrix &UpRight, const Matrix &DownRight) const;
  Matrix MergeRow(const Matrix &Down) const;
  Matrix MergeCol(const Matrix &Right) const;
  Matrix DelRowCol(int RowStart, int RowLen, int ColStart, int ColLen) const;
  Matrix DelRow(int Start, int Len) const;
  Matrix DelCol(int Start, int Len) const;

  const Matrix &operator +(void) const {
    return *this;
  }

  Matrix operator -(void) const;
  Matrix operator +(const Matrix &Matr) const;
  Matrix operator -(const Matrix &Matr) const;
  Matrix operator *(double Real) const;
  Matrix operator /(double Real) const;

  Matrix &operator +=(const Matrix &Matr) {
    int i, j;
    for (i = 0; i < Row; i ++) {
      for (j = 0; j < Col; j ++) {
        (*this)[i][j] += Matr[i][j];
      }
    }
    return *this;
  }

  Matrix &operator -=(const Matrix &Matr) {
    int i, j;
    for (i = 0; i < Row; i ++) {
      for (j = 0; j < Col; j ++) {
        (*this)[i][j] -= Matr[i][j];
      }
    }
    return *this;
  }

  Matrix &operator *=(double Real) {
    int i, j;
    for (i = 0; i < Row; i ++) {
      for (j = 0; j < Col; j ++) {
        (*this)[i][j] *= Real;
      }
    }
    return *this;
  }

  Matrix &operator /=(double Real) {
    int i, j;
    for (i = 0; i < Row; i ++) {
     for (j = 0; j < Col; j ++) {
        (*this)[i][j] /= Real;
      }
    }
    return *this;
  }

  Matrix operator *(const Matrix &Matr) const;

  void RowSwap(int DstRow, int SrcRow, int Start = 0) {
    int i;
    if (DstRow != SrcRow) {
      for (i = Start; i < Col; i ++) {
        SWAP((*this)[DstRow][i], (*this)[SrcRow][i]);
      }
    }
  }

  void RowMul(int DstRow, double Real, int Start = 0) {
    int i;
    for (i = Start; i < Col; i ++) {
      (*this)[DstRow][i] *= Real;
    }
  }

  void RowAdd(int DstRow, int SrcRow, int Start = 0) {
    int i;
    for (i = Start; i < Col; i ++) {
      (*this)[DstRow][i] += (*this)[SrcRow][i];
    }
  }

  void RowAddMul(int DstRow, int SrcRow, double Real, int Start = 0) {
    int i;
    for (i = Start; i < Col; i ++) {
      (*this)[DstRow][i] += (*this)[SrcRow][i] * Real;
    }
  }

  void RowSub(int DstRow, int SrcRow, int Start = 0) {
    int i;
    for (i = Start; i < Col; i ++) {
      (*this)[DstRow][i] -= (*this)[SrcRow][i];
    }
  }

  void RowSubMul(int DstRow, int SrcRow, double Real, int Start = 0) {
    int i;
    for (i = Start; i < Col; i ++) {
      (*this)[DstRow][i] -= (*this)[SrcRow][i] * Real;
    }
  }

  void ColSwap(int DstCol, int SrcCol, int Start = 0) {
    int i;
    if (DstCol != SrcCol) {
      for (i = Start; i < Row; i ++) {
        SWAP((*this)[i][DstCol], (*this)[i][SrcCol]);
      }
    }
  }

  void ColMul(int DstCol, double Real, int Start = 0) {
    int i;
    for (i = Start; i < Row; i ++) {
      (*this)[i][DstCol] *= Real;
    }
  }

  void ColAdd(int DstCol, int SrcCol, int Start = 0) {
    int i;
    for (i = Start; i < Row; i ++) {
      (*this)[i][DstCol] += (*this)[i][SrcCol];
    }
  }

  void ColAddMul(int DstCol, int SrcCol, double Real, int Start = 0) {
    int i;
    for (i = Start; i < Row; i ++) {
      (*this)[i][DstCol] += (*this)[i][SrcCol] * Real;
    }
  }

  void ColSub(int DstCol, int SrcCol, int Start = 0) {
    int i;
    for (i = Start; i < Row; i ++) {
      (*this)[i][DstCol] -= (*this)[i][SrcCol];
    }
  }

  void ColSubMul(int DstCol, int SrcCol, double Real, int Start = 0) {
    int i;
    for (i = Start; i < Row; i ++) {
      (*this)[i][DstCol] -= (*this)[i][SrcCol] * Real;
    }
  }

  Matrix Trans(void) const;
  double Det(void) const;
  Matrix LeftDiv(const Matrix &Matr) const;
  Matrix RightDiv(const Matrix &Matr) const;
  Matrix Inv(void) const;
};

inline Matrix Trans(const Matrix &Matr) {
  return Matr.Trans();
}

inline double Det(const Matrix &Matr) {
  return Matr.Det();
}

inline Matrix Inv(const Matrix &Matr) {
  return Matr.Inv();
}

Matrix operator *(double Real, const Matrix &Matr);
Matrix Merge(const Matrix &UpLeft, const Matrix &DownLeft, const Matrix &UpRight, const Matrix &DownRight);
Matrix MergeRow(const Matrix &Up, const Matrix &Down);
Matrix MergeCol(const Matrix &Left, const Matrix &Right);

#endif
