#include "base.h"
#include "matrix.h"

Matrix Matrix::DelRowCol(int RowStart, int RowLen, int ColStart, int ColLen) const {
  Matrix RetVal(Row - RowLen, Col - ColLen);
  RetVal.Load(0, 0, *this, 0, 0, RowStart, ColStart);
  RetVal.Load(RowStart, 0, *this, RowStart + RowLen, 0, Row - RowStart - RowLen, ColStart);
  RetVal.Load(0, ColStart, *this, 0, ColStart + ColLen, RowStart, Col - ColStart - ColLen);
  RetVal.Load(RowStart, ColStart, *this, RowStart + RowLen, ColStart + ColLen, Row - RowStart - RowLen, Col - ColStart - ColLen);
  return RetVal;
}

Matrix Matrix::DelRow(int Start, int Len) const {
  Matrix RetVal(Row - Len, Col);
  RetVal.Load(0, 0, *this, 0, 0, Start, Col);
  RetVal.Load(Start, 0, *this, Start + Len, 0, Row - Start - Len, Col);
  return RetVal;
}

Matrix Matrix::DelCol(int Start, int Len) const {
  Matrix RetVal(Row, Col - Len);
  RetVal.Load(0, 0, *this, 0, 0, Row, Start);
  RetVal.Load(0, Start, *this, 0, Start + Len, Row, Col - Start - Len);
  return RetVal;
}

Matrix Matrix::operator -(void) const {
  int i, j;
  Matrix RetVal(Row, Col);
  for (i = 0; i < Row; i ++) {
    for (j = 0; j < Col; j ++) {
      RetVal[i][j] = -(*this)[i][j];
    }
  }
  return RetVal;
}

Matrix Matrix::operator +(const Matrix &Matr) const {
  int i, j;
  Matrix RetVal(Row, Col);
  for (i = 0; i < Row; i ++) {
    for (j = 0; j < Col; j ++) {
      RetVal[i][j] = (*this)[i][j] + Matr[i][j];
    }
  }
  return RetVal;
}

Matrix Matrix::operator -(const Matrix &Matr) const {
  int i, j;
  Matrix RetVal(Row, Col);
  for (i = 0; i < Row; i ++) {
    for (j = 0; j < Col; j ++) {
      RetVal[i][j] = (*this)[i][j] - Matr[i][j];
    }
  }
  return RetVal;
}

Matrix Matrix::operator *(double Real) const {
  int i, j;
  Matrix RetVal(Row, Col);
  for (i = 0; i < Row; i ++) {
    for (j = 0; j < Col; j ++) {
      RetVal[i][j] = (*this)[i][j] * Real;
    }
  }
  return RetVal;
}

Matrix Matrix::operator /(double Real) const {
  int i, j;
  Matrix RetVal(Row, Col);
  for (i = 0; i < Row; i ++) {
    for (j = 0; j < Col; j ++) {
      RetVal[i][j] = (*this)[i][j] / Real;
    }
  }
  return RetVal;
}

Matrix Matrix::operator *(const Matrix &Matr) const {
  int i, j, k;
  Matrix RetVal(Row, Matr.Col);
  for (i = 0; i < Row; i ++) {
    for (j = 0; j < Matr.Col; j ++) {
      for (k = 0; k < Col; k ++) {
        RetVal[i][j] += (*this)[i][k] * Matr[k][j];
      }
    }
  }
  return RetVal;
}

Matrix Matrix::Trans(void) const {
  int i, j;
  Matrix RetVal(Col, Row);
  for (i = 0; i < Col; i ++) {
    for (j = 0; j < Row; j ++) {
      RetVal[i][j] = (*this)[j][i];
    }
  }
  return RetVal;
}

double Matrix::Det(void) const {
  int i, j, MaxJ;
  double RetVal, ThisElem, MaxElem;
  Matrix Temp(*this);
  RetVal = 1.0;
  for (i = 0; i < Row; i ++) {
    // Stage 1:
    MaxElem = 0.0;
    MaxJ = i;
    for (j = i; j < Row; j ++) {
      ThisElem = ABS(Temp[i][j]);
      if (ThisElem > MaxElem) {
        MaxJ = j;
        MaxElem = ThisElem;
      }
    }
    if (MaxElem == 0.0) {
      return 0.0;
    }
    if (MaxJ != i) {
      RetVal = -RetVal;
      Temp.ColSwap(i, MaxJ);
    }
    // Stage 2:
    RetVal *= Temp[i][i];
    Temp.RowMul(i, 1.0 / Temp[i][i], i);
    for (j = i + 1; j < Row; j ++) {
      if (Temp[j][i] != 0.0) {
        RetVal *= Temp[j][i];
        Temp.RowMul(j, 1.0 / Temp[j][i], i);
        Temp.RowSub(j, i, i);
      }
    }
  }
  return RetVal;
}

