VERSION 5.00
Begin VB.Form frmEngineSet 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "引擎设置"
   ClientHeight    =   4200
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7800
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "ENGINE.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4200
   ScaleWidth      =   7800
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnLoadSlave 
      Caption         =   "加载副引擎"
      Height          =   375
      Left            =   6480
      TabIndex        =   32
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CheckBox chkSlaveRed 
      Caption         =   "副引擎执红"
      Height          =   255
      Left            =   6480
      TabIndex        =   31
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Frame frmOptions 
      Caption         =   "选项"
      Height          =   1695
      Left            =   120
      TabIndex        =   8
      Top             =   2400
      Width           =   6255
      Begin VB.CommandButton btnSelectFile 
         Caption         =   "浏览"
         Height          =   255
         Left            =   5520
         TabIndex        =   11
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtBookFile 
         Height          =   270
         Left            =   1080
         TabIndex        =   10
         Top             =   240
         Width           =   4335
      End
      Begin VB.CheckBox chkUseBook 
         Caption         =   "开局库"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   855
      End
      Begin VB.CheckBox chkUseEgtb 
         Caption         =   "残局库"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   600
         Width           =   855
      End
      Begin VB.CommandButton btnSelectPath 
         Caption         =   "浏览"
         Height          =   255
         Left            =   5520
         TabIndex        =   14
         Top             =   600
         Width           =   615
      End
      Begin VB.TextBox txtEgtbPath 
         Height          =   270
         Left            =   1080
         TabIndex        =   13
         Top             =   600
         Width           =   4335
      End
      Begin VB.ComboBox cmbPruning 
         Height          =   300
         ItemData        =   "ENGINE.frx":000C
         Left            =   4200
         List            =   "ENGINE.frx":000E
         Style           =   2  'Dropdown List
         TabIndex        =   24
         Top             =   960
         Width           =   615
      End
      Begin VB.ComboBox cmbKnowledge 
         Height          =   300
         ItemData        =   "ENGINE.frx":0010
         Left            =   4200
         List            =   "ENGINE.frx":0012
         Style           =   2  'Dropdown List
         TabIndex        =   26
         Top             =   1320
         Width           =   615
      End
      Begin VB.ComboBox cmbRepetition 
         Height          =   300
         ItemData        =   "ENGINE.frx":0014
         Left            =   2640
         List            =   "ENGINE.frx":0016
         Style           =   2  'Dropdown List
         TabIndex        =   20
         Top             =   960
         Width           =   855
      End
      Begin VB.ComboBox cmbDrawMoves 
         Height          =   300
         ItemData        =   "ENGINE.frx":0018
         Left            =   2640
         List            =   "ENGINE.frx":001A
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Top             =   1320
         Width           =   855
      End
      Begin VB.ComboBox cmbThreads 
         Height          =   300
         ItemData        =   "ENGINE.frx":001C
         Left            =   720
         List            =   "ENGINE.frx":001E
         Style           =   2  'Dropdown List
         TabIndex        =   18
         Top             =   1320
         Width           =   855
      End
      Begin VB.ComboBox cmbHash 
         Height          =   300
         ItemData        =   "ENGINE.frx":0020
         Left            =   720
         List            =   "ENGINE.frx":0022
         Style           =   2  'Dropdown List
         TabIndex        =   16
         Top             =   960
         Width           =   855
      End
      Begin VB.ComboBox cmbStyle 
         Height          =   300
         ItemData        =   "ENGINE.frx":0024
         Left            =   5520
         List            =   "ENGINE.frx":0026
         Style           =   2  'Dropdown List
         TabIndex        =   30
         Top             =   1320
         Width           =   615
      End
      Begin VB.ComboBox cmbSelectivity 
         Height          =   300
         ItemData        =   "ENGINE.frx":0028
         Left            =   5520
         List            =   "ENGINE.frx":002A
         Style           =   2  'Dropdown List
         TabIndex        =   28
         Top             =   960
         Width           =   615
      End
      Begin VB.Label lblKnowledge 
         Caption         =   "知识"
         Height          =   255
         Left            =   3720
         TabIndex        =   25
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblDrawMoves 
         Caption         =   "自然限着"
         Height          =   255
         Left            =   1800
         TabIndex        =   21
         Top             =   1320
         Width           =   735
      End
      Begin VB.Label lblPruning 
         Caption         =   "裁剪"
         Height          =   255
         Left            =   3720
         TabIndex        =   23
         Top             =   960
         Width           =   375
      End
      Begin VB.Label lblRepetition 
         Caption         =   "重复判定"
         Height          =   255
         Left            =   1800
         TabIndex        =   19
         Top             =   960
         Width           =   735
      End
      Begin VB.Label lblHash 
         Caption         =   "置换表"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   960
         Width           =   615
      End
      Begin VB.Label lblStyle 
         Caption         =   "风格"
         Height          =   255
         Left            =   5040
         TabIndex        =   29
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblSelectivity 
         Caption         =   "随机"
         Height          =   255
         Left            =   5040
         TabIndex        =   27
         Top             =   960
         Width           =   375
      End
      Begin VB.Label lblThreads 
         Caption         =   "负荷"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   1320
         Width           =   615
      End
   End
   Begin VB.Frame frmUcci 
      Caption         =   "调试UCCI引擎"
      Height          =   2175
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7575
      Begin VB.TextBox txtLogFile 
         Height          =   270
         Left            =   1200
         TabIndex        =   2
         Top             =   240
         Width           =   4815
      End
      Begin VB.CommandButton btnOpenLog 
         Caption         =   "查看"
         Height          =   255
         Left            =   6840
         TabIndex        =   4
         Top             =   240
         Width           =   615
      End
      Begin VB.CheckBox chkEngineLog 
         Caption         =   "记录日志"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton btnSelectLog 
         Caption         =   "浏览"
         Height          =   255
         Left            =   6120
         TabIndex        =   3
         Top             =   240
         Width           =   615
      End
      Begin VB.ListBox lstReceived 
         Height          =   1140
         Left            =   120
         TabIndex        =   7
         Top             =   960
         Width           =   7335
      End
      Begin VB.CommandButton btnSend 
         Caption         =   "发送"
         Height          =   255
         Left            =   6840
         TabIndex        =   6
         Top             =   600
         Width           =   615
      End
      Begin VB.TextBox txtCommand 
         Height          =   270
         Left            =   120
         TabIndex        =   5
         Top             =   600
         Width           =   6615
      End
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   6480
      TabIndex        =   34
      Top             =   3720
      Width           =   1215
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Height          =   375
      Left            =   6480
      TabIndex        =   33
      Top             =   3240
      Width           =   1215
   End
