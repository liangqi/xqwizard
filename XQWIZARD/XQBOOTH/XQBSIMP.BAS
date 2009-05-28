Attribute VB_Name = "mdlXQBooth"
' XQBOOTH.BAS - Source Code for XiangQi Booth, Part I
'
' XiangQi Booth - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 3.97, Last Modified: May 2009
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

' 全局常量
Public Const STRING_VERSION     As String = "3.97"
Public Const STRING_COPYRIGHT   As String = "(C) 2004-2009 www.elephantbase.net"
Public Const QUOTE_NUM          As Integer = 12     ' 名言条目数
Public Const ICON_QUOTE         As Integer = 2      ' 名言图标
Public Const MAX_ENDGAMES       As Integer = 4096   ' 残局的最大条目数
Public Const ENDGAME_FILE       As String = "ENDGAMES\BOOTH.EPD"    ' 残局文件
Public Const ENGINE_FILE        As String = "ELEEYE.EXE"    ' 引擎文件
Public Const MANUAL_UPDATE      As Boolean = True   ' CheckUpdate
' 全局常量——棋盘(小)设置选项
Public Const BOARD_WOOD         As Integer = 0
Public Const BOARD_GREEN        As Integer = 1
Public Const BOARD_WHITE        As Integer = 2
Public Const BOARD_SHEET        As Integer = 3
Public Const BOARD_CANVAS       As Integer = 4
Public Const BOARD_DROPS        As Integer = 5
Public Const BOARD_CLOUDS       As Integer = 6
Public Const BOARD_XQSTUDIO     As Integer = 7
Public Const BOARD_MOVESKY      As Integer = 8
Public Const BOARD_MRSJ         As Integer = 9
Public Const BOARD_ZMBL         As Integer = 10
Public Const BOARD_QIANHONG     As Integer = 11
Public Const BOARD_MAX          As Integer = 12
' 全局常量——棋子(小)设置选项
Public Const PIECES_WOOD        As Integer = 0
Public Const PIECES_DELICATE    As Integer = 1
Public Const PIECES_POLISH      As Integer = 2
Public Const PIECES_XQSTUDIO    As Integer = 3
Public Const PIECES_MOVESKY     As Integer = 4
Public Const PIECES_MRSJ        As Integer = 5
Public Const PIECES_ZMBL        As Integer = 6
Public Const PIECES_MAX         As Integer = 7

' 全局变量
Public App_szPath               As String   ' 主程序所在的文件夹，以"\"结尾
Public App_bRunning             As Boolean  ' 程序运行标志，启动时设成True，如果是False，则跳出事件检测循环
Public App_nEndgames            As Integer  ' 读入的残局数量
Public App_szEndgames(0 To MAX_ENDGAMES - 1) As String  ' 读入的残局
Public Gui_nBoard               As Integer  ' 棋盘
Public Gui_nPieces              As Integer  ' 棋子
Public Gui_bSounds              As Boolean  ' 音效
Public Gui_szUpgradeVer         As String   ' 检查升级的版本
Public Gui_szUpgradeDate        As String   ' 检查升级的日期
Public Gui_nCurr                As Integer  ' 当前残局的条目序号
Public Gui_nLast                As Integer  ' 最后残局的条目序号
Public Gui_szAdvertDate         As String   ' 检查广告的日期
Public Gui_dfLastTime           As Double   ' 当前时间(每天00:00过去的秒数)
Public Gui_nAdvertIndex         As Integer  ' 当前广告序号
Public Gui_szQuotes(1 To QUOTE_NUM) As String ' “名言”的条目
Public Engine_pipe          As PipeStruct   ' 引擎管道

' 从注册表加载参数
Public Sub LoadRegs()

Gui_szUpgradeVer = GetSetting("XQWizard", "Gui", "UpgradeVer", STRING_VERSION)
Gui_szUpgradeDate = GetSetting("XQWizard", "Gui", "UpgradeDate", "")
Gui_szAdvertDate = GetSetting("XQWizard", "Gui", "AdvertDate", "")
Gui_nBoard = Str2Int(GetSetting("XQBooth", "Gui", "Board", "0"), 0, BOARD_MAX - 1)
Gui_nPieces = Str2Int(GetSetting("XQBooth", "Gui", "Pieces", "0"), 0, PIECES_MAX - 1)
Gui_bSounds = GetSetting("XQBooth", "Gui", "Sounds", "1") <> "0"
Gui_nLast = Str2Int(GetSetting("XQBooth", "Gui", "Last", "0"), 0, MAX_ENDGAMES - 1)
Gui_nCurr = Str2Int(GetSetting("XQBooth", "Gui", "Curr", "0"), 0, MAX_ENDGAMES - 1)

End Sub

' 保存参数到注册表
Public Sub SaveRegs()

