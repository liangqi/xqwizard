Attribute VB_Name = "mdlBase"
Option Explicit

' === Begin Windows APIs ===

Public Const SW_SHOWNORMAL      As Long = 1         ' ShellExecuteA
Public Const MB_ICONSTOP        As Long = 16        ' MessageBeep
Public Const MB_ICONHAND        As Long = 16        ' MessageBeep
Public Const MB_ICONERROR       As Long = 16        ' MessageBeep
Public Const MB_ICONQUESTION    As Long = 32        ' MessageBeep
Public Const MB_ICONEXCLAMATION As Long = 48        ' MessageBeep
Public Const MB_ICONWARNING     As Long = 48        ' MessageBeep
Public Const MB_ICONINFORMATION As Long = 64        ' MessageBeep
Public Const MB_ICONASTERISK    As Long = 64        ' MessageBeep
Public Const IDI_APPLICATION    As Long = 32512     ' LoadIconA
Public Const SND_ASYNC          As Long = 1         ' PlaySoundA
Public Const SND_NOWAIT         As Long = 8192      ' PlaySoundA
Public Const SND_FILENAME       As Long = 131072    ' PlaySoundA
Public Const HWND_TOPMOST       As Long = -1        ' SetWindowPos
Public Const HWND_NOTOPMOST     As Long = -2        ' SetWindowPos
Public Const SWP_NOSIZE         As Long = 1         ' SetWindowPos
Public Const SWP_NOMOVE         As Long = 2         ' SetWindowPos
Public Const GWL_WNDPROC        As Long = -4        ' SetWindowLongA
Public Const WM_LBUTTONUP       As Long = 514       ' CallWindowProcA
Public Const WM_RBUTTONUP       As Long = 517       ' CallWindowProcA

Public Declare Sub Sleep Lib "KERNEL32.DLL" (ByVal dwMilliseconds As Long)
Public Declare Sub ShellExecuteA Lib "SHELL32.DLL" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long)
Public Declare Sub MessageBeep Lib "USER32.DLL" (ByVal uType As Long)
Public Declare Sub PlaySoundA Lib "WINMM.DLL" (ByVal lpszSound As String, ByVal hmod As Long, ByVal fdwSound As Long)
Public Declare Sub SetWindowPos Lib "USER32.DLL" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
Public Declare Function SetWindowLongA Lib "USER32.DLL" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function CallWindowProcA Lib "USER32.DLL" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal lpsz As Long) As Long
Public Declare Function SysAllocStringByteLen Lib "OLEAUT32.DLL" (ByVal lpsz As Long, ByVal dwLen As Long) As String

' For Atom Subs/Functions
Public Declare Function VarPtr Lib "ATOM.DLL" Alias "_Lea@4" (ByRef lp As Any) As Long
Public Declare Function CvBStr Lib "ATOM.DLL" Alias "_Lea@4" (ByVal lp As String) As Long
Public Declare Function CvInt Lib "ATOM.DLL" Alias "_WordPtr@4" (ByRef lpw As Any) As Integer
Public Declare Function CvLng Lib "ATOM.DLL" Alias "_DWordPtr@4" (ByRef lpdw As Any) As Long
Public Declare Function CvCur Lib "ATOM.DLL" Alias "_QWordPtr@4" (ByRef lpqw As Any) As Currency
Public Declare Function CvSng Lib "ATOM.DLL" Alias "_Real4Ptr@4" (ByRef lpsf As Any) As Single
Public Declare Function CvDbl Lib "ATOM.DLL" Alias "_Real8Ptr@4" (ByRef lpdf As Any) As Double
Public Declare Function CvI Lib "ATOM.DLL" Alias "_WordPtr@4" (ByVal lpw As String) As Integer
Public Declare Function CvL Lib "ATOM.DLL" Alias "_DWordPtr@4" (ByVal lpdw As String) As Long
Public Declare Function CvC Lib "ATOM.DLL" Alias "_QWordPtr@4" (ByVal lpqw As String) As Currency
Public Declare Function CvS Lib "ATOM.DLL" Alias "_Real4Ptr@4" (ByVal lpsf As String) As Single
Public Declare Function CvD Lib "ATOM.DLL" Alias "_Real8Ptr@4" (ByVal lpdf As String) As Double
Public Declare Sub MkInt Lib "ATOM.DLL" Alias "_MovWordPtr@8" (ByRef lpw As Any, ByVal w As Integer)
Public Declare Sub MkLng Lib "ATOM.DLL" Alias "_MovDWordPtr@8" (ByRef lpdw As Any, ByVal dw As Long)
Public Declare Sub MkCur Lib "ATOM.DLL" Alias "_MovQWordPtr@12" (ByRef lpqw As Any, ByVal qw As Currency)
Public Declare Sub MkSng Lib "ATOM.DLL" Alias "_MovDWordPtr@8" (ByRef lpdw As Any, ByVal dw As Single)
Public Declare Sub MkDbl Lib "ATOM.DLL" Alias "_MovQWordPtr@12" (ByRef lpqw As Any, ByVal qw As Double)
Public Declare Function StrAlloc Lib "ATOM.DLL" Alias "_StrAlloc@4" (ByVal lpsz As String) As Long
Public Declare Sub StrFree Lib "ATOM.DLL" Alias "_StrFree@4" (ByVal lpsz As Long)

