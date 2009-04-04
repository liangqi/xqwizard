#include <stdlib.h>
#include <string.h>
#include <windows.h>

__declspec(dllexport) VOID WINAPI CallProc(LPVOID lpProc, LPCVOID lpcParam, DWORD dwParamLen) {
  __asm {
    mov   eax, lpcParam;
    mov   ecx, dwParamLen;
L_LOOP:
    jcxz  L_EXIT;
    sub   ecx, 4;
    push  [eax + ecx];
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