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
         MouseIcon       =   "PUBLISH.frx":000C
         MousePointer    =   99  'Custom
         TabIndex        =   12
         Top             =   960
         Width           =   375
      End
      Begin VB.Label lblPieces 
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
         MouseIcon       =   "PUBLISH.frx":015E
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
         MouseIcon       =   "PUBLISH.frx":02B0
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
' PUBLISH.FRM - Source Code for XiangQi Witchcraft School, Part VI
'
' XiangQi Witchcraft School - a Chinese Chess Endgame Challenge Game
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

Private Sub Form_Load()

Dim i As Integer
' 图片类型
optSize(Publish_nSize).Value = True

' 发布格式
cmbFormat.Clear
cmbFormat.AddItem L("纯文本", "純文本"), 0
cmbFormat.AddItem L("ANSI文本", "ANSI文本"), 1
cmbFormat.AddItem L("UBB文本", "UBB文本"), 2
cmbFormat.AddItem L("HTML文本", "HTML文本"), 3
cmbFormat.AddItem L("HTML内容", "HTML內容"), 4
cmbFormat.ListIndex = Publish_nFormat

' 注意：先有发布格式，再有发布站点！
' 发布站点
cmbLocation.Clear
cmbLocation.AddItem L("百度知道", "百度知道"), 0
cmbLocation.AddItem L("百度贴吧象棋吧", "百度貼吧象棋吧"), 1
cmbLocation.AddItem L("象棋家园", "象棋家園"), 2
cmbLocation.AddItem L("新浪博客", "新浪博客"), 3
cmbLocation.AddItem L("QQ空间", "QQ空間"), 4
cmbLocation.AddItem L("(其他)", "(其他)"), 5
cmbLocation.ListIndex = Publish_nLocation

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
lblViewBoard.Font.Underline = True
lblLocation.Font.Underline = True
lblFormat.Font.Underline = True
Caption = "發布棋譜"
frmBoard.Caption = "棋盤"
lblSize.Caption = "圖片類型"
optSize(0).Caption = "簡單"
optSize(1).Caption = "印刷"
optSize(2).Caption = "適中"
optSize(3).Caption = "最大"
lblBoard.Caption = "棋盤樣式"
lblPieces.Caption = "棋子樣式"
lblBoardUrl.Caption = "圖片地址"
txtBoardUrl.ToolTipText = "按Ctrl-C複製到剪貼板"
lblViewBoard.Caption = "預覽"
frmPublish.Caption = "發布"
lblLocation.Caption = "發布站點"
lblFormat.Caption = "發布格式"
btnHelp.Caption = "幫助"
btnPublish.Caption = "發布"
btnCancel.Caption = "關閉"

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
    cmbBoard.AddItem L("默认", "默認"), 0
    cmbBoard.ListIndex = 0
    cmbPieces.AddItem L("简体", "簡體"), 0
    cmbPieces.AddItem L("繁体", "繁體"), 1
    cmbPieces.ListIndex = IIf(Publish_bTrad, 1, 0)
Case PUB_SIZE_SMALL
    cmbBoard.AddItem L("栎木", "櫟木"), 0
    cmbBoard.AddItem L("绿色大理石", "綠色大理石"), 1
    cmbBoard.AddItem L("白色大理石", "白色大理石"), 2
    cmbBoard.AddItem L("再生纸", "再生紙"), 3
    cmbBoard.AddItem L("画布", "畫布"), 4
    cmbBoard.AddItem L("水滴", "水滴"), 5
    cmbBoard.AddItem L("蓝天白云石", "藍天白雲"), 6
    cmbBoard.AddItem L("象棋演播室", "象棋演播室"), 7
    cmbBoard.AddItem L("弈天棋缘", "弈天棋緣"), 8
    cmbBoard.AddItem L("梦入神机", "夢入神機"), 9
    cmbBoard.AddItem L("纵马奔流", "縱馬奔流"), 10
    cmbBoard.AddItem L("浅红象棋", "淺紅象棋"), 11
    cmbBoard.ListIndex = Publish_nBoardS
    cmbPieces.AddItem L("木刻", "木刻"), 0
    cmbPieces.AddItem L("精致", "精緻"), 1
    cmbPieces.AddItem L("光泽", "光澤"), 2
    cmbPieces.AddItem L("象棋演播室", "象棋演播室"), 3
    cmbPieces.AddItem L("弈天棋缘", "弈天棋緣"), 4
    cmbPieces.AddItem L("梦入神机", "夢入神機"), 5
    cmbPieces.AddItem L("纵马奔流", "縱馬奔流"), 6
    cmbPieces.ListIndex = Publish_nPiecesS
