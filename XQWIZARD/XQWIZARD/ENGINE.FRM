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
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton btnLoadSlave 
      Height          =   375
      Left            =   6480
      TabIndex        =   26
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CheckBox chkSlaveRed 
      Caption         =   "副引擎执红"
      Height          =   255
      Left            =   6480
      TabIndex        =   25
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
      Begin VB.CommandButton btnResetPath 
         Caption         =   "重置"
         Height          =   255
         Left            =   5520
         TabIndex        =   16
         Top             =   600
         Width           =   615
      End
      Begin VB.CommandButton btnResetFile 
         Caption         =   "重置"
         Height          =   255
         Left            =   5520
         TabIndex        =   12
         Top             =   240
         Width           =   615
      End
      Begin VB.CommandButton btnSelectFile 
         Caption         =   "浏览"
         Height          =   255
         Left            =   4800
         TabIndex        =   11
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtBookFile 
         BackColor       =   &H8000000F&
         Height          =   270
         Left            =   1080
         Locked          =   -1  'True
         TabIndex        =   10
         Top             =   240
         Width           =   3615
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
         TabIndex        =   13
         Top             =   600
         Width           =   855
      End
      Begin VB.CommandButton btnSelectPath 
         Caption         =   "浏览"
         Height          =   255
         Left            =   4800
         TabIndex        =   15
         Top             =   600
         Width           =   615
      End
      Begin VB.TextBox txtEgtbPath 
         BackColor       =   &H8000000F&
         Height          =   270
         Left            =   1080
         Locked          =   -1  'True
         TabIndex        =   14
         Top             =   600
         Width           =   3615
      End
      Begin VB.ComboBox cmbThreads 
         Height          =   300
         ItemData        =   "ENGINE.frx":000C
         Left            =   2160
         List            =   "ENGINE.frx":000E
         Style           =   2  'Dropdown List
         TabIndex        =   20
         Top             =   1320
         Width           =   855
      End
      Begin VB.ComboBox cmbHash 
         Height          =   300
         ItemData        =   "ENGINE.frx":0010
         Left            =   600
         List            =   "ENGINE.frx":0012
         Style           =   2  'Dropdown List
         TabIndex        =   18
         Top             =   1320
         Width           =   855
      End
      Begin VB.ComboBox cmbStyle 
         Height          =   300
         ItemData        =   "ENGINE.frx":0014
         Left            =   5280
         List            =   "ENGINE.frx":0016
         Style           =   2  'Dropdown List
         TabIndex        =   24
         Top             =   1320
         Width           =   855
      End
      Begin VB.ComboBox cmbRandomness 
         Height          =   300
         ItemData        =   "ENGINE.frx":0018
         Left            =   3720
         List            =   "ENGINE.frx":001A
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Top             =   1320
         Width           =   855
      End
      Begin VB.Label lblHash 
         Caption         =   "内存"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblStyle 
         Caption         =   "风格"
         Height          =   255
         Left            =   4800
         TabIndex        =   23
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblRandomness 
         Caption         =   "随机"
         Height          =   255
         Left            =   3240
         TabIndex        =   21
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblThreads 
         Caption         =   "负荷"
         Height          =   255
         Left            =   1680
         TabIndex        =   19
         Top             =   1320
         Width           =   375
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
         BackColor       =   &H8000000F&
         Height          =   270
         Left            =   1200
         Locked          =   -1  'True
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
      TabIndex        =   28
      Top             =   3720
      Width           =   1215
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   6480
      TabIndex        =   27
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

Private EngineSet_bRunning As Boolean, EngineSet_bCommandSent As Boolean

Private Sub Form_Load()

