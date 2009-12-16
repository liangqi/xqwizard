VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1920
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3240
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "LOGIN.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1920
   ScaleWidth      =   3240
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   1800
      TabIndex        =   10
      Top             =   1440
      Width           =   855
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   600
      TabIndex        =   9
      Top             =   1440
      Width           =   855
   End
   Begin VB.CheckBox chkRemember 
      Caption         =   "记住密码"
      Height          =   255
      Left            =   840
      TabIndex        =   6
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox txtPassword 
      Height          =   270
      IMEMode         =   3  'DISABLE
      Left            =   840
      PasswordChar    =   "*"
      TabIndex        =   4
      Top             =   480
      Width           =   1335
   End
   Begin VB.TextBox txtUserName 
      Height          =   270
      Left            =   840
      TabIndex        =   1
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label lblCharge 
      Caption         =   "补充点数"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   2400
      MouseIcon       =   "LOGIN.frx":000C
      MousePointer    =   99  'Custom
      TabIndex        =   7
      Top             =   840
      Width           =   735
   End
   Begin VB.Label lblRegister 
      Caption         =   "建立存档"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   2400
      MouseIcon       =   "LOGIN.frx":015E
      MousePointer    =   99  'Custom
      TabIndex        =   2
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lblUserName 
      Caption         =   "用户名："
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lblPrompt 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   0
      TabIndex        =   8
      Top             =   1200
      Width           =   3255
   End
   Begin VB.Label lblGetPassword 
      Caption         =   "找回密码"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   2400
      MouseIcon       =   "LOGIN.frx":02B0
      MousePointer    =   99  'Custom
      TabIndex        =   5
      Top             =   480
      Width           =   735
   End
   Begin VB.Label lblPassword 
      Caption         =   "　密码："
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   480
      Width           =   735
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' XQBOOTH.BAS - Source Code for XiangQi Witchcraft School, Part IV
'
' XiangQi Witchcraft School - a Chinese Chess Endgame Challenge Game
' Designed by Morning Yellow, Version: 4.5, Last Modified: Jan. 2010
' Copyright (C) 2004-2010 www.xqbase.com
'
' This program is free software; you can redistribute it and/or modify
' it under the terms of the GNU General Public License as published by
' the Free Software Foundation; either version 2 of the License, or
' (at your option) any later version.

' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.

' You should have received a copy of the GNU General Public License along
' with this program; if not, write to the Free Software Foundation, Inc.,
' 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

Option Explicit

Private Sub Form_Load()

Dim i As Integer

Login_bCancel = True
Caption = Login_szTitle
lblPrompt.Caption = Login_szPrompt
txtUserName.Text = Login_szUserName
If Login_szPrompt = "" Or Gui_nCurr < 200 Then
    lblCharge.Visible = False
End If
If Login_bRemember Then
    txtPassword.Text = Login_szPassword
    chkRemember.Value = 1
End If

If Options_nLanguage = LANGUAGE_ZH_CN Then
    Exit Sub
End If
Font.Charset = 136
Font.Name = "細明體"
On Error Resume Next
For i = 0 To Controls.Count - 1
    Controls(i).Font = Font
Next
On Error GoTo 0
lblRegister.Font.Underline = True
lblGetPassword.Font.Underline = True
lblCharge.Font.Underline = True
lblUserName.Caption = "用戶名："
lblPassword.Caption = "密碼："
chkRemember.Caption = "記住密碼"
lblRegister.Caption = "建立存檔"
lblGetPassword.Caption = "找回密碼"
lblCharge.Caption = "補充點數"
btnConfirm.Caption = "確定"
btnCancel.Caption = "取消"

End Sub

Private Sub lblRegister_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=register", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub lblGetPassword_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=getpassword", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub lblCharge_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/charge/index.htm", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub btnConfirm_Click()

If Len(txtUserName.Text) = 0 Or Len(txtPassword.Text) = 0 Then
    MsgBox L("用户名和密码不能为空", "用戶名和密碼不能為空"), vbExclamation
    Exit Sub
End If
Login_bCancel = False
Login_szUserName = txtUserName.Text
Login_szPassword = txtPassword.Text
Login_bRemember = chkRemember.Value <> 0
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
