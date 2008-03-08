#ifdef _WIN32
  #include <windows.h>
#else
  #include <stdlib.h>
  #include <unistd.h>
#endif
#include <string.h>

#ifndef BASE2_H
#define BASE2_H

const int PATH_MAX_CHAR = 1024;

#ifdef _WIN32

inline void Idle(void) {
  Sleep(1);
}

const int PATH_SEPERATOR = '\\';

inline Bool AbsolutePath(const char *sz) {
  return sz[0] == '\\' || (((sz[0] >= 'A' && sz[0] <= 'Z') || (sz[0] >= 'a' && sz[0] <= 'z')) && sz[1] == ':');
}

inline void GetSelfExe(char *szDst) {
  GetModuleFileName(NULL, szDst, PATH_MAX_CHAR);
}

#else

inline void Idle(void) {
  usleep(1000);
}

const int PATH_SEPERATOR = '/';

inline Bool AbsolutePath(const char *sz) {
  return sz[0] == '/' || (sz[0] == '~' && sz[1] == '/');
}

inline void GetSelfExe(char *szDst) {
  readlink("/proc/self/exe", szDst, PATH_MAX_CHAR);
}

#endif

inline void LocatePath(char *szDst, const char *szSrc) {
  char *lpSeperator;
  if (AbsolutePath(szSrc)) {
    strcpy(szDst, szSrc);
  } else {
    GetSelfExe(szDst);
    lpSeperator = strrchr(szDst, PATH_SEPERATOR);
    if (lpSeperator == NULL) {
      strcpy(szDst, szSrc);
    } else {
      strcpy(lpSeperator + 1, szSrc);
    }
  }
}

#endif
