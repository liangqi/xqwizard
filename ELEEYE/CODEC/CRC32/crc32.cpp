#include "../../base/base.h"
#include "crc32.h"

#ifdef CRC32_DLL

#include <windows.h>

extern "C" __declspec(dllexport) VOID WINAPI Crc32Init(VOID);
extern "C" __declspec(dllexport) VOID WINAPI Crc32Reset(LPDWORD lpdwCrc);
extern "C" __declspec(dllexport) VOID WINAPI Crc32Update(LPDWORD lpdwCrc, LPCSTR lpBuffer, LONG nLen);
extern "C" __declspec(dllexport) DWORD WINAPI Crc32Digest(LPDWORD lpdwCrc);

VOID WINAPI Crc32Init(VOID) {
  InitCrc32Table();
}

VOID WINAPI Crc32Reset(LPDWORD lpdwCrc) {
  ((Crc32 *) lpdwCrc)->Reset();
}

VOID WINAPI Crc32Update(LPDWORD lpdwCrc, LPCSTR lpBuffer, LONG nLen) {
  ((Crc32 *) lpdwCrc)->Update((const uint8_t *) lpBuffer, nLen);
}

DWORD WINAPI Crc32Digest(LPDWORD lpdwCrc) {
  return ((Crc32 *) lpdwCrc)->Digest();
}

#endif

static const uint32_t CRC32_IV = 0xedb88320;

uint32_t dwCrc32Table[256];

void InitCrc32Table(void) {
  int i, j;
  uint32_t r;
  for (i = 0; i < 256; i ++) {
    r = i;
    for (j = 0; j < 8; j ++) {
      r = (r >> 1) ^ ((r & 1) == 0 ? 0 : CRC32_IV);
    }
    dwCrc32Table[i] = r;
  }
}

void Crc32::Update(const uint8_t *lpuc, int nLen) {
  int i;
  for (i = 0; i < nLen; i ++) {
    Update(lpuc[i]);
  }
}
