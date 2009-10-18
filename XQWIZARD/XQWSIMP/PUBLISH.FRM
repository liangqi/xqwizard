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
      TabIndex        =   21
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CommandButton btnPublish 
      Caption         =   "发布"
      Default         =   -1  'True
      Height          =   375
      Left            =   1800
      TabIndex        =   22
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Frame frmBoard 
      Caption         =   "棋盘"
      Height          =   1335
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4455
      Begin VB.ComboBox cmbPieces 
         Height          =   300
         Left            =   3120
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   600
         Width           =   1215
      End
      Begin VB.ComboBox cmbBoard 
         Height          =   300
         Left            =   960
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   600
         Width           =   1215
      End
      Begin VB.OptionButton optSize 
         Caption         =   "简单"
         Height          =   255
         Index           =   0
         Left            =   960
         TabIndex        =   2
         Top             =   240
         Width           =   855
      End
      Begin VB.TextBox txtBoardUrl 
         BackColor       =   &H8000000F&
         Height          =   270
         Left            =   960
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "按Ctrl-C复制到剪贴板"
         Top             =   960
         Width           =   2895
      End
      Begin VB.OptionButton optSize 
         Caption         =   "最大"
         Height          =   255
         Index           =   3
         Left            =   3480
         TabIndex        =   5
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton optSize 
         Caption         =   "适中"
         Height          =   255
         Index           =   2
         Left            =   2640
         TabIndex        =   4
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton optSize 
         Caption         =   "印刷"
         Height          =   255
         Index           =   1
         Left            =   1800
         TabIndex        =   3
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblBoardUrl 
         Caption         =   "图片地址"
         Height          =   255
         Left            =   120
         TabIndex        =   10
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
         MousePointer    =   99  'Custom
         TabIndex        =   12
         Top             =   960
         Width           =   375
      End
      Begin VB.Label Label1 
         Caption         =   "棋子样式"
         Height          =   255
         Left            =   2280
         TabIndex        =   8
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblBoard 
         Caption         =   "棋盘样式"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblSize 
         Caption         =   "图片类型"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "关闭"
      Height          =   375
      Left            =   3240
      TabIndex        =   23
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Frame frmFormat 
      Caption         =   "发布"
      Height          =   1095
      Left            =   120
      TabIndex        =   13
      Top             =   1560
      Width           =   4455
      Begin VB.OptionButton optContent 
         Caption         =   "当前局面"
         Height          =   255
         Index           =   1
         Left            =   2040
         TabIndex        =   16
         Top             =   240
         Width           =   1095
      End
      Begin VB.OptionButton optContent 
         Caption         =   "整个棋局"
         Height          =   255
         Index           =   0
         Left            =   960
         TabIndex        =   15
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
         TabIndex        =   20
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label lblFormat 
         Caption         =   "发布格式"
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
         Left            =   2280
         MouseIcon       =   "PUBLISH.frx":015E
         MousePointer    =   99  'Custom
         TabIndex        =   19
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblLocation 
         Caption         =   "发布站点"
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
         Left            =   120
         MouseIcon       =   "PUBLISH.frx":02B0
         MousePointer    =   99  'Custom
         TabIndex        =   17
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblContent 
         Caption         =   "发布内容"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   240
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

Private Declare Sub compress Lib "ZLIB.DLL" (ByVal lpDst As Long, _
        ByRef dwDstLen As Long, ByVal lpSrc As Long, ByVal dwSrcLen As Long)

Private Sub Form_Load()

' 图片类型
optSize(Publish_nSize).Value = True

' 发布内容
optContent(IIf(Publish_bContent, 1, 0)).Value = True

' 发布站点
cmbLocation.Clear
cmbLocation.AddItem "百度贴吧象棋吧", 0
cmbLocation.AddItem "中国象棋大师网", 1
cmbLocation.AddItem "百度知道", 2
cmbLocation.AddItem "新浪博客", 3
cmbLocation.AddItem "QQ空间", 4
cmbLocation.AddItem "(其他)", 5
cmbLocation.ListIndex = Publish_nLocation

