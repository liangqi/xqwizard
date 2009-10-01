#include <windows.h>

__declspec(dllexport) DWORD WINAPI GetAppType(LPCSTR szFilePath);

static BOOL ReadFileBytes(HANDLE hFile, LPVOID lpBuffer, DWORD dwSize) {
  DWORD dwBytes = 0;
  if (!ReadFile(hFile, lpBuffer, dwSize, &dwBytes, NULL)) {
    return FALSE;
  }
  return (dwSize == dwBytes);
}

DWORD WINAPI GetAppType(LPCSTR szFilePath) {
  HANDLE hImage;
  DWORD dwAppType;
  DWORD dwNewOffset;
  DWORD dwMoreDosHeader[16];
  ULONG ulNTSignature;

  IMAGE_DOS_HEADER dos_header;
  IMAGE_FILE_HEADER file_header;
  IMAGE_OPTIONAL_HEADER optional_header;

  hImage = CreateFile(szFilePath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
  if (hImage == INVALID_HANDLE_VALUE) {
    return -1;
  }
  if (!ReadFileBytes(hImage, &dos_header, sizeof(IMAGE_DOS_HEADER))) {
    return -1;
  }
  if (dos_header.e_magic != IMAGE_DOS_SIGNATURE) {
    return -1;
  }
  if (!ReadFileBytes(hImage, dwMoreDosHeader, sizeof(dwMoreDosHeader))) {
    return -1;
  }
  dwNewOffset = SetFilePointer(hImage, dos_header.e_lfanew, NULL, FILE_BEGIN);
  if (dwNewOffset == -1) {
    return -1;
  }
  if (!ReadFileBytes(hImage, &ulNTSignature, sizeof(ULONG))) {
    return -1;
  }
  if (ulNTSignature != IMAGE_NT_SIGNATURE) {
    return -1;
  }
  if (!ReadFileBytes(hImage, &file_header, IMAGE_SIZEOF_FILE_HEADER)) {
    return -1;
  }
  if (!ReadFileBytes(hImage, &optional_header, IMAGE_SIZEOF_NT_OPTIONAL_HEADER)) {
    return -1;
  }
  dwAppType = optional_header.Subsystem;
  CloseHandle(hImage);
  return dwAppType;
}