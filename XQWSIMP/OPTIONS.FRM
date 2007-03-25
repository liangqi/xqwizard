VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选项设置"
   ClientHeight    =   3360
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
   ScaleHeight     =   3360
   ScaleWidth      =   6840
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frmOther 
      Caption         =   "其他"
      Height          =   855
      Left            =   3480
      TabIndex        =   24
      Top             =   1920
      Width           =   3255
      Begin VB.OptionButton optEngineUser 
         Caption         =   "引擎"
         Height          =   255
         Left            =   2400
         TabIndex        =   27
         Top             =   240
         Width           =   735
      End
      Begin VB.OptionButton optAppUser 
         Caption         =   "象棋巫师"
         Height          =   255
         Left            =   1320
         TabIndex        =   26
         Top             =   240
         Width           =   1095
      End
      Begin VB.CheckBox chkCheckUpdate 
         Caption         =   "检查最新版本"
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label lblUser 
         Caption         =   "人机对弈用户"
         Height          =   255
         Left            =   120
         TabIndex        =   25
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.Frame frmEngine 
      Caption         =   "引擎"
      Height          =   1695
      Left            =   3480
      TabIndex        =   15
      Top             =   120
      Width           =   3255
      Begin VB.CheckBox chkStatusBar 
         Caption         =   "输出到状态栏"
         Height          =   255
         Left            =   1680
         TabIndex        =   21
         Top             =   960
         Width           =   1455
      End
      Begin VB.CheckBox chkEngineTime 
         Caption         =   "显示思考时间"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   960
         Width           =   1455
      End
      Begin VB.CheckBox chkAllowResign 
         Caption         =   "允许提和认输"
         Height          =   255
         Left            =   1680
         TabIndex        =   19
         Top             =   600
         Width           =   1455
      End
      Begin VB.CheckBox chkAlwaysPonder 
         Caption         =   "启用后台思考"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   600
         Width           =   1455
      End
      Begin VB.ComboBox cmbEnginePlay 
         Height          =   300
         Left            =   1560
         Style           =   2  'Dropdown List
         TabIndex        =   23
         Top             =   1320
         Width           =   1215
      End
      Begin VB.CheckBox chkAutoFlip 
         Caption         =   "自动翻转棋盘"
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   240
         Width           =   1455
      End
      Begin VB.CheckBox chkEngineName 
         Caption         =   "显示引擎名称"
         Height          =   255
         Left            =   1680
         TabIndex        =   17
         Top             =   240
         Width           =   1455
      End
      Begin VB.Label lblEnginePlay 
         Caption         =   "新局的引擎状态"
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   1320
         Width           =   1335
      End
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   5280
      TabIndex        =   30
      Top             =   2880
      Width           =   975
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Height          =   375
      Left            =   3960
      TabIndex        =   29
      Top             =   2880
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
      Height          =   2415
      Left            =   120
      TabIndex        =   5
      Top             =   840
      Width           =   3255
      Begin VB.CheckBox chkEscapeDouble 
         Caption         =   "用两个Esc输入ANSI"
         Height          =   255
         Left            =   120
         TabIndex        =   31
         Top             =   1200
         Width           =   1935
      End
      Begin VB.CheckBox chkMonoBitmap 
         Caption         =   "图片棋盘的红子用白底红字表示"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   1920
         Width           =   2895
      End
      Begin VB.CheckBox chkAnsiText 
         Caption         =   "使用ANSI文本棋盘"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   1560
         Width           =   1815
      End
      Begin VB.TextBox txtJavaPath 
         Height          =   270
         Left            =   120
         TabIndex        =   12
         Top             =   840
         Width           =   3015
      End
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
         BuddyDispid     =   196633
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
         Width           =   345
      End
      Begin VB.CheckBox chkAutoPlay 
         Caption         =   "自动播放"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label lblJavaPath 
         Caption         =   "指定象棋 Java Applet 路径"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   600
         Width           =   2415
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
' OPTIONS.FRM - Source Code for XiangQi Wizard, Part VIII
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 2.2, Last Modified: Mar. 2006
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

Private nPlayIntv As Integer

Private Sub Form_Load()

cmbEnginePlay.Clear
cmbEnginePlay.AddItem "不启用引擎", 0
cmbEnginePlay.AddItem "引擎执红", 1
cmbEnginePlay.AddItem "引擎执黑", 2
cmbEnginePlay.AddItem "随机选择红黑", 3

optSmallGui.Value = Not Options_bLargeGui
optLargeGui.Value = Options_bLargeGui
chkSounds.Value = IIf(Options_bSounds, 1, 0)
chkAutoPlay.Value = IIf(Options_bAutoPlay, 1, 0)
nPlayIntv = Options_nPlayIntv
txtPlayIntv.Text = nPlayIntv
txtJavaPath.Text = Options_szJavaPath
chkEscapeDouble.Value = IIf(Options_bEscapeDouble, 1, 0)
chkAnsiText.Value = IIf(Options_bAnsiText, 1, 0)
chkMonoBitmap.Value = IIf(Options_bMonoBitmap, 1, 0)
chkAutoFlip.Value = IIf(Options_bAutoFlip, 1, 0)
chkEngineName.Value = IIf(Options_bEngineName, 1, 0)
chkAlwaysPonder.Value = IIf(Options_bAlwaysPonder, 1, 0)
chkAllowResign.Value = IIf(Options_bAllowResign, 1, 0)
chkEngineTime.Value = IIf(Options_bEngineTime, 1, 0)
chkStatusBar.Value = IIf(Options_bStatusBar, 1, 0)
cmbEnginePlay.ListIndex = Options_nEnginePlay
chkCheckUpdate.Value = IIf(Options_bCheckUpdate, 1, 0)
optAppUser.Value = Not Options_bEngineUser
optEngineUser.Value = Options_bEngineUser

End Sub

Private Sub txtPlayIntv_Change()

If nPlayIntv <> Str2Int(txtPlayIntv.Text) Then
    nPlayIntv = Str2Int(txtPlayIntv.Text, 1, 10)
    txtPlayIntv.Text = nPlayIntv
End If

End Sub

Private Sub btnConfirm_Click()

If Options_bLargeGui <> optLargeGui.Value Then
    MsgBox "显示模式已经更改，重新启动程序后才能生效。", vbInformation
End If
Options_bLargeGui = optLargeGui.Value
Options_bSounds = (chkSounds.Value = 1)
Options_nPlayIntv = nPlayIntv
Options_bAutoPlay = (chkAutoPlay.Value = 1)
Options_szJavaPath = txtJavaPath.Text
Options_bEscapeDouble = (chkEscapeDouble.Value = 1)
Options_bAnsiText = (chkAnsiText.Value = 1)
Options_bMonoBitmap = (chkMonoBitmap.Value = 1)
Options_bAutoFlip = (chkAutoFlip.Value = 1)
Options_bEngineName = (chkEngineName.Value = 1)
Options_bAlwaysPonder = (chkAlwaysPonder.Value = 1)
Options_bAllowResign = (chkAllowResign.Value = 1)
Options_bEngineTime = (chkEngineTime.Value = 1)
Options_bStatusBar = (chkStatusBar.Value = 1)
Options_nEnginePlay = cmbEnginePlay.ListIndex
Options_bCheckUpdate = (chkCheckUpdate.Value = 1)
Options_bEngineUser = optEngineUser.Value
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