Matrix Matrix::LeftDiv(const Matrix &Matr) const {
  int i, j, MaxJ;
  double ThisElem, MaxElem;
  int *SwapList;
  Matrix RetVal(*this), Temp(Matr);
  SwapList = new int[Row];
  for (i = 0; i < Row; i ++) {
    // Stage 1:
    MaxElem = 0.0;
    MaxJ = i;
    for (j = i; j < Row; j ++) {
      ThisElem = ABS(Temp[i][j]);
      if (ThisElem > MaxElem) {
        MaxJ = j;
        MaxElem = ThisElem;
      }
    }
    if (MaxElem == 0.0) {
      delete[] SwapList;
      return Matrix(Row, Row);
    }
    SwapList[i] = MaxJ;
    if (MaxJ != i) {
      Temp.ColSwap(i, MaxJ);
    }
    // Stage 2:
    RetVal.RowMul(i, 1.0 / Temp[i][i]);
    Temp.RowMul(i, 1.0 / Temp[i][i], i);
    for (j = i + 1; j < Row; j ++) {
      if (Temp[j][i] != 0.0) {
        RetVal.RowMul(j, 1.0 / Temp[j][i]);        
        RetVal.RowSub(j, i);
        Temp.RowMul(j, 1.0 / Temp[j][i], i);
        Temp.RowSub(j, i, i);
      }
    }
  }
  // Stage 3:
  for (i = Row - 1; i >= 0; i --) {
    for (j = i - 1; j >= 0; j --) {
      if (Temp[j][i] != 0.0) {
        RetVal.RowSubMul(j, i, Temp[j][i]);
      }
    }
  }
  // Stage 4:
  for (i = Row - 1; i >= 0; i --) {
    if (SwapList[i] != i) {
      RetVal.RowSwap(i, SwapList[i]);
    }
  }
  delete[] SwapList;
  return RetVal;
}

Matrix Matrix::RightDiv(const Matrix &Matr) const {
  int i, j, MaxJ;
  double ThisElem, MaxElem;
  int *SwapList;
  Matrix RetVal(*this), Temp(Matr);
  SwapList = new int[Col];
  for (i = 0; i < Col; i ++) {
    // Stage 1:
    MaxElem = 0.0;
    MaxJ = i;
    for (j = i; j < Col; j ++) {
      ThisElem = ABS(Temp[j][i]);
      if (ThisElem > MaxElem) {
        MaxJ = j;
        MaxElem = ThisElem;
      }
    }
    if (MaxElem == 0.0) {
      delete[] SwapList;
      return Matrix(Col, Col);
    }
    SwapList[i] = MaxJ;
    if (MaxJ != i) {
      Temp.RowSwap(i, MaxJ);
    }
    // Stage 2:
    RetVal.ColMul(i, 1.0 / Temp[i][i]);
    Temp.ColMul(i, 1.0 / Temp[i][i], i);
    for (j = i + 1; j < Col; j ++) {
      if (Temp[i][j] != 0.0) {
        RetVal.ColMul(j, 1.0 / Temp[i][j]);
        RetVal.ColSub(j, i);
        Temp.ColMul(j, 1.0 / Temp[i][j], i);
        Temp.ColSub(j, i, i);
      }
    }
  }
  // Stage 3:
  for (i = Col - 1; i >= 0; i --) {
    for (j = i - 1; j >= 0; j --) {
      if (Temp[i][j] != 0.0) {
        RetVal.ColSubMul(j, i, Temp[i][j]);
      }
    }
  }
  // Stage 4:
  for (i = Col - 1; i >= 0; i --) {
    if (SwapList[i] != i) {
      RetVal.ColSwap(i, SwapList[i]);
    }
  }
  delete[] SwapList;
  return RetVal;
}

Matrix Matrix::Inv(void) const {
  int i;
  Matrix RetVal(Row, Row);
  for (i = 0; i < Row; i ++) {
    RetVal[i][i] = 1.0;
  }
  return RetVal.LeftDiv(*this);
}

Matrix operator *(double Real, const Matrix &Matr) {
  int i, j;
  Matrix RetVal(Matr.Row, Matr.Col);
  for (i = 0; i < Matr.Row; i ++) {
    for (j = 0; j < Matr.Col; j ++) {
      RetVal[i][j] = Matr[i][j] * Real;
    }
  }
  return RetVal;
}

Matrix Merge(const Matrix &UpLeft, const Matrix &DownLeft, const Matrix &UpRight, const Matrix &DownRight) {
  Matrix RetVal(UpLeft.Row + DownLeft.Row, UpLeft.Col + UpRight.Col);
  RetVal.Load(0, 0, UpLeft, 0, 0, UpLeft.Row, UpLeft.Col);
  RetVal.Load(UpLeft.Row, 0, DownLeft, 0, 0, DownLeft.Row, DownLeft.Col);
  RetVal.Load(0, UpLeft.Col, UpRight, 0, 0, UpRight.Row, UpRight.Col);
  RetVal.Load(UpLeft.Row, UpLeft.Col, DownRight, 0, 0, DownRight.Row, DownRight.Col);
  return RetVal;
}

Matrix MergeRow(const Matrix &Up, const Matrix &Down) {
  Matrix RetVal(Up.Row + Down.Row, Up.Col);
  RetVal.Load(0, 0, Up, 0, 0, Up.Row, Up.Col);
  RetVal.Load(Up.Row, 0, Down, 0, 0, Down.Row, Down.Col);
  return RetVal;
}

Matrix MergeCol(const Matrix &Left, const Matrix &Right) {
  Matrix RetVal(Left.Row, Left.Col + Right.Col);
  RetVal.Load(0, 0, Left, 0, 0, Left.Row, Left.Col);
  RetVal.Load(0, Left.Col, Right, 0, 0, Right.Row, Right.Col);
  return RetVal;
}
