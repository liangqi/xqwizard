#ifdef _WIN32
  #include <windows.h>
#endif
#include "base.h"

#ifndef PIPE_H
#define PIPE_H

const int LINE_INPUT_MAX_CHAR = 4096;

struct PipeStruct {
#ifdef _WIN32
  HANDLE hInput, hOutput;
  BOOL bConsole;
  int nBytesLeft;
#else
  int nInput, nOutput;
#endif
  int nReadEnd;
  char szBuffer[LINE_INPUT_MAX_CHAR];

  void Open(const char *szExecFile = NULL);
  void Close(void) const;
  void ReadInput(void);
  Bool CheckInput(void);
  Bool GetBuffer(char *szLineStr);
  Bool LineInput(char *szLineStr);
  void LineOutput(const char *szLineStr) const;
}; // pipe

#endif