Case PUB_SIZE_LARGE
    cmbBoard.AddItem L("栎木", "櫟木"), 0
    cmbBoard.AddItem L("绿色大理石", "綠色大理石"), 1
    cmbBoard.AddItem L("白色大理石", "白色大理石"), 2
    cmbBoard.AddItem L("再生纸", "再生紙"), 3
    cmbBoard.AddItem L("画布", "畫布"), 4
    cmbBoard.AddItem L("水滴", "水滴"), 5
    cmbBoard.AddItem L("浅红象棋", "淺紅象棋"), 6
    cmbBoard.ListIndex = Publish_nBoardL
    cmbPieces.AddItem L("木刻", "木刻"), 0
    cmbPieces.AddItem L("精致", "精緻"), 1
    cmbPieces.AddItem L("光泽", "光澤"), 2
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

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/publish.htm", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub btnPublish_Click()

Dim szCopy As String, szFen As String, szBr As String, szFlashVars As String
Dim szSt1 As String, szSt2 As String
Dim pos As PositionStruct

szBr = IIf(Publish_nFormat >= PUB_FORMAT_HTML, "<br>" & vbCrLf, vbCrLf)
szCopy = L("象棋巫师魔法学校第", "象棋巫師魔法學校第") & (Gui_nCurr + 1) & _
        L("关怎么过？", "關怎麼過？") & szBr
szSt1 = L("# 在浏览器中打开下面的链接，就能直接用象棋巫师打开盘面", "# 在瀏覽器中打開下面的鏈接，就能直接用象棋巫師打開盤面")
szSt2 = L("用象棋巫师打开盘面", "用象棋巫師打開盤面")
' 发布当前局面，依次显示文本棋盘/图片棋盘，外加FEN链接
szFen = App_szEndgames(Gui_nCurr)
Select Case Publish_nFormat
Case PUB_FORMAT_TEXT, PUB_FORMAT_ANSI
    CchessFen2Board pos, szFen
    szCopy = szCopy & GetBoardText(pos)
    szCopy = szCopy & "# " & szFen & szBr ' 这里还是要显示FEN，以免下面的链接无法打开给用户造成麻烦
    szCopy = szCopy & szSt1 & szBr
    szCopy = szCopy & "# http://www.xqbase.com/pub/fen.php?fen=" & UrlEncode(szFen) & szBr
Case PUB_FORMAT_UBB
    szCopy = szCopy & "[img]" & GetBoardUrl(szFen) & "[/img]" & szBr
    szCopy = szCopy & "# [url=http://www.xqbase.com/pub/fen.php?fen=" & _
            UrlEncode(szFen) & "]" & szSt2 & "[/url]" & szBr
Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
    szCopy = szCopy & "<img src=""" & GetBoardUrl(szFen) & """>" & szBr
    szCopy = szCopy & "# <a href=""http://www.xqbase.com/pub/fen.php?fen=" & _
            UrlEncode(szFen) & """>" & szSt2 & "</a>" & szBr
End Select
' 给象棋巫师做个广告
szSt1 = L("下载象棋巫师", "下載象棋巫師")
szSt2 = L("象棋百科全书", "象棋百科全書")
Select Case Publish_nFormat
Case PUB_FORMAT_TEXT, PUB_FORMAT_ANSI
    szCopy = szCopy & "# " & szSt1 & " http://www.xqbase.com/pub/xqwizard.php" & szBr
    szCopy = szCopy & "# " & szSt2 & " http://www.xqbase.com/"
