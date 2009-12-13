VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选项设置"
   ClientHeight    =   3120
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6840
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "OPTIONS.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3120
   ScaleWidth      =   6840
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frmOther 
      Caption         =   "其他"
      Height          =   975
      Left            =   120
      TabIndex        =   11
      Top             =   1560
      Width           =   3255
      Begin VB.CheckBox chkAutoSave 
         Caption         =   "自动保存棋局"
         Height          =   255
         Left            =   1680
         TabIndex        =   14
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox chkPromptSave 
         Caption         =   "提示保存棋局"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox chkShowNew 
         Caption         =   "启动时显示“开始对局”对话框"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   3015
      End
   End
   Begin VB.Frame frmEngine 
      Caption         =   "电脑"
      Height          =   2415
      Left            =   3480
      TabIndex        =   15
      Top             =   120
      Width           =   3255
      Begin VB.TextBox txtMoveDelay 
         Height          =   285
         Left            =   960
         TabIndex        =   17
         Top             =   240
         Width           =   360
      End
      Begin VB.TextBox txtUser 
         Height          =   270
         Left            =   1680
         TabIndex        =   29
         Top             =   2040
         Width           =   1215
      End
      Begin VB.CheckBox chkStatusBar 
         Caption         =   "输出到状态栏"
         Height          =   255
         Left            =   1680
         TabIndex        =   25
         Top             =   1320
         Width           =   1455
      End
      Begin VB.CheckBox chkEngineTime 
         Caption         =   "显示思考时间"
         Height          =   255
         Left            =   120
         TabIndex        =   24
         Top             =   1320
         Width           =   1455
      End
      Begin VB.CheckBox chkAllowResign 
         Caption         =   "允许提和认输"
         Height          =   255
         Left            =   1680
         TabIndex        =   23
         Top             =   960
         Width           =   1455
      End
      Begin VB.CheckBox chkAlwaysPonder 
         Caption         =   "启用后台思考"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   960
         Width           =   1455
      End
      Begin VB.ComboBox cmbEnginePlay 
         Height          =   300
         Left            =   1680
         Style           =   2  'Dropdown List
         TabIndex        =   27
         Top             =   1680
         Width           =   1215
      End
      Begin VB.CheckBox chkAutoFlip 
         Caption         =   "自动翻转棋盘"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox chkEngineName 
         Caption         =   "显示引擎名称"
         Height          =   255
         Left            =   1680
         TabIndex        =   21
         Top             =   600
         Width           =   1455
      End
      Begin ComCtl2.UpDown updnMoveDelay 
         Height          =   285
         Left            =   1320
         TabIndex        =   18
         Top             =   240
         Width           =   195
         _ExtentX        =   344
         _ExtentY        =   503
         _Version        =   327681
         Value           =   1
         BuddyControl    =   "txtMoveDelay"
         BuddyDispid     =   196614
         OrigLeft        =   2160
         OrigTop         =   240
         OrigRight       =   2355
         OrigBottom      =   495
         Max             =   5
         SyncBuddy       =   -1  'True
         BuddyProperty   =   65547
         Enabled         =   -1  'True
      End
      Begin VB.Label lblDelaySec 
         Caption         =   "秒"
         Height          =   255
         Left            =   1560
         TabIndex        =   19
         Top             =   240
         Width           =   255
      End
      Begin VB.Label lblMoveDelay 
         Caption         =   "走子延时"
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblUser 
         Caption         =   "人机对弈用户"
         Height          =   255
         Left            =   480
         TabIndex        =   28
         Top             =   2040
         Width           =   1095
      End
      Begin VB.Label lblEnginePlay 
         Caption         =   "新局电脑状态"
         Height          =   255
         Left            =   480
         TabIndex        =   26
         Top             =   1680
         Width           =   1095
      End
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   3720
      TabIndex        =   31
      Top             =   2640
      Width           =   975
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Height          =   375
      Left            =   2040
      TabIndex        =   30
      Top             =   2640
      Width           =   975
   End
   Begin VB.Frame frmGui 
      Caption         =   "外观"
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3255
      Begin VB.OptionButton optSmallGui 
         Caption         =   "小"
         Height          =   255
         Left            =   600
         TabIndex        =   2
         Top             =   240
         Width           =   495
      End
      Begin VB.OptionButton optLargeGui 
         Caption         =   "大"
         Height          =   255
         Left            =   1080
         TabIndex        =   3
         Top             =   240
         Width           =   495
      End
      Begin VB.CheckBox chkSounds 
         Caption         =   "声音效果"
         Height          =   255
         Left            =   2040
         TabIndex        =   4
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label lblDisplay 
         Caption         =   "显示"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame frmWizard 
      Caption         =   "魔法"
      Height          =   615
      Left            =   120
      TabIndex        =   5
      Top             =   840
      Width           =   3255
      Begin ComCtl2.UpDown updnPlayIntv 
         Height          =   285
         Left            =   2640
         TabIndex        =   9
         Top             =   240
         Width           =   195
         _ExtentX        =   344
         _ExtentY        =   503
         _Version        =   327681
         Value           =   1
         BuddyControl    =   "txtPlayIntv"
         BuddyDispid     =   196640
         OrigLeft        =   2160
         OrigTop         =   240
         OrigRight       =   2355
         OrigBottom      =   495
         Min             =   1
         SyncBuddy       =   -1  'True
         BuddyProperty   =   65547
         Enabled         =   -1  'True
      End
      Begin VB.TextBox txtPlayIntv 
         Height          =   285
         Left            =   2280
         TabIndex        =   8
         Top             =   240
         Width           =   360
      End
      Begin VB.CheckBox chkAutoPlay 
         Caption         =   "自动播放"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label lblPlayIntv 
         Caption         =   "播放延时"
         Height          =   255
         Left            =   1440
         TabIndex        =   7
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblIntvSec 
         Caption         =   "秒"
         Height          =   255
         Left            =   2880
         TabIndex        =   10
         Top             =   240
         Width           =   255
      End
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' OPTIONS.FRM - Source Code for XiangQi Wizard, Part VII
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
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

