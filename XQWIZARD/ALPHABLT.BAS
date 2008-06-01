Attribute VB_Name = "mdlALphaBlt"
Option Explicit

Private Declare Sub AlphaBlt Lib "ALPHABLT.DLL" Alias "_AlphaBlt@44" (ByVal hdcDest As Long, ByVal xDest As Long, ByVal yDest As Long, ByVal nWidth As Long, ByVal nHeight As Long, _
        ByVal hdcSrc As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal hdcAlpha As Long, ByVal xAlpha As Long, ByVal yAlpha As Long)
Private Declare Function CreateWindowExA Lib "USER32.DLL" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, _
        ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, ByVal lpParam As Long) As Long
Private Declare Function GetDC Lib "USER32.DLL" (ByVal hWnd As Long) As Long
Private Declare Sub ReleaseDC Lib "USER32.DLL" (ByVal hWnd As Long, ByVal hdc As Long)
Private Declare Function CreateCompatibleDC Lib "GDI32.DLL" (ByVal hdc As Long) As Long
Private Declare Sub SelectObject Lib "GDI32.DLL" (ByVal hdc As Long, ByVal hgdiobj As Long)
Private Declare Sub DeleteDC Lib "GDI32.DLL" (ByVal hdc As Long)


Public Function TransparentWindow(ByVal hInstance As Long, ByVal hbmpSrc As Long, ByVal hbmpAlpha As Long, ByVal nWidth As Integer, ByVal nHeight As Integer)

Dim hWnd As Long, hdcDest As Long, hdcSrc As Long, hdcAlpha As Long
Dim nWidthScreen As Integer, nHeightScreen As Integer, nWidthBitmap As Integer, nHeightBitmap As Integer

nWidthScreen = Fix(Screen.Width / Screen.TwipsPerPixelX)
nHeightScreen = Fix(Screen.Height / Screen.TwipsPerPixelY)
nWidthBitmap = Fix(nWidth / Screen.TwipsPerPixelX)
nHeightBitmap = Fix(nHeight / Screen.TwipsPerPixelY)
hWnd = CreateWindowExA(0, "TransparentWindow", vbNullString, 0, 0, 0, nWidthScreen, nHeightScreen, 0, 0, hInstance, 0)
hdcDest = GetDC(hWnd)
hdcSrc = CreateCompatibleDC(hdcDest)
hdcAlpha = CreateCompatibleDC(hdcDest)
SelectObject hdcSrc, hbmpSrc
SelectObject hdcAlpha, hbmpAlpha
AlphaBlt hdcDest, (nWidthScreen - nWidthBitmap) \ 2, (nHeightScreen - nHeightBitmap) \ 2, nWidthBitmap, nHeightBitmap, hdcSrc, 0, 0, hdcAlpha, 0, 0
DeleteDC hdcSrc
DeleteDC hdcAlpha
ReleaseDC hWnd, hdcDest
TransparentWindow = hWnd

End Function
