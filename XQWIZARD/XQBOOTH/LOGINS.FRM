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
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "LOGINS.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1920
   ScaleWidth      =   3240
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   1800
      TabIndex        =   9
      Top             =   1440
      Width           =   855
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   600
      TabIndex        =   8
      Top             =   1440
      Width           =   855
   End
   Begin VB.CheckBox chkRemember 
      Caption         =   "记住密码"
      Height          =   255
      Left            =   840
      TabIndex        =   7
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox txtPassword 
      Height          =   270
      IMEMode         =   3  'DISABLE
      Left            =   840
      PasswordChar    =   "*"
      TabIndex        =   5
      Top             =   480
      Width           =   1335
   End
   Begin VB.TextBox txtUserName 
      Height          =   270
      Left            =   840
      TabIndex        =   2
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label lblRegister 
      Caption         =   "立即注册"
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
      MouseIcon       =   "LOGINS.frx":000C
      MousePointer    =   99  'Custom
      TabIndex        =   3
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lblUserName 
      Caption         =   "用户名："
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lblPrompt 
      Alignment       =   2  'Center
      Height          =   255
      Left            =   0
      TabIndex        =   0
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
      MouseIcon       =   "LOGINS.frx":015E
      MousePointer    =   99  'Custom
      TabIndex        =   6
      Top             =   480
      Width           =   735
   End
   Begin VB.Label lblPassword 
      Caption         =   "　密码："
      Height          =   255
      Left            =   120
      TabIndex        =   4
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
' XiangQi Witchcraft School - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 4.0, Last Modified: Jun. 2009
' Copyright (C) 2004-2009 www.elephantbase.net
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

Caption = Login_szTitle
lblPrompt.Caption = Login_szPrompt
txtUserName.Text = Login_szUserName
If Login_bRemember Then
    txtPassword.Text = Login_szPassword
    chkRemember.Value = 1
End If

End Sub

Private Sub lblRegister_Click()

ShellExecuteA 0, vbNullString, "http://users.elephantbase.net/register.htm", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub lblGetPassword_Click()

ShellExecuteA 0, vbNullString, "http://users.elephantbase.net/getpassword.htm", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnOK_Click()

If Len(txtUserName.Text) = 0 Or Len(txtPassword.Text) = 0 Then
    MsgBox "用户名和密码不能为空", vbExclamation
    Exit Sub
End If
Login_bCancel = False
Login_szUserName = txtUserName.Text
Login_szPassword = txtPassword.Text
Login_bRemember = chkRemember.Value <> 0
Unload Me

End Sub

Private Sub btnCancel_Click()

Login_bCancel = True
Unload Me

End Sub
