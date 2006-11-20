Attribute VB_Name = "mdlMsgBox"
Option Explicit

Private Type MsgBoxParams
    cbSize As Long
    hwndOwner As Long
    hInstance As Long
    lpszText As String
    lpszCaption As String
    dwStyle As Long
    lpszIcon As Long
    dwContextHelpId As Long
    lpfnMsgBoxCallback As Long
    dwLanguageId As Long
End Type

Private Declare Function LoadLibraryA Lib "KERNEL32.DLL" (ByVal lpLibFileName As String) As Long
Private Declare Sub FreeLibrary Lib "KERNEL32.DLL" (ByVal hLibModule As Long)
Private Declare Function LoadIconA Lib "USER32.DLL" (ByVal hInstance As Long, ByVal lpIconName As Long) As Long
Private Declare Sub DestroyIcon Lib "USER32.DLL" (ByVal hIcon As Long)
Private Declare Sub MessageBeep Lib "USER32.DLL" (ByVal uType As Long)
Private Declare Sub MessageBoxIndirectA Lib "USER32.DLL" (ByRef lpMsgBoxParams As MsgBoxParams)

Private Const MB_ICONINFORMATION As Long = 64
Private Const MB_USERICON As Long = 128

Public Sub MsgBoxWithIcon(ByVal szPrompt As String, Optional ByVal szTitle As String = vbNullString, Optional ByVal szIconFile As String = vbNullString)

Dim mbp As MsgBoxParams
Dim hInstance As Long, hIcon As Long

If szIconFile = vbNullString Then
    hInstance = App.hInstance
Else
    hInstance = LoadLibraryA(szIconFile)
End If
If hInstance = 0 Then
    hIcon = 0
Else
    hIcon = LoadIconA(hInstance, 1)
End If
If hIcon = 0 Then
    MsgBox szPrompt, vbInformation, szTitle
Else
    DestroyIcon hIcon
    MessageBeep MB_ICONINFORMATION
    mbp.cbSize = Len(mbp)
    mbp.hwndOwner = Screen.ActiveForm.hWnd
    mbp.hInstance = hInstance
    mbp.lpszText = szPrompt
    mbp.lpszCaption = szTitle
    mbp.dwStyle = MB_USERICON
    mbp.lpszIcon = 1
    mbp.dwContextHelpId = 0
    mbp.lpfnMsgBoxCallback = 0
    mbp.dwLanguageId = 0
    MessageBoxIndirectA mbp
End If
If hInstance <> 0 And hInstance <> App.hInstance Then
    FreeLibrary mbp.hInstance
End If

End Sub
