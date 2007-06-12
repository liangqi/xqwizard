VERSION 5.00
Begin VB.Form frmRegister 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "猔禜囱畍"
   ClientHeight    =   1650
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2400
   BeginProperty Font 
      Name            =   "細明體"
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
   ScaleHeight     =   1650
   ScaleWidth      =   2400
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnRegister 
      Cancel          =   -1  'True
      Caption         =   "猔"
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
      Caption         =   "眤临⊿Τ猔"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblRegCode 
      Caption         =   "猔絏"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   615
   End
   Begin VB.Label lblUser 
      Caption         =   "ノめ"
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
' REGCODE.FRM - Source Code for XiangQi Wizard, Part IX
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 3.02, Last Modified: Oct. 2006
' Copyright (C) 2004-2006 www.elephantbase.net
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

txtUser.Text = Gui_szUser
txtRegCode.Text = Gui_szRegCode
If App_bRegistered Then
    lblWelcome.Caption = "您是注冊用戶"
    btnRegister.Caption = "再次注冊"
End If

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

Gui_szUser = Replace(txtUser.Text, vbCrLf, "")
Gui_szRegCode = Replace(txtRegCode.Text, vbCrLf, "")
App_bRegistered = (UCase(Gui_szRegCode) = Crc32Hex(Gui_szUser))
SetTitle
If App_bRegistered Then
    MsgBox "恭喜你注冊成功！", vbInformation
Else
    ShellExecuteA 0, vbNullString, App_szPath + "HELP\PURCHASE.HTM", vbNullString, vbNullString, SW_SHOWNORMAL
End If

End Sub

Private Sub btnRegister_Click()

Unload Me

End Sub
