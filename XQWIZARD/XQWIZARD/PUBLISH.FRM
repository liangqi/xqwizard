VERSION 5.00
Begin VB.Form frmPublish 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "发布棋谱"
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
   StartUpPosition =   1  'CenterOwner
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
' Designed by Morning Yellow, Version: 4.64, Last Modified: May 2010
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

' 发布内容
optContent(IIf(Publish_bContent, 1, 0)).Value = True

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
cmbLocation.AddItem L("新浪博客", "新浪博客"), 2
cmbLocation.AddItem L("QQ空间", "QQ空間"), 3
cmbLocation.AddItem L("(其他)", "(其他)"), 4
cmbLocation.ListIndex = Publish_nLocation

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
lblContent.Caption = "發布內容"
optContent(0).Caption = "整個棋局"
optContent(1).Caption = "當前局面"
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
txtBoardUrl.Text = GetBoardUrl(AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))))

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
txtBoardUrl.Text = GetBoardUrl(AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))))

End Sub

Private Sub optContent_Click(Index As Integer)

Publish_bContent = optContent(1).Value

End Sub

Private Sub btnHelp_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/publish.htm", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub btnPublish_Click()

Dim szCopy As String, szFen As String, szBr As String, szAd As String, szFlashVars As String
Dim bReturned As Boolean, cnt As Integer, sd As Integer, i As Integer
Dim pos As PositionStruct

' 输出标题(赛事、结果、日起地点、开局)
szCopy = ""
szBr = IIf(Publish_nFormat >= PUB_FORMAT_HTML, "<br>" & vbCrLf, vbCrLf)
If EventString <> "" Then
    szCopy = szCopy & EventString & szBr
End If
If ResultString <> "" Then
    szCopy = szCopy & ResultString & szBr
End If
If DateSiteString <> "" Then
    szCopy = szCopy & DateSiteString & szBr
End If
If OpenString <> "" Then
    szCopy = szCopy & OpenString & szBr
End If
szAd = L("# 本棋谱由象棋巫师生成，欢迎访问 ", "# 本棋譜由象棋巫師生成，歡迎訪問 ")
If Publish_bContent Then
    ' 发布当前局面，依次显示文本棋盘/图片棋盘，外加FEN链接
    szFen = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev)))
    Select Case Publish_nFormat
    Case PUB_FORMAT_TEXT, PUB_FORMAT_ANSI
        szCopy = szCopy & GetBoardText(Game_posIrrev(Game_nCurrIrrev))
        szCopy = szCopy & "# " & szFen & szBr
    Case PUB_FORMAT_UBB
        szCopy = szCopy & "[img]" & GetBoardUrl(szFen) & "[/img]" & szBr
        szCopy = szCopy & "# [url=http://www.xqbase.com/pub/fen.php?fen=" & _
                UrlEncode(szFen) & "]" & szFen & "[/url]" & szBr
    Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
        szCopy = szCopy & "<img src=""" & GetBoardUrl(szFen) & """>" & szBr
        szCopy = szCopy & "# <a href=""http://www.xqbase.com/pub/fen.php?fen=" & _
                UrlEncode(szFen) & """>" & szFen & "</a>" & szBr
    End Select
