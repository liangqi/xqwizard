VERSION 5.00
Begin VB.Form frmRedirect 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Redirect Proxy"
   ClientHeight    =   960
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   3600
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
   ScaleWidth      =   3600
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox selDump 
      Height          =   300
      ItemData        =   "REDIRECT.frx":030A
      Left            =   600
      List            =   "REDIRECT.frx":0317
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   480
      Width           =   855
   End
   Begin VB.TextBox txtServerHost 
      Height          =   270
      Left            =   1680
      TabIndex        =   3
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox txtServerPort 
      Height          =   285
      Left            =   3000
      TabIndex        =   5
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton btnExit 
      Cancel          =   -1  'True
      Caption         =   "Exit"
      Height          =   375
      Left            =   2640
      TabIndex        =   9
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnStart 
      Caption         =   "Start"
      Height          =   375
      Left            =   1680
      TabIndex        =   8
      Top             =   480
      Width           =   855
   End
   Begin VB.TextBox txtClientPort 
      Height          =   285
      Left            =   600
      TabIndex        =   1
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblLog 
      Caption         =   "Dump"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   480
      Width           =   375
   End
   Begin VB.Label lblSlash 
      Alignment       =   2  'Center
      Caption         =   "/"
      Height          =   255
      Left            =   2760
      TabIndex        =   4
      Top             =   120
      Width           =   255
   End
   Begin VB.Label lblDest 
      Caption         =   "Dest"
      Height          =   255
      Left            =   1200
      TabIndex        =   2
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
    nPort = Str2Lng(Val(txtClientPort.Text), 1, 65535)
    txtClientPort.Text = nPort
    App_sServer = WSBOpenServer(nPort)
    If App_sServer = INVALID_SOCKET Then
        MsgBox "Error Opening Port" + Str(nPort), vbExclamation
    Else
        For i = 1 To MAX_CLIENTS
            App_sClients(i) = INVALID_SOCKET
        Next
        App_nNext = 1
        txtClientPort.Enabled = False
        txtServerHost.Enabled = False
        txtServerPort.Enabled = False
        btnStart.Caption = "Stop"
        mnTrayStart.Caption = "&Stop"
    End If
Else
    StopServer
    txtClientPort.Enabled = True
    txtServerHost.Enabled = True
    txtServerPort.Enabled = True
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

txtClientPort.Text = Str2Lng(GetSetting("VBChat", "Redirect", "ClientPort", "8228"), 1, 65535)
txtServerHost.Text = GetSetting("VBChat", "Redirect", "ServerHost", "localhost")
txtServerPort.Text = Str2Lng(GetSetting("VBChat", "Redirect", "ServerPort", "2882"), 1, 65535)
selDump.ListIndex = Str2Int(GetSetting("VBChat", "Redirect", "Dump", "0"), 0, 2)
App_lpPrevWndFunc = SetWindowLongA(hWnd, GWL_WNDPROC, AddressOf NewWndFunc)

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

If WindowState = vbMinimized Then
    DeleteTrayIcon Me
End If
SetWindowLongA hWnd, GWL_WNDPROC, App_lpPrevWndFunc
SaveSetting "VBChat", "Redirect", "ClientPort", txtClientPort.Text
SaveSetting "VBChat", "Redirect", "ServerHost", txtServerHost.Text
SaveSetting "VBChat", "Redirect", "ServerPort", txtServerPort.Text
SaveSetting "VBChat", "Redirect", "Dump", LTrim(Str(selDump.ListIndex))
App_bRunning = False

End Sub
