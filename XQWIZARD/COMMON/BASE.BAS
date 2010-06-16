Attribute VB_Name = "mdlBase"
Option Explicit

' === Begin Windows APIs ===

Public Const IDI_APPLICATION    As Long = 32512     ' LoadIconA
Public Const SND_ASYNC          As Long = 1         ' PlaySoundA
Public Const SND_NOWAIT         As Long = 8192      ' PlaySoundA
Public Const SND_FILENAME       As Long = 131072    ' PlaySoundA
Public Const SND_RESOURCE       As Long = 262148    ' PlaySoundA
Public Const HWND_TOPMOST       As Long = -1        ' SetWindowPos
Public Const HWND_NOTOPMOST     As Long = -2        ' SetWindowPos
Public Const SWP_NOSIZE         As Long = 1         ' SetWindowPos
Public Const SWP_NOMOVE         As Long = 2         ' SetWindowPos
Public Const GWL_WNDPROC        As Long = -4        ' SetWindowLongA
Public Const WM_LBUTTONUP       As Long = 514       ' CallWindowProcA
Public Const WM_RBUTTONUP       As Long = 517       ' CallWindowProcA

Public Declare Sub Sleep Lib "KERNEL32.DLL" (ByVal dwMilliseconds As Long)
Public Declare Sub QueryPerformanceCounter Lib "KERNEL32.DLL" (ByVal lpPerformanceCounter As Long)
Public Declare Sub ShellExecuteA Lib "SHELL32.DLL" (ByVal hWnd As Long, ByVal lpOperation As String, _
        ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long)
Public Declare Sub MessageBeep Lib "USER32.DLL" (ByVal uType As Long)
Public Declare Sub PlaySoundA Lib "WINMM.DLL" (ByVal szSound As String, ByVal hmod As Long, ByVal fdwSound As Long)
Public Declare Sub DestroyWindow Lib "USER32.DLL" (ByVal hWnd As Long)
Public Declare Sub SetWindowPos Lib "USER32.DLL" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, _
        ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Public Declare Function SetWindowLongA Lib "USER32.DLL" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function CallWindowProcA Lib "USER32.DLL" (ByVal lpPrevWndFunc As Long, _
        ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function Assign Lib "MSVBVM60.DLL" Alias "VarPtr" (ByVal dw As Long) As Long

' === End Windows APIs ===

' For AllocString
Private Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal lpsz As Long) As Long
Private Declare Function SysAllocStringByteLen Lib "OLEAUT32.DLL" (ByVal lpsz As Long, ByVal dwLen As Long) As String

' For MsgBoxIcon
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

Private Const MB_USERICON As Long = 128

Private Declare Function LoadLibraryA Lib "KERNEL32.DLL" (ByVal lpLibFileName As String) As Long
Private Declare Sub FreeLibrary Lib "KERNEL32.DLL" (ByVal hLibModule As Long)
Private Declare Function LoadIconA Lib "USER32.DLL" (ByVal hInstance As Long, ByVal lpIconName As Long) As Long
Private Declare Function MessageBoxIndirectA Lib "USER32.DLL" (ByRef lpMsgBoxParams As MsgBoxParams) As Long

' For Open/Save
Private Type OpenFileName
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type

Private Const OFN_OVERWRITEPROMPT As Long = 2
Private Const OFN_HIDEREADONLY As Long = 4
Private Const OFN_PATHMUSTEXIST As Long = 2048
Private Const OFN_FILEMUSTEXIST As Long = 4096

Private Declare Function GetOpenFileNameA Lib "COMDLG32.DLL" (ByRef lpofn As OpenFileName) As Long
Private Declare Function GetSaveFileNameA Lib "COMDLG32.DLL" (ByRef lpofn As OpenFileName) As Long

' For BrowseForFolder
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

Private Const BIF_RETURNONLYFSDIRS As Long = 1

Private Declare Function SHBrowseForFolderA Lib "SHELL32.DLL" (ByRef lpbi As BrowseInfo) As Long
Private Declare Function SHGetPathFromIDListA Lib "SHELL32.DLL" (ByVal pidl As Long, ByVal pszPath As Long) As Long

' For TrayIcon
Private Type NotifyIconData
    cbSize As Long
    hWnd As Long
    uID As Long
    uFlags As Long
    uCallbackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type

Private Const NIF_MESSAGE As Long = 1
Private Const NIF_ICON As Long = 2
Private Const NIF_TIP As Long = 4

Private Const NIM_ADD As Long = 0
Private Const NIM_MODIFY As Long = 1
Private Const NIM_DELETE As Long = 2

Public Const WM_TRAY As Long = &H401

