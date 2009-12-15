Attribute VB_Name = "mdlAdvert"
' ADVERT.BAS - Source Code for XiangQi Wizard & XiangQi Witchcraft School
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' XiangQi Witchcraft School - a Chinese Chess Endgame Challenge Game
' Designed by Morning Yellow, Version: 4.50, Last Modified: Jan. 2010
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

Public Const MAX_ADVERTS    As Integer = 100            ' 最大广告数

Public Gui_nAdvertNum As Integer                        ' 广告数量
Public Gui_nAdvertTimes(0 To MAX_ADVERTS) As Integer    ' 广告时间
Public Gui_szAdvertFiles(1 To MAX_ADVERTS) As String    ' 广告列表

' 下载广告列表
Public Sub DownloadAdvertList(ByVal szAdvertFile As String)

Dim buffer() As Byte, nFileNo As Integer, sz As String
nFileNo = FreeFile
On Error GoTo lnErrorOpen
sz = frmHide.inet.OpenURL("http://www.xqbase.com/advert/" & szAdvertFile)
On Error GoTo 0
If sz <> "" Then
    On Error Resume Next
    MkDir App_szPath & "ADVERT"
    On Error GoTo lnErrorOpen
    Open App_szPath & "ADVERT\advert.txt" For Output As #nFileNo
    On Error GoTo 0
    sz = Replace(sz, Chr(10), vbCrLf)
    sz = Replace(sz, Chr(13) & vbCrLf, vbCrLf)
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
If GetFileSize(App_szPath & "ADVERT\" & szFileName & ".htm") = nHtmSize Then
    If GetFileSize(App_szPath & "ADVERT\" & szFileName & ".gif") = nGifSize Then
        Exit Sub
    End If
End If

nFileNo = FreeFile
' 下载htm文件，文本方式
On Error GoTo lnErrorOpen
sz = frmHide.inet.OpenURL("http://www.xqbase.com/advert/" & szFileName & ".htm")
On Error GoTo 0
If sz <> "" Then
    On Error GoTo lnErrorOpen
    Open App_szPath & "ADVERT\" & szFileName & ".htm" For Output As #nFileNo
    On Error GoTo 0
    sz = Replace(sz, Chr(10), vbCrLf)
    sz = Replace(sz, Chr(13) & vbCrLf, vbCrLf)
    Print #nFileNo, sz;
    Close #nFileNo
End If
' 下载gif文件，二进制方式
On Error GoTo lnErrorOpen
buffer() = frmHide.inet.OpenURL("http://www.xqbase.com/advert/" & szFileName & ".gif", icByteArray)
On Error GoTo 0
If UBound(buffer) >= 0 Then
    On Error Resume Next
    Kill App_szPath & "ADVERT\" & szFileName & ".gif"
    On Error GoTo lnErrorOpen
    Open App_szPath & "ADVERT\" & szFileName & ".gif" For Binary Access Write As #nFileNo
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
Open App_szPath & "ADVERT\advert.txt" For Input As #nFileNo
On Error GoTo 0
If EOF(nFileNo) Then
    Close #nFileNo
    Exit Sub
End If
' 检查广告文件是否正确
Line Input #nFileNo, sz
If sz <> "www.xqbase.com Advert List" Then
    Close #nFileNo
    Exit Sub
End If
' 逐一读取广告
Do While Not EOF(nFileNo)
    Line Input #nFileNo, sz
    ' 每一行包含的信息有：文件名，播放时间，htm文件大小，gif文件大小
    ' 四项用逗号隔开，如“xqbase,11,111,1111”
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
