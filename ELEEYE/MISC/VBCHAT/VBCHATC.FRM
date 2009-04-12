VERSION 5.00
Begin VB.Form frmVBChat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "VBChat Client"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "ËÎÌו"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   MaxButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnConnect 
      Caption         =   "Connect"
      Height          =   375
      Left            =   3480
      TabIndex        =   4
      Top             =   120
      Width           =   1095
   End
   Begin VB.CheckBox chkQuiet 
      Caption         =   "Quiet"
      Height          =   300
      Left            =   3720
      TabIndex        =   8
      Top             =   480
      Width           =   855
   End
   Begin VB.TextBox txtPort 
      Height          =   285
      Left            =   2880
      TabIndex        =   3
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton btnExit 
      Cancel          =   -1  'True
      Caption         =   "Exit"
      Height          =   375
      Left            =   3120
      TabIndex        =   13
      Top             =   2760
      Width           =   855
   End
   Begin VB.CommandButton btnSend 
      Caption         =   "Send"
      Height          =   375
      Left            =   720
      TabIndex        =   11
      Top             =   2760
      Width           =   855
   End
   Begin VB.TextBox txtMyName 
      Height          =   285
      Left            =   1080
      TabIndex        =   6
      Top             =   480
      Width           =   1215
   End
   Begin VB.TextBox txtHostName 
      Height          =   285
      Left            =   1080
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton btnClear 
      Caption         =   "Clear"
      Height          =   375
      Left            =   1920
      TabIndex        =   12
      Top             =   2760
      Width           =   855
   End
   Begin VB.TextBox txtSend 
      Height          =   495
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   10
      Top             =   2160
      Width           =   4455
   End
   Begin VB.TextBox txtRecv 
      Height          =   1215
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   9
      Top             =   840
      Width           =   4455
   End
   Begin VB.CheckBox chkAnonymous 
      Caption         =   "Anonymous"
      Height          =   300
      Left            =   2400
      TabIndex        =   7
      Top             =   480
      Width           =   1215
   End
   Begin VB.Label lblPort 
      Caption         =   "Port"
      Height          =   255
      Left            =   2400
      TabIndex        =   2
      Top             =   120
      Width           =   375
   End
   Begin VB.Label lblMyName 
      Caption         =   "My Name"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   480
      Width           =   855
   End
   Begin VB.Label lblHostName 
      Caption         =   "Host Name"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   855
   End
End
Attribute VB_Name = "frmVBChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal sz As String) As Long
Private Declare Function WSBSend2 Lib "WSOCKBAS.DLL" Alias "_WSBSend@12" (ByVal nSocket As Long, ByVal sz As String, ByVal nLen As Long) As Long

Private Sub btnConnect_Click()

Dim sz As String, nPort As Long, df As Double
If nSocket = INVALID_SOCKET Then
    df = Val(txtPort.Text)
    nPort = IIf(df < 0.5 Or df >= 65535.5, 23, df)
    If txtHostName.Text <> vbNullString And nPort > 0 And nPort < 65536 Then
        txtPort.Text = LTrim(Str(nPort))
        nSocket = WSBConnect(txtHostName.Text, nPort)
        If nSocket = INVALID_SOCKET Then
            MsgBox "Connection Failed", vbExclamation
        Else
            If chkAnonymous.Value = 0 Then
                sz = "[" + txtMyName.Text + " Connected at " + Time$ + "]" + vbCrLf
                WSBSend2 nSocket, sz, lstrlenA(sz)
            End If
            frmVBChat.btnConnect.Caption = "Disconnect"
            frmVBChat.btnSend.Enabled = True
        End If
    End If
Else
    If chkAnonymous.Value = 0 Then
        sz = "[" + txtMyName.Text + " Disconnected at " + Time$ + "]" + vbCrLf
        WSBSend2 nSocket, sz, lstrlenA(sz)
    End If
    WSBDisconnect nSocket
    nSocket = INVALID_SOCKET
    frmVBChat.btnConnect.Caption = "Connect"
    frmVBChat.btnSend.Enabled = False
End If

End Sub

Private Sub chkAnonymous_Click()

txtMyName.Enabled = (chkAnonymous.Value = 0)
txtMyName.BackColor = IIf(chkAnonymous.Value = 0, vbWindowBackground, vbButtonFace)

End Sub

Private Sub txtSend_KeyDown(nKeyCode As Integer, nShift As Integer)

If nSocket <> INVALID_SOCKET And nKeyCode = vbKeyReturn And (nShift And vbCtrlMask) <> 0 Then
    btnSend_Click
    txtSend.Locked = True
End If

End Sub

Private Sub txtSend_KeyUp(nKeyCode As Integer, nShift As Integer)

If txtSend.Locked Then
    txtSend.Locked = False
End If

End Sub

Private Sub btnSend_Click()

Dim sz As String
sz = IIf(chkAnonymous.Value = 0, "[" + txtMyName.Text + " Sent at " + Time$ + "]" + vbCrLf + txtSend.Text + vbCrLf, txtSend.Text)
WSBSend2 nSocket, sz, lstrlenA(sz)
txtSend.Text = ""

End Sub

Private Sub btnClear_Click()

txtRecv.Text = ""

End Sub

Private Sub btnExit_Click()

Unload Me

End Sub

Private Sub Form_Load()

txtHostName.Text = GetSetting("VBChat", "Client", "HostName", "localhost")
txtPort.Text = GetSetting("VBChat", "Client", "Port", "23")
txtMyName.Text = GetSetting("VBChat", "Client", "MyName", "My Name")
chkAnonymous.Value = IIf(GetSetting("VBChat", "Client", "Anonymous", "0") = "0", 0, 1)
chkQuiet.Value = IIf(GetSetting("VBChat", "Client", "Quiet", "0") = "0", 0, 1)
txtMyName.Enabled = (chkAnonymous.Value = 0)
txtMyName.BackColor = IIf(chkAnonymous.Value = 0, vbWindowBackground, vbButtonFace)
btnSend.Enabled = False

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

Dim sz As String
If nSocket <> INVALID_SOCKET Then
    If chkAnonymous.Value = 0 Then
        sz = "[" + txtMyName.Text + " Disconnected at " + Time$ + "]" + vbCrLf
        WSBSend2 nSocket, sz, lstrlenA(sz)
    End If
    WSBDisconnect nSocket
    nSocket = INVALID_SOCKET
End If
SaveSetting "VBChat", "Client", "HostName", txtHostName.Text
SaveSetting "VBChat", "Client", "Port", txtPort.Text
SaveSetting "VBChat", "Client", "MyName", txtMyName.Text
SaveSetting "VBChat", "Client", "Anonymous", IIf(chkAnonymous.Value = 0, "0", "1")
SaveSetting "VBChat", "Client", "Quiet", IIf(chkQuiet.Value = 0, "0", "1")
bRunning = False

End Sub

