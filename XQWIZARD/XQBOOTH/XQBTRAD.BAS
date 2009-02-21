Attribute VB_Name = "mdlXQBooth"
' XQBOOTH.BAS - Source Code for XiangQi Booth, Part I
'
' XiangQi Booth - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 3.92, Last Modified: Feb. 2009
' Copyright (C) 2004-2008 www.elephantbase.net
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
Public Const STRING_VERSION     As String = "3.92"
Public Const STRING_COPYRIGHT   As String = "(C) 2004-2009 www.elephantbase.net"
Public Const QUOTE_NUM          As Integer = 12     ' 名言條目數
Public Const ICON_QUOTE         As Integer = 2      ' 名言圖標
Public Const MAX_ADVERTS        As Integer = 100    ' 廣告的最大條目數
Public Const MAX_ENDGAMES       As Integer = 4096   ' 殘局的最大條目數
Public Const ENDGAME_FILE       As String = "ENDGAMES\BOOTH.EPD"    ' 殘局文件
Public Const ENGINE_FILE        As String = "ELEEYE.EXE"    ' 引擎文件
Public Const MANUAL_UPDATE      As Boolean = True   ' CheckUpdate
' 全局常量——棋盤(小)設置選項
Public Const BOARD_WOOD       As Integer = 0
Public Const BOARD_GREEN      As Integer = 1
Public Const BOARD_WHITE      As Integer = 2
Public Const BOARD_SHEET      As Integer = 3
Public Const BOARD_CANVAS     As Integer = 4
Public Const BOARD_DROPS      As Integer = 5
Public Const BOARD_CLOUDS     As Integer = 6
Public Const BOARD_XQSTUDIO   As Integer = 7
Public Const BOARD_MOVESKY    As Integer = 8
Public Const BOARD_MRSJ       As Integer = 9
Public Const BOARD_ZMBL       As Integer = 10
Public Const BOARD_QIANHONG   As Integer = 11
Public Const BOARD_MAX        As Integer = 12
' 全局常量——棋子(小)設置選項
Public Const PIECES_WOOD      As Integer = 0
Public Const PIECES_DELICATE  As Integer = 1
Public Const PIECES_POLISH    As Integer = 2
Public Const PIECES_XQSTUDIO  As Integer = 3
Public Const PIECES_MOVESKY   As Integer = 4
Public Const PIECES_MRSJ      As Integer = 5
Public Const PIECES_ZMBL      As Integer = 6
Public Const PIECES_MAX       As Integer = 7

' 全局變量
Public App_szPath               As String   ' 主程序所在的文件夾，以"\"結尾
Public App_bRunning             As Boolean  ' 程序運行標志，啟動時設成True，如果是False，則跳出事件檢測循環
Public App_nEndgames            As Integer  ' 讀入的殘局數量
Public App_szEndgames(0 To MAX_ENDGAMES - 1) As String  ' 讀入的殘局
Public Gui_nBoard               As Integer  ' 棋盤
Public Gui_nPieces              As Integer  ' 棋子
Public Gui_bSounds              As Boolean  ' 音效
Public Gui_szUpgradeVer         As String   ' 檢查升級的版本
Public Gui_szUpgradeDate        As String   ' 檢查升級的日期
Public Gui_nCurr                As Integer  ' 當前殘局的條目序號
Public Gui_nLast                As Integer  ' 最后殘局的條目序號
Public Gui_szAdvertDate         As String   ' 檢查廣告的日期
Public Gui_dfLastTime           As Double   ' 當前時間(每天00:00過去的秒數)
Public Gui_nAdvertNum           As Integer  ' 廣告數量
Public Gui_nAdvertIndex         As Integer  ' 當前廣告序號
Public Gui_szAdvertFiles(1 To MAX_ADVERTS) As String ' 每個廣告的文件
Public Gui_nAdvertTimes(0 To MAX_ADVERTS) As Integer ' 每個廣告的時間(秒)
Public Gui_szQuotes(1 To QUOTE_NUM) As String ' “名言”的條目
Public Engine_pipe          As PipeStruct   ' 引擎管道

' 下載廣告列表
Public Sub DownloadAdvertList()

