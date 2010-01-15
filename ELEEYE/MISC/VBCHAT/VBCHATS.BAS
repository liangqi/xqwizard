Attribute VB_Name = "mdlVBChat"
Option Explicit

Public Const MAX_CLIENTS As Integer = 4096
Public Const BUFFER_LEN As Long = 65536

Public App_sServer As Long, App_sClients(1 To MAX_CLIENTS) As Long, App_nNext As Integer
Public App_bRunning As Boolean
Public App_lpPrevWndFunc As Long

Public Sub StopServer()
    
Dim i As Integer
For i = 1 To MAX_CLIENTS
    If App_sClients(i) <> INVALID_SOCKET Then
        WSBDisconnect App_sClients(i)
    End If
Next
WSBCloseServer App_sServer
App_sServer = INVALID_SOCKET

End Sub

Public Function NewWndFunc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

If uMsg = WM_TRAY Then
    If lParam = WM_LBUTTONUP Then
        frmVBChat.WindowState = vbNormal
        frmVBChat.Show
    ElseIf lParam = WM_RBUTTONUP Then
        frmVBChat.PopupMenu frmVBChat.mnTray, , , , frmVBChat.mnTrayOpen
    End If
End If
NewWndFunc = CallWindowProcA(App_lpPrevWndFunc, hWnd, uMsg, wParam, lParam)

End Function

Private Sub SendBlock(ByVal s As Long, ByVal lp As Long, ByVal nLen As Long)

Dim nLenSend As Long, nLenSendTotal As Long

nLenSend = WSBSend(s, lp, nLen)
nLenSendTotal = nLenSend
Do While nLenSend >= 0 And nLenSendTotal < nLen
    Sleep 1
    nLenSend = WSBSend(s, lp + nLenSendTotal, nLen - nLenSendTotal)
    nLenSendTotal = nLenSendTotal + nLenSend
Loop

End Sub

Public Sub Main()

Dim i As Integer, j As Integer, bReceived As Boolean, nLen As Long
Dim ucBuffer(0 To BUFFER_LEN - 1) As Byte

WSBStartup
App_sServer = INVALID_SOCKET
App_bRunning = True
frmVBChat.Show
Do While App_bRunning
    If App_sServer = INVALID_SOCKET Then
        bReceived = False
    Else
        If App_nNext <= MAX_CLIENTS Then
            App_sClients(App_nNext) = WSBAccept(App_sServer)
            If App_sClients(App_nNext) <> INVALID_SOCKET Then
                For App_nNext = 1 To MAX_CLIENTS
                    If App_sClients(App_nNext) = INVALID_SOCKET Then
                        Exit For
                    End If
                Next
            End If
        End If
        bReceived = False
        For i = 1 To MAX_CLIENTS
            If App_sClients(i) <> INVALID_SOCKET Then
                nLen = WSBRecv(App_sClients(i), VarPtr(ucBuffer(0)), BUFFER_LEN - 1)
                If nLen < 0 Then
                    WSBDisconnect App_sClients(i)
                    App_sClients(i) = INVALID_SOCKET
                    App_nNext = i
                ElseIf nLen > 0 Then
                    For j = 1 To MAX_CLIENTS
                        If App_sClients(j) <> INVALID_SOCKET Then
                            If frmVBChat.chkNoEcho.Value = 0 Or j <> i Then
                                SendBlock App_sClients(j), VarPtr(ucBuffer(0)), nLen
                            End If
                        End If
                    Next
                    bReceived = True
                End If
            End If
        Next
    End If
    If Not bReceived Then
        Sleep 1
        DoEvents
    End If
Loop
If App_sServer <> INVALID_SOCKET Then
    StopServer
End If
WSBCleanup

End Sub
