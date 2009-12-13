VERSION 5.00
Begin VB.Form frmEndgames 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "ENDGAMES.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   3600
      TabIndex        =   3
      Top             =   2760
      Width           =   855
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   2640
      TabIndex        =   2
      Top             =   2760
      Width           =   855
   End
   Begin VB.ListBox lstGames 
      Height          =   2220
      Left            =   2640
      TabIndex        =   1
      Top             =   480
      Width           =   1935
   End
   Begin VB.Label lblTitle 
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   15
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   720
      TabIndex        =   0
      Top             =   120
      Width           =   3855
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Left            =   120
      Picture         =   "ENDGAMES.frx":000C
      Top             =   0
      Width           =   480
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   89
      Left            =   2160
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   88
      Left            =   1920
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   87
      Left            =   1680
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   86
      Left            =   1440
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   85
      Left            =   1200
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   84
      Left            =   960
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   83
      Left            =   720
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   82
      Left            =   480
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   81
      Left            =   240
      Top             =   2760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   80
      Left            =   2160
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   79
      Left            =   1920
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   78
      Left            =   1680
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   77
      Left            =   1440
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   76
      Left            =   1200
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   75
      Left            =   960
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   74
      Left            =   720
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   73
      Left            =   480
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   72
      Left            =   240
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   71
      Left            =   2160
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   70
      Left            =   1920
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   69
      Left            =   1680
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   68
      Left            =   1440
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   67
      Left            =   1200
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   66
      Left            =   960
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   65
      Left            =   720
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   64
      Left            =   480
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   63
      Left            =   240
      Top             =   2280
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   62
      Left            =   2160
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   61
      Left            =   1920
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   60
      Left            =   1680
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   59
      Left            =   1440
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   58
      Left            =   1200
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   57
      Left            =   960
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   56
      Left            =   720
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   55
      Left            =   480
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   54
      Left            =   240
      Top             =   2040
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   53
      Left            =   2160
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   52
      Left            =   1920
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   51
      Left            =   1680
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   50
      Left            =   1440
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   49
      Left            =   1200
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   48
      Left            =   960
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   47
      Left            =   720
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   46
      Left            =   480
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   45
      Left            =   240
      Top             =   1800
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   44
      Left            =   2160
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   43
      Left            =   1920
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   42
      Left            =   1680
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   41
      Left            =   1440
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   40
      Left            =   1200
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   39
      Left            =   960
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   38
      Left            =   720
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   37
      Left            =   480
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   36
      Left            =   240
      Top             =   1560
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   35
      Left            =   2160
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   34
      Left            =   1920
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   33
      Left            =   1680
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   32
      Left            =   1440
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   31
      Left            =   1200
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   30
      Left            =   960
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   29
      Left            =   720
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   28
      Left            =   480
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   27
      Left            =   240
      Top             =   1320
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   26
      Left            =   2160
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   25
      Left            =   1920
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   24
      Left            =   1680
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   23
      Left            =   1440
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   22
      Left            =   1200
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   21
      Left            =   960
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   20
      Left            =   720
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   19
      Left            =   480
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   18
      Left            =   240
      Top             =   1080
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   17
      Left            =   2160
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   16
      Left            =   1920
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   15
      Left            =   1680
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   14
      Left            =   1440
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   13
      Left            =   1200
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   12
      Left            =   960
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   11
      Left            =   720
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   10
      Left            =   480
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   9
      Left            =   240
      Top             =   840
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   8
      Left            =   2160
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   7
      Left            =   1920
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   6
      Left            =   1680
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   5
      Left            =   1440
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   4
      Left            =   1200
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   3
      Left            =   960
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   2
      Left            =   720
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   1
      Left            =   480
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   255
      Index           =   0
      Left            =   240
      Top             =   600
      Width           =   255
   End
   Begin VB.Image imgBoard 
      Height          =   2655
      Left            =   120
      Picture         =   "ENDGAMES.frx":0AC6
      Stretch         =   -1  'True
      Top             =   480
      Width           =   2415
   End
End
Attribute VB_Name = "frmEndgames"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ENDGAMES.FRM - Source Code for XiangQi Wizard, Part IX
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
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

Private Sub Form_Load()

Dim i As Integer
lstGames.Clear
SetTopMost hWnd

If Options_nLanguage = 0 Then
    Exit Sub
End If
Font.Charset = 136
Font.Name = "細明體"
On Error Resume Next
For i = 0 To Controls.Count - 1
    Controls(i).Font = Font
Next
On Error GoTo 0
lblTitle.Font.Name = "標楷體"
lblTitle.Font.Size = 15
btnConfirm.Caption = "確定"
btnCancel.Caption = "取消"

End Sub

Private Sub lstGames_Click()

Dim i As Integer, j As Integer, pc As Integer, nPicId As Integer
Dim pos As PositionStruct
lblTitle.Caption = lstGames.List(lstGames.ListIndex)
Gui_nEndgamesIndex = lstGames.ListIndex
CchessFen2Board pos, App_szEndgames(Gui_nEndgamesIndex)
For i = 3 To 12
    For j = 3 To 11
        pc = pos.ucpcSquares(i * 16 + j)
        If pc = 0 Then
            nPicId = 0
        Else
            nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
        End If
        imgSquares((i - 3) * 9 + j - 3).Picture = frmHide.imgPiecesMini(nPicId).Picture
    Next
Next

End Sub

Private Sub lstGames_DblClick()

btnConfirm_Click

End Sub

Private Sub btnConfirm_Click()

LoadFenStr App_szEndgames(Gui_nEndgamesIndex)
EngineNewGame ENGINE_PLAY_BLACK
Game_szEvent = Caption
Game_szRound = lstGames.List(Gui_nEndgamesIndex)
LabelFlush
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub

