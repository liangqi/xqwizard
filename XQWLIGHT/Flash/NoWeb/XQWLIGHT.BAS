Attribute VB_Name = "mdlXQWLight"
Option Explicit

Private Const WM_LBUTTONDOWN As Long = &H201
Private Const WM_RBUTTONDOWN As Long = &H204

Private Declare Function SendMessageA Lib "USER32.DLL" (ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function DefWindowProcA Lib "USER32.DLL" (ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Public hWndFlash As Long

Public Function FlashWndProc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Select Case uMsg
Case WM_LBUTTONDOWN
    FlashWndProc = SendMessageA(hWndFlash, WM_LBUTTONDOWN, wParam, lParam)
Case WM_RBUTTONDOWN
    FlashWndProc = 0
Case Else
    FlashWndProc = DefWindowProcA(hWnd, uMsg, wParam, lParam)
End Select

End Function
