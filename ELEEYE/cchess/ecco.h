#ifndef ECCO_H
#define ECCO_H

#ifdef _WIN32

#include <windows.h>
#include "../utility/base.h"

const char *const cszLibEccoFile = "ECCO.DLL";

struct EccoApiStruct {
  HMODULE hModule;
  VOID (WINAPI *EccoInitOpenVar)(BOOL);
  LONG (WINAPI *EccoIndex)(LPCSTR);
  LPCSTR (WINAPI *EccoOpening)(LONG);
  LPCSTR (WINAPI *EccoVariation)(LONG);
  Bool Startup(const char *szLibEccoPath, Bool bTrad = FALSE) {
    hModule = LoadLibrary(szLibEccoPath);
    if (hModule != NULL) {
      EccoInitOpenVar = (VOID (WINAPI *)(BOOL)) GetProcAddress(hModule, "_EccoInitOpenVar@4");
      EccoIndex = (LONG (WINAPI *)(LPCSTR)) GetProcAddress(hModule, "_EccoIndex@4");
      EccoOpening = (LPCSTR (WINAPI *)(LONG)) GetProcAddress(hModule, "_EccoOpening@4");
      EccoVariation = (LPCSTR (WINAPI *)(LONG)) GetProcAddress(hModule, "_EccoVariation@4");
      EccoInitOpenVar(FALSE);
      return TRUE;
    } else {
      return FALSE;
    }
  }
  Bool Available(void) const {
    return hModule != NULL;
  }
  void Shutdown(void) {
    if (hModule != NULL) {
      FreeLibrary(hModule);
    }
  }
};

#else

#include <dlfcn.h>
#include "../utility/base.h"

const char *const cszLibEccoFile = "libecco.so";

struct EccoApiStruct {
  void *hModule;
  void (*EccoInitOpenVar)(Bool);
  uint32 (*EccoIndex)(const char *);
  const char *(*EccoOpening)(uint32);
  const char *(*EccoVariation)(uint32);
  Bool Startup(const char *szLibEccoPath, Bool bTrad = FALSE) {
    hModule = dlopen(szLibEccoPath, RTLD_LAZY);
    if (hModule != NULL) {
      EccoInitOpenVar = (void (*)(Bool)) dlsym(hModule, "EccoInitOpenVar");
      EccoIndex = (uint32 (*)(const char *)) dlsym(hModule, "EccoIndex");
      EccoOpening = (const char *(*)(uint32)) dlsym(hModule, "EccoOpening");
      EccoVariation = (const char *(*)(uint32)) dlsym(hModule, "EccoVariation");
      EccoInitOpenVar(FALSE);
      return TRUE;
    } else {
      return FALSE;
    }
  }
  Bool Available(void) const {
    return hModule != NULL;
  }
  void Shutdown(void) {
    if (hModule != NULL) {
      dlclose(hModule);
    }
  }
};

#endif

#endif
