Attribute VB_Name = "mdlBrowse"
Option Explicit

Private Type BrowseInfo
    hwndOwner As Long
    pidlRoot As Long
    pszDisplayName As String
    lpszTitle As String
    ulFlags As Long
    lpfn As Long
    lParam As Long
    iImage As Long
End Type

Private Declare Function SHBrowseForFolderA Lib "SHELL32.DLL" (ByRef lpbi As BrowseInfo) As Long
Private Declare Function SHGetPathFromIDListA Lib "SHELL32.DLL" (ByVal pidl As Long, ByVal pszPath As Long) As Long

Private Const BIF_RETURNONLYFSDIRS As Long = 1
Private Const MAX_PATH As Long = 260

Public Function BrowseForFolder(ByVal szTitle As String) As String

Dim bi As BrowseInfo
Dim szDisplayName(0 To MAX_PATH - 1) As Byte
Dim pidl As Long
bi.hwndOwner = Screen.ActiveForm.hWnd
bi.pidlRoot = 0
bi.pszDisplayName = 0
bi.lpszTitle = szTitle
bi.ulFlags = BIF_RETURNONLYFSDIRS
bi.lpfn = 0
bi.lParam = 0
bi.iImage = 0
pidl = SHBrowseForFolderA(bi)
If SHGetPathFromIDListA(pidl, VarPtr(szDisplayName(0))) = 0 Then
    BrowseForFolder = ""
Else
    BrowseForFolder = MkBStr(VarPtr(szDisplayName(0)))
End If

End Function
