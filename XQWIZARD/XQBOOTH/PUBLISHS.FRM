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
   Icon            =   "PUBLISHS.frx":0000
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
      TabIndex        =   18
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
         MouseIcon       =   "PUBLISHS.frx":000C
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
      TabIndex        =   20
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
      Begin VB.ComboBox cmbLocation 
         Height          =   300
         Left            =   960
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   600
         Width           =   1215
      End
      Begin VB.ComboBox cmbFormat 
         Height          =   300
         Left            =   3120
         Style           =   2  'Dropdown List
         TabIndex        =   17
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
         MouseIcon       =   "PUBLISHS.frx":015E
         MousePointer    =   99  'Custom
         TabIndex        =   16
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
         MouseIcon       =   "PUBLISHS.frx":02B0
         MousePointer    =   99  'Custom
         TabIndex        =   14
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

' 图片类型
optSize(Publish_nSize).Value = True

' 发布格式
cmbFormat.Clear
cmbFormat.AddItem "纯文本", 0
cmbFormat.AddItem "ANSI文本", 1
cmbFormat.AddItem "UBB文本", 2
cmbFormat.AddItem "HTML文本", 3
cmbFormat.AddItem "HTML内容", 4
cmbFormat.ListIndex = Publish_nFormat

' 注意：先有发布格式，再有发布站点！
' 发布站点
cmbLocation.Clear
cmbLocation.AddItem "中国象棋大师网", 0
cmbLocation.AddItem "百度贴吧象棋吧", 1
cmbLocation.AddItem "百度知道", 2
cmbLocation.AddItem "新浪博客", 3
cmbLocation.AddItem "QQ空间", 4
cmbLocation.AddItem "(其他)", 5
cmbLocation.ListIndex = Publish_nLocation

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
txtBoardUrl.Text = GetBoardUrl(App_szEndgames(Gui_nCurr))

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
txtBoardUrl.Text = GetBoardUrl(App_szEndgames(Gui_nCurr))

End Sub

Private Sub btnHelp_Click()

ShellExecuteA 0, vbNullString, _
        "http://www.elephantbase.net/xqwizard/publish.htm", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnPublish_Click()

Dim szCopy As String, szBr As String, szFlashVars As String
Dim bReturned As Boolean, cnt As Integer, sd As Integer, i As Integer
Dim pos As PositionStruct

szBr = IIf(Publish_nFormat >= PUB_FORMAT_HTML, "<br>" + vbCrLf, vbCrLf)
szCopy = "象棋巫师魔法学校第" + Str(Gui_nCurr + 1) + " 关怎么过？" + szBr
' 发布当前局面，依次显示文本棋盘/图片棋盘，外加FEN链接
Select Case Publish_nFormat
Case PUB_FORMAT_TEXT, PUB_FORMAT_ANSI
    CchessFen2Board pos, App_szEndgames(Gui_nCurr)
    szCopy = szCopy + GetBoardText(pos)
    szCopy = szCopy + "# " + App_szEndgames(Gui_nCurr) + szBr ' 这里还是要显示FEN，以免下面的链接无法打开给用户造成麻烦
    szCopy = szCopy + "# 在浏览器中打开下面的链接，就能直接用象棋巫师打开盘面" + szBr
    szCopy = szCopy + "# http://pub.elephantbase.net/fen.php?fen=" + UrlEncode(App_szEndgames(Gui_nCurr)) + szBr
Case PUB_FORMAT_UBB
    szCopy = szCopy + "[img]" + GetBoardUrl(App_szEndgames(Gui_nCurr)) + "[/img]" + szBr
    szCopy = szCopy + "# [url=http://pub.elephantbase.net/fen.php?fen=" + _
            UrlEncode(App_szEndgames(Gui_nCurr)) + "]用象棋巫师打开盘面[/url]" + szBr
Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
    szCopy = szCopy + "<img src=""" + GetBoardUrl(App_szEndgames(Gui_nCurr)) + """>" + szBr
    szCopy = szCopy + "# <a href=""http://pub.elephantbase.net/fen.php?fen=" + _
            UrlEncode(App_szEndgames(Gui_nCurr)) + """>用象棋巫师打开盘面</a>" + szBr
End Select
' 给象棋巫师做个广告
Select Case Publish_nFormat
Case PUB_FORMAT_TEXT, PUB_FORMAT_ANSI
    szCopy = szCopy + "# 象棋巫师是一款功能超强的象棋教学、电脑对弈和棋谱编辑软件，欢迎大家使用" + szBr
    szCopy = szCopy + "# http://pub.elephantbase.net/xqwizard.php" + szBr
    szCopy = szCopy + "# 欢迎访问象棋百科全书网 http://www.elephantbase.net/"