Private Declare Sub Shell_NotifyIconA Lib "SHELL32.DLL" (ByVal dwMessage As Long, ByRef lpData As NotifyIconData)

' For Stdio
Private Type StartupInfo
    cb              As Long
    lpReserved      As Long
    lpDesktop       As Long
    lpTitle         As Long
    dwX             As Long
    dwY             As Long
    dwXSize         As Long
    dwYSize         As Long
    dwXCountChars   As Long
    dwYCountChars   As Long
    dwFillAttribute As Long
    dwFlags         As Long
    wShowWindow     As Integer
    cbReserved2     As Integer
    lpReserved2     As Long
    hStdInput       As Long
    hStdOutput      As Long
    hStdError       As Long
End Type

Private Const STARTF_USESTDHANDLES As Long = 256
Private Const STD_INPUT_HANDLE As Long = -10
Private Const STD_OUTPUT_HANDLE As Long = -11
Private Const STD_ERROR_HANDLE As Long = -12
Private Const INVALID_HANDLE_VALUE As Long = -1
Private Const READ_BUFFER_LEN As Long = 65536
Private Const SC_CLOSE As Long = 61536

Private Declare Sub GetStartupInfoA Lib "KERNEL32.DLL" (ByRef lpStartupInfo As StartupInfo)
Private Declare Sub AllocConsole Lib "KERNEL32.DLL" ()
Private Declare Sub FreeConsole Lib "KERNEL32.DLL" ()
Private Declare Sub SetConsoleCtrlHandler Lib "KERNEL32.DLL" (ByVal lpHandlerRoutine As Long, ByVal bAdd As Long)
Private Declare Sub SetConsoleTitleA Lib "KERNEL32.DLL" (ByVal szConsoleTitle As String)
Private Declare Function lstrlenA2 Lib "KERNEL32.DLL" Alias "lstrlenA" (ByVal sz As String) As Long
Private Declare Sub ReadFile Lib "KERNEL32.DLL" (ByVal hHandle As Long, ByVal lpBuffer As Long, _
        ByVal nNumberOfBytesToWrite As Long, ByRef lpNumberOfBytesWritten As Long, Optional ByVal lpOverlapped As Long = 0)
Private Declare Sub WriteFile Lib "KERNEL32.DLL" (ByVal hHandle As Long, ByVal sz As String, _
        ByVal nNumberOfBytesToWrite As Long, ByRef lpNumberOfBytesWritten As Long, Optional ByVal lpOverlapped As Long = 0)
Private Declare Function GetStdHandle Lib "KERNEL32.DLL" (ByVal nStdHandle As Long) As Long
Private Declare Function FindWindowA Lib "USER32.DLL" (Optional ByVal szClassName As String = vbNullString, _
        Optional ByVal szWindowName As String = vbNullString) As Long
Private Declare Function GetSystemMenu Lib "USER32.DLL" (ByVal hWnd As Long, Optional ByVal bRevert As Long = 0) As Long
Private Declare Sub DeleteMenu Lib "USER32.DLL" (ByVal hMenu As Long, ByVal uPosition As Long, Optional ByVal uFlag As Long = 0)

Private Stdio_si As StartupInfo

' === Begin AllocString ===

Public Function AllocString(ByVal lpsz As Long) As String

AllocString = SysAllocStringByteLen(lpsz, lstrlenA(lpsz))

End Function

' === End AllocString ===

' === Begin Str2Int/Lng ===

Public Function Str2Int(ByVal sz As String, Optional ByVal nMin As Integer = -32767, Optional ByVal nMax As Integer = 32767) As Integer

Dim df As Double
df = Val(sz)
If df < nMin Then
    Str2Int = nMin
ElseIf df > nMax Then
    Str2Int = nMax
Else
    Str2Int = df
End If

End Function

Public Function Str2Lng(ByVal sz As String, Optional ByVal nMin As Long = -2147483647, Optional ByVal nMax As Long = 2147483647) As Long

Dim df As Double
df = Val(sz)
If df < nMin Then
    Str2Lng = nMin
ElseIf df > nMax Then
    Str2Lng = nMax
Else
    Str2Lng = df
End If

End Function

' === End Str2Int/Lng ===

' === Begin URLs ===

Public Function UrlEncode(ByVal sz As String) As String

Dim szReturn As String, szChar As String
Dim i As Integer, nAscii As Integer

