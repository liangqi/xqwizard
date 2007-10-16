VERSION 5.00
Begin VB.Form frmHowTo 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "日积月累"
   ClientHeight    =   3210
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "HOWTO.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3210
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "关闭"
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      Top             =   2760
      Width           =   855
   End
   Begin VB.CommandButton btnNext 
      Caption         =   "下一条 >"
      Height          =   375
      Left            =   2520
      TabIndex        =   4
      Top             =   2760
      Width           =   975
   End
   Begin VB.CommandButton btnPrev 
      Caption         =   "< 上一条"
      Height          =   375
      Left            =   1440
      TabIndex        =   3
      Top             =   2760
      Width           =   975
   End
   Begin VB.CheckBox chkShowHowTo 
      Caption         =   "启动时显示"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   2760
      Width           =   1215
   End
   Begin VB.TextBox txtTips 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   600
      Width           =   4455
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Left            =   120
      Picture         =   "HOWTO.frx":000C
      Top             =   0
      Width           =   480
   End
   Begin VB.Label lblDoYouKnow 
      Caption         =   "你知道吗？"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   720
      TabIndex        =   0
      Top             =   120
      Width           =   3855
   End
End
Attribute VB_Name = "frmHowTo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' HOWTO.FRM - Source Code for XiangQi Wizard, Part VIII
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 3.3, Last Modified: Jul. 2007
' Copyright (C) 2004-2007 www.elephantbase.net
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

chkShowHowTo.Value = IIf(Gui_bShowHowTo, 1, 0)
txtTips.Text = Gui_szTips(Gui_nTipIndex)

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

Gui_bShowHowTo = (chkShowHowTo.Value = 1)

End Sub

Private Sub btnPrev_Click()

Gui_nTipIndex = Gui_nTipIndex - 1
If Gui_nTipIndex < 1 Then
    Gui_nTipIndex = TIP_NUM
End If
txtTips.Text = Gui_szTips(Gui_nTipIndex)

End Sub

Private Sub btnNext_Click()

Gui_nTipIndex = Gui_nTipIndex + 1
If Gui_nTipIndex > TIP_NUM Then
    Gui_nTipIndex = 1
End If
txtTips.Text = Gui_szTips(Gui_nTipIndex)

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub

