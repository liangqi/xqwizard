#include <windows.h>

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
  ShellExecute(NULL, NULL,
      MessageBox(NULL, "是否從 SourceForge.net 下載象棋巫師安裝包?", "歡迎使用象棋巫師", MB_ICONQUESTION + MB_YESNO) == IDYES ?
      "http://nchc.dl.sourceforge.net/sourceforge/xqwizard/xqwizard_trad.exe" :
      "http://www.elephantbase.net/xqwizard/download.htm", NULL, NULL, SW_SHOW);
  return 0;
}