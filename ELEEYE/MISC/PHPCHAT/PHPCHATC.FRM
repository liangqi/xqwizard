VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmPHPChat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "PHPChat Client"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "ËÎÌו"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   MaxButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin InetCtlsObjects.Inet inet 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.CommandButton btnSettings 
      Caption         =   "Settings"
      Height          =   375
      Left            =   2400
      TabIndex        =   4
      Top             =   2760
      Width           =   975
   End
   Begin VB.CommandButton btnExit 
      Cancel          =   -1  'True
      Caption         =   "Exit"
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      Top             =   2760
      Width           =   855
   End
   Begin VB.CommandButton btnSend 
      Caption         =   "Send"
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   2760
      Width           =   855
   End
   Begin VB.CommandButton btnClear 
      Caption         =   "Clear"
      Height          =   375
      Left            =   1320
      TabIndex        =   3
      Top             =   2760
      Width           =   855
   End
   Begin VB.TextBox txtSend 
      Height          =   495
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   2160
      Width           =   4455
   End
   Begin VB.TextBox txtRecv 
      Height          =   1935
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "frmPHPChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' PHPChat Client - A NetMeeting Client Program
' Designed by Morning Yellow, Version: 1.0, Last Modified: Sep. 2006
' Copyright (C) 2004-2006 www.elephantbase.net
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

Private Sub Form_UnLoad(nCancel As Integer)

Logoff

End Sub

Private Sub txtSend_KeyDown(nKeyCode As Integer, nShift As Integer)

If nKeyCode = vbKeyReturn And (nShift And vbCtrlMask) <> 0 Then
    btnSend_Click
    txtSend.Locked = True
End If

End Sub

Private Sub txtSend_KeyUp(nKeyCode As Integer, nShift As Integer)

If txtSend.Locked Then
    txtSend.Locked = False
End If

End Sub

Private Sub btnSend_Click()

Send txtSend.Text
txtSend.Text = ""

End Sub

Private Sub btnClear_Click()

txtRecv.Text = ""

End Sub

Private Sub btnSettings_Click()

frmSettings.Show vbModal, Me
If App_bUpdated Then
    Set_nMessageId = Str2Lng(GetSetting("PHPChat", "Room", Set_szChatRoom + "@" + Set_szServerUrl, "0"), 0)
    Logon True, Me
End If

End Sub

Private Sub btnExit_Click()

Unload Me

End Sub
