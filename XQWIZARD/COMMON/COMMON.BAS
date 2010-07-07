Attribute VB_Name = "mdlCommon"
' COMMON.BAS - Source Code for XiangQi Wizard & XiangQi Witchcraft School
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' XiangQi Witchcraft School - a Chinese Chess Endgame Challenge Game
' Designed by Morning Yellow, Version: 4.67, Last Modified: Jul. 2010
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

Private Declare Function GetACP Lib "KERNEL32.DLL" () As Long

' 全局常量——象棋巫师信息
Public Const STRING_VERSION     As String = "4.68"
Public Const STRING_COPYRIGHT   As String = "(C) 2004-2010 www.xqbase.com"
Public Const QUOTE_NUM          As Integer = 12   ' 名言条目数
Public Const ICON_QUOTE         As Integer = 8    ' 名言图标
Public Const ICON_WIN           As Integer = 15   ' 胜的图标
Public Const ICON_DRAW          As Integer = 16   ' 和的图标
Public Const ICON_LOSS          As Integer = 17   ' 负的图标
Public Const MANUAL_UPDATE      As Boolean = True ' CheckUpdate
' 全局常量——棋盘(小)设置选项
Public Const BOARD_S_WOOD       As Integer = 0
Public Const BOARD_S_GREEN      As Integer = 1
Public Const BOARD_S_WHITE      As Integer = 2
Public Const BOARD_S_SHEET      As Integer = 3
Public Const BOARD_S_CANVAS     As Integer = 4
Public Const BOARD_S_DROPS      As Integer = 5
Public Const BOARD_S_CLOUDS     As Integer = 6
Public Const BOARD_S_XQSTUDIO   As Integer = 7
Public Const BOARD_S_MOVESKY    As Integer = 8
Public Const BOARD_S_MRSJ       As Integer = 9
Public Const BOARD_S_ZMBL       As Integer = 10
Public Const BOARD_S_QIANHONG   As Integer = 11
Public Const BOARD_S_MAX        As Integer = 12
' 全局常量——棋子(小)设置选项
Public Const PIECES_S_WOOD      As Integer = 0
Public Const PIECES_S_DELICATE  As Integer = 1
Public Const PIECES_S_POLISH    As Integer = 2
Public Const PIECES_S_XQSTUDIO  As Integer = 3
Public Const PIECES_S_MOVESKY   As Integer = 4
Public Const PIECES_S_MRSJ      As Integer = 5
Public Const PIECES_S_ZMBL      As Integer = 6
Public Const PIECES_S_MAX       As Integer = 7
' 全局常量——棋盘(大)设置选项
Public Const BOARD_L_WOOD       As Integer = 0
Public Const BOARD_L_GREEN      As Integer = 1
Public Const BOARD_L_WHITE      As Integer = 2
Public Const BOARD_L_SHEET      As Integer = 3
Public Const BOARD_L_CANVAS     As Integer = 4
Public Const BOARD_L_DROPS      As Integer = 5
Public Const BOARD_L_QIANHONG   As Integer = 6
Public Const BOARD_L_MAX        As Integer = 7
' 全局常量——棋子(大)设置选项
Public Const PIECES_L_WOOD      As Integer = 0
Public Const PIECES_L_DELICATE  As Integer = 1
Public Const PIECES_L_POLISH    As Integer = 2
Public Const PIECES_L_MAX       As Integer = 3
' 全局常量——发布图片大小
Public Const PUB_SIZE_MINI      As Integer = 0
Public Const PUB_SIZE_PRINT     As Integer = 1
Public Const PUB_SIZE_SMALL     As Integer = 2
Public Const PUB_SIZE_LARGE     As Integer = 3
Public Const PUB_SIZE_MAX       As Integer = 4
' 全局常量——发布站点
Public Const PUB_LOCATION_ZHIDAO As Integer = 0
Public Const PUB_LOCATION_TIEBA As Integer = 1
Public Const PUB_LOCATION_SINA  As Integer = 2
Public Const PUB_LOCATION_QZONE As Integer = 3
Public Const PUB_LOCATION_OTHER As Integer = 4
Public Const PUB_LOCATION_MAX   As Integer = 5
' 全局常量——发布格式
Public Const PUB_FORMAT_TEXT    As Integer = 0
Public Const PUB_FORMAT_ANSI    As Integer = 1
Public Const PUB_FORMAT_UBB     As Integer = 2
Public Const PUB_FORMAT_HTML    As Integer = 3
Public Const PUB_FORMAT_WEB     As Integer = 4
Public Const PUB_FORMAT_MAX     As Integer = 5
' 全局常量——语言
Public Const LANGUAGE_ZH_CN     As Integer = 0
Public Const LANGUAGE_ZH_TW     As Integer = 1
Public Const LANGUAGE_MAX       As Integer = 2
' 全局变量——选项
Public Options_nLanguage        As Integer  ' 语言
Public Options_bLargeGui        As Boolean  ' 大界面
Public Options_bSounds          As Boolean  ' 声音
Public Options_nBoardS          As Integer  ' 小界面的棋盘
Public Options_nPiecesS         As Integer  ' 小界面的棋子
Public Options_nBoardL          As Integer  ' 大界面的棋盘
Public Options_nPiecesL         As Integer  ' 大界面的棋子
' 全局变量——界面(杂项)
Public Gui_szQuotes(1 To QUOTE_NUM) As String ' “名言”的条目
Public Gui_szUpgradeVer         As String   ' 检查升级的版本
Public Gui_szUpgradeDate        As String   ' 检查升级的日期
Public Gui_szAdvertDate         As String   ' 检查广告的日期
Public Gui_nAdvertIndex         As Integer  ' 当前广告序号
Public Gui_dfLastTime           As Double   ' 当前时间(每天00:00过去的秒数)
' 全局变量——发布设置
Public Publish_nSize            As Integer  ' 图片类型
Public Publish_bTrad            As Boolean  ' 是否繁体(简单/印刷)
Public Publish_nBoardS          As Integer  ' 棋盘类型(小)
Public Publish_nPiecesS         As Integer  ' 棋子类型(小)
Public Publish_nBoardL          As Integer  ' 棋盘类型(小)
Public Publish_nPiecesL         As Integer  ' 棋子类型(大)
Public Publish_nLocation        As Integer  ' 发布站点
Public Publish_nFormat          As Integer  ' 发布格式

