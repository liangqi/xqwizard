VERSION 5.00
Begin VB.Form frmRedirect 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Redirect Proxy"
   ClientHeight    =   960
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   2265
   BeginProperty Font 
      Name            =   "ËÎÌו"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "REDIRECT.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   960
   ScaleWidth      =   2265
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnExit 
      Cancel          =   -1  'True
      Caption         =   "Exit"
      Height          =   375
      Left            =   1200
      TabIndex        =   4
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnStart 
      Caption         =   "Start"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   480
      Width           =   855
   End
   Begin VB.CheckBox chkNoEcho 
      Caption         =   "No Echo"
      Height          =   300
      Left            =   1200
      TabIndex        =   2
      Top             =   120
      Width           =   975
   End
   Begin VB.TextBox txtPort 
      Height          =   285
      Left            =   600
      TabIndex        =   1
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblPort 
      Caption         =   "Port"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   375
   End
   Begin VB.Menu mnTray 
      Caption         =   "Tray Menu"
      Visible         =   0   'False
      Begin VB.Menu mnTrayOpen 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnTrayStart 
         Caption         =   "&Start"
      End
      Begin VB.Menu mnTrayExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmRedirect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub mnTrayOpen_Click()

WindowState = vbNormal
Show

End Sub

Private Sub mnTrayStart_Click()

btnStart_Click

End Sub

Private Sub mnTrayExit_Click()

Unload Me

End Sub

Private Sub btnStart_Click()

Dim i As Integer, nPort As Long
If App_sServer = INVALID_SOCKET Then
    nPort = Str2Lng(Val(txtPort.Text), 1, 65535)
    txtPort.Text = nPort
    App_sServer = WSBOpenServer(nPort)
    If App_sServer = INVALID_SOCKET Then
        MsgBox "Error Opening Port" + Str(nPort), vbExclamation
    Else
        For i = 1 To MAX_CLIENTS
            App_sClients(i) = INVALID_SOCKET
        Next
        App_nNext = 1
        txtPort.Enabled = False
        chkNoEcho.Enabled = False
        btnStart.Caption = "Stop"
        mnTrayStart.Caption = "&Stop"
    End If
Else
    StopServer
    txtPort.Enabled = True
    chkNoEcho.Enabled = True
    btnStart.Caption = "Start"
    mnTrayStart.Caption = "&Start"
End If

End Sub

Private Sub btnExit_Click()

Unload Me

End Sub

Private Sub Form_Resize()

If WindowState = vbMinimized Then
    AddTrayIcon Me
    Hide
Else
    DeleteTrayIcon Me
End If

End Sub

Private Sub Form_Load()

txtPort.Text = Str2Lng(GetSetting("Redirect", "Server", "Port", "23"), 1, 65535)
chkNoEcho.Value = IIf(GetSetting("Redirect", "Server", "NoEcho", "0") = "0", 0, 1)
App_lpPrevWndFunc = SetWindowLongA(hWnd, GWL_WNDPROC, AddressOf NewWndFunc)

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

If WindowState = vbMinimized Then
    DeleteTrayIcon Me
End If
SetWindowLongA hWnd, GWL_WNDPROC, App_lpPrevWndFunc
SaveSetting "VBChat", "Server", "Port", txtPort.Text
SaveSetting "VBChat", "Server", "NoEcho", IIf(chkNoEcho.Value = 0, "0", "1")
App_bRunning = False

End Sub
