Attribute VB_Name = "mdlXQBooth"
' XQBOOTH.BAS - Source Code for XiangQi Booth, Part I
'
' XiangQi Booth - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 3.89, Last Modified: Jan. 2009
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
Public Const STRING_VERSION     As String = "3.89"
Public Const MAX_ADVERTS        As Integer = 100    ' 广告的最大条目数
Public Const MAX_ENDGAMES       As Integer = 4096   ' 残局的最大条目数
Public Const ENDGAME_FILE       As String = "ENDGAMES\BOOTH.EPD"    ' 残局文件
Public Const ENGINE_FILE        As String = "ELEEYE.EXE"    ' 引擎文件

' 全局变量
Public App_szPath               As String   ' 主程序所在的文件夹，以"\"结尾
Public App_bRunning             As Boolean  ' 程序运行标志，启动时设成True，如果是False，则跳出事件检测循环
Public App_nEndgames            As Integer  ' 读入的残局数量
Public App_szEndgames(0 To MAX_ENDGAMES - 1) As String  ' 读入的残局
Public Gui_szUpgradeVer         As String   ' 检查升级的版本
Public Gui_szUpgradeDate        As String   ' 检查升级的日期
Public Gui_nCurr                As Integer  ' 当前残局的条目序号
Public Gui_nLast                As Integer  ' 最后残局的条目序号
Public Gui_szAdvertDate         As String   ' 检查广告的日期
Public Gui_dfLastTime           As Double   ' 当前时间(每天00:00过去的秒数)
Public Gui_nAdvertNum           As Integer  ' 广告数量
Public Gui_nAdvertIndex         As Integer  ' 当前广告序号
Public Gui_szAdvertFiles(1 To MAX_ADVERTS) As String ' 每个广告的文件
Public Gui_nAdvertTimes(0 To MAX_ADVERTS) As Integer ' 每个广告的时间(秒)
Public Engine_pipe          As PipeStruct   ' 引擎管道

' 下载广告列表
Public Sub DownloadAdvertList()

Dim buffer() As Byte, nFileNo As Integer, sz As String
nFileNo = FreeFile
On Error GoTo lnErrorOpen
sz = frmHide.Inet.OpenURL("http://www.elephantbase.net/xqwizard/advert.txt")
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

' 获取文件长度
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

' 检查广告(htm和gif文件)
Public Sub CheckAdvert(ByVal szFileName As String, ByVal nHtmSize As Long, ByVal nGifSize As Long)

Dim nFileNo As Integer, sz As String, buffer() As Byte
' 判断文件字节数，如果跟广告列表中的一致，就不需要下载了
If GetFileSize(App_szPath + "ADVERT\" + szFileName + ".htm") = nHtmSize Then
    If GetFileSize(App_szPath + "ADVERT\" + szFileName + ".gif") = nGifSize Then
        Exit Sub
    End If
End If

nFileNo = FreeFile
' 下载htm文件，文本方式
On Error GoTo lnErrorOpen
sz = frmHide.Inet.OpenURL("http://www.elephantbase.net/xqwizard/" + szFileName + ".htm")
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
' 下载gif文件，二进制方式
On Error GoTo lnErrorOpen
buffer() = frmHide.Inet.OpenURL("http://www.elephantbase.net/xqwizard/" + szFileName + ".gif", icByteArray)
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

' 加载广告列表
Public Sub LoadAdvertList()

Dim nFileNo As Integer, sz As String, szs() As String
' 检查广告文件是否有内容
Gui_nAdvertNum = 0
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath + "ADVERT\advert.txt" For Input As #nFileNo
On Error GoTo 0
If EOF(nFileNo) Then
    Close #nFileNo
    Exit Sub
End If
' 检查广告文件是否正确
Line Input #nFileNo, sz
If sz <> "XQWizard Advert List" Then
    Close #nFileNo
    Exit Sub
End If
' 逐一读取广告
Do While Not EOF(nFileNo)
    Line Input #nFileNo, sz
    ' 每一行包含的信息有：文件名，播放时间，htm文件大小，gif文件大小
    ' 四项用逗号隔开，如“elephantbase,10,183,5618”
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

' 从注册表加载参数
Public Sub LoadRegs()

Gui_szUpgradeVer = GetSetting("XQWizard", "Gui", "UpgradeVer", STRING_VERSION)
Gui_szUpgradeDate = GetSetting("XQWizard", "Gui", "UpgradeDate", "")
Gui_szAdvertDate = GetSetting("XQWizard", "Gui", "AdvertDate", "")
Gui_nLast = Str2Int(GetSetting("XQBooth", "Gui", "Last", "0"), 0, MAX_ENDGAMES - 1)
Gui_nCurr = Str2Int(GetSetting("XQBooth", "Gui", "Curr", "0"), 0, MAX_ENDGAMES - 1)

End Sub

' 保存参数到注册表
Public Sub SaveRegs()

SaveSetting "XQWizard", "Gui", "UpgradeVer", Gui_szUpgradeVer
SaveSetting "XQWizard", "Gui", "UpgradeDate", Gui_szUpgradeDate
SaveSetting "XQWizard", "Gui", "AdvertDate", Gui_szAdvertDate
SaveSetting "XQBooth", "Gui", "Last", LTrim(Str(Gui_nLast))
SaveSetting "XQBooth", "Gui", "Curr", LTrim(Str(Gui_nCurr))

End Sub

' 检查更新
Public Sub CheckUpdate()

Dim sz As String, szWhatsNew As String, szUrl As String
sz = ""
On Error Resume Next
sz = frmHide.Inet.OpenURL("http://mirror.elephantbase.net/xqwizard/version_simp.php")
On Error GoTo 0
If sz = "" Then
    Exit Sub
End If
Gui_szUpgradeDate = Date ' 如果访问升级信息成功，那么当天就不再访问升级信息
If Not (Val(sz) > Val(STRING_VERSION) + 0.005 And Val(sz) > Val(Gui_szUpgradeVer) + 0.005) Then
    Exit Sub
End If
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
        sz = MkBStr(lpStr)
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

' 调整广告框大小
On Error Resume Next
frmHide.imgAdvert.Picture = LoadPicture(App_szPath + "ADVERT\elephantbase.gif")
On Error GoTo 0
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
frmXQBooth.frmWeb.Width = frmHide.imgAdvert.Width
frmXQBooth.frmWeb.Height = frmHide.imgAdvert.Height
frmXQBooth.web.Navigate "file://" + App_szPath + "ADVERT\elephantbase.htm"

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
        frmXQBooth.web.Navigate "file://" + App_szPath + "ADVERT\" + Gui_szAdvertFiles(Gui_nAdvertIndex) + ".htm"
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
        sz = MkBStr(lpStr)
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
PlaySoundA 0, 0, 0
Unload frmHide

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "无法打开文件 " + App_szPath + ENDGAME_FILE, vbExclamation

End Sub
