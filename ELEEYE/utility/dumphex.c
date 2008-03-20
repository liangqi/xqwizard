#ifdef DUMPHEX_DLL

#include <windows.h>
#include "dumphex.h"

extern "C" __declspec(dllexport) LONG WINAPI DumpHexA(LPSTR szHexText, LPCSTR lpBuffer, LONG nOffset, LONG nLength);

LONG WINAPI DumpHexA(LPSTR szHexText, LPCSTR lpBuffer, LONG nOffset, LONG nLength) {
  return DumpHex(szHexText, lpBuffer, nOffset, nLength);
}

#endif

static void DumpLine(char *szHexText, const char *lpBuffer, int nOffsetMod16, int nBegin, int nEnd) {
  
}

int DumpHex(char *szHexText, const char *lpBuffer, int nOffset, int nLength) {
  int nOffsetMod16, nEndMod16;
  
}