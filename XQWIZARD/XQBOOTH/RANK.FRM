VERSION 5.00
Begin VB.Form frmRank 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "����������"
   ClientHeight    =   4440
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3090
   BeginProperty Font 
      Name            =   "����"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "RANK.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4440
   ScaleWidth      =   3090
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOK 
      Cancel          =   -1  'True
      Caption         =   "ȷ��"
      Default         =   -1  'True
      Height          =   495
      Left            =   960
      TabIndex        =   38
      Top             =   3840
      Width           =   1215
   End
   Begin VB.PictureBox pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Left            =   0
      ScaleHeight     =   2535
      ScaleWidth      =   3015
      TabIndex        =   3
      Top             =   360
      Width           =   3075
      Begin VB.VScrollBar vs 
         Height          =   2535
         LargeChange     =   9
         Left            =   2760
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   0
         Width           =   255
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   9
         Left            =   2280
         TabIndex        =   34
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   8
         Left            =   2280
         TabIndex        =   33
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   7
         Left            =   2280
         TabIndex        =   32
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   6
         Left            =   2280
         TabIndex        =   31
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   5
         Left            =   2280
         TabIndex        =   30
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   4
         Left            =   2280
         TabIndex        =   29
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   3
         Left            =   2280
         TabIndex        =   28
         Top             =   840
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   2
         Left            =   2280
         TabIndex        =   27
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   1
         Left            =   2280
         TabIndex        =   26
         Top             =   360
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   0
         Left            =   2280
         TabIndex        =   25
         Top             =   120
         Width           =   375
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   9
         Left            =   480
         TabIndex        =   24
         Top             =   2280
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   8
         Left            =   480
         TabIndex        =   23
         Top             =   2040
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   7
         Left            =   480
         TabIndex        =   22
         Top             =   1800
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   6
         Left            =   480
         TabIndex        =   21
         Top             =   1560
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   5
         Left            =   480
         TabIndex        =   20
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   4
         Left            =   480
         TabIndex        =   19
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   3
         Left            =   480
         TabIndex        =   18
         Top             =   840
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   2
         Left            =   480
         TabIndex        =   17
         Top             =   600
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   1
         Left            =   480
         TabIndex        =   16
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "������ʦע���û�"
         Height          =   255
         Index           =   0
         Left            =   480
         TabIndex        =   15
         Top             =   120
         Width           =   1695
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "10"
         Height          =   255
         Index           =   9
         Left            =   0
         TabIndex        =   14
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "9"
         Height          =   255
         Index           =   8
         Left            =   0
         TabIndex        =   13
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "8"
         Height          =   255
         Index           =   7
         Left            =   0
         TabIndex        =   12
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "7"
         Height          =   255
         Index           =   6
         Left            =   0
         TabIndex        =   11
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "6"
         Height          =   255
         Index           =   5
         Left            =   0
         TabIndex        =   10
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "5"
         Height          =   255
         Index           =   4
         Left            =   0
         TabIndex        =   9
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "4"
         Height          =   255
         Index           =   3
         Left            =   0
         TabIndex        =   8
         Top             =   840
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "3"
         Height          =   255
         Index           =   2
         Left            =   0
         TabIndex        =   7
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "2"
         Height          =   255
         Index           =   1
         Left            =   0
         TabIndex        =   6
         Top             =   360
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "1"
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   5
         Top             =   120
         Width           =   375
      End
   End
   Begin VB.Label lblMessage 
      Alignment       =   2  'Center
      Caption         =   "(����ĳɼ�����ӳ�������������)"
      Height          =   255
      Left            =   120
      TabIndex        =   39
      Top             =   3480
      Width           =   2895
   End
   Begin VB.Label lblScoreSelf 
      Alignment       =   1  'Right Justify
      Caption         =   "9999"
      Height          =   255
      Left            =   2400
      TabIndex        =   37
      Top             =   3120
      Width           =   375
   End
   Begin VB.Label lblScoreHeader 
      Alignment       =   1  'Right Justify
      Caption         =   "�ɼ�"
      Height          =   255
      Left            =   2160
      TabIndex        =   2
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblRankSelf 
      Alignment       =   1  'Right Justify
      Caption         =   "99999"
      Height          =   255
      Left            =   0
      TabIndex        =   35
      Top             =   3120
      Width           =   495
   End
   Begin VB.Label lblUserNameSelf 
      Alignment       =   2  'Center
      Caption         =   "������ʦע���û�"
      Height          =   255
      Left            =   600
      TabIndex        =   36
      Top             =   3120
      Width           =   1695
   End
   Begin VB.Label lblUserNameHeader 
      Alignment       =   2  'Center
      Caption         =   "ѡ��"
      Height          =   255
      Left            =   1080
      TabIndex        =   1
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblRankHeader 
      Alignment       =   1  'Right Justify
      Caption         =   "����"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   375
   End
End
Attribute VB_Name = "frmRank"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' XQBOOTH.FRM - Source Code for XiangQi Witchcraft School, Part V
'
' XiangQi Witchcraft School - a Chinese Chess Endgame Challenge Game
' Designed by Morning Yellow, Version: 4.5, Last Modified: Jan. 2010
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

Private szRankList() As String, nLastRank As Integer

Private Sub SetTip(ByVal szTip As String)

lblRankSelf.ToolTipText = szTip
lblUserNameSelf.ToolTipText = szTip
lblScoreSelf.ToolTipText = szTip

End Sub

Private Sub Form_Load()

If Rank_nToday = 0 Then
    lblRankSelf.Caption = "-"
    SetTip "���ڽ�������û������"
Else
    lblRankSelf.Caption = Rank_nToday
    If Rank_nYesterday > 0 Then
        If Rank_nToday = Rank_nYesterday Then
            SetTip "����û�б仯"
        Else
            SetTip "����" & IIf(Rank_nToday < Rank_nYesterday, "����", "�½�") & _
                    Abs(Rank_nToday - Rank_nYesterday) & "λ"
        End If
    End If
End If
lblUserNameSelf.Caption = Login_szUserName
lblScoreSelf.Caption = Rank_nScore

szRankList = Split(Rank_szList, vbCrLf)
nLastRank = UBound(szRankList)
vs.Max = IIf(nLastRank > 10, nLastRank - 10, 0)
vs_Change

End Sub

Private Sub vs_Change()

Dim i As Integer, j As Integer, nScore As Integer, nRank As Integer, nColor As Long
For i = 0 To 9
    nRank = i + vs.Value
    If nRank < nLastRank Then
        lblRank(i).Caption = i + vs.Value + 1
        j = InStr(szRankList(nRank), "|")
        lblUserName(i).Caption = Mid(szRankList(nRank), j + 1)
        nScore = Str2Int(szRankList(nRank), 0, App_nEndgames)
        If nScore > 900 And nScore > Rank_nScore + 100 Then
            lblScore(i).Caption = "δ֪"
        Else
            lblScore(i).Caption = nScore
        End If
        nColor = IIf(lblUserName(i).Caption = Login_szUserName, vbBlue, vbButtonText)
        lblRank(i).ForeColor = nColor
        lblUserName(i).ForeColor = nColor
        lblScore(i).ForeColor = nColor
    Else
        lblRank(i).Caption = ""
        lblUserName(i).Caption = ""
        lblScore(i).Caption = ""
    End If
Next

End Sub

Private Sub btnOK_Click()

Unload Me

End Sub