Attribute VB_Name = "mdlPHPChat"
' PHPChat Client - A NetMeeting Client Program
' Designed by Morning Yellow, Version: 1.0, Last Modified: Sep. 2006
' Copyright (C) 2004-2006 www.elephantbase.net
'
' This program is free software; you can redistribute it and/or
' modify it under the terms of the GNU General Public License
' as published by the Free Software Foundation; either version 2
' of the License, or (at your option) any later version.
'
' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.
'
' You should have received a copy of the GNU General Public License
' along with this program; if not, write to the Free Software
' Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

Option Explicit

Public Const BUFFER_LEN As Long = 65536

Public Set_szServerUrl As String, Set_szChatRoom As String, Set_szMyName As String
Public Set_nRefresh As Long, Set_bFocus As Boolean, Set_bBeep As Boolean
Public Set_bLogon As Boolean, Set_bSend As Boolean, Set_bLogoff As Boolean
Public Set_szLogon As String, Set_szSend As String, Set_szLogoff As String
Public Set_bMsgLogs As Boolean, Set_nMessageId As Long

Public App_szPath As String, App_bLogon As Boolean, App_bCtrlEnter As Boolean
Public App_bUpdated As Boolean, App_dfLastTime As Double

Private Const MB_ICONINFORMATION As Long = 64

Private Declare Sub Sleep Lib "KERNEL32.DLL" (ByVal dwMilliseconds As Long)
Private Declare Sub MessageBeep Lib "USER32.DLL" (ByVal uType As Long)
Private Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal lpString As Long) As Long
Private Declare Function SysAllocStringByteLen Lib "OLEAUT32.DLL" (ByVal psz As Long, ByVal len_ As Long) As String

