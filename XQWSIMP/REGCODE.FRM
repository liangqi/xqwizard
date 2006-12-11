VERSION 5.00
Begin VB.Form frmRegister 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "注册《象棋巫师》"
   ClientHeight    =   1650
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2400
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "REGCODE.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1650
   ScaleWidth      =   2400
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnRegister 
      Cancel          =   -1  'True
      Caption         =   "注册"
      Height          =   375
      Left            =   600
      TabIndex        =   5
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox txtRegCode 
      Height          =   285
      Left            =   720
      TabIndex        =   4
      Top             =   840
      Width           =   1575
   End
   Begin VB.TextBox txtUser 
      Height          =   285
      Left            =   720
      TabIndex        =   2
      Top             =   480
      Width           =   1575
   End
   Begin VB.Label lblWelcome 
      Caption         =   "您还没有注册"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblRegCode 
      Caption         =   "注册码"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   615
   End
   Begin VB.Label lblUser 
      Caption         =   "用户名"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   615
   End
End
Attribute VB_Name = "frmRegister"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' XQWMAIN.BAS - Source Code for XiangQi Wizard, Part XII
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 3.02, Last Modified: Oct. 2006
' Copyright (C) 2004-2006 www.elephantbase.net
'
' This program is free software; you can redistribute it and/or
' modify it under the terms of the GNU General Public License
' as published by the Free Software Foundation; either version 2
' of the License, or (at your option) any later version.
'
' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.
'
' You should have received a copy of the GNU General Public License
' along with this program; if not, write to the Free Software
' Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

Option Explicit

' Private Gui_szUser As String, Gui_szRegCode As String, App_bRegistered As Boolean ' For RegCode

Private Sub Form_Load()

txtUser.Text = Gui_szUser
txtRegCode.Text = Gui_szRegCode
If App_bRegistered Then
    lblWelcome.Caption = "您是注册用户"
    btnRegister.Caption = "再次注册"
End If

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

Gui_szUser = Replace(txtUser.Text, vbCrLf, "")
Gui_szRegCode = Replace(txtRegCode.Text, vbCrLf, "")
App_bRegistered = (UCase(Gui_szRegCode) = Crc32Hex(Gui_szUser))
If App_bRegistered Then
    MsgBox "恭喜你注册成功！", vbInformation
Else
    App_bRegistered = False
    ShellExecuteA 0, vbNullString, App_szPath + "HELP\PURCHASE.HTM", vbNullString, vbNullString, SW_SHOWNORMAL ' Not for RegCode
End If
Unload Me

End Sub

Private Sub txtUser_Change()

' txtRegCode.Text = Crc32Hex(txtUser.Text) ' For RegCode

End Sub

Private Sub btnRegister_Click()

Unload Me

End Sub
