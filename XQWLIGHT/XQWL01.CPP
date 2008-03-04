/**
 * XiangQi Wizard Light - A Very Simple Chinese Chess Program
 * Designed by Morning Yellow, Version: 0.1, Last Modified: Mar. 2008
 * Copyright (C) 2004-2008 www.elephantbase.net
 *
 * 象棋小巫师 0.1 的目标：
 * 一、绘制棋具；
 * 二、制作一个可操作的图形界面。
 */

#include <windows.h>
#include "resource.h"

// 版本号
const char *const cszAbout = "象棋小巫师 0.1\n象棋百科全书 荣誉出品\n\n"
    "(C) 2004-2008 www.elephantbase.net\n本产品符合GNU通用公共许可协议\n\n"
    "欢迎登录 www.elephantbase.net\n免费下载PC版 象棋巫师";

// 窗口和绘图属性
const int WINDOW_STYLES = WS_OVERLAPPED | WS_SYSMENU | WS_CAPTION | WS_MINIMIZEBOX;
const int MASK_COLOR = RGB(0, 255, 0);
const int SQUARE_SIZE = 56;
const int BOARD_EDGE = 8;
const int BOARD_WIDTH = BOARD_EDGE + SQUARE_SIZE * 9 + BOARD_EDGE;
const int BOARD_HEIGHT = BOARD_EDGE + SQUARE_SIZE * 10 + BOARD_EDGE;

// 棋盘范围
const int RANK_TOP = 3;
const int RANK_BOTTOM = 12;
const int FILE_LEFT = 3;
const int FILE_RIGHT = 11;

// 棋子编号
const int PIECE_KING = 0;
const int PIECE_ADVISOR = 1;
const int PIECE_BISHOP = 2;
const int PIECE_KNIGHT = 3;
const int PIECE_ROOK = 4;
const int PIECE_CANNON = 5;
const int PIECE_PAWN = 6;

// 棋盘初始设置
static const unsigned char cucpcStartup[256] = {
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0, 20, 19, 18, 17, 16, 17, 18, 19, 20,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0, 21,  0,  0,  0,  0,  0, 21,  0,  0,  0,  0,  0,
  0,  0,  0, 22,  0, 22,  0, 22,  0, 22,  0, 22,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0, 14,  0, 14,  0, 14,  0, 14,  0, 14,  0,  0,  0,  0,
  0,  0,  0,  0, 13,  0,  0,  0,  0,  0, 13,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0, 12, 11, 10,  9,  8,  9, 10, 11, 12,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
};

// 获得格子的横坐标
inline int RANK_Y(int sq) {
  return sq >> 4;
}

// 获得格子的纵坐标
inline int FILE_X(int sq) {
  return sq & 15;
}

// 根据纵坐标和横坐标获得格子
inline int COORD_XY(int x, int y) {
  return x + (y << 4);
}

// 获得红黑标记(红子是8，黑子是16)
inline int SIDE_TAG(int sd) {
  return 8 + (sd << 3);
}

// 获得对方红黑标记
inline int OPP_SIDE_TAG(int sd) {
  return 16 - (sd << 3);
}

// 获得走法的起点
inline int SRC(int mv) {
  return mv & 255;
}

// 获得走法的终点
inline int DST(int mv) {
  return mv >> 8;
}

// 根据起点和终点获得走法
inline int MOVE(int sqSrc, int sqDst) {
  return sqSrc + sqDst * 256;
}

// 局面结构
struct PositionStruct {
  int sdPlayer;                   // 轮到谁走，0=红方，1=黑方
  unsigned char ucpcSquares[256]; // 棋盘上的棋子

  void Startup(void) {     // 初始化棋盘
    sdPlayer = 0;
    memcpy(ucpcSquares, cucpcStartup, 256);
  }
  void ChangeSide(void) {  // 交换走子方
    sdPlayer = 1 - sdPlayer;
  }
  void MovePiece(int mv) { // 搬一步棋的棋子
    ucpcSquares[DST(mv)] = ucpcSquares[SRC(mv)];
    ucpcSquares[SRC(mv)] = 0;
  }
  void MakeMove(int mv) {  // 走一步棋
    MovePiece(mv);
    ChangeSide();
  }
};

PositionStruct pos; // 局面实例

// 除"pos"外，所有的全局变量都包装在"Vsccp"这个结构中
static struct {
  HINSTANCE hInst;                              // 应用程序句柄实例
  HWND hWnd;                                    // 主窗口句柄
  int sqSelected, mvLast;                       // 选中的格子，上一步棋
  HBITMAP bmpBoard, bmpSelected, bmpPieces[24]; // 资源图片句柄
} Xqwl;