Dim buffer() As Byte, nFileNo As Integer, sz As String
nFileNo = FreeFile
On Error GoTo lnErrorOpen
sz = frmHide.inet.OpenURL("http://www.elephantbase.net/xqwizard/advert.txt")
On Error GoTo 0
If sz <> "" Then
    On Error Resume Next
    MkDir App_szPath + "ADVERT"
    On Error GoTo lnErrorOpen
    Open App_szPath + "ADVERT\advert.txt" For Output As #nFileNo
    On Error GoTo 0
    sz = Replace(sz, Chr(10), vbCrLf)
    sz = Replace(sz, Chr(13) + vbCrLf, vbCrLf)
    Print #nFileNo, sz;
    Close #nFileNo
End If

lnErrorOpen:
On Error GoTo 0

End Sub

' 獲取文件長度
Public Function GetFileSize(ByVal szFileName As String) As Long

Dim nFileNo As Integer
GetFileSize = 0
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open szFileName For Binary Access Read As #nFileNo
On Error GoTo 0
GetFileSize = LOF(nFileNo)
Close #nFileNo

lnErrorOpen:
On Error GoTo 0

End Function

' 檢查廣告(htm和gif文件)
Public Sub CheckAdvert(ByVal szFileName As String, ByVal nHtmSize As Long, ByVal nGifSize As Long)