szReturn = ""
For i = 1 To Len(sz)
    szChar = Mid(sz, i, 1)
    Select Case szChar
    Case " "
        szReturn = szReturn & "+"
    Case "*", ".", "-", "0" To "9", "@", "A" To "Z", "_", "a" To "z"
        szReturn = szReturn & szChar
    Case Else
        nAscii = Asc(szChar)
        If nAscii < 0 Then
            szReturn = szReturn & "%" & Left(Hex(nAscii), 2) & "%" & Right(Hex(nAscii), 2)
        Else
            szReturn = szReturn & "%" & Mid(Hex(&H100 + nAscii), 2, 2)
        End If
    End Select
Next
UrlEncode = szReturn

End Function

Public Function UrlDecode(ByVal sz As String) As String

Dim szReturn As String, szChar As String
Dim i As Integer

szReturn = ""
For i = 1 To Len(sz)
    szChar = Mid(sz, i, 1)
    Select Case szChar
    Case "+"
        szReturn = szReturn & " "
    Case "%"
        szChar = Mid(sz, i + 1, 2)
        If szChar < "80" Then
            szReturn = szReturn & Chr(Val("&H" & szChar))
            i = i + 2
        Else
            szChar = szChar & Mid(sz, i + 4, 2)
            szReturn = szReturn & Chr(Val("&H" & szChar))
            i = i + 5
        End If
    Case Else
        szReturn = szReturn & szChar
    End Select
Next
UrlDecode = szReturn

End Function

' === End URLs ===

' === Begin MsgBoxIcon ===

Public Function MsgBoxIcon(ByVal szPrompt As String, Optional ByVal dwStyle As Long = 0, Optional ByVal szTitle As String = vbNullString, _
        Optional ByVal szIconFile As String = vbNullString, Optional ByVal nIcon As Integer = 1) As Long

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
    MsgBoxIcon = MsgBox(szPrompt, dwStyle, szTitle)
Else
    If (dwStyle And &H70) <> 0 Then
        MessageBeep dwStyle And &H70
    End If
    mbp.cbSize = Len(mbp)
    mbp.hwndOwner = 0
    On Error Resume Next
    mbp.hwndOwner = Screen.ActiveForm.hWnd
    On Error GoTo 0
    mbp.hInstance = hInstance
    mbp.lpszText = szPrompt
    mbp.lpszCaption = IIf(szTitle = vbNullString, App.Title, szTitle)
    mbp.dwStyle = MB_USERICON
    mbp.lpszIcon = nIcon
    mbp.dwContextHelpId = 0
    mbp.lpfnMsgBoxCallback = 0
    mbp.dwLanguageId = 0
    MsgBoxIcon = MessageBoxIndirectA(mbp)
End If
If hInstance <> 0 And hInstance <> App.hInstance Then
    FreeLibrary mbp.hInstance
End If

End Function

' === End MsgBoxIcon ===

' === Begin Open/Save ===

Private Function TrimNull(ByVal sz As String) As String

Dim i As Integer
i = InStr(sz, Chr(0))
If i > 0 Then
    TrimNull = Left(sz, i - 1)
Else
    TrimNull = sz
End If

End Function

Public Function OpenFileDialog(ByVal szTitle As String, ByVal szFilter As String) As String

Dim ofn As OpenFileName
szFilter = Replace(szFilter, "|", Chr(0))
ofn.lStructSize = Len(ofn)
ofn.hwndOwner = 0
On Error Resume Next
ofn.hwndOwner = Screen.ActiveForm.hWnd
On Error GoTo 0
ofn.lpstrCustomFilter = vbNullString
ofn.lpstrFileTitle = vbNullString
ofn.lpstrInitialDir = vbNullString
ofn.lpstrFilter = szFilter & Chr(0)
ofn.lpstrFile = String(260, 0)
ofn.nMaxFile = 260
ofn.lpstrTitle = szTitle
ofn.flags = OFN_PATHMUSTEXIST + OFN_FILEMUSTEXIST + OFN_HIDEREADONLY
ofn.nFileOffset = 0
ofn.nFileExtension = 0
ofn.lpstrDefExt = vbNullString
ofn.lCustData = 0
If GetOpenFileNameA(ofn) <> 0 Then
    OpenFileDialog = TrimNull(ofn.lpstrFile)
Else
    OpenFileDialog = ""
End If

End Function

Public Function SaveFileDialog(ByVal szTitle As String, ByVal szFilter As String, _
        ByVal szFileName As String, Optional ByVal szDefExt As String = vbNullString) As String