// TransparentBlt 的替代函数，用来修正原函数在 Windows 98 下资源泄漏的问题
static void TransparentBlt2(HDC hdcDest, int nXOriginDest, int nYOriginDest, int nWidthDest, int nHeightDest,
    HDC hdcSrc, int nXOriginSrc, int nYOriginSrc, int nWidthSrc, int nHeightSrc, UINT crTransparent) {
  HDC hImageDC, hMaskDC;
  HBITMAP hOldImageBMP, hImageBMP, hOldMaskBMP, hMaskBMP;

  hImageBMP = CreateCompatibleBitmap(hdcDest, nWidthDest, nHeightDest);
  hMaskBMP = CreateBitmap(nWidthDest, nHeightDest, 1, 1, NULL);
  hImageDC = CreateCompatibleDC(hdcDest);
  hMaskDC = CreateCompatibleDC(hdcDest);
  hOldImageBMP = (HBITMAP) SelectObject(hImageDC, hImageBMP);
  hOldMaskBMP = (HBITMAP) SelectObject(hMaskDC, hMaskBMP);

  if (nWidthDest == nWidthSrc && nHeightDest == nHeightSrc) {
    BitBlt(hImageDC, 0, 0, nWidthDest, nHeightDest,
        hdcSrc, nXOriginSrc, nYOriginSrc, SRCCOPY);
  } else {
    StretchBlt(hImageDC, 0, 0, nWidthDest, nHeightDest,
        hdcSrc, nXOriginSrc, nYOriginSrc, nWidthSrc, nHeightSrc, SRCCOPY);
  }
  SetBkColor(hImageDC, crTransparent);
  BitBlt(hMaskDC, 0, 0, nWidthDest, nHeightDest, hImageDC, 0, 0, SRCCOPY);
  SetBkColor(hImageDC, RGB(0,0,0));
  SetTextColor(hImageDC, RGB(255,255,255));
  BitBlt(hImageDC, 0, 0, nWidthDest, nHeightDest, hMaskDC, 0, 0, SRCAND);
  SetBkColor(hdcDest, RGB(255,255,255));
  SetTextColor(hdcDest, RGB(0,0,0));
  BitBlt(hdcDest, nXOriginDest, nYOriginDest, nWidthDest, nHeightDest,
      hMaskDC, 0, 0, SRCAND);
  BitBlt(hdcDest, nXOriginDest, nYOriginDest, nWidthDest, nHeightDest,
      hImageDC, 0, 0, SRCPAINT);

  SelectObject(hImageDC, hOldImageBMP);
  DeleteDC(hImageDC);
  SelectObject(hMaskDC, hOldMaskBMP);
  DeleteDC(hMaskDC);
  DeleteObject(hImageBMP);
  DeleteObject(hMaskBMP);
}

// 绘制透明图片
static void DrawTransBmp(HDC hdc, HDC hdcTmp, int xx, int yy, HBITMAP bmp) {
  SelectObject(hdcTmp, bmp);
  TransparentBlt2(hdc, xx, yy, SQUARE_SIZE, SQUARE_SIZE, hdcTmp, 0, 0, SQUARE_SIZE, SQUARE_SIZE, MASK_COLOR);
}

// "DrawSquare"参数
const BOOL DRAW_SELECTED = TRUE;

// 绘制格子
static void DrawSquare(HDC hdc, HDC hdcTmp, int sq, BOOL bSelected = FALSE) {
  int xx, yy, pc;

  xx = BOARD_EDGE + (FILE_X(sq) - FILE_LEFT) * SQUARE_SIZE;
  yy = BOARD_EDGE + (RANK_Y(sq) - RANK_TOP) * SQUARE_SIZE;
  SelectObject(hdcTmp, Xqwl.bmpBoard);
  BitBlt(hdc, xx, yy, SQUARE_SIZE, SQUARE_SIZE, hdcTmp, xx, yy, SRCCOPY);
  pc = pos.ucpcSquares[sq];
  if (pc != 0) {
    DrawTransBmp(hdc, hdcTmp, xx, yy, Xqwl.bmpPieces[pc]);
  }
  if (bSelected) {
    DrawTransBmp(hdc, hdcTmp, xx, yy, Xqwl.bmpSelected);
  }
}