Case PUB_FORMAT_UBB
    szCopy = szCopy + "# [url=http://pub.elephantbase.net/xqwizard.php]象棋巫师[/url]是一款功能超强的象棋教学、电脑对弈和棋谱编辑软件，欢迎大家使用" + szBr
    szCopy = szCopy + "[url=http://pub.elephantbase.net/][img]http://pub.elephantbase.net/index.gif[/img][/url]"
Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
    szCopy = szCopy + "# <a href=""http://pub.elephantbase.net/xqwizard.php"" target=""_blank"">象棋巫师</a>是一款功能超强的象棋教学、电脑对弈和棋谱编辑软件，欢迎大家使用" + szBr
    szCopy = szCopy + "<a href=""http://pub.elephantbase.net/"" target=""_blank""><img src=""http://pub.elephantbase.net/index.gif"" border=""0""></a>"
End Select
' 把szCopy的内容复制到剪贴板
If Publish_nFormat = PUB_FORMAT_WEB Then
    With frmHide.web.Document
        .body.innerHtml = szCopy
        .execCommand "SelectAll"
        .execCommand "Copy"
        .body.innerHtml = ""
    End With
Else
    Clipboard.Clear
    Clipboard.SetText szCopy
End If
' 打开要发布的网页
Select Case Publish_nLocation
Case PUB_LOCATION_TIEBA
    ShellExecuteA 0, vbNullString, "http://tieba.baidu.com/f?kw=%CF%F3%C6%E5#sub", vbNullString, vbNullString, SW_SHOWNORMAL
Case PUB_LOCATION_ZGXQDS
    ShellExecuteA 0, vbNullString, "http://www.zgxqds.com/bbs/titlepost.asp", vbNullString, vbNullString, SW_SHOWNORMAL
Case PUB_LOCATION_ZHIDAO
    ShellExecuteA 0, vbNullString, "http://zhidao.baidu.com/", vbNullString, vbNullString, SW_SHOWNORMAL
Case PUB_LOCATION_SINA
    ShellExecuteA 0, vbNullString, "http://control.blog.sina.com.cn/admin/article/article_add.php?index", vbNullString, vbNullString, SW_SHOWNORMAL
Case PUB_LOCATION_QZONE
    ShellExecuteA 0, vbNullString, "http://user.qzone.qq.com/", vbNullString, vbNullString, SW_SHOWNORMAL
End Select
MsgBox "棋谱已复制到剪贴板，请找到发表帖子的内容框，按 Ctrl-V 键粘贴。", vbInformation

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub

Private Sub txtBoardUrl_Click()

txtBoardUrl.SelStart = 0
txtBoardUrl.SelLength = Len(txtBoardUrl)

End Sub

Private Sub cmbFormat_Click()

Publish_nFormat = cmbFormat.ListIndex

End Sub

Private Sub cmbLocation_Click()

Publish_nLocation = cmbLocation.ListIndex
Select Case Publish_nLocation
Case PUB_LOCATION_TIEBA
    Publish_nFormat = PUB_FORMAT_TEXT
Case PUB_LOCATION_ZGXQDS
    Publish_nFormat = PUB_FORMAT_UBB
Case PUB_LOCATION_ZHIDAO
    Publish_nFormat = PUB_FORMAT_TEXT
Case PUB_LOCATION_SINA
    Publish_nFormat = PUB_FORMAT_WEB
Case PUB_LOCATION_QZONE
    Publish_nFormat = PUB_FORMAT_WEB
End Select
cmbFormat.ListIndex = Publish_nFormat

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

Private Function GetBoardUrl(ByVal szFen As String) As String

GetBoardUrl = "http://pub.elephantbase.net/board.php?&fen=" + _
        UrlEncode(szFen) + "&size=" + LTrim(Str(Publish_nSize)) + "&board=" + _
        LTrim(Str(cmbBoard.ListIndex)) + "&pieces=" + LTrim(Str(cmbPieces.ListIndex))

End Function

Private Function GetBoardText(ByRef pos As PositionStruct) As String

Dim sz As String
sz = AllocString(CchessBoardText(pos, IIf(Publish_nFormat = PUB_FORMAT_ANSI, CCHESS_ANSI_TEXT, 0)))
' 在百度贴吧里，要把所有双空格全部替换"‐"，这样显示出来可能会美观些
' If Publish_nLocation = PUB_LOCATION_TIEBA Or Publish_nLocation = PUB_LOCATION_ZHIDAO Then
If Publish_nFormat = PUB_FORMAT_ANSI Then
    sz = AllocString(CchessBoardText(pos, CCHESS_ANSI_TEXT))
Else
    sz = AllocString(CchessBoardText(pos))
    sz = Replace(sz, "  ", "‐")
    sz = Replace(sz, "--", "—")
End If
GetBoardText = sz

End Function