' 发布格式
cmbFormat.Clear
cmbFormat.AddItem "纯文本", 0
cmbFormat.AddItem "ANSI文本", 1
cmbFormat.AddItem "UBB文本", 2
cmbFormat.AddItem "HTML文本", 3
cmbFormat.AddItem "HTML内容", 4
cmbFormat.ListIndex = Publish_nFormat

SetTopMost hWnd

End Sub

Private Sub Form_Unload(Cancel As Integer)

' 棋盘
Select Case Publish_nSize
Case PUB_SIZE_MINI, PUB_SIZE_PRINT
    Publish_bTrad = (cmbPieces.ListIndex = 1)
Case PUB_SIZE_SMALL
    Publish_nBoardS = cmbBoard.ListIndex
    Publish_nPiecesS = cmbPieces.ListIndex
Case PUB_SIZE_LARGE
    Publish_nBoardL = cmbBoard.ListIndex
    Publish_nPiecesL = cmbPieces.ListIndex
End Select
' 发布
Publish_bContent = optContent(1).Value
Publish_nLocation = cmbLocation.ListIndex
Publish_nFormat = cmbFormat.ListIndex

End Sub

Private Sub optSize_Click(nIndex As Integer)

Publish_nSize = nIndex
cmbBoard.Clear
cmbPieces.Clear
Select Case nIndex
Case PUB_SIZE_MINI, PUB_SIZE_PRINT
    cmbBoard.AddItem "默认", 0
    cmbBoard.ListIndex = 0
    cmbPieces.AddItem "简体", 0
    cmbPieces.AddItem "繁体", 1
    cmbPieces.ListIndex = IIf(Publish_bTrad, 1, 0)
Case PUB_SIZE_SMALL
    cmbBoard.AddItem "栎木", 0
    cmbBoard.AddItem "绿色大理石", 1
    cmbBoard.AddItem "白色大理石", 2
    cmbBoard.AddItem "再生纸", 3
    cmbBoard.AddItem "画布", 4
    cmbBoard.AddItem "水滴", 5
    cmbBoard.AddItem "蓝天白云石", 6
    cmbBoard.AddItem "象棋演播室", 7
    cmbBoard.AddItem "弈天棋缘", 8
    cmbBoard.AddItem "梦入神机", 9
    cmbBoard.AddItem "纵马奔流", 10
    cmbBoard.AddItem "浅红象棋", 11
    cmbBoard.ListIndex = Publish_nBoardS
    cmbPieces.AddItem "木刻", 0
    cmbPieces.AddItem "精致", 1
    cmbPieces.AddItem "光泽", 2
    cmbPieces.AddItem "象棋演播室", 3
    cmbPieces.AddItem "弈天棋缘", 4
    cmbPieces.AddItem "梦入神机", 5
    cmbPieces.AddItem "纵马奔流", 6
    cmbPieces.ListIndex = Publish_nPiecesS
Case PUB_SIZE_LARGE
    cmbBoard.AddItem "栎木", 0
    cmbBoard.AddItem "绿色大理石", 1
    cmbBoard.AddItem "白色大理石", 2
    cmbBoard.AddItem "再生纸", 3
    cmbBoard.AddItem "画布", 4
    cmbBoard.AddItem "水滴", 5
    cmbBoard.AddItem "浅红象棋", 6
    cmbBoard.ListIndex = Publish_nBoardL
    cmbPieces.AddItem "木刻", 0
    cmbPieces.AddItem "精致", 1
    cmbPieces.AddItem "光泽", 2
    cmbPieces.ListIndex = Publish_nPiecesL
End Select

End Sub

Private Sub cmbBoard_Click()

Select Case Publish_nSize
Case PUB_SIZE_SMALL
    Publish_nBoardS = cmbBoard.ListIndex
