Attribute VB_Name = "mdlVBChat"
Option Explicit

Public Const BUFFER_LEN As Long = 65536

Public bRunning As Boolean, bCtrlEnter As Boolean
Public nSocket As Long

Sub Main()

Dim nLen As Long
Dim ucBuffer(0 To BUFFER_LEN - 1) As Byte

WSBStartup
nSocket = INVALID_SOCKET
bRunning = True
bCtrlEnter = False
frmVBChat.Show
Do While bRunning
    If nSocket = INVALID_SOCKET Then
        Sleep 1
    Else
        nLen = WSBRecv(nSocket, VarPtr(ucBuffer(0)), BUFFER_LEN)
        If nLen < 0 Then
            WSBDisconnect nSocket
            nSocket = INVALID_SOCKET
            MsgBox "Server Disconnected", vbInformation
            frmVBChat.btnConnect.Caption = "Connect"
            frmVBChat.btnSend.Enabled = False
        ElseIf nLen = 0 Then
            Sleep 1
        Else
            frmVBChat.txtRecv.Text = frmVBChat.txtRecv.Text + SysAllocStringByteLen(VarPtr(ucBuffer(0)), nLen)
            frmVBChat.txtRecv.SelStart = Len(frmVBChat.txtRecv.Text)
            If frmVBChat.chkQuiet.Value = 0 Then
                MessageBeep MB_ICONINFORMATION
                frmVBChat.SetFocus
            End If
        End If
    End If
    DoEvents
Loop
WSBCleanup

End Sub