Dim nFileNo As Integer, sz As String, buffer() As Byte
' 判斷文件字節數，如果跟廣告列表中的一致，就不需要下載了
If GetFileSize(App_szPath + "ADVERT\" + szFileName + ".htm") = nHtmSize Then
    If GetFileSize(App_szPath + "ADVERT\" + szFileName + ".gif") = nGifSize Then
        Exit Sub
    End If
End If

nFileNo = FreeFile
' 下載htm文件，文本方式
On Error GoTo lnErrorOpen
sz = frmHide.inet.OpenURL("http://www.elephantbase.net/xqwizard/" + szFileName + ".htm")
On Error GoTo 0
If sz <> "" Then
    On Error GoTo lnErrorOpen
    Open App_szPath + "ADVERT\" + szFileName + ".htm" For Output As #nFileNo
    On Error GoTo 0
    sz = Replace(sz, Chr(10), vbCrLf)
    sz = Replace(sz, Chr(13) + vbCrLf, vbCrLf)
    Print #nFileNo, sz;
    Close #nFileNo
End If
' 下載gif文件，二進制方式
On Error GoTo lnErrorOpen
buffer() = frmHide.inet.OpenURL("http://www.elephantbase.net/xqwizard/" + szFileName + ".gif", icByteArray)
On Error GoTo 0
If UBound(buffer) >= 0 Then
    On Error Resume Next
    Kill App_szPath + "ADVERT\" + szFileName + ".gif"
    On Error GoTo lnErrorOpen
    Open App_szPath + "ADVERT\" + szFileName + ".gif" For Binary Access Write As #nFileNo
    On Error GoTo 0
    Put #nFileNo, , buffer()
    Close #nFileNo
End If

lnErrorOpen:
On Error GoTo 0

End Sub

' 加載廣告列表
Public Sub LoadAdvertList()

Dim nFileNo As Integer, sz As String, szs() As String
' 檢查廣告文件是否有內容
Gui_nAdvertNum = 0
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath + "ADVERT\advert.txt" For Input As #nFileNo
On Error GoTo 0
If EOF(nFileNo) Then
    Close #nFileNo
    Exit Sub
End If
' 檢查廣告文件是否正确
Line Input #nFileNo, sz
If sz <> "XQWizard Advert List" Then
    Close #nFileNo
    Exit Sub
End If
' 逐一讀取廣告
Do While Not EOF(nFileNo)
    Line Input #nFileNo, sz
    ' 每一行包含的信息有：文件名，播放時間，htm文件大小，gif文件大小
    ' 四項用逗號隔開，如“elephantbase,10,183,5618”
    szs = Split(sz, ",")
    If UBound(szs) >= 0 Then
        Gui_nAdvertNum = Gui_nAdvertNum + 1
        Gui_szAdvertFiles(Gui_nAdvertNum) = szs(0)
        If UBound(szs) >= 1 Then
            Gui_nAdvertTimes(Gui_nAdvertNum) = Str2Int(szs(1))
            If UBound(szs) >= 3 Then
                CheckAdvert szs(0), Str2Lng(szs(2)), Str2Lng(szs(3))
            End If
        Else
            Gui_nAdvertTimes(Gui_nAdvertNum) = 10
        End If
    End If
Loop
Close #nFileNo

lnErrorOpen:
On Error GoTo 0

End Sub

' 從注冊表加載參數
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

' 保存參數到注冊表
Public Sub SaveRegs()

SaveSetting "XQWizard", "Gui", "UpgradeVer", Gui_szUpgradeVer
SaveSetting "XQWizard", "Gui", "UpgradeDate", Gui_szUpgradeDate
SaveSetting "XQWizard", "Gui", "AdvertDate", Gui_szAdvertDate
SaveSetting "XQBooth", "Gui", "Board", LTrim(Str(Gui_nBoard))
SaveSetting "XQBooth", "Gui", "Pieces", LTrim(Str(Gui_nPieces))
SaveSetting "XQBooth", "Gui", "Sounds", IIf(Gui_bSounds, "1", "0")
SaveSetting "XQBooth", "Gui", "Last", LTrim(Str(Gui_nLast))
SaveSetting "XQBooth", "Gui", "Curr", LTrim(Str(Gui_nCurr))

End Sub

' 檢查更新
Public Sub CheckUpdate(Optional ByVal bManual As Boolean = False)

Dim sz As String, szWhatsNew As String, szUrl As String
sz = ""
On Error Resume Next
sz = frmHide.inet.OpenURL("http://mirror.elephantbase.net/xqwizard/version_trad.php")
On Error GoTo 0
If sz = "" Then
    If bManual Then
        MsgBox "無法訪問 www.elephantbase.net，請稍後再試。", vbExclamation
    End If
Else
    Gui_szUpgradeDate = Date ' 如果訪問升級信息成功，那么當天就不再訪問升級信息
    If Val(sz) > Val(STRING_VERSION) + 0.005 And (bManual Or Val(sz) > Val(Gui_szUpgradeVer) + 0.005) Then
        szWhatsNew = ""
        On Error Resume Next
        szWhatsNew = frmHide.inet.OpenURL("http://mirror.elephantbase.net/xqwizard/whatsnew_trad.txt")
        On Error GoTo 0
        If MsgBox(IIf(szWhatsNew = "", "象棋巫師 " + sz + " 已經發布，需要下載最新版本嗎？", szWhatsNew), vbQuestion + vbYesNo) = vbYes Then
            szUrl = ""
            On Error Resume Next
            szUrl = frmHide.inet.OpenURL("http://mirror.elephantbase.net/xqwizard/download_trad.txt")
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
            MsgBox "您的“象棋巫師”已經是最新版本了。", vbInformation
        End If
    End If
End If

End Sub

' 加載名言
Public Sub LoadTips()

Gui_szQuotes(1) = "　　子曰：“學而時習之，不亦說乎？有朋自遠方來，不亦樂乎？人不知而不慍，不亦君子乎？”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·學而》"
Gui_szQuotes(2) = "　　子貢問曰：“有一言而可以終身行之者乎？”子曰：“其恕乎！己所不欲，勿施於人。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·衛靈公》"
Gui_szQuotes(3) = "　　或曰：“以德報怨，何如？”子曰：“何以報德？以直報怨，以德報德。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·憲問》"
Gui_szQuotes(4) = "　　子夏曰：“博學而篤志，切問而近思；仁在其中矣。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·子張》"
Gui_szQuotes(5) = "　　子曰：“不患人之不己知，患不知人也。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·學而》"
Gui_szQuotes(6) = "　　子曰：“三人行，必有我師焉：擇其善者而從之，其不善者而改之。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·述而》"
Gui_szQuotes(7) = "　　將欲歙之，必固張之；將欲弱之，必固強之；將欲廢之，必固興之；將欲取之，必固与之。是謂微明。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第三十六章》"
Gui_szQuotes(8) = "　　柔弱胜剛強。魚不可脫于淵，國之利器不可以示人。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第三十六章》"
Gui_szQuotes(9) = "　　圖難于其易；為大于其細。天下難事，必作于易；天下大事，必作于細。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第六十三章》"
Gui_szQuotes(10) = "　　合抱之木，生于毫末；九層之臺，起于累土；千里之行，始于足下。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第六十四章》"
Gui_szQuotes(11) = "　　知彼知己，胜乃不殆；知天知地，胜乃可全。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《孫子兵法·地形》"
Gui_szQuotes(12) = "　　怒可以复喜，慍可以复說，亡國不可以复存，死者不可以复生。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《孫子兵法·火攻》"

End Sub

' 主函數
Public Sub Main()

Dim i As Integer, nFileNo As Integer, bLoaded As Boolean
Dim sz As String, lpStr As Long
Dim dfThisTime As Double, dfLastTime As Double

' 初始化
App_szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")
CchessInit
LoadRegs
LoadTips

' 加載殘局
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
    MsgBox "無法打開文件 " + App_szPath + ENDGAME_FILE, vbExclamation
    Exit Sub
End If
If Gui_nLast >= App_nEndgames Then
    Gui_nLast = App_nEndgames - 1
End If
If Gui_nCurr > Gui_nLast Then
    Gui_nCurr = Gui_nLast
End If

' 加載引擎
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
        sz = MkBStr(lpStr)
        If sz = "ucciok" Then
            bLoaded = True
        End If
    End If
Loop
If Not bLoaded Then
    PipeLineOutput Engine_pipe, "quit"
    PipeClose Engine_pipe
    MsgBox "無法加載引擎 " + App_szPath + ENGINE_FILE, vbExclamation
    Exit Sub
End If
' 電腦執黑，不能只考慮將軍走法
' PipeLineOutput Engine_pipe, "setoption alwayscheck true"

' 調整廣告框大小
On Error Resume Next
frmHide.imgAdvert.Picture = LoadPicture(App_szPath + "ADVERT\elephantbase.gif")
On Error GoTo 0
' 加載廣告，如果加載失敗，則下載廣告列表，再次加載失敗則放棄
Gui_dfLastTime = 0#
Gui_nAdvertIndex = 0
Gui_nAdvertTimes(0) = 10 ' 10秒鐘后開始播放廣告
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
' 檢查更新，如果用戶決定更新，會彈出下載頁面，出現在象棋巫師頁面之前
If Gui_szUpgradeDate <> Date Then
    CheckUpdate
End If

frmXQBooth.Show
frmXQBooth.mnOptionsSounds.Checked = Gui_bSounds
frmXQBooth.frmWeb.Width = frmHide.imgAdvert.Width
frmXQBooth.frmWeb.Height = frmHide.imgAdvert.Height
frmXQBooth.web.Navigate "file://" + App_szPath + "ADVERT\elephantbase.htm"

' 主循環
App_bRunning = True
Do While App_bRunning
    ' 播放廣告可以跟引擎和播放棋局同時進行，所以不能用 Timer_dfLastTime，而是用 Gui_dfLastTime
    dfThisTime = Timer
    dfThisTime = dfThisTime + IIf(dfThisTime < Gui_dfLastTime, 86400#, 0#)
    If dfThisTime > Gui_dfLastTime + Gui_nAdvertTimes(Gui_nAdvertIndex) Then
        Gui_dfLastTime = Timer
        Gui_nAdvertIndex = Gui_nAdvertIndex + 1
        If Gui_nAdvertIndex > Gui_nAdvertNum Then
            Gui_nAdvertIndex = 1
        End If
        frmXQBooth.web.Navigate "file://" + App_szPath + "ADVERT\" + Gui_szAdvertFiles(Gui_nAdvertIndex) + ".htm"
    End If
    DoEvents
    Sleep 1
Loop
' 退出前下載廣告列表
If Gui_szAdvertDate <> Date Then
    DownloadAdvertList
    LoadAdvertList
    If Gui_nAdvertNum > 0 Then
        Gui_szAdvertDate = Date
    End If
End If
' 關閉引擎
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
        sz = MkBStr(lpStr)
        If sz = "bye" Then
            bLoaded = False
        End If
    End If
Loop
PipeClose Engine_pipe
If bLoaded Then
    MsgBox "無法正常卸載引擎！", vbExclamation
End If
' 退出
SaveRegs
PlaySoundA 0, 0, 0
Unload frmHide

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "無法打開文件 " + App_szPath + ENDGAME_FILE, vbExclamation

End Sub