' 简繁选择，0选简体，1选繁体
Public Function L(ParamArray sz() As Variant) As String

L = sz(Options_nLanguage)

End Function

' 无法打开文件提示
Public Sub ErrorOpen(ByVal szFileName As String)

MsgBox L("无法打开文件 ", "無法打開文件 ") & szFileName, vbExclamation

End Sub

' 获得棋子图片的文件名
Public Function PieceFileName(ByVal nIndex As Integer) As String

If nIndex = 30 Then
    PieceFileName = "RKM"
ElseIf nIndex = 31 Then
    PieceFileName = "BKM"
ElseIf nIndex >= 15 Then
    PieceFileName = PieceFileName(nIndex - 15) & "S"
Else
    If nIndex = 0 Then
        PieceFileName = "OO"
    Else
        If nIndex > 7 Then
            PieceFileName = "B" & PieceByte(nIndex - 8)
        Else
            PieceFileName = "R" & PieceByte(nIndex - 1)
        End If
    End If
End If

End Function

' 关于象棋巫师
Public Sub AboutXQWizard()

MessageBeep vbInformation
If Options_nLanguage = LANGUAGE_ZH_CN Then
    MsgBoxIcon "象棋巫师 " & STRING_VERSION & vbCrLf & "象棋百科全书 荣誉出品" & vbCrLf & vbCrLf & _
            STRING_COPYRIGHT, , "关于象棋巫师"
