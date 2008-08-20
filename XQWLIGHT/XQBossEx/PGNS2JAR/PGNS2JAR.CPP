/*
PGNS2JAR - a XQBoss Jar Making Program
Designed by Morning Yellow, Version: 3.14, Last Modified: Jun. 2008
Copyright (C) 2004-2008 www.elephantbase.net

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

int main(void) {
  char szPath[MAX_PATH], szJarFile[MAX_PATH];
  BROWSEINFO bi;
  LPITEMIDLIST pidl;
  OPENFILENAME ofn;
  ZIPUSERFUNCTIONS zuf;
  ZPOPT zpopt;
  ZCL zcl;

  bi.hwndOwner = NULL;
  bi.pidlRoot = NULL;
  bi.pszDisplayName = NULL;
  bi.lpszTitle = "请选择象棋棋谱(*.PGN)所在的文件夹";
  bi.ulFlags = BIF_RETURNONLYFSDIRS;
  bi.lpfn = NULL;
  bi.lParam = NULL;
  bi.iImage = 0;
  pidl = SHBrowseForFolder(&bi);
  if (!SHGetPathFromIDList(pidl, szPath)) {
    return 0;
  }

  szJarFile[0] = '\0';
  memset(&ofn, 0, sizeof(OPENFILENAME));
  ofn.lStructSize = sizeof(OPENFILENAME);
  ofn.lpstrFilter = "Executable Jar File (*.jar)\0*.jar\0";
  ofn.lpstrFile = szJarFile;
  ofn.nMaxFile = MAX_PATH;
  ofn.lpstrTitle = "请指定要生成的手机棋谱程序";
  ofn.Flags = OFN_PATHMUSTEXIST + OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT;
  if (!GetSaveFileName(&ofn)) {
    return 0;
  }

  memset(&zuf, 0, sizeof(ZIPUSERFUNCTIONS));
  ZpInit(&zuf);
  memset(&zpopt, 0, sizeof(ZPOPT));
  memset(&zcl, 0, sizeof(ZCL));
  ZpArchive(zcl, &zpopt);

  printf("%s %s\n", szPath, szJarFile);
  return 0;
}