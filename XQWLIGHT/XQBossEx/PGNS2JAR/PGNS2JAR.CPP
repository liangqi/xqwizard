/*
PGNS2JAR - a XQBoss Jar Making Program
Designed by Morning Yellow, Version: 4.0, Last Modified: May 2009
Copyright (C) 2004-2009 www.elephantbase.net

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

#include <windows.h>
#include <shlobj.h>
#include <stdio.h>
#include <string.h>
#include "zip.h"

const int MAX_CHAR = 1024;

// 棋谱信息
static struct {
  char szTitle[MAX_CHAR];     // 棋谱标题
  char szSrcFolder[MAX_CHAR]; // 棋谱来源文件夹
  char szDstFolder[MAX_CHAR]; // 棋谱目标文件夹
  char szJarFile[MAX_CHAR];   // 手机棋谱程序文件
} XqBossEx;

// 定位棋谱目标文件夹
void LocateDestFolder(void) {
  char *lpBackSlash;
  GetModuleFileName(NULL, XqBossEx.szDstFolder, MAX_PATH);
  lpBackSlash = strrchr(XqBossEx.szDstFolder, '\\');
  if (lpBackSlash == NULL) {
    strcpy(XqBossEx.szDstFolder, "XQBOSSEX");
  } else {
    strcpy(lpBackSlash, "\\XQBOSSEX");
  }
}

// 选择棋谱来源文件夹
bool ChooseSourceFolder(void) {
  char *lpBackSlash;
  BROWSEINFO bi;
  LPITEMIDLIST pidl;

  bi.hwndOwner = NULL;
  bi.pidlRoot = NULL;
  bi.pszDisplayName = NULL;
  bi.lpszTitle = "请选择象棋棋谱(*.PGN)所在的文件夹";
  bi.ulFlags = BIF_RETURNONLYFSDIRS;
  bi.lpfn = NULL;
  bi.lParam = NULL;
  bi.iImage = 0;
  pidl = SHBrowseForFolder(&bi);
  if (!SHGetPathFromIDList(pidl, XqBossEx.szSrcFolder)) {
    return false;
  }

  // 获取棋谱标题
  lpBackSlash = strrchr(XqBossEx.szSrcFolder, '\\');
  if (lpBackSlash == NULL || lpBackSlash[1] == '\0') {
    strcpy(XqBossEx.szTitle, "无标题");
  } else {
    strcpy(XqBossEx.szTitle, lpBackSlash + 1);
  }
  return true;
}

// 选择要生成的手机棋谱文件
bool ChooseJarFile(void) {
  OPENFILENAME ofn;

  strcpy(XqBossEx.szJarFile, XqBossEx.szTitle);
  strcat(XqBossEx.szJarFile, ".jar");
  memset(&ofn, 0, sizeof(OPENFILENAME));
  ofn.lStructSize = sizeof(OPENFILENAME);
  ofn.lpstrFilter = "手机应用程序 (*.jar)\0*.jar\0所有文件 (*.*)\0*.*\0";
  ofn.lpstrFile = XqBossEx.szJarFile;
  ofn.nMaxFile = MAX_PATH;
  ofn.lpstrTitle = "请指定要生成的手机棋谱程序";
  ofn.lpstrDefExt = "jar";
  ofn.Flags = OFN_PATHMUSTEXIST + OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT;
  return GetSaveFileName(&ofn) != 0;
}

static void SearchFolder(const char *szFolderPath, const EccoApiStruct &EccoApi);

// 搜索到指定的文件
static void SearchFile(const char *szSrcFilePath, const char *szDstFilePath, const WIN32_FIND_DATA &wfd) {
  int nPathLen;
  char szPgnFile[MAX_CHAR];
  if ((wfd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) == 0) {
    nPathLen = strlen(szFilePath) - 4;
    if (nPathLen > 0 && strnicmp(szFilePath + nPathLen, ".PGN", 4) == 0) {
      // 是PGN文件，写入FILELIST
    }
  } else if (strcmp(wfd.cFileName, ".") != 0 && strcmp(wfd.cFileName, "..") != 0) {
    SearchFolder(szFilePath);
    // 是目录，写入FILELIST
  }
}

// 搜索指定文件夹
static void SearchFolder(const char *szSrcFolderPath, const char *szDstFolderPath) {
  int nIndex;
  char szFilePath[MAX_CHAR];
  WIN32_FIND_DATA wfd;
  HANDLE hFind;
  char *lpFilePath;

  strcpy(szFilePath, szFolderPath);
  lpFilePath = szFilePath + strlen(szFolderPath);
  if (*(lpFilePath - 1) == '\\') {
    lpFilePath --;
  }
  strcpy(lpFilePath, "\\*");
  lpFilePath ++;
  hFind = FindFirstFile(szFilePath, &wfd);
  if (hFind != INVALID_HANDLE_VALUE) {
    strcpy(lpFilePath, wfd.cFileName);
    SearchFile(szFilePath, wfd, 1);
    nIndex = 2;
    while (FindNextFile(hFind, &wfd)) {
      strcpy(lpFilePath, wfd.cFileName);
      SearchFile(szFilePath, wfd, nIndex);
      nIndex ++;
    }
  }
  FindClose(hFind);
}

// InfoZip参数
static int WINAPI PrintFunction(LPSTR, unsigned long) {
  return 0;
}
const char *argv[1] = {"."};

// 用InfoZip生成JAR文件
void CreateJarFile(void) {
  ZIPUSERFUNCTIONS zuf;
  ZPOPT zpopt;
  ZCL zcl;

  memset(&zuf, 0, sizeof(ZIPUSERFUNCTIONS));
  zuf.print = PrintFunction;
  ZpInit(&zuf);

  memset(&zpopt, 0, sizeof(ZPOPT));
  zpopt.szRootDir = XqBossEx.szDstFolder;
  zpopt.fExtra = TRUE;
  zpopt.fRecurse = 1;

  memset(&zcl, 0, sizeof(ZCL));
  zcl.argc = 1;
  zcl.lpszZipFN = XqBossEx.szJarFile;
  zcl.FNV = (char **) argv;
  ZpArchive(zcl, &zpopt);
}

// 主程序
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
  char sz[MAX_CHAR];

  // 定位棋谱目标文件夹
  LocateDestFolder();
  // 让用户选择棋谱来源文件夹
  if (!ChooseSourceFolder()) {
    return 0;
  }
  // 让用户选择手机棋谱程序文件
  if (!ChooseJarFile()) {
    return 0;
  }
  CreateJarFile();

  sprintf(sz, "手机棋谱 %s 制作成功。\n%s", XqBossEx.szJarFile, XqBossEx.szDstFolder);
  MessageBox(NULL, sz, "手机棋谱制作工具", 0);
  return 0;
}