#include <windows.h>

__declspec(dllexport) VOID WINAPI AlphaBlt(
    HDC hdcDest, int xDest, int yDest, int nWidth, int nHeight,
    HDC hdcSrc, int xSrc, int ySrc, HDC hdcAlpha, int xAlpha, int yAlpha);

VOID WINAPI AlphaBlt(HDC hdcDest, int xDest, int yDest, int nWidth, int nHeight,
    HDC hdcSrc, int xSrc, int ySrc, HDC hdcAlpha, int xAlpha, int yAlpha) {
  int x, y;
  COLORREF clrDest, clrSrc, clrAlpha;
  HBITMAP hbmpTmp;
  HDC hdcTmp;

  hdcTmp = CreateCompatibleDC(hdcDest);
  hbmpTmp = CreateCompatibleBitmap(hdcDest, nWidth, nHeight);
  SelectObject(hdcTmp, hbmpTmp);
  for (y = 0; y < nHeight; y ++) {
    for (x = 0; x < nWidth; x ++) {
      clrDest = GetPixel(hdcDest, xDest + x, yDest + y);
      clrSrc = GetPixel(hdcSrc, xSrc + x, ySrc + y);
      clrAlpha = GetPixel(hdcAlpha, xAlpha + x, yAlpha + y);
      SetPixel(hdcTmp, x, y, RGB(
          (GetRValue(clrDest) * (256 - GetRValue(clrAlpha)) + GetRValue(clrSrc) * GetRValue(clrAlpha)) >> 8,
          (GetGValue(clrDest) * (256 - GetGValue(clrAlpha)) + GetGValue(clrSrc) * GetGValue(clrAlpha)) >> 8,
          (GetBValue(clrDest) * (256 - GetBValue(clrAlpha)) + GetBValue(clrSrc) * GetBValue(clrAlpha)) >> 8));
    }
  }
  BitBlt(hdcDest, xDest, yDest, nWidth, nHeight, hdcTmp, 0, 0, SRCCOPY);
  DeleteObject(hbmpTmp);
  DeleteDC(hdcTmp);
}