Else
    MsgBoxIcon "象棋巫師 " & STRING_VERSION & vbCrLf & "象棋百科全書 榮譽出品" & vbCrLf & vbCrLf & _
            STRING_COPYRIGHT, , "關於象棋巫師"
End If

End Sub

' 检查更新
Public Sub CheckUpdate(ByVal szReferer As String, Optional ByVal bManual As Boolean = False)

Dim sz As String, szUserID As String, szWhatsNew As String, szUrl As String
Dim dwCounter(0 To 1) As Long

sz = ""
QueryPerformanceCounter VarPtr(dwCounter(0))
szUserID = GetSetting("XQWizard", "Gui", "UserID", Hex(dwCounter(0)) & Hex(dwCounter(1)))
On Error Resume Next
sz = frmHide.Inet.OpenURL("http://www.xqbase.com/xqwizard/version.php?referer=" & szReferer & "&version=" & _
        STRING_VERSION & "&userid=" & szUserID)
On Error GoTo 0
If sz = "" Then
    If bManual Then
        MsgBox L("无法访问 www.xqbase.com，请稍后再试。", "無法訪問 www.xqbase.com，請稍後再試。"), vbExclamation
    End If
Else
    Gui_szUpgradeDate = Date ' 如果访问升级信息成功，那么当天就不再访问升级信息
    SaveSetting "XQWizard", "Gui", "UpgradeDate", Gui_szUpgradeDate ' 立即写注册表，避免重开窗口导致的重复访问
    SaveSetting "XQWizard", "Gui", "UserID", szUserID               ' 同上
    If Val(sz) > Val(STRING_VERSION) + 0.005 And (bManual Or Val(sz) > Val(Gui_szUpgradeVer) + 0.005) Then
        szWhatsNew = ""
        On Error Resume Next
        szWhatsNew = frmHide.Inet.OpenURL("http://www.xqbase.com/xqwizard/whatsnew_" & L("simp.txt", "trad.txt"))
        On Error GoTo 0
        If szWhatsNew = "" Then
            szWhatsNew = L("象棋巫师 ", "象棋巫師") & sz & _
                    L(" 已经发布，需要下载最新版本吗？", " 已經發布，需要下載最新版本嗎？")
        End If
        If MsgBox(szWhatsNew, vbQuestion + vbYesNo) = vbYes Then
            szUrl = ""
            On Error Resume Next
            szUrl = frmHide.Inet.OpenURL("http://www.xqbase.com/xqwizard/download.txt")
            On Error GoTo 0
            If Left(szUrl, 7) <> "http://" Then
                szUrl = "http://www.xqbase.com/xqwizard/download.htm"
            End If
            ShellExecuteA 0, vbNullString, szUrl, vbNullString, vbNullString, vbNormalFocus
        Else
            Gui_szUpgradeVer = sz
        End If
    Else
        If bManual Then
            MsgBox L("您的象棋巫师已经是最新版本了。", "您的象棋巫師已經是最新版本了。"), vbInformation
        End If
    End If
End If

End Sub

' 退弹
Public Sub ExitPopup()

Dim szUrl As String
' 用到时才读注册表，避免重开窗口导致的重复访问。这里的做法与Gui_szAdvertDate相反，但达到的目的是一样的。
If GetSetting("XQWizard", "Gui", "PopupDate", "") = Date Then
    Exit Sub
End If
' 如果退弹成功，那么当天就不再退弹了
SaveSetting "XQWizard", "Gui", "PopupDate", Date
szUrl = ""
On Error Resume Next
szUrl = frmHide.Inet.OpenURL("http://www.xqbase.com/advert/popup.txt")
On Error GoTo 0
If Left(szUrl, 7) = "http://" Then
    ShellExecuteA 0, vbNullString, szUrl, vbNullString, vbNullString, vbNormalFocus
End If

End Sub

' 加载“名言”
Public Sub LoadQuotes()

If Options_nLanguage = LANGUAGE_ZH_CN Then