End
Attribute VB_Name = "frmEngineSet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ENGINE.FRM - Source Code for XiangQi Wizard, Part V
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 2.1, Last Modified: Mar. 2006
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

Private EngineSet_bRunning As Boolean, EngineSet_bCommandSent As Boolean

Private Sub Form_Load()

cmbHash.Clear
cmbHash.AddItem "自动", 0
cmbHash.AddItem "16MB", 1
cmbHash.AddItem "32MB", 2
cmbHash.AddItem "64MB", 3
cmbHash.AddItem "128MB", 4
cmbHash.AddItem "256MB", 5
cmbHash.AddItem "512MB", 6
cmbHash.AddItem "1024MB", 7
cmbThreads.Clear
cmbThreads.AddItem "自动", 0
cmbThreads.AddItem "低负荷", 1
cmbThreads.AddItem "中负荷", 2
cmbThreads.AddItem "高负荷", 3
cmbThreads.AddItem "满负荷", 4
cmbThreads.AddItem "2线程", 5
cmbThreads.AddItem "4线程", 6
cmbThreads.AddItem "8线程", 7
cmbThreads.AddItem "16线程", 8
cmbThreads.AddItem "32线程", 9
cmbDrawMoves.Clear
cmbDrawMoves.AddItem "50回合", 0
cmbDrawMoves.AddItem "60回合", 1
cmbDrawMoves.AddItem "70回合", 2
cmbDrawMoves.AddItem "80回合", 3
cmbDrawMoves.AddItem "90回合", 4
cmbDrawMoves.AddItem "100回合", 5
cmbRepetition.Clear
cmbRepetition.AddItem "不变作和", 0
cmbRepetition.AddItem "禁止长将", 1
cmbRepetition.AddItem "亚洲规则", 2
cmbRepetition.AddItem "中国规则", 3
cmbPruning.Clear
cmbPruning.AddItem "没有", 0
cmbPruning.AddItem "少量", 1
cmbPruning.AddItem "适中", 2
cmbPruning.AddItem "充分", 3
cmbKnowledge.Clear
cmbKnowledge.AddItem "没有", 0
cmbKnowledge.AddItem "少量", 1
cmbKnowledge.AddItem "适中", 2
cmbKnowledge.AddItem "充分", 3
cmbSelectivity.Clear
cmbSelectivity.AddItem "没有", 0
cmbSelectivity.AddItem "少量", 1
cmbSelectivity.AddItem "适中", 2
cmbSelectivity.AddItem "充分", 3
cmbStyle.Clear
cmbStyle.AddItem "保守", 0
cmbStyle.AddItem "均衡", 1
cmbStyle.AddItem "冒进", 2