' For URLs
Public Type UrlType
    szProto As String
    szHost  As String
    nPort   As Long
    szFile  As String
    szLabel As String
End Type

' For MsgBoxWithIcon/MsgBoxMute
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
Private Declare Sub MessageBoxIndirectA Lib "USER32.DLL" (ByRef lpMsgBoxParams As MsgBoxParams)

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

Private Declare Sub Shell_NotifyIcon Lib "SHELL32.DLL" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, ByRef lpData As NotifyIconData)

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

Private Declare Sub GetStartupInfoA Lib "KERNEL32.DLL" (ByRef lpStartupInfo As StartupInfo)
Private Declare Sub AllocConsole Lib "KERNEL32.DLL" ()
Private Declare Sub FreeConsole Lib "KERNEL32.DLL" ()
Private Declare Sub SetConsoleMode Lib "KERNEL32.DLL" (ByVal h As Long, ByVal n As Long)
Private Declare Sub ReadFile Lib "KERNEL32.DLL" (ByVal hHandle As Long, ByVal lpBuffer As Long, ByVal nNumberOfBytesToWrite As Long, ByRef lpNumberOfBytesWritten As Long, Optional ByVal lpOverlapped As Long = 0)
Private Declare Sub WriteFile Lib "KERNEL32.DLL" (ByVal hHandle As Long, ByVal lpBuffer As Long, ByVal nNumberOfBytesToWrite As Long, ByRef lpNumberOfBytesWritten As Long, Optional ByVal lpOverlapped As Long = 0)
Private Declare Function GetStdHandle Lib "KERNEL32.DLL" (ByVal nStdHandle As Long) As Long

Private Stdio_si As StartupInfo

' === End Windows APIs ===

' === Begin Atom Subs/Functions ===

Public Function MkI(ByVal w As Integer) As String

MkI = SysAllocStringByteLen(VarPtr(w), 2)

End Function

Public Function MkL(ByVal dw As Long) As String

MkL = SysAllocStringByteLen(VarPtr(dw), 4)

End Function

Public Function MkC(ByVal qw As Currency) As String

MkC = SysAllocStringByteLen(VarPtr(qw), 8)

End Function

Public Function MkS(ByVal sf As Single) As String

MkS = SysAllocStringByteLen(VarPtr(sf), 4)

End Function

Public Function MkD(ByVal df As Double) As String

MkD = SysAllocStringByteLen(VarPtr(df), 8)

End Function

Public Function MkBStr(ByVal lpsz As Long) As String

MkBStr = SysAllocStringByteLen(lpsz, lstrlenA(lpsz))

End Function