Gui_szQuotes(1) = "　　子曰：“学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知而不愠，不亦君子乎？”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·学而》"
Gui_szQuotes(2) = "　　子贡问曰：“有一言而可以终身行之者乎？”子曰：“其恕乎！己所不欲，勿施于人。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·卫灵公》"
Gui_szQuotes(3) = "　　或曰：“以德报怨，何如？”子曰：“何以报德？以直报怨，以德报德。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·宪问》"
Gui_szQuotes(4) = "　　子夏曰：“博学而笃志，切问而近思；仁在其中矣。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·子张》"
Gui_szQuotes(5) = "　　子曰：“不患人之不己知，患不知人也。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·学而》"
Gui_szQuotes(6) = "　　子曰：“三人行，必有我师焉：择其善者而从之，其不善者而改之。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·述而》"
Gui_szQuotes(7) = "　　将欲歙之，必固张之；将欲弱之，必固强之；将欲废之，必固兴之；将欲取之，必固与之。是谓微明。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第三十六章》"
Gui_szQuotes(8) = "　　柔弱胜刚强。鱼不可脱于渊，国之利器不可以示人。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第三十六章》"
Gui_szQuotes(9) = "　　图难于其易；为大于其细。天下难事，必作于易；天下大事，必作于细。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第六十三章》"
Gui_szQuotes(10) = "　　合抱之木，生于毫末；九层之台，起于累土；千里之行，始于足下。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第六十四章》"
Gui_szQuotes(11) = "　　知彼知己，胜乃不殆；知天知地，胜乃可全。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《孙子兵法·地形》"
Gui_szQuotes(12) = "　　怒可以复喜，愠可以复说，亡国不可以复存，死者不可以复生。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《孙子兵法·火攻》"

Else

Gui_szQuotes(1) = "　　子曰：“學而時習之，不亦說乎？有朋自遠方來，不亦樂乎？人不知而不慍，不亦君子乎？”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語．學而》"
Gui_szQuotes(2) = "　　子貢問曰：“有一言而可以終身行之者乎？”子曰：“其恕乎！己所不欲，勿施於人。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語．衛靈公》"
Gui_szQuotes(3) = "　　或曰：“以德報怨，何如？”子曰：“何以報德？以直報怨，以德報德。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語．憲問》"
Gui_szQuotes(4) = "　　子夏曰：“博學而篤志，切問而近思；仁在其中矣。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語．子張》"
Gui_szQuotes(5) = "　　子曰：“不患人之不己知，患不知人也。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語．學而》"
Gui_szQuotes(6) = "　　子曰：“三人行，必有我師焉：擇其善者而從之，其不善者而改之。”" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語．述而》"
Gui_szQuotes(7) = "　　將欲歙之，必固張之；將欲弱之，必固強之；將欲廢之，必固興之；將欲取之，必固与之。是謂微明。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子．第三十六章》"
Gui_szQuotes(8) = "　　柔弱胜剛強。魚不可脫於淵，國之利器不可以示人。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子．第三十六章》"
Gui_szQuotes(9) = "　　圖難於其易；為大於其細。天下難事，必作於易；天下大事，必作於細。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子．第六十三章》"
Gui_szQuotes(10) = "　　合抱之木，生於毫末；九層之台，起於累土；千里之行，始於足下。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子．第六十四章》"
Gui_szQuotes(11) = "　　知彼知己，胜乃不殆；知天知地，胜乃可全。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《孫子兵法．地形》"
Gui_szQuotes(12) = "　　怒可以複喜，慍可以複說，亡國不可以複存，死者不可以複生。" & vbCrLf & vbCrLf & _
        "　　　　　　　　　　　　　　　　　　　　　　——《孫子兵法．火攻》"

End If

End Sub

' 从注册表加载参数
Public Sub LoadRegs()