Dim ofn As OpenFileName, sz As String
szFilter = Replace(szFilter, "|", Chr(0))
ofn.lStructSize = Len(ofn)
ofn.hwndOwner = 0
On Error Resume Next
ofn.hwndOwner = Screen.ActiveForm.hWnd
On Error GoTo 0
ofn.lpstrCustomFilter = vbNullString
ofn.lpstrFileTitle = vbNullString
ofn.lpstrInitialDir = vbNullString
ofn.lpstrFilter = szFilter & Chr(0)
ofn.lpstrFile = szFileName & String(260, 0)
ofn.nMaxFile = 260
ofn.lpstrTitle = szTitle
ofn.flags = OFN_PATHMUSTEXIST + OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT
ofn.nFileOffset = 0
ofn.nFileExtension = 0
ofn.lpstrDefExt = szDefExt
ofn.lCustData = 0
If GetSaveFileNameA(ofn) <> 0 Then
   SaveFileDialog = TrimNull(ofn.lpstrFile)
Else
   SaveFileDialog = ""
End If

End Function

' === End OpenFile ===

' === Begin BrowseForFolder ===

Public Function BrowseForFolder(ByVal szTitle As String) As String

Dim bi As BrowseInfo
Dim szDisplayName(0 To 259) As Byte
Dim pidl As Long

bi.hwndOwner = 0
On Error Resume Next
bi.hwndOwner = Screen.ActiveForm.hWnd
On Error GoTo 0
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
    BrowseForFolder = AllocString(VarPtr(szDisplayName(0)))
End If

End Function

' === End BrowseForFolder ===

' === Begin TrayIcon ===

Public Sub AddTrayIcon(ByVal frm As Form, Optional ByVal hIcon As Long = 0, Optional ByVal szTip As String = "")

Dim nid As NotifyIconData
nid.cbSize = Len(nid)
nid.hWnd = frm.hWnd
nid.uID = 0
nid.uFlags = NIF_MESSAGE + NIF_ICON + NIF_TIP
nid.uCallbackMessage = WM_TRAY
nid.hIcon = IIf(hIcon = 0, frm.Icon.Handle, hIcon)
nid.szTip = IIf(szTip = "", frm.Caption, szTip) & Chr(0)
Shell_NotifyIconA NIM_ADD, nid

End Sub

Public Sub DeleteTrayIcon(ByVal frm As Form)

Dim nid As NotifyIconData
nid.cbSize = Len(nid)
nid.hWnd = frm.hWnd
nid.uID = 0
nid.uFlags = 0
Shell_NotifyIconA NIM_DELETE, nid

End Sub

' === End TrayIcon ===

' === Begin Stdio ===

Private Function CtrlHandlerRoutine(ByVal dwCtrlType) As Long

CtrlHandlerRoutine = 1

End Function

Public Sub StdioOpen(Optional ByVal szTitle As String = "")

Dim hWnd As Long, hMenu As Long, szTempTitle As String

GetStartupInfoA Stdio_si
If (Stdio_si.dwFlags And STARTF_USESTDHANDLES) <> 0 Then
    Exit Sub
End If
AllocConsole
SetConsoleCtrlHandler AddressOf CtrlHandlerRoutine, 1
szTempTitle = "Console " & App.hInstance & " " & App.ThreadID
SetConsoleTitleA szTempTitle
hWnd = 0
Do While hWnd = 0
    Sleep 1
    hWnd = FindWindowA(, szTempTitle)
Loop
SetConsoleTitleA IIf(szTitle = "", App.Title, szTitle)
hMenu = GetSystemMenu(hWnd)
DeleteMenu hMenu, SC_CLOSE
Stdio_si.hStdInput = GetStdHandle(STD_INPUT_HANDLE)
Stdio_si.hStdOutput = GetStdHandle(STD_OUTPUT_HANDLE)
Stdio_si.hStdError = GetStdHandle(STD_ERROR_HANDLE)

End Sub

Public Sub StdioClose()

If (Stdio_si.dwFlags And STARTF_USESTDHANDLES) = 0 Then
    FreeConsole
End If

End Sub

Public Function StdioIn() As String

Dim nNumberOfBytesRead As Long
Dim lpBuffer(0 To READ_BUFFER_LEN - 1) As Byte
ReadFile Stdio_si.hStdInput, VarPtr(lpBuffer(0)), READ_BUFFER_LEN - 1, nNumberOfBytesRead
lpBuffer(nNumberOfBytesRead) = 0
StdioIn = AllocString(VarPtr(lpBuffer(0)))

End Function

Public Sub StdioOut(ByVal sz As String)

Dim nNumberOfBytesWritten As Long
WriteFile Stdio_si.hStdOutput, sz, lstrlenA2(sz), nNumberOfBytesWritten

End Sub

Public Sub StdioErr(ByVal sz As String)

Dim nNumberOfBytesWritten As Long
WriteFile Stdio_si.hStdError, sz, lstrlenA2(sz), nNumberOfBytesWritten

End Sub

' === End Stdio ===