' === End Atom Subs/Functions ===

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
        szReturn = szReturn + "+"
    Case "*", ".", "-", "0" To "9", "@", "A" To "Z", "_", "a" To "z"
        szReturn = szReturn + szChar
    Case Else
        nAscii = Asc(szChar)
        If nAscii < 0 Then
            szReturn = szReturn + "%" + Left(Hex(nAscii), 2) + "%" + Right(Hex(nAscii), 2)
        Else
            szReturn = szReturn + "%" + Mid(Hex(&H100 + nAscii), 2, 2)
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
        szReturn = szReturn + " "
    Case "%"
        szChar = Mid(sz, i + 1, 2)
        If szChar < "80" Then
            szReturn = szReturn + Chr(Val("&H" + szChar))
            i = i + 2
        Else
            szChar = szChar + Mid(sz, i + 4, 2)
            szReturn = szReturn + Chr(Val("&H" + szChar))
            i = i + 5
        End If
    Case Else
        szReturn = szReturn + szChar
    End Select
Next
UrlDecode = szReturn

End Function

Public Sub ParseUrl(ByRef url As UrlType, ByVal szUrl As String)

Dim n As Integer, sz As String, df As Double

n = InStr(szUrl, ":")
If n = 0 Then
    url.szProto = "http"
Else
    url.szProto = LCase(Left(szUrl, n - 1))
End If
Do While Mid(szUrl, n + 1, 1) = "/"
    n = n + 1
Loop
sz = Mid(szUrl, n + 1)

n = InStr(sz, "#")
If n = 0 Then
    url.szLabel = ""
Else
    url.szLabel = Mid(sz, n + 1)
    sz = Left(sz, n - 1)
End If

n = InStr(sz, "/")
If n = 0 Then
    url.szFile = ""
Else
    url.szFile = Mid(sz, n + 1)
    If Right(url.szFile, 1) = "/" Then
        url.szFile = Left(url.szFile, Len(url.szFile) - 1)
    End If
    sz = Left(sz, n - 1)
End If

n = InStr(sz, ":")
If n = 0 Then
    url.nPort = 80
    url.szHost = LCase(sz)
Else
    df = Val(Mid(sz, n + 1))
    url.nPort = IIf(df < 0.5 Or df >= 65535.5, 80, sz)
    url.szHost = LCase(Left(sz, n - 1))
End If

End Sub

Public Function UrlString(ByRef url As UrlType) As String

UrlString = url.szProto + "://" + url.szHost + IIf(url.szProto = "http" And url.nPort = 80, "", ":" + LTrim(Str(url.nPort))) + "/" + url.szFile + "#" + url.szLabel

End Function

' === End URLs ===

' === Begin MsgBoxWithIcon/MsgBoxMute ===

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
    MessageBeep MB_ICONINFORMATION
    mbp.cbSize = Len(mbp)
    mbp.hwndOwner = 0
    On Error Resume Next
    mbp.hwndOwner = Screen.ActiveForm.hWnd
    On Error GoTo 0
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

Public Sub MsgBoxMute(ByVal szPrompt As String, Optional ByVal dwStyle As Long = 0, Optional ByVal szTitle As String = vbNullString)

Dim mbp As MsgBoxParams
mbp.cbSize = Len(mbp)
mbp.hwndOwner = 0
On Error Resume Next
mbp.hwndOwner = Screen.ActiveForm.hWnd
On Error GoTo 0
mbp.hInstance = 0
mbp.lpszText = szPrompt
mbp.lpszCaption = IIf(szTitle = vbNullString, App.Title, szTitle)
mbp.dwStyle = MB_USERICON
mbp.lpszIcon = dwStyle \ 16 + IDI_APPLICATION
mbp.dwContextHelpId = 0
mbp.lpfnMsgBoxCallback = 0
mbp.dwLanguageId = 0
MessageBoxIndirectA mbp

End Sub

' === End MsgBoxWithIcon/MsgBoxMute ===

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
ofn.hInstance = 0
ofn.lpstrCustomFilter = vbNullString
ofn.lpstrFileTitle = vbNullString
ofn.lpstrInitialDir = vbNullString
ofn.lpstrFilter = szFilter + Chr(0)
ofn.lpstrFile = String(260, 0)
ofn.nMaxFile = 260
ofn.lpstrTitle = szTitle
ofn.flags = OFN_PATHMUSTEXIST + OFN_FILEMUSTEXIST + OFN_HIDEREADONLY
If GetOpenFileNameA(ofn) <> 0 Then
    OpenFileDialog = TrimNull(ofn.lpstrFile)
