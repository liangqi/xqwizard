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

const int CALLBACK_CONTEXT      = 7;
const int CALLBACK_ADDRESS      = 12;
const int CALLBACK_WPARAMLEN    = 19;
const int CALLBACK_SIZE         = 32;

// LPVOID WINAPI Callback(LPVOID lpContext, LPCVOID lpcParam);

static const unsigned char cucCallbackPattern[] = {
#ifdef _DEBUG
  0xCC,                         // int
#else
  0x90,                         // noop
#endif
  0x8D, 0x44, 0x24, 0x04,       // lea eax, [esp+4]
  0x50,                         // push eax
  0x68, 0xCC, 0xCC, 0xCC, 0xCC, // push lpContext
  0xB8, 0xCC, 0xCC, 0xCC, 0xCC, // mov eax, lpCallback
  0xFF, 0xD0,                   // call eax
  0xC2, 0xCC, 0xCC,             // ret wParamLen
  0xCC, 0xCC, 0xCC, 0xCC, 0xCC, // Reserved
  0xCC, 0xCC, 0xCC, 0xCC, 0xCC, // Reserved
  0xCC                          // Reserved
}; // 32 Bytes

__declspec(dllexport) VOID WINAPI PrepareCallback(LPBYTE lpucCallbackMem, LPVOID lpCallback, LPVOID lpContext, DWORD dwParamLen) {
  memcpy(lpucCallbackMem, cucCallbackPattern, CALLBACK_SIZE);
  *(LPDWORD) (lpucCallbackMem + CALLBACK_CONTEXT) = (DWORD) lpContext;
  *(LPDWORD) (lpucCallbackMem + CALLBACK_ADDRESS) = (DWORD) lpCallback;
  *(LPWORD) (lpucCallbackMem + CALLBACK_WPARAMLEN) = (WORD) dwParamLen;
}