Attribute VB_Name = "mdlTransWin"
Option Explicit

Private Const WS_VISIBLE As Long = &H10000000
Private Const WS_CHILD As Long = &H40000000
Private Const WS_EX_TRANSPARENT As Long = 32
Private Const IDC_ARROW As Long = &H7F00

Private Type WndClassEx
    cbSize As Long
    style As Long
    lpfnWndProc As Long
    cbClsExtra As Long
    cbWndExtra As Long
    hInstance As Long
    hIcon As Long
    hCursor As Long
    hbrBackground As Long
    lpszMenuName As String
    lpszClassName As String
    hIconSm As Long
End Type

Private Declare Sub RegisterClassExA Lib "USER32.DLL" (ByRef wcx As WndClassEx)
Private Declare Function LoadCursorA Lib "USER32.DLL" (ByVal hInstance As Long, ByVal lpCursorName As Long) As Long
Private Declare Function CreateWindowExA Lib "USER32.DLL" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, _
        ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, ByVal lpParam As Long) As Long
Private Declare Sub BringWindowToTop Lib "USER32.DLL" (ByVal hWnd As Long)

Public Function TransparentWindow(ByVal hWndParent As Long, ByVal WndProc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long)

Dim hWnd As Long
Dim wcx As WndClassEx

wcx.cbSize = Len(wcx)
wcx.style = 0
wcx.lpfnWndProc = WndProc
wcx.cbClsExtra = 0
wcx.cbWndExtra = 0
wcx.hInstance = App.hInstance
wcx.hIcon = 0
wcx.hCursor = LoadCursorA(0, IDC_ARROW)
wcx.hbrBackground = 0
wcx.lpszMenuName = vbNullString
wcx.lpszClassName = "TransparentWindow"
wcx.hIconSm = 0
RegisterClassExA wcx
hWnd = CreateWindowExA(WS_EX_TRANSPARENT, "TransparentWindow", vbNullString, WS_VISIBLE Or WS_CHILD, x, y, nWidth, nHeight, hWndParent, 0, App.hInstance, 0)
BringWindowToTop hWnd
TransparentWindow = hWnd

End Function
