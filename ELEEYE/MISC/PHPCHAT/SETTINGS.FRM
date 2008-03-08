VERSION 5.00
Begin VB.Form frmSettings 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Settings"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "ËÎÌו"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "SETTINGS.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnReset 
      Caption         =   "Reset"
      Height          =   375
      Left            =   360
      TabIndex        =   19
      Top             =   2760
      Width           =   1095
   End
   Begin VB.TextBox txtLogoff 
      Height          =   285
      Left            =   1080
      TabIndex        =   15
      Top             =   1920
      Width           =   3495
   End
   Begin VB.CheckBox chkSend 
      Caption         =   "Send"
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   1560
      Width           =   855
   End
   Begin VB.TextBox txtSend 
      Height          =   285
      Left            =   1080
      TabIndex        =   13
      Top             =   1560
      Width           =   3495
   End
   Begin VB.TextBox txtLogon 
      Height          =   285
      Left            =   1080
      TabIndex        =   11
      Top             =   1200
      Width           =   3495
   End
   Begin VB.CheckBox chkLogoff 
      Caption         =   "Logoff"
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   1920
      Width           =   855
   End
   Begin VB.CheckBox chkLogon 
      Caption         =   "Logon"
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   1200
      Width           =   855
   End
   Begin VB.CheckBox chkBeep 
      Caption         =   "Beep"
      Height          =   300
      Left            =   3720
      TabIndex        =   9
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton btnClearLog 
      Caption         =   "Clear Log"
      Height          =   375
      Left            =   3240
      TabIndex        =   18
      Top             =   2280
      Width           =   1095
   End
   Begin VB.TextBox txtMyName 
      Height          =   285
      Left            =   1080
      TabIndex        =   7
      Top             =   840
      Width           =   1695
   End
   Begin VB.TextBox txtChatRoom 
      Height          =   285
      Left            =   1080
      TabIndex        =   3
      Top             =   480
      Width           =   1695
   End
   Begin VB.TextBox txtServerUrl 
      Height          =   285
      Left            =   1080
      TabIndex        =   1
      Top             =   120
      Width           =   3495
   End
   Begin VB.CheckBox chkFocus 
      Caption         =   "Focus"
      Height          =   300
      Left            =   2880
      TabIndex        =   8
      Top             =   840
      Width           =   855
   End
   Begin VB.ComboBox optRefresh 
      Height          =   300
      ItemData        =   "SETTINGS.frx":000C
      Left            =   3600
      List            =   "SETTINGS.frx":000E
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   480
      Width           =   975
   End
   Begin VB.CheckBox chkMsgLogs 
      Caption         =   "Message Logs"
      Height          =   255
      Left            =   120
      TabIndex        =   16
      Top             =   2280
      Width           =   1455
   End
   Begin VB.CommandButton btnViewLog 
      Caption         =   "View Log"
      Height          =   375
      Left            =   1800
      TabIndex        =   17
      Top             =   2280
      Width           =   1095
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3240
      TabIndex        =   21
      Top             =   2760
      Width           =   1095
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "OK"
      Height          =   375
      Left            =   1800
      TabIndex        =   20
      Top             =   2760
      Width           =   1095
   End
   Begin VB.Label lblMyName 
      Alignment       =   1  'Right Justify
      Caption         =   "My Name"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   840
      Width           =   735
   End
   Begin VB.Label lblChatRoom 
      Alignment       =   1  'Right Justify
      Caption         =   "Chat Room"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   855
   End
   Begin VB.Label lblServerUrl 
      Alignment       =   1  'Right Justify
      Caption         =   "Server URL"
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
   Begin VB.Label lblRefresh 
      Caption         =   "Refresh"
      Height          =   255
      Left            =   2880
      TabIndex        =   4
      Top             =   480
      Width           =   735
   End
End
Attribute VB_Name = "frmSettings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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

Private Const SW_SHOWNORMAL As Long = 1
Private Declare Sub ShellExecuteA Lib "SHELL32.DLL" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long)

Private Sub Form_Load()

optRefresh.Clear
optRefresh.AddItem "10 Sec", 0
optRefresh.AddItem "30 Sec", 1
optRefresh.AddItem "60 Sec", 2

txtServerUrl.Text = Set_szServerUrl
txtChatRoom.Text = Set_szChatRoom
txtMyName.Text = Set_szMyName
optRefresh.ListIndex = Set_nRefresh
chkFocus.Value = IIf(Set_bFocus, 1, 0)
chkBeep.Value = IIf(Set_bBeep, 1, 0)
chkLogon.Value = IIf(Set_bLogon, 1, 0)
chkSend.Value = IIf(Set_bSend, 1, 0)
chkLogoff.Value = IIf(Set_bLogoff, 1, 0)
chkMsgLogs.Value = IIf(Set_bMsgLogs, 1, 0)
txtLogon.Text = Set_szLogon
txtSend.Text = Set_szSend
txtLogoff.Text = Set_szLogoff

End Sub

Private Sub btnViewLog_Click()

ShellExecuteA 0, vbNullString, App_szPath + "PHPCHATC.LOG", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnClearLog_Click()

Dim nLogFileNo As Integer
nLogFileNo = FreeFile
On Error Resume Next
Open App_szPath + "PHPCHATC.LOG" For Output As #nLogFileNo
Close #nLogFileNo
On Error GoTo 0

End Sub

Private Sub btnReset_Click()

Set_nMessageId = 0
SaveSetting "PHPChat", "Room", Set_szChatRoom + "@" + Set_szServerUrl, LTrim(Str(Set_nMessageId))

End Sub

Private Sub btnConfirm_Click()

If txtServerUrl.Text = Set_szServerUrl And txtChatRoom.Text = Set_szChatRoom Then
    App_bUpdated = False
Else
    App_bUpdated = True
    If App_bLogon Then
        Logoff
    End If
End If
Set_szServerUrl = txtServerUrl.Text + IIf(Right(txtServerUrl.Text, 1) = "/", "", "/")
Set_szChatRoom = txtChatRoom.Text
Set_szMyName = txtMyName.Text
Set_nRefresh = optRefresh.ListIndex
Set_bFocus = (chkFocus.Value = 1)
Set_bBeep = (chkBeep.Value = 1)
Set_bLogon = (chkLogon.Value = 1)
Set_bSend = (chkSend.Value = 1)
Set_bLogoff = (chkLogoff.Value = 1)
Set_bMsgLogs = (chkMsgLogs.Value = 1)
Set_szLogon = txtLogon.Text
Set_szSend = txtSend.Text
Set_szLogoff = txtLogoff.Text
Unload Me
    
End Sub

Private Sub btnCancel_Click()

App_bUpdated = False
Unload Me

End Sub
