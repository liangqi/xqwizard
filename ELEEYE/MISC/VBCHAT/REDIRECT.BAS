Attribute VB_Name = "mdlRedirect"
Option Explicit

Private Declare Function SysAllocStringByteLen Lib "OLEAUT32.DLL" (ByVal lpsz As Long, ByVal dwLen As Long) As String

Public Const MAX_CLIENTS As Integer = 256
Public Const BUFFER_LEN As Long = 65536

Public App_sServer As Long, App_nNext As Integer
Public App_sClients(1 To MAX_CLIENTS) As Long, App_sServers(1 To MAX_CLIENTS) As Long
Public App_bRunning As Boolean, App_bConsole As Boolean
Public App_lpPrevWndFunc As Long
Public App_ucDumpText(0 To 327679) As Byte

Private Type SockAddr
    wSinFamily As Integer
    ucSinPort(0 To 1) As Byte
    ucSinAddr(0 To 3) As Byte
    ucSinZero(0 To 8) As Byte
End Type

Private Declare Sub getpeername Lib "WSOCK32.DLL" (ByVal s As Long, ByRef name As SockAddr, ByRef nNameLen As Long)

Private Sub Prompt(ByVal s As Long, ByVal szAction As String)

Dim nNameLen As Long, name As SockAddr
If frmRedirect.selDump.ListIndex = 0 Then
    Exit Sub
End If
If Not App_bConsole Then
    App_bConsole = True
    StdioOpen
End If
nNameLen = Len(name)
getpeername s, name, nNameLen
StdioOut "[" + LTrim(Str(name.ucSinAddr(0))) + "." + LTrim(Str(name.ucSinAddr(1))) + "." + _
        LTrim(Str(name.ucSinAddr(2))) + "." + LTrim(Str(name.ucSinAddr(3))) + "/" + _
        LTrim(Str(256& * name.ucSinPort(0) + name.ucSinPort(1))) + " " + szAction + " at " + Time$ + "]" + vbCrLf

End Sub

Private Sub Dump(ByVal lpBuffer As Long, ByVal nLen As Long)

Dim nBytesWritten As Long, sz As String

If frmRedirect.selDump.ListIndex = 0 Then
    Exit Sub
End If
If frmRedirect.selDump.ListIndex = 1 Then
    DumpHex VarPtr(App_ucDumpText(0)), lpBuffer, 0, nLen
    StdioOut AllocString(VarPtr(App_ucDumpText(0)))
Else
    StdioOut Replace(SysAllocStringByteLen(lpBuffer, nLen), Chr(7), "")
    StdioOut vbCrLf
End If

End Sub

Public Function NewWndFunc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

If uMsg = WM_TRAY Then
    If lParam = WM_LBUTTONUP Then
        frmRedirect.WindowState = vbNormal
        frmRedirect.Show
    ElseIf lParam = WM_RBUTTONUP Then
        frmRedirect.PopupMenu frmRedirect.mnTray, , , , frmRedirect.mnTrayOpen
    End If
End If
NewWndFunc = CallWindowProcA(App_lpPrevWndFunc, hWnd, uMsg, wParam, lParam)

End Function

Public Sub StopServer()
    
Dim i As Integer
For i = 1 To MAX_CLIENTS
    If App_sClients(i) <> INVALID_SOCKET Then
        WSBDisconnect App_sServers(i)
        WSBDisconnect App_sClients(i)
    End If
Next
WSBCloseServer App_sServer
App_sServer = INVALID_SOCKET

End Sub

Public Sub Main()

Dim i As Integer, bReceived As Boolean, nLen As Long, nPort As Long
Dim uidTrayIcon As Long
Dim ucBuffer(0 To BUFFER_LEN - 1) As Byte

WSBStartup
App_sServer = INVALID_SOCKET
App_bRunning = True
App_bConsole = False
frmRedirect.Show
Do While App_bRunning
    If App_sServer = INVALID_SOCKET Then
        bReceived = False
    Else
        If App_nNext <= MAX_CLIENTS Then
            App_sClients(App_nNext) = WSBAccept(App_sServer)
            If App_sClients(App_nNext) <> INVALID_SOCKET Then
                nPort = Str2Lng(Val(frmRedirect.txtServerPort.Text), 1, 65535)
                frmRedirect.txtServerPort.Text = nPort
                App_sServers(App_nNext) = WSBConnect(frmRedirect.txtServerHost.Text, nPort)
                If App_sServers(App_nNext) = INVALID_SOCKET Then
                    WSBDisconnect App_sClients(App_nNext)
                    App_sClients(App_nNext) = INVALID_SOCKET
                Else
                    Prompt App_sClients(App_nNext), "Connected"
                    For App_nNext = 1 To MAX_CLIENTS
                        If App_sClients(App_nNext) = INVALID_SOCKET Then
                            Exit For
                        End If
                    Next
                End If
            End If
        End If
        bReceived = False
        For i = 1 To MAX_CLIENTS
            If App_sClients(i) <> INVALID_SOCKET Then
                ' Read Data From Client
                nLen = WSBRecv(App_sClients(i), VarPtr(ucBuffer(0)), BUFFER_LEN)
                If nLen < 0 Then
                    Prompt App_sClients(i), "Disconnected"
                    WSBDisconnect App_sServers(i)
                    WSBDisconnect App_sClients(i)
                    App_sClients(i) = INVALID_SOCKET
                    App_nNext = i
                ElseIf nLen > 0 Then
                    WSBSend App_sServers(i), VarPtr(ucBuffer(0)), nLen
                    Prompt App_sClients(i), "Sent"
                    ucBuffer(nLen) = 0
                    Dump VarPtr(ucBuffer(0)), nLen
                    bReceived = True
                Else
                    ' Read Data from Server
                    nLen = WSBRecv(App_sServers(i), VarPtr(ucBuffer(0)), BUFFER_LEN)
                    If nLen < 0 Then
                        Prompt App_sClients(i), "Disconnected"
                        WSBDisconnect App_sServers(i)
                        WSBDisconnect App_sClients(i)
                        App_sClients(i) = INVALID_SOCKET
                        App_nNext = i
                    ElseIf nLen > 0 Then
                        WSBSend App_sClients(i), VarPtr(ucBuffer(0)), nLen
                        Prompt App_sClients(i), "Received"
                        ucBuffer(nLen) = 0
                        Dump VarPtr(ucBuffer(0)), nLen
                        bReceived = True
                    End If
                End If
            End If
        Next
    End If
    If Not bReceived Then
        Sleep 1
        DoEvents
    End If
Loop
If App_bConsole Then
    StdioClose
End If
If App_sServer <> INVALID_SOCKET Then
    StopServer
End If
WSBCleanup

End Sub