Case PUB_FORMAT_UBB
    szCopy = szCopy & "# [url=http://www.xqbase.com/pub/xqwizard.php]" & szSt1 & "[/url]" & szBr
    szCopy = szCopy & "[url=http://www.xqbase.com/pub/]" & szSt2 & "[/url]"
Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
    szCopy = szCopy & "# <a href=""http://www.xqbase.com/pub/xqwizard.php"" target=""_blank"">" & szSt1 & "</a>" & szBr
    szCopy = szCopy & "# <a href=""http://www.xqbase.com/pub/"" target=""_blank"">" & szSt2 & "</a>"
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
Case PUB_LOCATION_ZHIDAO
    ShellExecuteA 0, vbNullString, "http://zhidao.baidu.com/", _
            vbNullString, vbNullString, vbNormalFocus
Case PUB_LOCATION_TIEBA
    ShellExecuteA 0, vbNullString, "http://tieba.baidu.com/f?kw=%CF%F3%C6%E5#sub", _
            vbNullString, vbNullString, vbNormalFocus
Case PUB_LOCATION_HOME
    ShellExecuteA 0, vbNullString, "http://home.xqbase.com/cp.php?ac=blog", _
            vbNullString, vbNullString, vbNormalFocus
Case PUB_LOCATION_SINA
    ShellExecuteA 0, vbNullString, "http://control.blog.sina.com.cn/admin/article/article_add.php?index", _
            vbNullString, vbNullString, vbNormalFocus
Case PUB_LOCATION_QZONE
    ShellExecuteA 0, vbNullString, "http://user.qzone.qq.com/", _
            vbNullString, vbNullString, vbNormalFocus
End Select
MsgBox L("棋谱已复制到剪贴板，请找到发表帖子的内容框，按Ctrl-V键粘贴。", _
        "棋譜已復製到剪貼板，請找到發表帖子的內容框，按Ctrl-V鍵粘貼。"), vbInformation

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
Case PUB_LOCATION_ZHIDAO
    Publish_nFormat = PUB_FORMAT_TEXT
Case PUB_LOCATION_TIEBA
    Publish_nFormat = PUB_FORMAT_TEXT
Case PUB_LOCATION_HOME
    Publish_nFormat = PUB_FORMAT_WEB
Case PUB_LOCATION_SINA
    Publish_nFormat = PUB_FORMAT_WEB
Case PUB_LOCATION_QZONE
    Publish_nFormat = PUB_FORMAT_WEB
End Select
cmbFormat.ListIndex = Publish_nFormat

End Sub

Private Sub lblViewBoard_Click()

ShellExecuteA 0, vbNullString, txtBoardUrl.Text, vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub lblLocation_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/publish.htm#location", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub lblFormat_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/publish.htm#format", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Function GetBoardUrl(ByVal szFen As String) As String

GetBoardUrl = "http://www.xqbase.com/pub/board.php?&fen=" & UrlEncode(szFen) & _
        "&size=" & Publish_nSize & "&board=" & cmbBoard.ListIndex & "&pieces=" & cmbPieces.ListIndex

End Function

Private Function GetBoardText(ByRef pos As PositionStruct) As String

Dim sz As String
sz = AllocString(CchessBoardText(pos, IIf(Publish_nFormat = PUB_FORMAT_ANSI, CCHESS_ANSI_TEXT, 0)))
' 在百度贴吧里，要把所有双空格全部替换"‐"(繁体是"．")，这样显示出来可能会美观些
' If Publish_nLocation = PUB_LOCATION_TIEBA Or Publish_nLocation = PUB_LOCATION_ZHIDAO Then
If Publish_nFormat = PUB_FORMAT_ANSI Then
    sz = AllocString(CchessBoardText(pos, CCHESS_ANSI_TEXT))
Else
    sz = AllocString(CchessBoardText(pos))
    sz = Replace(sz, "  ", L("‐", "．"))
    sz = Replace(sz, "--", "—")
End If
GetBoardText = sz

End Function
