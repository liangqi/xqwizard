#include <stdlib.h>
#include <string.h>
#include <windows.h>

__declspec(dllexport) LPVOID WINAPI Lea(LPVOID lp);
__declspec(dllexport) BYTE WINAPI BytePtr(LPBYTE lpuc);
__declspec(dllexport) WORD WINAPI WordPtr(LPWORD lpw);
__declspec(dllexport) DWORD WINAPI DWordPtr(LPDWORD lpdw);
__declspec(dllexport) unsigned __int64 WINAPI QWordPtr(unsigned __int64 *lpqw);
__declspec(dllexport) float WINAPI Real4Ptr(float *lpsf);
__declspec(dllexport) double WINAPI Real8Ptr(double *lpdf);
__declspec(dllexport) VOID WINAPI MovBytePtr(LPBYTE lpuc, BYTE uc);
__declspec(dllexport) VOID WINAPI MovWordPtr(LPWORD lpw, WORD w);
__declspec(dllexport) VOID WINAPI MovDWordPtr(LPDWORD lpdw, DWORD dw);
__declspec(dllexport) VOID WINAPI MovQWordPtr(unsigned __int64 *lpqw, unsigned __int64 qw);
__declspec(dllexport) LPSTR WINAPI StrAlloc(LPCSTR lpsz);
__declspec(dllexport) VOID WINAPI StrFree(LPSTR lpsz);

LPVOID WINAPI Lea(LPVOID lp) {
  return lp;
}

BYTE WINAPI BytePtr(LPBYTE lpuc) {
  return *lpuc;
}

WORD WINAPI WordPtr(LPWORD lpw) {
  return *lpw;
}

DWORD WINAPI DWordPtr(LPDWORD lpdw) {
  return *lpdw;
}

unsigned __int64 WINAPI QWordPtr(unsigned __int64 *lpqw) {
  return *lpqw;
}

float WINAPI Real4Ptr(float *lpsf) {
  return *lpsf;
}

double WINAPI Real8Ptr(double *lpdf) {
  return *lpdf;
}

VOID WINAPI MovBytePtr(LPBYTE lpuc, BYTE uc) {
  *lpuc = uc;
}

VOID WINAPI MovWordPtr(LPWORD lpw, WORD w) {
  *lpw = w;
}

VOID WINAPI MovDWordPtr(LPDWORD lpdw, DWORD dw) {
  *lpdw = dw;
}

VOID WINAPI MovQWordPtr(unsigned __int64 *lpqw, unsigned __int64 qw) {
  *lpqw = qw;
}

LPSTR WINAPI StrAlloc(LPCSTR lpsz) {
  return strcpy((char *) malloc(strlen(lpsz) + 1), lpsz);
}

VOID WINAPI StrFree(LPSTR lpsz) {
  free(lpsz);
}