SaveSetting "XQWizard", "Gui", "UpgradeVer", Gui_szUpgradeVer
' SaveSetting "XQWizard", "Gui", "UpgradeDate", Gui_szUpgradeDate
SaveSetting "XQWizard", "Gui", "AdvertDate", Gui_szAdvertDate
SaveSetting "XQBooth", "Gui", "Board", LTrim(Str(Gui_nBoard))
SaveSetting "XQBooth", "Gui", "Pieces", LTrim(Str(Gui_nPieces))
SaveSetting "XQBooth", "Gui", "Sounds", IIf(Gui_bSounds, "1", "0")
SaveSetting "XQBooth", "Gui", "Last", LTrim(Str(Gui_nLast))
SaveSetting "XQBooth", "Gui", "Curr", LTrim(Str(Gui_nCurr))

End Sub

' 检查更新
Public Sub CheckUpdate(Optional ByVal bManual As Boolean = False)

Dim sz As String, szWhatsNew As String, szUrl As String
sz = ""
On Error Resume Next
sz = frmHide.Inet.OpenURL("http://mirror.elephantbase.net/xqwizard/version_simp.php")
On Error GoTo 0
If sz = "" Then
    If bManual Then
        MsgBox "无法访问 www.elephantbase.net，请稍后再试。", vbExclamation
    End If
Else
    Gui_szUpgradeDate = Date ' 如果访问升级信息成功，那么当天就不再访问升级信息
    SaveSetting "XQWizard", "Gui", "UpgradeDate", Gui_szUpgradeDate ' 立即写注册表，避免重开窗口导致的重复访问
    If Val(sz) > Val(STRING_VERSION) + 0.005 And (bManual Or Val(sz) > Val(Gui_szUpgradeVer) + 0.005) Then
        szWhatsNew = ""
        On Error Resume Next
        szWhatsNew = frmHide.Inet.OpenURL("http://mirror.elephantbase.net/xqwizard/whatsnew_simp.txt")
        On Error GoTo 0
        If MsgBox(IIf(szWhatsNew = "", "象棋巫师 " + sz + " 已经发布，需要下载最新版本吗？", szWhatsNew), vbQuestion + vbYesNo) = vbYes Then
            szUrl = ""
            On Error Resume Next
            szUrl = frmHide.Inet.OpenURL("http://mirror.elephantbase.net/xqwizard/download_simp.txt")
            On Error GoTo 0
            If Left(szUrl, 7) <> "http://" Then
                szUrl = "http://www.elephantbase.net/xqwizard/download.htm"
            End If
            ShellExecuteA 0, vbNullString, szUrl, vbNullString, vbNullString, SW_SHOWNORMAL
        Else
            Gui_szUpgradeVer = sz
        End If
    Else
        If bManual Then
            MsgBox "您的“象棋巫师”已经是最新版本了。", vbInformation
        End If
    End If
End If

End Sub

' 加载名言
Public Sub LoadTips()

Gui_szQuotes(1) = "　　子曰：“学而时习之，不亦说乎？有朋自远方来，不亦乐乎？人不知而不愠，不亦君子乎？”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·学而》"
Gui_szQuotes(2) = "　　子贡问曰：“有一言而可以终身行之者乎？”子曰：“其恕乎！己所不欲，勿施於人。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·卫灵公》"
Gui_szQuotes(3) = "　　或曰：“以德报怨，何如？”子曰：“何以报德？以直报怨，以德报德。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·宪问》"
Gui_szQuotes(4) = "　　子夏曰：“博学而笃志，切问而近思；仁在其中矣。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·子张》"
Gui_szQuotes(5) = "　　子曰：“不患人之不己知，患不知人也。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·学而》"
Gui_szQuotes(6) = "　　子曰：“三人行，必有我师焉：择其善者而从之，其不善者而改之。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《论语·述而》"
Gui_szQuotes(7) = "　　将欲歙之，必固张之；将欲弱之，必固强之；将欲废之，必固兴之；将欲取之，必固与之。是谓微明。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第三十六章》"
Gui_szQuotes(8) = "　　柔弱胜刚强。鱼不可脱于渊，国之利器不可以示人。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第三十六章》"
Gui_szQuotes(9) = "　　图难于其易；为大于其细。天下难事，必作于易；天下大事，必作于细。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第六十三章》"
Gui_szQuotes(10) = "　　合抱之木，生于毫末；九层之台，起于累土；千里之行，始于足下。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第六十四章》"
Gui_szQuotes(11) = "　　知彼知己，胜乃不殆；知天知地，胜乃可全。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《孙子兵法·地形》"
Gui_szQuotes(12) = "　　怒可以复喜，愠可以复说，亡国不可以复存，死者不可以复生。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《孙子兵法·火攻》"

End Sub

' 主函数
Public Sub Main()

Dim i As Integer, nFileNo As Integer, bLoaded As Boolean
Dim sz As String, lpStr As Long
Dim dfThisTime As Double, dfLastTime As Double

