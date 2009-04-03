#include <stdlib.h>
#include <string.h>
#include <windows.h>

__declspec(dllexport) VOID WINAPI CallProc(LPVOID lpProc, DWORD dwParamLen, LPCVOID lpcParam) {
  __asm {
    mov   ebx, lpcParam;
    mov   ecx, dwParamLen;
L_LOOP:
    jcxz  L_EXIT;
    sub   ecx, 4;
    push  [ebx + ecx];
    jmp   L_LOOP;
L_EXIT:
    mov   eax, lpProc;
    call  eax;
  }
}

__declspec(dllexport) LPVOID WINAPI Alloc(DWORD dwSize) {
  return malloc(dwSize);
}

__declspec(dllexport) LPSTR WINAPI StrDup(LPCSTR lpcsz) {
  return _strdup(lpcsz);
}

__declspec(dllexport) VOID WINAPI Free(LPVOID lp) {
  free(lp);
}