Options_nLanguage = Str2Int(GetSetting("XQWizard", "Options", "Language", IIf(GetACP = 950, "1", "0")), 0, LANGUAGE_MAX - 1)
Options_bLargeGui = (Str2Int(GetSetting("XQWizard", "Options", "LargeGui", IIf(Screen.Height > 10000, "1", "0"))) <> 0)
Options_bSounds = (Str2Int(GetSetting("XQWizard", "Options", "Sounds", "1")) <> 0)
Options_nBoardS = Str2Int(GetSetting("XQWizard", "Options", "BoardSmall", "0"), 0, BOARD_S_MAX - 1)
Options_nPiecesS = Str2Int(GetSetting("XQWizard", "Options", "PiecesSmall", "0"), 0, PIECES_S_MAX - 1)
Options_nBoardL = Str2Int(GetSetting("XQWizard", "Options", "BoardLarge", "0"), 0, BOARD_L_MAX - 1)
Options_nPiecesL = Str2Int(GetSetting("XQWizard", "Options", "PiecesLarge", "0"), 0, PIECES_L_MAX - 1)
Gui_szUpgradeVer = GetSetting("XQWizard", "Gui", "UpgradeVer", STRING_VERSION)
Gui_szUpgradeDate = GetSetting("XQWizard", "Gui", "UpgradeDate", "")
Gui_szAdvertDate = GetSetting("XQWizard", "Gui", "AdvertDate", "")
Publish_nSize = Str2Int(GetSetting("XQWizard", "Publish", "Size", "0"), 0, PUB_SIZE_MAX - 1)
Publish_bTrad = (Str2Int(GetSetting("XQWizard", "Publish", "Trad", "0")) <> 0)
Publish_nBoardS = Str2Int(GetSetting("XQWizard", "Publish", "BoardS", "0"), 0, BOARD_S_MAX - 1)
Publish_nPiecesS = Str2Int(GetSetting("XQWizard", "Publish", "PiecesS", "0"), 0, PIECES_S_MAX - 1)
Publish_nBoardL = Str2Int(GetSetting("XQWizard", "Publish", "BoardL", "0"), 0, BOARD_L_MAX - 1)
Publish_nPiecesL = Str2Int(GetSetting("XQWizard", "Publish", "PiecesL", "0"), 0, PIECES_L_MAX - 1)
Publish_nLocation = Str2Int(GetSetting("XQWizard", "Publish", "Location", "0"), 0, PUB_LOCATION_MAX - 1)
Publish_nFormat = Str2Int(GetSetting("XQWizard", "Publish", "Format", "0"), 0, PUB_FORMAT_MAX - 1)

End Sub

' 保存参数到注册表
Public Sub SaveRegs()

SaveSetting "XQWizard", "Options", "Sounds", IIf(Options_bSounds, "1", "0")
SaveSetting "XQWizard", "Options", "BoardSmall", Options_nBoardS
SaveSetting "XQWizard", "Options", "PiecesSmall", Options_nPiecesS
SaveSetting "XQWizard", "Options", "BoardLarge", Options_nBoardL
SaveSetting "XQWizard", "Options", "PiecesLarge", Options_nPiecesL
SaveSetting "XQWizard", "Gui", "UpgradeVer", Gui_szUpgradeVer
SaveSetting "XQWizard", "Gui", "AdvertDate", Gui_szAdvertDate
SaveSetting "XQWizard", "Publish", "Size", Publish_nSize
SaveSetting "XQWizard", "Publish", "Trad", IIf(Publish_bTrad, "1", "0")
SaveSetting "XQWizard", "Publish", "BoardS", Publish_nBoardS
SaveSetting "XQWizard", "Publish", "PiecesS", Publish_nPiecesS
SaveSetting "XQWizard", "Publish", "BoardL", Publish_nBoardL
SaveSetting "XQWizard", "Publish", "PiecesL", Publish_nPiecesL
SaveSetting "XQWizard", "Publish", "Location", Publish_nLocation
SaveSetting "XQWizard", "Publish", "Format", Publish_nFormat

End Sub