Public Function Str2Lng(ByVal sz As String, Optional ByVal nMin As Long = -2147483648#, Optional ByVal nMax As Long = 2147483647) As Long

Dim df As Double
df = Val(sz)
If df < nMin Then
    Str2Lng = nMin
ElseIf df > nMax Then
    Str2Lng = nMax
Else
    Str2Lng = df
End If

End Function

Public Function Receive() As Boolean

Dim szReceived As String, szShow As String, szMessage As String
Dim nLogFileNo As Integer, bResponse As Boolean, m As Long, n As Long
szReceived = ""
On Error Resume Next
szReceived = frmPHPChat.inet.OpenURL(Set_szServerUrl + "list_message.php?room=" + UrlEncode(Set_szChatRoom) + "&message_id=" + LTrim(Set_nMessageId))
On Error GoTo 0
szShow = ""
n = InStr(szReceived, Chr(10))
Receive = False
Do While n > 0
    If n = 1 Then ' to prevent Mid(... , n - 1, ...) !
        szMessage = ""
    Else
        szMessage = Left(szReceived, n - IIf(Mid(szReceived, n - 1, 1) = Chr(13), 2, 1))
    End If
    If Left(szMessage, 11) = "message_id=" Then
        Set_nMessageId = Str2Lng(Mid(szMessage, 12))
        m = InStr(szMessage, "&message=")
        If m > 0 Then
            szShow = szShow + UrlDecode(Mid(szMessage, m + 9))
            Receive = True
        End If
    End If
    szReceived = Mid(szReceived, n + 1)
    n = InStr(szReceived, Chr(10))
Loop
frmPHPChat.txtRecv.Text = frmPHPChat.txtRecv.Text + szShow
frmPHPChat.txtRecv.SelStart = Len(frmPHPChat.txtRecv.Text)
If Set_bMsgLogs Then
    nLogFileNo = FreeFile
    On Error GoTo lnErrorOpen
    Open App_szPath + "PHPCHATC.LOG" For Append As #nLogFileNo
    On Error GoTo 0
    Print #nLogFileNo, szShow
    Close #nLogFileNo
End If
App_dfLastTime = Timer

Exit Function
lnErrorOpen:
On Error GoTo 0
App_dfLastTime = Timer

End Function

Public Sub Logon(ByVal bSettings As Boolean, Optional ByVal frm As Form = Null)

Dim bResponse As Boolean
bResponse = False
On Error GoTo lnErrorOpen
bResponse = (UCase(frmPHPChat.inet.OpenURL(Set_szServerUrl + "phpchat.php")) = "PHPCHAT")
lnErrorOpen:
On Error GoTo 0
If bResponse Then
    Set_nMessageId = Str2Lng(GetSetting("PHPChat", "Room", Set_szChatRoom + "@" + Set_szServerUrl, "0"), 0)
    If Set_bLogon Then
        On Error Resume Next
        frmPHPChat.inet.OpenURL Set_szServerUrl + "send_message.php?room=" + UrlEncode(Set_szChatRoom) + "&message=" + ParseInfo(Set_szLogon)
        On Error GoTo 0
        Sleep 100
        Receive
    End If
    App_bLogon = True
Else
    MsgBox "Server " + Chr(34) + Set_szServerUrl + Chr(34) + " not connected!", vbExclamation
    If bSettings Then
        frmSettings.Show vbModal, frm
        If App_bUpdated Then
            Logon False, frm
        End If
    End If
End If

End Sub

Public Sub Send(ByVal sz As String)

On Error Resume Next
If Set_bSend Then
    frmPHPChat.inet.OpenURL Set_szServerUrl + "send_message.php?room=" + UrlEncode(Set_szChatRoom) + "&message=" + ParseInfo(Set_szSend, sz)
Else
    frmPHPChat.inet.OpenURL Set_szServerUrl + "send_message.php?room=" + UrlEncode(Set_szChatRoom) + "&message=" + UrlEncode(sz)
End If
On Error GoTo 0
Sleep 100
Receive

End Sub

Public Sub Logoff()

If Set_bLogoff Then
    On Error Resume Next
    frmPHPChat.inet.OpenURL Set_szServerUrl + "send_message.php?room=" + UrlEncode(Set_szChatRoom) + "&message=" + ParseInfo(Set_szLogoff)
    On Error GoTo 0
    Sleep 100
    Receive
End If
SaveSetting "PHPChat", "Room", Set_szChatRoom + "@" + Set_szServerUrl, LTrim(Str(Set_nMessageId))
App_bLogon = False

End Sub

Public Function ParseInfo(ByVal sz As String, Optional ByVal szContent As String = "") As String

Dim szReturn As String
szReturn = Replace(sz, "${room}", Set_szChatRoom, , , vbTextCompare)
szReturn = Replace(szReturn, "${name}", Set_szMyName, , , vbTextCompare)
szReturn = Replace(szReturn, "${date}", Date, , , vbTextCompare)
szReturn = Replace(szReturn, "${time}", Time, , , vbTextCompare)
szReturn = Replace(szReturn, "${return}", vbCrLf, , , vbTextCompare)
szReturn = Replace(szReturn, "${message}", szContent, , , vbTextCompare)
ParseInfo = UrlEncode(szReturn)

End Function

Public Sub LoadRegs()

Set_szServerUrl = GetSetting("PHPChat", "Client", "ServerURL", "http://live.elephantbase.net/")
Set_szChatRoom = GetSetting("PHPChat", "Client", "ChatRoom", "Default Room")
Set_szMyName = GetSetting("PHPChat", "Client", "MyName", "Anonymous")
Set_nRefresh = Str2Lng(GetSetting("PHPChat", "Client", "Refresh", "0"), 0, 2)
Set_bFocus = Str2Lng(GetSetting("PHPChat", "Client", "Focus", "1")) <> 0
Set_bBeep = Str2Lng(GetSetting("PHPChat", "Client", "Beep", "1")) <> 0
Set_bLogon = Str2Lng(GetSetting("PHPChat", "Client", "Logon", "1")) <> 0
Set_bSend = Str2Lng(GetSetting("PHPChat", "Client", "Send", "1")) <> 0
Set_bLogoff = Str2Lng(GetSetting("PHPChat", "Client", "Logoff", "1")) <> 0
Set_szLogon = GetSetting("PHPChat", "Client", "LogonInfo", "[${name} Connected at ${time}]${return}")
Set_szSend = GetSetting("PHPChat", "Client", "SendInfo", "[${name} Sent at ${time}]${return}${message}${return}")
Set_szLogoff = GetSetting("PHPChat", "Client", "LogoffInfo", "[${name} Disconnected at ${time}]${return}")
Set_bMsgLogs = Str2Lng(GetSetting("PHPChat", "Client", "MsgLogs", "0")) <> 0

End Sub

Public Sub SaveRegs()

SaveSetting "PHPChat", "Client", "ServerURL", Set_szServerUrl
SaveSetting "PHPChat", "Client", "ChatRoom", Set_szChatRoom
SaveSetting "PHPChat", "Client", "MyName", Set_szMyName
SaveSetting "PHPChat", "Client", "Refresh", LTrim(Str(Set_nRefresh))
SaveSetting "PHPChat", "Client", "Focus", IIf(Set_bFocus, "1", "0")
SaveSetting "PHPChat", "Client", "Beep", IIf(Set_bBeep, "1", "0")
SaveSetting "PHPChat", "Client", "Logon", IIf(Set_bLogon, "1", "0")
SaveSetting "PHPChat", "Client", "Send", IIf(Set_bSend, "1", "0")
SaveSetting "PHPChat", "Client", "Logoff", IIf(Set_bLogoff, "1", "0")
SaveSetting "PHPChat", "Client", "LogonInfo", Set_szLogon
SaveSetting "PHPChat", "Client", "SendInfo", Set_szSend
SaveSetting "PHPChat", "Client", "LogoffInfo", Set_szLogoff
SaveSetting "PHPChat", "Client", "MsgLogs", IIf(Set_bMsgLogs, "1", "0")

End Sub

Public Sub Main()

Dim dfThisTime As Double
LoadRegs
App_szPath = App.Path
App_szPath = App_szPath + IIf(Right(App_szPath, 1) = "\", "", "\")
App_bLogon = False
frmPHPChat.Show
frmPHPChat.txtSend.SetFocus
Logon True
If App_bLogon Then
    App_dfLastTime = Timer
    App_bCtrlEnter = False
    Do While App_bLogon
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < App_dfLastTime, 86400#, 0#)
        If dfThisTime > App_dfLastTime + Choose(Set_nRefresh + 1, 10#, 30#, 60#) Then
            If Receive Then
                If Set_bFocus Then
                    frmPHPChat.SetFocus
                End If
                If Set_bBeep Then
                    MessageBeep MB_ICONINFORMATION
                End If
            End If
        End If
        Sleep 1
        DoEvents
    Loop
End If
Unload frmPHPChat
SaveRegs

End Sub
