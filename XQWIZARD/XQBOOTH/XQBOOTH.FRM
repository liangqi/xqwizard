VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmXQBooth 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "象棋路边摊"
   ClientHeight    =   5055
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   3735
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   MaxButton       =   0   'False
   ScaleHeight     =   5055
   ScaleWidth      =   3735
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frmWeb 
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   0
      TabIndex        =   0
      Top             =   4080
      Width           =   3735
      Begin SHDocVwCtl.WebBrowser web 
         Height          =   1335
         Left            =   -120
         TabIndex        =   1
         Top             =   -120
         Width           =   4335
         ExtentX         =   7646
         ExtentY         =   2143
         ViewMode        =   0
         Offline         =   0
         Silent          =   0
         RegisterAsBrowser=   0
         RegisterAsDropTarget=   1
         AutoArrange     =   0   'False
         NoClientEdge    =   0   'False
         AlignLeft       =   0   'False
         NoWebView       =   0   'False
         HideFileNames   =   0   'False
         SingleClick     =   0   'False
         SingleSelection =   0   'False
         NoFolders       =   0   'False
         Transparent     =   0   'False
         ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
         Location        =   ""
      End
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   89
      Left            =   3120
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   88
      Left            =   2760
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   87
      Left            =   2400
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   86
      Left            =   2040
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   85
      Left            =   1680
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   84
      Left            =   1320
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   83
      Left            =   960
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   82
      Left            =   600
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   81
      Left            =   240
      Top             =   3480
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   80
      Left            =   3120
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   79
      Left            =   2760
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   78
      Left            =   2400
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   77
      Left            =   2040
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   76
      Left            =   1680
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   75
      Left            =   1320
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   74
      Left            =   960
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   73
      Left            =   600
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   72
      Left            =   240
      Top             =   3120
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   71
      Left            =   3120
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   70
      Left            =   2760
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   69
      Left            =   2400
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   68
      Left            =   2040
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   67
      Left            =   1680
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   66
      Left            =   1320
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   65
      Left            =   960
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   64
      Left            =   600
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   63
      Left            =   240
      Top             =   2760
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   62
      Left            =   3120
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   61
      Left            =   2760
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   60
      Left            =   2400
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   59
      Left            =   2040
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   58
      Left            =   1680
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   57
      Left            =   1320
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   56
      Left            =   960
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   55
      Left            =   600
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   54
      Left            =   240
      Top             =   2400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   53
      Left            =   3120
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   52
      Left            =   2760
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   51
      Left            =   2400
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   50
      Left            =   2040
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   49
      Left            =   1680
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   48
      Left            =   1320
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   47
      Left            =   960
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   46
      Left            =   600
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   45
      Left            =   240
      Top             =   2040
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   44
      Left            =   3120
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   43
      Left            =   2760
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   42
      Left            =   2400
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   41
      Left            =   2040
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   40
      Left            =   1680
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   39
      Left            =   1320
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   38
      Left            =   960
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   37
      Left            =   600
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   36
      Left            =   240
      Top             =   1680
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   35
      Left            =   3120
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   34
      Left            =   2760
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   33
      Left            =   2400
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   32
      Left            =   2040
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   31
      Left            =   1680
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   30
      Left            =   1320
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   29
      Left            =   960
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   28
      Left            =   600
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   27
      Left            =   240
      Top             =   1320
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   26
      Left            =   3120
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   25
      Left            =   2760
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   24
      Left            =   2400
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   23
      Left            =   2040
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   22
      Left            =   1680
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   21
      Left            =   1320
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   20
      Left            =   960
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   19
      Left            =   600
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   18
      Left            =   240
      Top             =   960
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   17
      Left            =   3120
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   16
      Left            =   2760
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   15
      Left            =   2400
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   14
      Left            =   2040
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   13
      Left            =   1680
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   12
      Left            =   1320
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   11
      Left            =   960
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   10
      Left            =   600
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   9
      Left            =   240
      Top             =   600
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   8
      Left            =   3120
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   7
      Left            =   2760
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   6
      Left            =   2400
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   5
      Left            =   2040
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   4
      Left            =   1680
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   3
      Left            =   1320
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   2
      Left            =   960
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   1
      Left            =   600
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   375
      Index           =   0
      Left            =   240
      Top             =   240
      Width           =   375
   End
   Begin VB.Image imgBoard 
      Height          =   4095
      Left            =   0
      Picture         =   "XQBOOTH.frx":0000
      Stretch         =   -1  'True
      Top             =   0
      Width           =   3735
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   29
      Left            =   2640
      Picture         =   "XQBOOTH.frx":123D
      Top             =   1200
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   28
      Left            =   2280
      Picture         =   "XQBOOTH.frx":164A
      Top             =   1200
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   27
      Left            =   1920
      Picture         =   "XQBOOTH.frx":1A57
      Top             =   1200
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   26
      Left            =   1560
      Picture         =   "XQBOOTH.frx":1E59
      Top             =   1200
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   25
      Left            =   1200
      Picture         =   "XQBOOTH.frx":2260
      Top             =   1200
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   24
      Left            =   840
      Picture         =   "XQBOOTH.frx":266D
      Top             =   1200
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   23
      Left            =   480
      Picture         =   "XQBOOTH.frx":2A71
      Top             =   1200
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   22
      Left            =   2640
      Picture         =   "XQBOOTH.frx":2E7F
      Top             =   840
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   21
      Left            =   2280
      Picture         =   "XQBOOTH.frx":3284
      Top             =   840
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   20
      Left            =   1920
      Picture         =   "XQBOOTH.frx":3692
      Top             =   840
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   19
      Left            =   1560
      Picture         =   "XQBOOTH.frx":3A99
      Top             =   840
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   18
      Left            =   1200
      Picture         =   "XQBOOTH.frx":3EA0
      Top             =   840
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   17
      Left            =   840
      Picture         =   "XQBOOTH.frx":42AE
      Top             =   840
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   16
      Left            =   480
      Picture         =   "XQBOOTH.frx":46B4
      Top             =   840
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   15
      Left            =   120
      Picture         =   "XQBOOTH.frx":4AC3
      Top             =   840
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   14
      Left            =   2640
      Picture         =   "XQBOOTH.frx":4E3A
      Top             =   480
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   13
      Left            =   2280
      Picture         =   "XQBOOTH.frx":5228
      Top             =   480
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   12
      Left            =   1920
      Picture         =   "XQBOOTH.frx":561B
      Top             =   480
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   11
      Left            =   1560
      Picture         =   "XQBOOTH.frx":5A06
      Top             =   480
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   10
      Left            =   1200
      Picture         =   "XQBOOTH.frx":5DF7
      Top             =   480
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   9
      Left            =   840
      Picture         =   "XQBOOTH.frx":61EB
      Top             =   480
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   8
      Left            =   480
      Picture         =   "XQBOOTH.frx":65D6
      Top             =   480
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   7
      Left            =   2640
      Picture         =   "XQBOOTH.frx":69CB
      Top             =   120
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   6
      Left            =   2280
      Picture         =   "XQBOOTH.frx":6DB9
      Top             =   120
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   5
      Left            =   1920
      Picture         =   "XQBOOTH.frx":71A8
      Top             =   120
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   4
      Left            =   1560
      Picture         =   "XQBOOTH.frx":7593
      Top             =   120
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   3
      Left            =   1200
      Picture         =   "XQBOOTH.frx":7984
      Top             =   120
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   2
      Left            =   840
      Picture         =   "XQBOOTH.frx":7D77
      Top             =   120
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   1
      Left            =   480
      Picture         =   "XQBOOTH.frx":8165
      Top             =   120
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   0
      Left            =   120
      Picture         =   "XQBOOTH.frx":855C
      Top             =   120
      Width           =   360
   End
   Begin VB.Menu mnPrev 
      Caption         =   "上一关(&P)"
   End
   Begin VB.Menu mnRestart 
      Caption         =   "再来一次(&R)"
   End
   Begin VB.Menu mnNext 
      Caption         =   "下一关(&N)"
   End
End
Attribute VB_Name = "frmXQBooth"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' XQBOOTH.FRM - Source Code for XiangQi Booth, Part II
'
' XiangQi Booth - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 3.8, Last Modified: Jul. 2008
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

Private App_szPath As String

Private Sub Form_Load()

App_szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")
web.Navigate "file://" + App_szPath + "ADVERT\elephantbase.htm"

Dim i As Integer
For i = 0 To 89
    imgSquares(i).Picture = imgPieces(i Mod 30).Picture
Next

End Sub
