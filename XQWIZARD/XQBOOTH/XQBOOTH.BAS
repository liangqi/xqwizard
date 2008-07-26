Attribute VB_Name = "mdlXQBooth"
' XQBOOTH.BAS - Source Code for XiangQi Booth, Part I
'
' XiangQi Booth - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 1.0, Last Modified: Jul. 2008
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
Public Const MAX_ADVERTS        As Integer = 100  ' 广告的最大条目数

' 全局变量
Public App_szPath               As String   ' 主程序所在的文件夹，以"\"结尾
Public App_bRunning             As Boolean  ' 程序运行标志，启动时设成True，如果是False，则跳出事件检测循环
Public Gui_szAdvertDate         As String   ' 检查广告的日期
Public Gui_dfLastTime           As Double   ' 当前时间(每天00:00过去的秒数)
Public Gui_nAdvertNum           As Integer  ' 广告数量
Public Gui_nAdvertIndex         As Integer  ' 当前广告序号
Public Gui_szAdvertFiles(1 To MAX_ADVERTS) As String ' 每个广告的文件
Public Gui_nAdvertTimes(0 To MAX_ADVERTS) As Integer ' 每个广告的时间(秒)

' 从注册表加载参数
Public Sub LoadRegs()

Gui_szAdvertDate = GetSetting("XQBooth", "Gui", "AdvertDate", "")

End Sub

' 保存参数到注册表
Public Sub SaveRegs()

SaveSetting "XQBooth", "Gui", "AdvertDate", Gui_szAdvertDate

End Sub

' 下载广告列表
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
' 下载gif文件，二进制方式
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

' 加载广告列表
Public Sub LoadAdvertList()

Dim nFileNo As Integer, sz As String, szs() As String
Gui_nAdvertNum = 0
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath + "ADVERT\advert.txt" For Input As #nFileNo
On Error GoTo 0
If Not EOF(nFileNo) Then
    Line Input #nFileNo, sz
    If sz = "XQWizard Advert List" Then
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
                        If UBound(szs) >= 4 Then
                            sz = ""
                            On Error Resume Next
                            sz = frmHide.inet.OpenURL("http://www.elephantbase.net/xqwizard/advert_online.txt")
                            On Error GoTo 0
                            If Left(sz, 15) <> "XQWizard Advert" Then
                                Gui_nAdvertNum = Gui_nAdvertNum - 1
                            End If
                        End If
                    End If
                Else
                    Gui_nAdvertTimes(Gui_nAdvertNum) = 10
                End If
            End If
        Loop
    End If
End If
Close #nFileNo

lnErrorOpen:
On Error GoTo 0

End Sub

' 主函数
Public Sub Main()

Dim i As Integer
Dim dfThisTime As Double

' 初始化
App_szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")
CchessInit
LoadRegs
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
frmXQBooth.Show
frmXQBooth.frmWeb.Width = frmHide.imgAdvert.Width
frmXQBooth.frmWeb.Height = frmHide.imgAdvert.Height
frmXQBooth.web.Navigate "file://" + App_szPath + "ADVERT\elephantbase.htm"

' 测试
For i = 0 To 89
    frmXQBooth.imgSquares(i).Picture = frmHide.imgPieces(i Mod 30).Picture
Next

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
SaveRegs
PlaySoundA 0, 0, 0
Unload frmHide

End Sub