' 初始化
App_szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")
CchessInit
LoadRegs
LoadTips

' 加载残局
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath + ENDGAME_FILE For Input As #nFileNo
On Error GoTo 0
App_nEndgames = 0
Do While App_nEndgames < MAX_ENDGAMES And Not EOF(nFileNo)
    Line Input #nFileNo, sz
    i = InStr(sz, ";")
    If i > 0 Then
        App_szEndgames(App_nEndgames) = RTrim(Left(sz, i - 1))
        App_nEndgames = App_nEndgames + 1
    Else
        sz = RTrim(sz)
        If sz <> "" Then
            App_szEndgames(App_nEndgames) = sz
            App_nEndgames = App_nEndgames + 1
        End If
    End If
Loop
Close #nFileNo
If App_nEndgames = 0 Then
    MsgBox "无法打开文件 " + App_szPath + ENDGAME_FILE, vbExclamation
    Exit Sub
End If
If Gui_nLast >= App_nEndgames Then
    Gui_nLast = App_nEndgames - 1
End If
If Gui_nCurr > Gui_nLast Then
    Gui_nCurr = Gui_nLast
End If

' 加载引擎
PipeOpen Engine_pipe, App_szPath + ENGINE_FILE
PipeLineOutput Engine_pipe, "ucci"
dfLastTime = Timer
bLoaded = False
Do While Not bLoaded
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        If dfThisTime > dfLastTime + 10# Then
            Exit Do
        End If
    Else
        sz = AllocString(lpStr)
        If sz = "ucciok" Then
            bLoaded = True
        End If
    End If
Loop
If Not bLoaded Then
    PipeLineOutput Engine_pipe, "quit"
    PipeClose Engine_pipe
    MsgBox "无法加载引擎 " + App_szPath + ENGINE_FILE, vbExclamation
    Exit Sub
End If
' 电脑执黑，不能只考虑将军走法
' PipeLineOutput Engine_pipe, "setoption alwayscheck true"

' 加载广告，如果加载失败，则下载广告列表，再次加载失败则放弃
Gui_dfLastTime = 0#
Gui_nAdvertIndex = 0
Gui_nAdvertTimes(0) = 10 ' 10秒钟后开始播放广告
LoadAdvertList
If Gui_nAdvertNum = 0 Then
    DownloadAdvertList
    LoadAdvertList
    If Gui_nAdvertNum = 0 Then
        Gui_nAdvertNum = 1
        Gui_szAdvertFiles(1) = "elephantbase"
        Gui_nAdvertTimes(1) = 32767
    Else
        Gui_szAdvertDate = Date
    End If
End If
' 检查更新，如果用户决定更新，会弹出下载页面，出现在象棋巫师页面之前
If Gui_szUpgradeDate <> Date Then
    CheckUpdate
End If

frmXQBooth.Show
frmXQBooth.mnOptionsSounds.Checked = Gui_bSounds
frmXQBooth.web.Navigate2 App_szPath + "ADVERT\elephantbase.htm"

' 主循环
App_bRunning = True
Do While App_bRunning
    ' 播放广告可以跟引擎和播放棋局同时进行，所以不能用 Timer_dfLastTime，而是用 Gui_dfLastTime
    dfThisTime = Timer
    dfThisTime = dfThisTime + IIf(dfThisTime < Gui_dfLastTime, 86400#, 0#)
    If dfThisTime > Gui_dfLastTime + Gui_nAdvertTimes(Gui_nAdvertIndex) Then
        Gui_dfLastTime = Timer
        Gui_nAdvertIndex = Gui_nAdvertIndex + 1
        If Gui_nAdvertIndex > Gui_nAdvertNum Then
            Gui_nAdvertIndex = 1
        End If
        frmXQBooth.web.Navigate2 App_szPath + "ADVERT\" + Gui_szAdvertFiles(Gui_nAdvertIndex) + ".htm"
    End If
    DoEvents
    Sleep 1
Loop
' 退出前下载广告列表
If Gui_szAdvertDate <> Date Then
    DownloadAdvertList
    LoadAdvertList
    If Gui_nAdvertNum > 0 Then
        Gui_szAdvertDate = Date
    End If
End If
' 关闭引擎
PipeLineOutput Engine_pipe, "quit"
dfLastTime = Timer
Do While bLoaded
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        If dfThisTime > dfLastTime + 1# Then
            Exit Do
        End If
    Else
        sz = AllocString(lpStr)
        If sz = "bye" Then
            bLoaded = False
        End If
    End If
Loop
PipeClose Engine_pipe
If bLoaded Then
    MsgBox "无法正常卸载引擎！", vbExclamation
End If
' 退出
SaveRegs
PlaySoundA vbNullString, 0, 0
Unload frmHide

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "无法打开文件 " + App_szPath + ENDGAME_FILE, vbExclamation

End Sub
