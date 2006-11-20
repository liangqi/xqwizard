VERSION 5.00
Begin VB.Form frmRegister 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "猔禜囱畍"
   ClientHeight    =   1320
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2400
   BeginProperty Font 
      Name            =   "灿蔨"
      Size            =   9
      Charset         =   136
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "REGCODE.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1320
   ScaleWidth      =   2400
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnRegister 
      Cancel          =   -1  'True
      Caption         =   "猔"
      Height          =   375
      Left            =   720
      TabIndex        =   4
      Top             =   840
      Width           =   975
   End
   Begin VB.TextBox txtRegCode 
      Height          =   285
      Left            =   720
      TabIndex        =   3
      Top             =   480
      Width           =   1575
   End
   Begin VB.TextBox txtUser 
      Height          =   285
      Left            =   720
      TabIndex        =   1
      Top             =   120
      Width           =   1575
   End
   Begin VB.Label lblRegCode 
      Caption         =   "猔絏"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   615
   End
   Begin VB.Label lblUser 
      Caption         =   "ノめ"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   615
   End
End
Attribute VB_Name = "frmRegister"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal lpsz As String) As Long

' Private App_szUser As String

Private Sub Form_Load()

' App_szUser = "象棋巫師測試團隊"
' txtRegCode.Text = Crc32Hex(App_szUser)

txtUser.Text = App_szUser

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

If UCase(txtRegCode.Text) = Crc32Hex(txtUser.Text) Then
    App_szUser = txtUser.Text
    SaveSetting "XQWizard", "Register", "User", App_szUser
    SaveSetting "XQWizard", "Register", "Code", txtRegCode.Text
    MsgBox "恭喜你注冊成功！", vbInformation
Else
    MsgBox "注冊碼不正确，請從 www.elephantbase.net 网站獲得注冊碼。", vbExclamation
End If
Unload Me

End Sub

Private Sub txtUser_Change()

' txtRegCode.Text = Crc32Hex(txtUser.Text)

End Sub

Private Sub btnRegister_Click()

Unload Me

End Sub
