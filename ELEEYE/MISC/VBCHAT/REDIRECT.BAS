Attribute VB_Name = "mdlRedirect"
Option Explicit

Public Const MAX_CLIENTS As Integer = 256
Public Const BUFFER_LEN As Long = 65536

Public App_sServer As Long, App_nNext As Integer
Public App_sClients(1 To MAX_CLIENTS) As Long, App_sServers(1 To MAX_CLIENTS) As Long
Public App_bRunning As Boolean, App_bConsole As Boolean
Public App_lpPrevWndFunc As Long

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

Public Function NewWndFunc(ByVal hWnd As Long, ByVal msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

If msg = WM_TRAY Then
    If lParam = WM_LBUTTONUP Then
        frmRedirect.WindowState = vbNormal
        frmRedirect.Show
    ElseIf lParam = WM_RBUTTONUP Then
        frmRedirect.PopupMenu frmRedirect.mnTray, , , , frmRedirect.mnTrayOpen
    End If
End If
NewWndFunc = CallWindowProcA(App_lpPrevWndFunc, hWnd, msg, wParam, lParam)

End Function

Public Sub Output(ByVal sz As String)

If frmRedirect.selDump.ListIndex > 0 Then
    If Not App_bConsole Then
        App_bConsole = True
        StdioOpen
    End If
    StdioOut sz
End If

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
                Else
                    Output "[Socket" + Str(App_sClients(App_nNext)) + " Connected at " + Time$ + "]" + vbCrLf
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
                    Output "[Socket" + Str(App_sClients(i)) + " Disconnected at " + Time$ + "]" + vbCrLf
                    WSBDisconnect App_sServers(i)
                    WSBDisconnect App_sClients(i)
                    App_sClients(i) = INVALID_SOCKET
                    App_nNext = i
                ElseIf nLen > 0 Then
                    WSBSend App_sServers(i), VarPtr(ucBuffer(0)), nLen
                    bReceived = True
                Else
                    ' Read Data from Server
                    nLen = WSBRecv(App_sServers(i), VarPtr(ucBuffer(0)), BUFFER_LEN)
                    If nLen < 0 Then
                        Output "[Socket" + Str(App_sClients(i)) + " Disconnected at " + Time$ + "]" + vbCrLf
                        WSBDisconnect App_sServers(i)
                        WSBDisconnect App_sClients(i)
                        App_sClients(i) = INVALID_SOCKET
                        App_nNext = i
                    ElseIf nLen > 0 Then
                        WSBSend App_sClients(i), VarPtr(ucBuffer(0)), nLen
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
