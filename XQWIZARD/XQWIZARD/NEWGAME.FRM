VERSION 5.00
Begin VB.Form frmNewGame 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "开始对局"
   ClientHeight    =   3120
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
   ScaleHeight     =   3120
   ScaleWidth      =   3000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkShowNew 
      Caption         =   "始终显示“开始对局”对话框"
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   2280
      Width           =   2655
   End
   Begin VB.Frame frmHandicap 
      Caption         =   "先走让子"
      Height          =   2055
      Left            =   1560
      TabIndex        =   6
      Top             =   120
      Width           =   1335
      Begin VB.OptionButton optHandicap 
         Caption         =   "自定义"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   11
         Top             =   1680
         Width           =   1095
      End
      Begin VB.OptionButton optHandicap 
         Caption         =   "让双马"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   9
         Top             =   960
         Width           =   1095
      End
      Begin VB.OptionButton optHandicap 
         Caption         =   "让九子"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   10
         Top             =   1320
         Width           =   1095
      End
      Begin VB.OptionButton optHandicap 
         Caption         =   "不让子"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   1095
      End
      Begin VB.OptionButton optHandicap 
         Caption         =   "让单马"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   8
         Top             =   600
         Width           =   1095
      End
   End
   Begin VB.Frame frmFlip 
      Caption         =   "谁先走"
      Height          =   1335
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1335
      Begin VB.OptionButton optFlip 
         Caption         =   "不用电脑"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   3
         Top             =   960
         Width           =   1095
      End
      Begin VB.OptionButton optFlip 
         Caption         =   "电脑先走"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   2
         Top             =   600
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
      Caption         =   "级别"
      Height          =   615
      Left            =   120
      TabIndex        =   4
      ToolTipText     =   "如果“傻瓜”对你仍有难度，可以叫电脑让你几个子。"
      Top             =   1560
      Width           =   1335
      Begin VB.ComboBox cmbLevel 
         Height          =   300
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   360
      TabIndex        =   13
      Top             =   2640
      Width           =   975
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   1680
      TabIndex        =   14
      Top             =   2640
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
' Designed by Morning Yellow, Version: 4.79, Last Modified: Oct. 2010
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

Private Const MORE_LEVELS As Integer = -LEVEL_GRANDMASTER

Private bMoreLevels As Boolean

Private Sub Form_Load()

Dim i As Integer
cmbLevel.AddItem L("傻瓜", "傻瓜")
cmbLevel.AddItem L("菜鸟", "菜鳥")
cmbLevel.AddItem L("新手", "新手")
cmbLevel.AddItem L("入门", "入門")
cmbLevel.AddItem L("业余", "業餘")
cmbLevel.AddItem L("专业", "專業")
cmbLevel.AddItem L("大师", "大師")
cmbLevel.AddItem L("特级大师", "特級大師")
cmbLevel.AddItem L("更多……", "更多……")

Select Case Options_nEnginePlay
Case ENGINE_PLAY_NONE
    optFlip(2).Value = True
Case ENGINE_PLAY_RED
    optFlip(1).Value = True
Case ENGINE_PLAY_BLACK
    optFlip(0).Value = True
Case ENGINE_PLAY_TURN
    If App_bRedTurn Then
        optFlip(1).Value = True
    Else
        optFlip(0).Value = True
    End If
Case ENGINE_PLAY_RANDOM
    If Rnd < 0.5 Then
        optFlip(1).Value = True
    Else
        optFlip(0).Value = True
    End If
End Select

optHandicap(0).Value = True
bMoreLevels = False
cmbLevel.ListIndex = IIf(Timer_nDepth < 0, LEVEL_PEABRAIN - Timer_nDepth, MORE_LEVELS)
bMoreLevels = True
chkShowNew.Value = IIf(Options_bShowNew, 1, 0)
SetTopMost hWnd

If Options_nLanguage = LANGUAGE_ZH_CN Then
    cmbLevel.ToolTipText = frmLevel.ToolTipText
    Exit Sub
End If
Font.Charset = 136
Font.Name = "細明體"
On Error Resume Next
For i = 0 To Controls.Count - 1
    Controls(i).Font = Font
Next
On Error GoTo 0
Caption = "開始對局"
frmFlip.Caption = "誰先走"
optFlip(0).Caption = "我先走"
optFlip(1).Caption = "電腦先走"
optFlip(2).Caption = "不用電腦"
frmHandicap.Caption = "先走讓子"
optHandicap(0).Caption = "不讓子"
optHandicap(1).Caption = "讓單馬"
optHandicap(2).Caption = "讓雙馬"
optHandicap(3).Caption = "讓九子"
optHandicap(4).Caption = "自定義"
frmLevel.Caption = "級別"
frmLevel.ToolTipText = "如果“傻瓜”對你仍有難度，可以叫電腦讓你幾個子。"
chkShowNew.Caption = "始終顯示“開始對局”對話框"
btnConfirm.Caption = "確定"
btnCancel.Caption = "取消"
cmbLevel.ToolTipText = frmLevel.ToolTipText

End Sub

Private Sub Form_Unload(Cancel As Integer)

Options_bShowNew = (chkShowNew.Value = 1)

End Sub

Private Sub cmbLevel_Click()

If Not bMoreLevels Or cmbLevel.ListIndex < MORE_LEVELS Then
    Exit Sub
End If
frmLevelSet.Show vbModal
If Timer_nDepth < 0 Then
    cmbLevel.ListIndex = LEVEL_PEABRAIN - Timer_nDepth
End If

End Sub

Private Sub btnConfirm_Click()

If cmbLevel.ListIndex < MORE_LEVELS Then
    Timer_nDepth = LEVEL_PEABRAIN - cmbLevel.ListIndex
End If
' 以上难度设置代码必须在RestartGame前运行才会生效
App_szFileName = ""
If optHandicap(0).Value Then
    NewGame0
ElseIf optHandicap(1).Value Then
    LoadFenStr HANDICAP_A
ElseIf optHandicap(2).Value Then
    LoadFenStr HANDICAP_B
ElseIf optHandicap(3).Value Then
    LoadFenStr HANDICAP_C
Else
    NewGame0
    frmPosEdit.Show vbModal, Me
End If

EngineNewGame IIf(optFlip(2).Value, ENGINE_PLAY_NONE, _
        IIf(optFlip(0).Value, ENGINE_PLAY_BLACK, ENGINE_PLAY_RED))
If Options_nEnginePlay = ENGINE_PLAY_TURN Then
    App_bRedTurn = optFlip(0).Value
End If

Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