// 绘制棋盘
static void DrawBoard(HDC hdc) {
  int x, y, xx, yy, sq, pc;
  HDC hdcTmp;

  // 画棋盘
  hdcTmp = CreateCompatibleDC(hdc);
  SelectObject(hdcTmp, Xqwl.bmpBoard);
  BitBlt(hdc, 0, 0, BOARD_WIDTH, BOARD_HEIGHT, hdcTmp, 0, 0, SRCCOPY);
  // 画棋子
  for (x = FILE_LEFT; x <= FILE_RIGHT; x ++) {
    for (y = RANK_TOP; y <= RANK_BOTTOM; y ++) {
      xx = BOARD_EDGE + (x - FILE_LEFT) * SQUARE_SIZE;
      yy = BOARD_EDGE + (y - RANK_TOP) * SQUARE_SIZE;
      sq = COORD_XY(x, y);
      pc = pos.ucpcSquares[sq];
      if (pc != 0) {
        DrawTransBmp(hdc, hdcTmp, xx, yy, Xqwl.bmpPieces[pc]);
      }
      if (sq == Xqwl.sqSelected || sq == SRC(Xqwl.mvLast) || sq == DST(Xqwl.mvLast)) {
        DrawTransBmp(hdc, hdcTmp, xx, yy, Xqwl.bmpSelected);
      }
    }
  }
  DeleteDC(hdcTmp);
}

// 走一步棋
static void MakeMove(int mv) {
  int sqSrc, sqDst, pc;
  sqSrc = SRC(mv);
  sqDst = DST(mv);
  pc = pos.ucpcSquares[sqSrc];
  pos.ucpcSquares[sqSrc] = 0;
  pos.ucpcSquares[sqDst] = pc;
  pos.sdPlayer = 1 - pos.sdPlayer;
}

// 播放资源声音
inline void PlayResWav(int nResId) {
  PlaySound(MAKEINTRESOURCE(nResId), Xqwl.hInst, SND_ASYNC | SND_NOWAIT | SND_RESOURCE);
}

// 点击格子事件处理
static void ClickSquare(int sq) {
  int pc;
  HDC hdc, hdcTmp;

  hdc = GetDC(Xqwl.hWnd);
  hdcTmp = CreateCompatibleDC(hdc);
  // 如果点击自己的子，那么直接选中该子
  pc = pos.ucpcSquares[sq];
  if ((pc & SIDE_TAG(pos.sdPlayer)) != 0) {
    if (Xqwl.sqSelected != 0) {
      DrawSquare(hdc, hdcTmp, Xqwl.sqSelected);
    }
    Xqwl.sqSelected = sq;
    DrawSquare(hdc, hdcTmp, sq, DRAW_SELECTED);
    if (Xqwl.mvLast != 0) {
      DrawSquare(hdc, hdcTmp, SRC(Xqwl.mvLast));
      DrawSquare(hdc, hdcTmp, DST(Xqwl.mvLast));
    }
    PlayResWav(IDR_CLICK); // 播放点击的声音
  // 如果点击的不是自己的子，但有子选中了(一定是自己的子)，那么走这个子
  } else if (Xqwl.sqSelected != 0) {
    Xqwl.mvLast = MOVE(Xqwl.sqSelected, sq);
    MakeMove(Xqwl.mvLast);
    DrawSquare(hdc, hdcTmp, Xqwl.sqSelected, DRAW_SELECTED);
    DrawSquare(hdc, hdcTmp, sq, DRAW_SELECTED);
    Xqwl.sqSelected = 0;
    PlayResWav(pc == 0 ? IDR_MOVE : IDR_CAPTURE); // 播放走子或吃子的声音
  }
  DeleteDC(hdcTmp);
  ReleaseDC(Xqwl.hWnd, hdc);
}

// 初始化棋局
static void Startup(void) {
  pos.Startup();
  Xqwl.sqSelected = Xqwl.mvLast = 0;
}

