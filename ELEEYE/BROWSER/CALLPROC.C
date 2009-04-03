#include <windows.h>

__declspec(dllexport) VOID WINAPI CallProc(VOID *lpProc, DWORD dwParamLen, LPCVOID lpcParam);

VOID WINAPI CallProc(VOID *lpProc, DWORD dwParamLen, LPCVOID *lpcParam) {
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