chkEngineLog.Value = IIf(Engine_bEngineLog, 1, 0)
txtLogFile.Text = Engine_szLogFile
chkUseBook.Value = IIf(Engine_bUseBook, 1, 0)
chkUseEgtb.Value = IIf(Engine_bUseEgtb, 1, 0)
txtBookFile.Text = Engine_szBookFiles
txtEgtbPath.Text = Engine_szEgtbPaths
cmbHash.ListIndex = Engine_nHash
cmbThreads.ListIndex = Engine_nThreads
cmbDrawMoves.ListIndex = Engine_nDrawMoves
cmbRepetition.ListIndex = Engine_nRepetition
cmbPruning.ListIndex = Engine_nPruning
cmbKnowledge.ListIndex = Engine_nKnowledge
cmbSelectivity.ListIndex = Engine_nSelectivity
cmbStyle.ListIndex = Engine_nStyle
chkSlaveRed.Value = IIf(Engine_bSlaveRed, 1, 0)
chkSlaveRed.Enabled = (Engine_bSlaveRed Or Engine_bSlaveBlack)

End Sub

Private Sub Form_Activate()

Dim lpStr As Long, szReceived As String
EngineSet_bRunning = True
EngineSet_bCommandSent = False
Do While EngineSet_bRunning
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        DoEvents
        Sleep 1
    Else
        szReceived = MkBStr(lpStr)
        ReceiveEngineLog szReceived
        frmEngineSet.lstReceived.AddItem szReceived
        frmEngineSet.lstReceived.ListIndex = frmEngineSet.lstReceived.ListCount - 1
    End If
Loop
If EngineSet_bCommandSent Then
    Engine_nStatus = BUSY_WAIT
    StopEngine
End If

End Sub

Private Sub Form_UnLoad(Cancel As Integer)

EngineSet_bRunning = False

End Sub

Private Sub btnSelectLog_Click()

Dim szFileName As String
szFileName = FileDialog("选择日志文件", "HTM文件", SHOW_SAVE, "HTM")
If szFileName <> "" Then
    txtLogFile.Text = szFileName
End If

End Sub


Private Sub btnOpenLog_Click()

Dim nLogFileNo As Integer
nLogFileNo = FreeFile
On Error GoTo lnErrorOpen
Open txtLogFile.Text For Append As #nLogFileNo
On Error GoTo 0
Close #nLogFileNo
ShellExecuteA 0, vbNullString, txtLogFile.Text, vbNullString, vbNullString, SW_SHOWNORMAL
Exit Sub

lnErrorOpen:
On Error GoTo 0
MsgBox "无法打开文件 " + txtLogFile.Text, vbExclamation

End Sub

Private Sub btnSend_Click()

If txtCommand.Text <> vbNullString Then
    If txtCommand.Text = "quit" Then
        MsgBox "别开这种玩笑！", vbExclamation
    Else
        SendEngine txtCommand.Text
        txtCommand.Text = ""
        EngineSet_bCommandSent = True
    End If
End If

End Sub

Private Sub btnSelectFile_Click()

Dim szFileName As String
szFileName = FileDialog("选择开局库", "开局库文件", , "DAT")
If szFileName <> "" Then
    txtBookFile.Text = szFileName
End If

End Sub

Private Sub btnSelectPath_Click()

Dim szPathName As String
szPathName = BrowseForFolder("请选择残局库所在文件夹")
If szPathName <> "" Then
    txtEgtbPath.Text = szPathName
End If

End Sub

Private Sub chkSlaveRed_Click()

Engine_bSlaveRed = (chkSlaveRed.Value <> 0)
Engine_bSlaveBlack = (chkSlaveRed.Value = 0)

End Sub

Private Sub btnLoadSlave_Click()

OpenSlaveEngine
chkSlaveRed.Enabled = Engine_bSlaveBlack
chkSlaveRed.Value = 0

End Sub

Private Sub btnConfirm_Click()

Dim i As Integer
Engine_bEngineLog = (chkEngineLog.Value = 1)
Engine_szLogFile = txtLogFile.Text
Engine_bUseBook = (chkUseBook.Value = 1)
Engine_bUseEgtb = (chkUseEgtb.Value = 1)
Engine_szBookFiles = txtBookFile.Text
Engine_szEgtbPaths = txtEgtbPath.Text
Engine_nHash = cmbHash.ListIndex
Engine_nThreads = cmbThreads.ListIndex
Engine_nDrawMoves = cmbDrawMoves.ListIndex
Engine_nRepetition = cmbRepetition.ListIndex
Engine_nPruning = cmbPruning.ListIndex
Engine_nKnowledge = cmbKnowledge.ListIndex
Engine_nSelectivity = cmbSelectivity.ListIndex
Engine_nStyle = cmbStyle.ListIndex
SetEngine
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