Dim i As Integer
cmbHash.Clear
cmbHash.AddItem L("自动", "自動"), 0
cmbHash.AddItem "16MB", 1
cmbHash.AddItem "32MB", 2
cmbHash.AddItem "64MB", 3
cmbHash.AddItem "128MB", 4
cmbHash.AddItem "256MB", 5
cmbHash.AddItem "512MB", 6
cmbHash.AddItem "1024MB", 7
cmbThreads.Clear
cmbThreads.AddItem L("自动", "自動"), 0
cmbThreads.AddItem L("低负荷", "低負荷"), 1
cmbThreads.AddItem L("中负荷", "中負荷"), 2
cmbThreads.AddItem L("高负荷", "高負荷"), 3
cmbThreads.AddItem L("满负荷", "滿負荷"), 4
cmbThreads.AddItem L("2线程", "2線程"), 5
cmbThreads.AddItem L("4线程", "4線程"), 6
cmbThreads.AddItem L("8线程", "8線程"), 7
cmbThreads.AddItem L("16线程", "16線程"), 8
cmbThreads.AddItem L("32线程", "32線程"), 9
cmbRandomness.Clear
cmbRandomness.AddItem L("没有", "沒有"), 0
cmbRandomness.AddItem L("少量", "少量"), 1
cmbRandomness.AddItem L("适中", "適中"), 2
cmbRandomness.AddItem L("充分", "充分"), 3
cmbStyle.Clear
cmbStyle.AddItem L("保守", "保守"), 0
cmbStyle.AddItem L("均衡", "均衡"), 1
cmbStyle.AddItem L("冒进", "冒進"), 2

chkEngineLog.Value = IIf(Engine_bEngineLog, 1, 0)
txtLogFile.Text = Engine_szLogFile
chkUseBook.Value = IIf(Engine_bUseBook, 1, 0)
chkUseEgtb.Value = IIf(Engine_bUseEgtb, 1, 0)
txtBookFile.Text = Engine_szBookFiles
txtEgtbPath.Text = Engine_szEgtbPaths
cmbHash.ListIndex = Engine_nHash
cmbThreads.ListIndex = Engine_nThreads
cmbRandomness.ListIndex = Engine_nRandomness
cmbStyle.ListIndex = Engine_nStyle
If Engine_bSlaveRed Or Engine_bSlaveBlack Then
    chkSlaveRed.Value = IIf(Engine_bSlaveRed, 1, 0)
    btnLoadSlave.Caption = L("卸载副引擎", "卸載副引擎")
Else
    chkSlaveRed.Enabled = False
    btnLoadSlave.Caption = L("加载副引擎", "加載副引擎")
End If
SetTopMost hWnd

If Options_nLanguage = LANGUAGE_ZH_CN Then
    Exit Sub
End If
Font.Charset = 136
Font.Name = "細明體"
On Error Resume Next
For i = 0 To Controls.Count - 1
    Controls(i).Font = Font
Next
On Error GoTo 0
Caption = "引擎設置"
frmUcci.Caption = "調試UCCI引擎"
chkEngineLog.Caption = "記錄日誌"
btnSelectLog.Caption = "瀏覽"
btnOpenLog.Caption = "查看"
btnSend.Caption = "發送"
frmOptions.Caption = "選項"
chkUseBook.Caption = "開局庫"
btnSelectFile.Caption = "瀏覽"
btnResetFile.Caption = "重置"
chkUseEgtb.Caption = "殘局庫"
btnSelectPath.Caption = "瀏覽"
btnResetPath.Caption = "重置"
lblHash.Caption = "內存"
lblThreads.Caption = "負荷"
lblRandomness.Caption = "隨機"
lblStyle.Caption = "風格"
chkSlaveRed.Caption = "副引擎執紅"
btnConfirm.Caption = "確定"
btnCancel.Caption = "取消"

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
        szReceived = AllocString(lpStr)
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

Private Sub Form_Unload(Cancel As Integer)

EngineSet_bRunning = False

End Sub

Private Sub btnSelectLog_Click()