Else
    ' 发布整个棋局，如果不是从起始局面开始的，那么依次显示文本棋盘/图片棋盘，外加FEN链接
    If Not Game_bStartPos Then
        Select Case Publish_nFormat
        Case PUB_FORMAT_TEXT, PUB_FORMAT_ANSI
            CchessFen2Board pos, Game_szIrrevFen(0)
            szCopy = szCopy & GetBoardText(pos)
            szCopy = szCopy & "# " & Game_szIrrevFen(0) & szBr
        Case PUB_FORMAT_UBB
            szCopy = szCopy & "[img]" & GetBoardUrl(Game_szIrrevFen(0)) & "[/img]" & szBr
            szCopy = szCopy & "# [url=http://www.xqbase.com/pub/fen.php?fen=" & _
                    UrlEncode(Game_szIrrevFen(0)) & "]" & Game_szIrrevFen(0) & "[/url]" & szBr
        Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
            szFlashVars = IIf(Game_bStartPos, "", "Position=" & UrlEncode(Game_szIrrevFen(0)) & "&") & "MoveList="
            For i = 1 To Game_nMaxMove
                szFlashVars = szFlashVars & UrlEncode(Move2Iccs(Game_mvMove(i)) & " ")
            Next
            szCopy = szCopy & "<embed src=""http://www.xqbase.com/pub/flashxq.swf"" " & _
                    "width=""324"" height=""396"" type=""application/x-shockwave-flash"" " & _
                    "pluginspage=""http://www.macromedia.com/go/getflashplayer"" allowScriptAccess=""always"" " & _
                    "quality=""high"" wmode=""transparent"" flashvars=""" & szFlashVars & """>" & szBr
            szCopy = szCopy & "# <a href=""http://www.xqbase.com/pub/fen.php?fen=" & _
                    UrlEncode(Game_szIrrevFen(0)) & """>" & Game_szIrrevFen(0) & "</a>" & szBr
        End Select
    End If
    ' 显示文本棋谱，润色字体
    Select Case Publish_nFormat
    Case PUB_FORMAT_ANSI
        szCopy = szCopy & Chr(27) & "[1;33m"
    Case PUB_FORMAT_UBB
        szCopy = szCopy & "[color=#003333]"
    Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
        szCopy = szCopy & "<font color=""#003333"">"
    End Select
    ' 输出棋谱
    If Game_szComment(0) <> "" Then
        szCopy = szCopy & "{" & Replace(Game_szComment(0), vbCrLf, szBr) & "}" & szBr
    End If
    bReturned = True
    cnt = Game_cntStart
    sd = Game_sdStart
    For i = 1 To Game_nMaxMove
        If bReturned Then
            szCopy = szCopy & Space(3 - Len("" & cnt)) & cnt & ". "
            If sd = 1 Then
                szCopy = szCopy & Space(Choose(Game_nFormat + 1, 8, 4, 5))
            End If
        End If
        If sd = 0 Then
            szCopy = szCopy & Game_szMoveText(Game_nFormat, i)
            bReturned = False
        Else
            szCopy = szCopy & " " & Game_szMoveText(Game_nFormat, i) & szBr
            bReturned = True
        End If
        If Game_szComment(i) <> "" Then
            If Not bReturned Then
                szCopy = szCopy & szBr
            End If
            szCopy = szCopy & "{" & Replace(Game_szComment(i), vbCrLf, szBr) & "}" & szBr
            bReturned = True
        End If
        sd = 1 - sd
        cnt = cnt + 1 - sd
    Next
    szCopy = szCopy & Choose(Game_nResult + 1, " *", " 1-0", " 1/2-1/2", " 0-1") & szBr
    ' 取消润色
    Select Case Publish_nFormat
    Case PUB_FORMAT_ANSI
        szCopy = szCopy & Chr(27) & "[1;0m"
    Case PUB_FORMAT_UBB
        szCopy = szCopy & "[/color]"
    Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
        szCopy = szCopy & "</font>"
    End Select
    ' 以上是供复制粘贴的文本棋谱
End If
' 给象棋巫师做个广告
If Not Publish_bContent Then
    szCopy = szCopy & "===============================================" & szBr
End If
Select Case Publish_nFormat
Case PUB_FORMAT_TEXT, PUB_FORMAT_ANSI
    szCopy = szCopy & szAd & "www.xqbase.com"
Case PUB_FORMAT_UBB
    szCopy = szCopy & szAd & "[url=http://www.xqbase.com/]www.xqbase.com[/url]"
Case PUB_FORMAT_HTML, PUB_FORMAT_WEB
    szCopy = szCopy & szAd & "<a href=""http://www.xqbase.com/"">www.xqbase.com</a>"
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
