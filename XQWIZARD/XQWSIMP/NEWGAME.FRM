VERSION 5.00
Begin VB.Form frmNewGame 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "开始对局"
   ClientHeight    =   4200
   ClientLeft      =   5310
   ClientTop       =   1830
   ClientWidth     =   3000
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "NEWGAME.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4200
   ScaleWidth      =   3000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkNoComputer 
      Caption         =   "不用电脑，只观看或编辑棋局"
      Height          =   255
      Left            =   120
      TabIndex        =   15
      Top             =   3000
      Width           =   2655
   End
   Begin VB.CheckBox chkShowNew 
      Caption         =   "始终显示“开始对局”对话框"
      Height          =   255
      Left            =   120
      TabIndex        =   16
      Top             =   3360
      Width           =   2655
   End
   Begin VB.Frame frmHandicap 
      Caption         =   "先走让子"
      Height          =   2055
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   1335
      Begin VB.CheckBox chkCustom 
         Caption         =   "自定义"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   1680
         Width           =   1095
      End
      Begin VB.OptionButton optHandicap 
         Caption         =   "让双马"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   1095
      End
      Begin VB.OptionButton optHandicap 
         Caption         =   "让九子"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   7
         Top             =   1320
         Width           =   1095
      End
      Begin VB.OptionButton optHandicap 
         Caption         =   "不让子"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   1095
      End
      Begin VB.OptionButton optHandicap 
         Caption         =   "让单马"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   5
         Top             =   600
         Width           =   1095
      End
   End
   Begin VB.Frame frmFlip 
      Caption         =   "谁先走"
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2775
      Begin VB.OptionButton optFlip 
         Caption         =   "电脑先走"
         Height          =   255
         Index           =   1
         Left            =   1560
         TabIndex        =   2
         Top             =   240
         Width           =   1095
      End
      Begin VB.OptionButton optFlip 
         Caption         =   "我先走"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.Frame frmLevel 
      Caption         =   "电脑水平"
      Height          =   2055
      Left            =   1560
      TabIndex        =   9
      Top             =   840
      Width           =   1335
      Begin VB.OptionButton optLevel 
         Caption         =   "业余"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   11
         Top             =   600
         Width           =   735
      End
      Begin VB.OptionButton optLevel 
         Caption         =   "专业"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   12
         Top             =   960
         Width           =   735
      End
      Begin VB.OptionButton optLevel 
         Caption         =   "大师"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   13
         Top             =   1320
         Width           =   735
      End
      Begin VB.OptionButton optLevel 
         Caption         =   "入门"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   735
      End
      Begin VB.OptionButton optLevel 
         Caption         =   "特级大师"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   14
         Top             =   1680
         Width           =   1095
      End
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   360
      TabIndex        =   17
      Top             =   3720
      Width           =   975
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   1680
      TabIndex        =   18
      Top             =   3720
      Width           =   975
   End
End
Attribute VB_Name = "frmNewGame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' NEWGAME.FRM - Source Code for XiangQi Wizard, Part X
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 4.3, Last Modified: Aug. 2009
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

Dim i As Integer

Select Case Options_nEnginePlay
Case ENGINE_PLAY_RED
    optFlip(1).Value = True
Case ENGINE_PLAY_BLACK
    optFlip(0).Value = True
Case ENGINE_PLAY_TURN
    optFlip(0).Value = Not App_bRedTurn
Case Else
    optFlip(0).Value = Rnd < 0.5
End Select
optFlip(1).Value = Not optFlip(0).Value

optHandicap(0).Value = True

Select Case Timer_nDepth
Case LEVEL_GRANDMASTER
    optLevel(4).Value = True
Case LEVEL_MASTER
    optLevel(3).Value = True
Case LEVEL_EXPERT
    optLevel(2).Value = True
Case LEVEL_AMATEUR
    optLevel(1).Value = True
Case Else
    optLevel(0).Value = True
End Select

chkNoComputer.Value = IIf(Options_nEnginePlay = ENGINE_PLAY_NONE, 1, 0)
chkShowNew.Value = IIf(Options_bShowNew, 1, 0)
SetTopMost hWnd

If Options_nLanguage = 0 Then
    Exit Sub
End If
Font.Charset = 136
Font.Name = "細明體"
On Error Resume Next
For i = 0 To Controls.Count - 1
    Controls(i).Font = Font
Next
On Error GoTo 0
frmFlip.Caption = "誰先走"
optFlip(0).Caption = "我先走"
optFlip(1).Caption = "電腦先走"
frmHandicap.Caption = "先走讓子"
optHandicap(0).Caption = "不讓子"
optHandicap(1).Caption = "讓單馬"

End Sub

Private Sub chkNoComputer_Click()

Dim i As Integer, bEnabled As Boolean
bEnabled = chkNoComputer.Value = 0
frmFlip.Enabled = bEnabled
For i = 0 To 1
    optFlip(i).Enabled = bEnabled
Next
frmLevel.Enabled = bEnabled
For i = 0 To 4
    optLevel(i).Enabled = bEnabled
Next

End Sub

Private Sub btnConfirm_Click()

If optLevel(4).Value Then
    Timer_nDepth = LEVEL_GRANDMASTER
    Timer_nIncMove = 1
ElseIf optLevel(3).Value Then
    Timer_nDepth = LEVEL_MASTER
    Timer_nIncMove = 6
ElseIf optLevel(2).Value Then
    Timer_nDepth = LEVEL_EXPERT
    Timer_nIncMove = 36
ElseIf optLevel(1).Value Then
    Timer_nDepth = LEVEL_AMATEUR
    Timer_nIncMove = 216
Else
    Timer_nDepth = LEVEL_BEGINNER
    Timer_nIncMove = 999
End If
Timer_bIncMode = False
Timer_nInitTime = 1
Timer_nIncTime = 1
' 以上难度设置代码必须在RestartGame前运行才会生效

App_szFileName = ""
If optHandicap(1).Value Then
    LoadFenStr HANDICAP_A
ElseIf optHandicap(2).Value Then
    LoadFenStr HANDICAP_B
ElseIf optHandicap(3).Value Then
    LoadFenStr HANDICAP_C
Else
    NewGame0
End If
If chkCustom.Value = 1 Then
    frmPosEdit.Show vbModal, Me
End If

EngineNewGame IIf(chkNoComputer.Value = 1, ENGINE_PLAY_NONE, _
        IIf(optFlip(0).Value, ENGINE_PLAY_BLACK, ENGINE_PLAY_RED))
If Options_nEnginePlay = ENGINE_PLAY_TURN Then
    App_bRedTurn = Not App_bRedTurn
End If

Options_bShowNew = (chkShowNew.Value = 1)
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