Else
    OpenFileDialog = ""
End If

End Function

Public Function SaveFileDialog(ByVal szTitle As String, ByVal szFilter As String, ByVal szFileName As String) As String

Dim ofn As OpenFileName, sz As String
szFilter = Replace(szFilter, "|", Chr(0))
ofn.lStructSize = Len(ofn)
ofn.hwndOwner = 0
On Error Resume Next
ofn.hwndOwner = Screen.ActiveForm.hWnd
On Error GoTo 0
ofn.hInstance = 0
ofn.lpstrCustomFilter = vbNullString
ofn.lpstrFileTitle = vbNullString
ofn.lpstrInitialDir = vbNullString
ofn.lpstrFilter = szFilter + Chr(0)
ofn.lpstrFile = szFileName + String(260, 0)
ofn.nMaxFile = 260
ofn.lpstrTitle = szTitle
ofn.flags = OFN_PATHMUSTEXIST + OFN_HIDEREADONLY + OFN_OVERWRITEPROMPT
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
    BrowseForFolder = MkBStr(VarPtr(szDisplayName(0)))
End If

End Function

' === End BrowseForFolder ===

' === Begin TrayIcon ===

Public Sub AddTrayIcon(ByRef frm As Form, Optional ByVal hIcon As Long = 0, Optional ByVal szTip As String = "")

Dim nid As NotifyIconData
nid.cbSize = Len(nid)
nid.hWnd = frm.hWnd
nid.uID = 0
nid.uFlags = NIF_MESSAGE + NIF_ICON + NIF_TIP
nid.uCallbackMessage = WM_TRAY
nid.hIcon = IIf(hIcon = 0, frm.Icon.Handle, hIcon)
nid.szTip = IIf(szTip = "", frm.Caption, szTip) + Chr(0)
Shell_NotifyIcon NIM_ADD, nid

End Sub

Public Sub DeleteTrayIcon(ByRef frm As Form)

Dim nid As NotifyIconData
nid.cbSize = Len(nid)
nid.hWnd = frm.hWnd
nid.uID = 0
nid.uFlags = 0
Shell_NotifyIcon NIM_DELETE, nid

End Sub

' === End TrayIcon ===

' === Begin Stdio ===
  
Public Sub StdioOpen()

GetStartupInfoA Stdio_si
If (Stdio_si.dwFlags And STARTF_USESTDHANDLES) = 0 Then
    AllocConsole
    Stdio_si.hStdInput = GetStdHandle(STD_INPUT_HANDLE)
    Stdio_si.hStdOutput = GetStdHandle(STD_OUTPUT_HANDLE)
    Stdio_si.hStdError = GetStdHandle(STD_ERROR_HANDLE)
End If

End Sub

Public Sub StdioClose()

If (Stdio_si.dwFlags And STARTF_USESTDHANDLES) = 0 Then
    FreeConsole
End If

End Sub

Public Function StdioIn() As String

Dim nNumberOfBytesRead As Long
Dim lpBuffer(0 To READ_BUFFER_LEN - 1) As Byte
ReadFile Stdio_si.hStdInput, VarPtr(lpBuffer(0)), READ_BUFFER_LEN, nNumberOfBytesRead
StdioIn = SysAllocStringByteLen(VarPtr(lpBuffer(0)), nNumberOfBytesRead)

End Function

Public Sub StdioOut(ByVal sz As String)

Dim nNumberOfBytesWritten As Long
WriteFile Stdio_si.hStdOutput, CvBStr(sz), lstrlenA(sz), nNumberOfBytesWritten

End Sub

Public Sub StdioErr(ByVal sz As String)

Dim nNumberOfBytesWritten As Long
WriteFile Stdio_si.hStdError, CvBStr(sz), lstrlenA(sz), nNumberOfBytesWritten

End Sub

' === End Stdio ===
