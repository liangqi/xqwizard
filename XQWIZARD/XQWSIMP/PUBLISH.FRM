VERSION 5.00
Begin VB.Form frmPublish 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "棋谱交流"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "PUBLISH.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnHelp 
      Caption         =   "帮助"
      Height          =   375
      Left            =   360
      TabIndex        =   23
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CommandButton btnPublish 
      Caption         =   "发布"
      Default         =   -1  'True
      Height          =   375
      Left            =   1800
      TabIndex        =   19
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Frame frmBoard 
      Caption         =   "棋盘"
      Height          =   1335
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   4455
      Begin VB.ComboBox cmbPieces 
         Height          =   300
         Left            =   3120
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Top             =   600
         Width           =   1215
      End
      Begin VB.ComboBox cmbBoard 
         Height          =   300
         Left            =   960
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   600
         Width           =   1215
      End
      Begin VB.OptionButton optSize 
         Caption         =   "简单"
         Height          =   255
         Index           =   0
         Left            =   960
         TabIndex        =   10
         Top             =   240
         Width           =   855
      End
      Begin VB.TextBox txtBoardUrl 
         BackColor       =   &H8000000F&
         Height          =   270
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   9
         Top             =   960
         Width           =   2895
      End
      Begin VB.OptionButton optSize 
         Caption         =   "最大"
         Height          =   255
         Index           =   3
         Left            =   3480
         TabIndex        =   8
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton optSize 
         Caption         =   "适中"
         Height          =   255
         Index           =   2
         Left            =   2640
         TabIndex        =   7
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton optSize 
         Caption         =   "印刷"
         Height          =   255
         Index           =   1
         Left            =   1800
         TabIndex        =   6
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblBoardUrl 
         Caption         =   "图片地址"
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   960
         Width           =   735
      End
      Begin VB.Label lblViewBoard 
         Caption         =   "预览"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   3960
         MouseIcon       =   "PUBLISH.frx":000C
         TabIndex        =   15
         Top             =   960
         Width           =   375
      End
      Begin VB.Label Label1 
         Caption         =   "棋子样式"
         Height          =   255
         Left            =   2280
         TabIndex        =   13
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblBoard 
         Caption         =   "棋盘样式"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblSize 
         Caption         =   "图片类型"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "关闭"
      Height          =   375
      Left            =   3240
      TabIndex        =   1
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Frame frmFormat 
      Caption         =   "发布"
      Height          =   1095
      Left            =   120
      TabIndex        =   0
      Top             =   1560
      Width           =   4455
      Begin VB.OptionButton optContent 
         Caption         =   "当前局面"
         Height          =   255
         Index           =   1
         Left            =   2040
         TabIndex        =   22
         Top             =   240
         Width           =   1095
      End
      Begin VB.OptionButton optContent 
         Caption         =   "整个棋局"
         Height          =   255
         Index           =   0
         Left            =   960
         TabIndex        =   21
         Top             =   240
         Width           =   1095
      End
      Begin VB.ComboBox cmbLocation 
         Height          =   300
         Left            =   960
         Style           =   2  'Dropdown List
         TabIndex        =   18
         Top             =   600
         Width           =   1215
      End
      Begin VB.ComboBox cmbFormat 
         Height          =   300
         Left            =   3120
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label lblContent 
         Caption         =   "发布内容"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblLocation 
         Caption         =   "发布站点"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblFormat 
         Caption         =   "发布格式"
         Height          =   255
         Left            =   2280
         TabIndex        =   3
         Top             =   600
         Width           =   735
      End
   End
End
Attribute VB_Name = "frmPublish"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' PUBLISH.FRM - Source Code for XiangQi Wizard, Part XI
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 4.4, Last Modified: Oct. 2009
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

cmbLocation.Clear
cmbLocation.AddItem "百度贴吧象棋吧", 0
cmbLocation.AddItem "中国象棋大师网", 1
cmbLocation.AddItem "百度知道", 2
cmbLocation.AddItem "新浪博客", 3
cmbLocation.AddItem "QQ空间", 4
cmbLocation.AddItem "(其他)", 5

cmbFormat.Clear
cmbFormat.AddItem "纯文本", 0
cmbFormat.AddItem "ANSI文本", 1
cmbFormat.AddItem "UBB文本", 2
cmbFormat.AddItem "HTML文本", 3
cmbFormat.AddItem "HTML内容", 4

SetTopMost hWnd

End Sub

Private Sub txtBoardUrl_Click()

txtBoardUrl.SelStart = 0
txtBoardUrl.SelLength = Len(txtBoardUrl)

End Sub