Dim szFileName As String
szFileName = FileDialog(L("选择日志文件", "選擇日誌文件"), L("HTM文件", "HTM文件"), "HTM", DefaultFileName)
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
ShellExecuteA 0, vbNullString, txtLogFile.Text, vbNullString, vbNullString, vbNormalFocus
Exit Sub

lnErrorOpen:
On Error GoTo 0
ErrorOpen txtLogFile.Text

End Sub

Private Sub btnSend_Click()

Dim sz As String, i As Integer, j As Integer
If txtCommand.Text = vbNullString Then
    Exit Sub
End If
If UCase(Left(txtCommand.Text, 4)) = "QUIT" Then
    MsgBox L("别开这种玩笑！", "別開這種玩笑！"), vbExclamation
    Exit Sub
End If
SendEngine txtCommand.Text
sz = txtCommand.Text
txtCommand.Text = ""
EngineSet_bCommandSent = True
If Left(sz, 9) <> "position " Then
    Exit Sub
End If
If CancelSave Then
    Exit Sub
End If
' 把"position fen ... moves ..."转换成棋谱
RestartGame , RESTART_DEBUG_UCCI
i = InStr(sz, " moves ")
If Mid(sz, 10, 4) = "fen " Then
    If i > 0 Then
        Game_szIrrevFen(0) = Mid(sz, 14, i - 14)
    Else
        Game_szIrrevFen(0) = Mid(sz, 14)
    End If
ElseIf Mid(sz, 10, 8) = "startpos" Then
    Game_szIrrevFen(0) = CCHESS_START_FEN
End If
CchessFen2Board Game_posIrrev(0), Game_szIrrevFen(0)
Game_sdCurr = Game_posIrrev(0).sdPlayer
j = InStr(Game_szIrrevFen(0), " - - 0 ")
If j > 0 Then
    Game_cntCurr = Str2Int(Mid(Game_szIrrevFen(0), j + 7), 1, 999)
Else
    Game_cntCurr = 1
End If
Game_sdStart = Game_sdCurr
Game_cntStart = Game_cntCurr
Game_sdMax = Game_sdStart
Game_bStartPos = False
If i > 0 Then
    i = i + 7
    Do While i < Len(sz)
        AddMove Coord2Move(Mid(sz, i))
        i = i + 5
    Loop
End If
BoardFlush
LabelFlush

End Sub

Private Sub btnSelectFile_Click()

Dim szFileName As String
szFileName = FileDialog(L("选择开局库", "選擇開局庫"), L("开局库文件", "開局庫文件"), "DAT")
If szFileName <> "" Then
    txtBookFile.Text = szFileName
End If

End Sub

Private Sub btnResetFile_Click()

chkUseBook.Value = vbChecked
txtBookFile.Text = ""

End Sub

Private Sub btnSelectPath_Click()

Dim szPathName As String
szPathName = BrowseForFolder(L("请选择残局库所在文件夹", "請選擇殘局庫所在文件夾"))
If szPathName <> "" Then
    txtEgtbPath.Text = szPathName
End If

End Sub

Private Sub btnResetPath_Click()

chkUseEgtb.Value = vbChecked
txtEgtbPath.Text = ""

End Sub

Private Sub chkSlaveRed_Click()

If Engine_bSlaveRed Or Engine_bSlaveBlack Then
    Engine_bSlaveRed = (chkSlaveRed.Value <> 0)
    Engine_bSlaveBlack = (chkSlaveRed.Value = 0)
End If

End Sub

Private Sub btnLoadSlave_Click()

OpenSlaveEngine
If Engine_bSlaveBlack Then
    chkSlaveRed.Enabled = True
    btnLoadSlave.Caption = L("卸载副引擎", "卸載副引擎")
Else
    chkSlaveRed.Enabled = False
    btnLoadSlave.Caption = L("加载副引擎", "加載副引擎")
End If
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
Engine_nRandomness = cmbRandomness.ListIndex
Engine_nStyle = cmbStyle.ListIndex
SetEngine
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
