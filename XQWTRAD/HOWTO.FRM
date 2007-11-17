VERSION 5.00
Begin VB.Form frmHowTo 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "ら縩る仓"
   ClientHeight    =   3210
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "細明體"
      Size            =   9
      Charset         =   136
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "HOWTO.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3210
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "闽超"
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      Top             =   2760
      Width           =   855
   End
   Begin VB.CommandButton btnNext 
      Caption         =   "兵 >"
      Height          =   375
      Left            =   2520
      TabIndex        =   4
      Top             =   2760
      Width           =   975
   End
   Begin VB.CommandButton btnPrev 
      Caption         =   "< 兵"
      Height          =   375
      Left            =   1440
      TabIndex        =   3
      Top             =   2760
      Width           =   975
   End
   Begin VB.CheckBox chkShowHowTo 
      Caption         =   "币笆陪ボ"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   2760
      Width           =   1215
   End
   Begin VB.TextBox txtTips 
      BeginProperty Font 
         Name            =   "細明體"
         Size            =   12
         Charset         =   136
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   600
      Width           =   4455
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Left            =   120
      Picture         =   "HOWTO.frx":000C
      Top             =   0
      Width           =   480
   End
   Begin VB.Label lblDoYouKnow 
      Caption         =   "笵盾"
      BeginProperty Font 
         Name            =   "細明體"
         Size            =   15
         Charset         =   136
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   720
      TabIndex        =   0
      Top             =   120
      Width           =   3855
   End
End
Attribute VB_Name = "frmHowTo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' HOWTO.FRM - Source Code for XiangQi Wizard, Part VIII
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 3.51, Last Modified: Nov. 2007
' Copyright (C) 2004-2007 www.elephantbase.net
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

Private Const cszPromotion As String = "　　中國象棋在增加了仕(士)相(象)升變成兵(卒)的規則後，比賽將更富有趣味性和觀賞性。這個規則有以下几個要點：" + vbCrLf + _
        "　　一、仕(士)相(象)只能在原來的位置，或走到另一個仕(士)相(象)的原來位置升變；" + vbCrLf + _
        "　　二、仕(士)相(象)升變成兵(卒)需要花一步棋，變成的兵(卒)占据原來仕(士)相(象)的位置，下一步棋才能走；" + vbCrLf + _
        "　　三、升變是不可逆的，即兵(卒)不能變回仕(士)相(象)；" + vbCrLf + _
        "　　四、升變後的兵(卒)同其他兵(卒)的走法一樣，過河前每步只能前行一格，過河後才能橫走；" + vbCrLf + _
        "　　五、只有本方兵(卒)少于五個時，仕(士)相(象)才能升變成兵(卒)。" + vbCrLf + vbCrLf + _
        "　　超級象棋巫師的升變走法非常簡單，選中可以升變的仕(士)或相(象)，點擊“升變”按鈕。" + vbCrLf + _
        "　　如果您不喜歡這個新規則，請運行“象棋巫師”而不是“超級象棋巫師”，不帶“超級”的“象棋巫師”將不會出現任何非傳統的象棋走法。" + vbCrLf + _
        "　　《象棋百科全書》网站推廣仕(士)相(象)升變成兵(卒)的規則，僅僅是為增加中國象棋的趣味性和觀賞性所做的嘗試性的探索。" + vbCrLf + _
        "　　您是否需要了解仕(士)相(象)升變成兵(卒)的規則的來龍去脈？"

Private Sub Form_Load()

chkShowHowTo.Value = IIf(Gui_bShowHowTo, 1, 0)
txtTips.Text = Gui_szTips(Gui_nTipIndex)
If App_bPromotion Then
    If MsgBox(cszPromotion, vbQuestion + vbYesNo, "關于仕(士)相(象)升變成兵(卒)的規則") = vbYes Then
        ShellExecuteA 0, vbNullString, App_szPath + "HELP\PROMOTE.HTM", vbNullString, vbNullString, SW_SHOWNORMAL
    End If
End If

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

Gui_bShowHowTo = (chkShowHowTo.Value = 1)

End Sub

Private Sub btnPrev_Click()

Gui_nTipIndex = Gui_nTipIndex - 1
If Gui_nTipIndex < 1 Then
    Gui_nTipIndex = TIP_NUM
End If
txtTips.Text = Gui_szTips(Gui_nTipIndex)

End Sub

Private Sub btnNext_Click()

Gui_nTipIndex = Gui_nTipIndex + 1
If Gui_nTipIndex > TIP_NUM Then
    Gui_nTipIndex = 1
End If
txtTips.Text = Gui_szTips(Gui_nTipIndex)

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