// 窗体事件捕捉过程
static LRESULT CALLBACK WndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam) {
  int x, y;
  HDC hdc;
  RECT rect;
  PAINTSTRUCT ps;
  MSGBOXPARAMS msgbox;

  switch (uMsg) {
  // 新建窗口
  case WM_CREATE:
    // 调整窗口位置和尺寸
    GetWindowRect(hWnd, &rect);
    x = rect.left;
    y = rect.top;
    rect.right = rect.left + BOARD_WIDTH;
    rect.bottom = rect.top + BOARD_HEIGHT;
    AdjustWindowRect(&rect, WINDOW_STYLES, TRUE);
    MoveWindow(hWnd, x, y, rect.right - rect.left, rect.bottom - rect.top, TRUE);
    break;
  // 退出
  case WM_DESTROY:
    PostQuitMessage(0);
    break;
  // 菜单命令
  case WM_COMMAND:
    switch (LOWORD(wParam)) {
    case IDM_FILE_RED:
    case IDM_FILE_BLACK:
      Startup();
      hdc = GetDC(Xqwl.hWnd);
      DrawBoard(hdc);
      ReleaseDC(Xqwl.hWnd, hdc);
      break;
    case IDM_FILE_EXIT:
      DestroyWindow(Xqwl.hWnd);
      break;
    case IDM_HELP_ABOUT:
      // 弹出带VSCCP图标的对话框
      MessageBeep(MB_ICONINFORMATION);
      msgbox.cbSize = sizeof(MSGBOXPARAMS);
      msgbox.hwndOwner = hWnd;
      msgbox.hInstance = Xqwl.hInst;
      msgbox.lpszText = cszAbout;
      msgbox.lpszCaption = "关于象棋小巫师";
      msgbox.dwStyle = MB_USERICON;
      msgbox.lpszIcon = MAKEINTRESOURCE(IDI_APPICON);
      msgbox.dwContextHelpId = 0;
      msgbox.lpfnMsgBoxCallback = NULL;
      msgbox.dwLanguageId = 0;
      MessageBoxIndirect(&msgbox);
      break;
    }
    break;
  // 绘图
  case WM_PAINT:
    hdc = BeginPaint(Xqwl.hWnd, &ps);
    DrawBoard(hdc);
    EndPaint(Xqwl.hWnd, &ps);
    break;
  // 鼠标点击
  case WM_LBUTTONDOWN:
    x = FILE_LEFT + (LOWORD(lParam) - BOARD_EDGE) / SQUARE_SIZE;
    y = RANK_TOP + (HIWORD(lParam) - BOARD_EDGE) / SQUARE_SIZE;
    if (x >= FILE_LEFT && x <= FILE_RIGHT && y >= RANK_TOP && y <= RANK_BOTTOM) {
      ClickSquare(COORD_XY(x, y));
    }
    break;
  // 其他事件
  default:
    return DefWindowProc(hWnd, uMsg, wParam, lParam);
  }
  return FALSE;
}

// 装入资源图片
inline HBITMAP LoadResBmp(int nResId) {
  return (HBITMAP) LoadImage(Xqwl.hInst, MAKEINTRESOURCE(nResId), IMAGE_BITMAP, 0, 0, LR_DEFAULTSIZE | LR_SHARED);
}

// 入口过程
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
  int i;
  MSG msg;
  WNDCLASSEX wce;

  // 初始化全局变量
  Xqwl.hInst = hInstance;
  Startup();

  // 装入图片
  Xqwl.bmpBoard = LoadResBmp(IDB_BOARD);
  Xqwl.bmpSelected = LoadResBmp(IDB_SELECTED);
  for (i = PIECE_KING; i <= PIECE_PAWN; i ++) {
    Xqwl.bmpPieces[SIDE_TAG(0) + i] = LoadResBmp(IDB_RK + i);
    Xqwl.bmpPieces[SIDE_TAG(1) + i] = LoadResBmp(IDB_BK + i);
  }

  // 设置窗口
  wce.cbSize = sizeof(WNDCLASSEX);
  wce.style = 0;
  wce.lpfnWndProc = (WNDPROC) WndProc;
  wce.cbClsExtra = wce.cbWndExtra = 0;
  wce.hInstance = hInstance;
  wce.hIcon = (HICON) LoadImage(hInstance, MAKEINTRESOURCE(IDI_APPICON), IMAGE_ICON, 32, 32, LR_SHARED);
  wce.hCursor = (HCURSOR) LoadImage(NULL, IDC_ARROW, IMAGE_CURSOR, 0, 0, LR_DEFAULTSIZE | LR_SHARED);
  wce.hbrBackground = (HBRUSH) (COLOR_BTNFACE + 1);
  wce.lpszMenuName = MAKEINTRESOURCE(IDM_MAINMENU);
  wce.lpszClassName = "VSCCP";
  wce.hIconSm = (HICON) LoadImage(hInstance, MAKEINTRESOURCE(IDI_APPICON), IMAGE_ICON, 16, 16, LR_SHARED);
  RegisterClassEx(&wce);

  // 打开窗口
  Xqwl.hWnd = CreateWindow("VSCCP", "象棋小巫师", WINDOW_STYLES,
      CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, NULL, NULL, hInstance, NULL);
  if (Xqwl.hWnd == NULL) {
    return 0;
  }
  ShowWindow(Xqwl.hWnd, nCmdShow);
  UpdateWindow(Xqwl.hWnd);

  // 接收消息
  while (GetMessage(&msg, NULL, 0, 0)) {
    TranslateMessage(&msg);
    DispatchMessage(&msg);
  }
  return msg.wParam;
}