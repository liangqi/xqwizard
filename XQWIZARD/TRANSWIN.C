#include <windows.h>

__declspec(dllexport) HWND WINAPI TransparentWindow(HINSTANCE hInstance, HBITMAP hBitmap, UINT crTransparent);

static void TransparentBlt2(HDC hdcDest, int nXOriginDest, int nYOriginDest, int nWidthDest, int nHeightDest,
    HDC hdcSrc, int nXOriginSrc, int nYOriginSrc, int nWidthSrc, int nHeightSrc, UINT crTransparent) {
  HDC hImageDC, hMaskDC;
  HBITMAP hOldImageBMP, hImageBMP, hOldMaskBMP, hMaskBMP;

  hImageBMP = CreateCompatibleBitmap(hdcDest, nWidthDest, nHeightDest);
  hMaskBMP = CreateBitmap(nWidthDest, nHeightDest, 1, 1, NULL);
  hImageDC = CreateCompatibleDC(hdcDest);
  hMaskDC = CreateCompatibleDC(hdcDest);
  hOldImageBMP = (HBITMAP) SelectObject(hImageDC, hImageBMP);
  hOldMaskBMP = (HBITMAP) SelectObject(hMaskDC, hMaskBMP);

  if (nWidthDest == nWidthSrc && nHeightDest == nHeightSrc) {
    BitBlt(hImageDC, 0, 0, nWidthDest, nHeightDest,
        hdcSrc, nXOriginSrc, nYOriginSrc, SRCCOPY);
  } else {
    StretchBlt(hImageDC, 0, 0, nWidthDest, nHeightDest,
        hdcSrc, nXOriginSrc, nYOriginSrc, nWidthSrc, nHeightSrc, SRCCOPY);
  }
  SetBkColor(hImageDC, crTransparent);
  BitBlt(hMaskDC, 0, 0, nWidthDest, nHeightDest, hImageDC, 0, 0, SRCCOPY);
  SetBkColor(hImageDC, RGB(0,0,0));
  SetTextColor(hImageDC, RGB(255,255,255));
  BitBlt(hImageDC, 0, 0, nWidthDest, nHeightDest, hMaskDC, 0, 0, SRCAND);
  SetBkColor(hdcDest, RGB(255,255,255));
  SetTextColor(hdcDest, RGB(0,0,0));
  BitBlt(hdcDest, nXOriginDest, nYOriginDest, nWidthDest, nHeightDest,
      hMaskDC, 0, 0, SRCAND);
  BitBlt(hdcDest, nXOriginDest, nYOriginDest, nWidthDest, nHeightDest,
      hImageDC, 0, 0, SRCPAINT);

  SelectObject(hImageDC, hOldImageBMP);
  DeleteDC(hImageDC);
  SelectObject(hMaskDC, hOldMaskBMP);
  DeleteDC(hMaskDC);
  DeleteObject(hImageBMP);
  DeleteObject(hMaskBMP);
}

HWND WINAPI TransparentWindow(HINSTANCE hInstance, HBITMAP hBitmap, UINT crTransparent) {
  HWND hWnd;
  HDC hdc, hdcTmp;
  RECT rect;
  BITMAP bmp;

  GetWindowRect(GetDesktopWindow(), &rect);
  hWnd = CreateWindow("TransparentWindow", NULL, WS_VISIBLE, 0, 0, rect.right, rect.bottom, NULL, NULL, hInstance, NULL);
  hdc = GetDC(hWnd);
  hdcTmp = CreateCompatibleDC(hdc);
  SelectObject(hdcTmp, hBitmap);
  GetObject(hBitmap, sizeof(BITMAP), &bmp);
  TransparentBlt2(hdc, (rect.right - bmp.bmWidth) / 2, (rect.bottom - bmp.bmHeight) / 2,
      bmp.bmWidth, bmp.bmHeight, hdcTmp, 0, 0, bmp.bmWidth, bmp.bmHeight, crTransparent);
  DeleteDC(hdcTmp);
  ReleaseDC(hWnd, hdc);
  return hWnd;
}