Private nPlayIntv As Integer, nMoveDelay As Integer

Private Sub Form_Load()

cmbEnginePlay.Clear
cmbEnginePlay.AddItem ST("不启用电脑", "不啟用電腦。"), 0
cmbEnginePlay.AddItem ST("电脑执红", "電腦執紅"), 1
cmbEnginePlay.AddItem ST("电脑执黑", "電腦執黑"), 2
cmbEnginePlay.AddItem ST("红黑轮流", "紅黑輪流"), 3
cmbEnginePlay.AddItem ST("红黑随机", "紅黑隨機"), 4

optSmallGui.Value = Not Options_bLargeGui
optLargeGui.Value = Options_bLargeGui
chkSounds.Value = IIf(Options_bSounds, 1, 0)
chkAutoPlay.Value = IIf(Options_bAutoPlay, 1, 0)
nPlayIntv = Options_nPlayIntv
txtPlayIntv.Text = nPlayIntv
nMoveDelay = Options_nMoveDelay
txtMoveDelay.Text = nMoveDelay
chkAutoFlip.Value = IIf(Options_bAutoFlip, 1, 0)
chkEngineName.Value = IIf(Options_bEngineName, 1, 0)
chkAlwaysPonder.Value = IIf(Options_bAlwaysPonder, 1, 0)
chkAllowResign.Value = IIf(Options_bAllowResign, 1, 0)
chkEngineTime.Value = IIf(Options_bEngineTime, 1, 0)
chkStatusBar.Value = IIf(Options_bStatusBar, 1, 0)
cmbEnginePlay.ListIndex = Options_nEnginePlay
txtUser.Text = Options_szUser
chkPromptSave.Value = IIf(Options_bPromptSave, 1, 0)
chkAutoSave.Value = IIf(Options_bAutoSave, 1, 0)
chkShowNew.Value = IIf(Options_bShowNew, 1, 0)
SetTopMost hWnd

End Sub

Private Sub txtPlayIntv_Change()

If nPlayIntv <> Str2Int(txtPlayIntv.Text) Then
    nPlayIntv = Str2Int(txtPlayIntv.Text, 1, 10)
    txtPlayIntv.Text = nPlayIntv
End If

End Sub

Private Sub txtMoveDelay_Change()

If nMoveDelay <> Str2Int(txtMoveDelay.Text) Then
    nMoveDelay = Str2Int(txtMoveDelay.Text, 0, 5)
    txtMoveDelay.Text = nMoveDelay
End If

End Sub

Private Sub btnConfirm_Click()

If Options_bLargeGui <> optLargeGui.Value Then
    MsgBox ST("显示模式已经更改，重新启动程序后才能生效。", "顯示模式已經更改，重新啟動程序後才能生效。"), vbInformation
    SaveSetting "XQWizard", "Options", "LargeGui", IIf(optLargeGui.Value, "1", "0")
End If
Options_bSounds = (chkSounds.Value = 1)
Options_nPlayIntv = nPlayIntv
Options_bAutoPlay = (chkAutoPlay.Value = 1)
Options_nMoveDelay = nMoveDelay
Options_bAutoFlip = (chkAutoFlip.Value = 1)
Options_bEngineName = (chkEngineName.Value = 1)
Options_bAlwaysPonder = (chkAlwaysPonder.Value = 1)
Options_bAllowResign = (chkAllowResign.Value = 1)
Options_bEngineTime = (chkEngineTime.Value = 1)
Options_bStatusBar = (chkStatusBar.Value = 1)
Options_nEnginePlay = cmbEnginePlay.ListIndex
Options_szUser = txtUser.Text
Options_bPromptSave = (chkPromptSave.Value = 1)
Options_bAutoSave = (chkAutoSave.Value = 1)
Options_bShowNew = (chkShowNew.Value = 1)
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