Case PUB_SIZE_LARGE
    Publish_nBoardL = cmbBoard.ListIndex
End Select
SetBoardUrl

End Sub

Private Sub cmbPieces_Click()

Select Case Publish_nSize
Case PUB_SIZE_MINI, PUB_SIZE_PRINT
    Publish_bTrad = (cmbPieces.ListIndex = 1)
Case PUB_SIZE_SMALL
    Publish_nPiecesS = cmbPieces.ListIndex
Case PUB_SIZE_LARGE
    Publish_nPiecesL = cmbPieces.ListIndex
End Select
SetBoardUrl

End Sub

Private Sub optContent_Click(Index As Integer)

Publish_bContent = optContent(1).Value

End Sub

Private Sub btnHelp_Click()

ShellExecuteA 0, vbNullString, _
        "http://www.elephantbase.net/xqwizard/publish.htm", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnPublish_Click()

Dim szFen As String, szB64 As String, nFileNo As Integer, nSrcLen As Long, nDstLen As Long
Dim ucSrc(0 To 65536) As Byte, ucDst(0 To 65536) As Byte, ucB64(0 To 131071) As Byte

szFen = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev)))
If Publish_bContent Then
    Clipboard.Clear
    Clipboard.SetText "http://users.elephantbase.net/publish/fen.php?fen=" + UrlEncode(szFen)
    MsgBox "局面下载链接已复制到剪贴板。", vbInformation
Else
    ' 生成PGN文件下载链接，步骤是：
    ' 1. 生成PGN文件
    WriteFile WRITE_TEMP_FILE
    ' 2. 将文件读入内存
    nFileNo = FreeFile
    On Error GoTo lnErrorOpen
    Open App_szPath + TEMP_FILE_NAME For Binary Access Read As #nFileNo
    On Error GoTo 0
    nSrcLen = LOF(nFileNo)
    If nSrcLen > 65536 Then
        Close #nFileNo
        MsgBox "文件太大，无法生成下载链接。", vbExclamation
        Exit Sub
    End If
    Get #nFileNo, , ucSrc()
    Close #nFileNo
    ' 3. 用ZLib压缩，用Base64编码
    nDstLen = 65536
    compress VarPtr(ucDst(0)), nDstLen, VarPtr(ucSrc(0)), nSrcLen
    Base64Enc VarPtr(ucB64(0)), VarPtr(ucDst(0)), nDstLen, 0
    szB64 = AllocString(VarPtr(ucB64(0)))
    ' 4. 复制到剪贴板
    Clipboard.Clear
    Clipboard.SetText "http://users.elephantbase.net/publish/pgn.htm?content=" + UrlEncode(szB64)
    MsgBox "棋局下载链接已复制到剪贴板。", vbInformation
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "无法打开文件 " + App_szPath + TEMP_FILE_NAME, vbExclamation

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub

Private Sub txtBoardUrl_Click()

txtBoardUrl.SelStart = 0
txtBoardUrl.SelLength = Len(txtBoardUrl)

End Sub

Private Sub lblViewBoard_Click()

ShellExecuteA 0, vbNullString, txtBoardUrl.Text, vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub lblLocation_Click()

ShellExecuteA 0, vbNullString, _
        "http://www.elephantbase.net/xqwizard/publish.htm#location", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub lblFormat_Click()

ShellExecuteA 0, vbNullString, _
        "http://www.elephantbase.net/xqwizard/publish.htm#format", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub SetBoardUrl()

Dim szFen As String
szFen = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev)))
txtBoardUrl.Text = "http://users.elephantbase.net/publish/board.php?&fen=" + _
        UrlEncode(szFen) + "&size=" + LTrim(Str(Publish_nSize)) + "&board=" + _
        LTrim(Str(cmbBoard.ListIndex)) + "&pieces=" + LTrim(Str(cmbPieces.ListIndex))

End Sub
