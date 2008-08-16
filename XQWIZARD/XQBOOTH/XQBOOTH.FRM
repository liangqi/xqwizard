VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmXQBooth 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   4935
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
   Icon            =   "XQBOOTH.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   4935
   ScaleWidth      =   3735
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frmWeb 
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   0
      TabIndex        =   0
      Top             =   3960
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
         Location        =   "http:///"
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
      Height          =   3975
      Left            =   0
      Picture         =   "XQBOOTH.frx":014A
      Top             =   0
      Width           =   3735
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
' Designed by Morning Yellow, Version: 1.01, Last Modified: Aug. 2008
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

Private Const DRAW_SELECTED As Boolean = True

Private Const PHASE_READY As Integer = 0
Private Const PHASE_BUSY As Integer = 1
Private Const PHASE_END As Integer = 2

Private pos As PositionStruct
Private nPhase As Integer, sqSelected As Integer, mvLast As Long

Private Sub PlayWavSound(ByVal szSoundFile As String)

PlaySoundA CvBStr(App_szPath + "SOUNDS\" + szSoundFile + ".WAV"), 0, SND_ASYNC + SND_NOWAIT + SND_FILENAME

End Sub

Private Sub DrawSquare(ByVal sq As Integer, Optional ByVal bSelected As Boolean = False)

Dim pc As Integer, nPicId As Integer
pc = pos.ucpcSquares(sq)
If pc = 0 Then
    nPicId = 0
Else
    nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
End If
nPicId = nPicId + IIf(bSelected, 15, 0)
imgSquares((sq \ 16 - 3) * 9 + sq Mod 16 - 3).Picture = frmHide.imgPieces(nPicId)

End Sub

Private Function GetResult(ByVal nStatus As Long) As Boolean

If (nStatus And MOVE_MATE) <> 0 Then
    If pos.sdPlayer = 0 Then
        PlayWavSound "LOSS"
        MsgBoxMute "请再接再厉！", vbInformation
    Else
        PlayWavSound "WIN"
        If Gui_nCurr = App_nEndgames - 1 Then
            MsgBoxMute "恭喜你闯过所有关卡！", vbInformation
        Else
            MsgBoxMute "恭喜你过关！", vbInformation
            mnNext.Enabled = True
        End If
        If Gui_nCurr = Gui_nLast Then
            Gui_nLast = Gui_nLast + 1
        End If
    End If
    GetResult = True
    Exit Function
End If
If (nStatus And MOVE_PERPETUAL) <> 0 Then
    PlayWavSound "LOSS"
    MsgBoxMute "请不要气馁！", vbInformation
    GetResult = True
    Exit Function
End If
If (nStatus And MOVE_CAPTURE) <> 0 Then
    CchessSetIrrev pos
End If
If (nStatus And MOVE_CHECK) <> 0 Then
    PlayWavSound "CHECK" + IIf(pos.sdPlayer = 0, "2", "")
ElseIf (nStatus And MOVE_CAPTURE) <> 0 Then
    PlayWavSound "CAPTURE" + IIf(pos.sdPlayer = 0, "2", "")
Else
    PlayWavSound "MOVE" + IIf(pos.sdPlayer = 0, "2", "")
End If
GetResult = False

End Function

Private Sub Thinking()

Dim lpStr As Long, mv As Long, nStatus As Long, sz As String

nPhase = PHASE_BUSY
MousePointer = vbHourglass
PipeLineOutput Engine_pipe, "position fen " + MkBStr(CchessBoard2Fen(pos))
PipeLineOutput Engine_pipe, "go infinity"
mv = 0
Do While mv = 0
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        DoEvents
        Sleep 1
    Else
        sz = MkBStr(lpStr)
        If Left(sz, 9) = "bestmove " Then
            mv = Coord2Move(Mid(sz, 10, 4))
        End If
    End If
Loop
If mvLast > 0 Then
    DrawSquare Src(mvLast)
    DrawSquare Dst(mvLast)
End If
CchessTryMove pos, nStatus, mv
DrawSquare Src(mv), DRAW_SELECTED
DrawSquare Dst(mv), DRAW_SELECTED
mvLast = mv
nPhase = IIf(GetResult(nStatus), PHASE_END, PHASE_READY)
MousePointer = vbDefault

End Sub

Private Sub LoadGame()

Dim i As Integer, j As Integer, pc As Integer, nPicId As Integer

mnPrev.Enabled = Gui_nCurr > 0
mnNext.Enabled = Gui_nCurr < Gui_nLast And Gui_nCurr < App_nEndgames - 1
Caption = "第" + Str(Gui_nCurr + 1) + " 关 - 象棋路边摊"
CchessFen2Board pos, App_szEndgames(Gui_nCurr)
For i = 3 To 12
    For j = 3 To 11
        DrawSquare i * 16 + j
    Next
Next
sqSelected = 0
mvLast = 0
nPhase = PHASE_READY

End Sub

Private Sub Form_Load()

LoadGame

End Sub

Private Sub Form_Unload(nCancel As Integer)

If nPhase = PHASE_BUSY Then
    nCancel = 1
Else
    App_bRunning = False
End If

End Sub

Private Sub mnPrev_Click()

If nPhase <> PHASE_BUSY Then
    Gui_nCurr = Gui_nCurr - 1
    LoadGame
End If

End Sub

Private Sub mnRestart_Click()

If nPhase <> PHASE_BUSY Then
    LoadGame
End If

End Sub

Private Sub mnNext_Click()

If nPhase <> PHASE_BUSY Then
    Gui_nCurr = Gui_nCurr + 1
    LoadGame
End If

End Sub

Private Sub imgSquares_MouseDown(nIndex As Integer, nButton As Integer, nShift As Integer, x As Single, y As Single)

Dim sq As Integer, pc As Integer, mv As Long, nStatus As Long

If nPhase <> PHASE_READY Then
    Exit Sub
End If
sq = (nIndex \ 9 + 3) * 16 + nIndex Mod 9 + 3
pc = pos.ucpcSquares(sq)
If (pc And (16 + pos.sdPlayer * 16)) <> 0 Then
    If sqSelected > 0 Then
        DrawSquare sqSelected
    End If
    sqSelected = sq
    DrawSquare sqSelected, DRAW_SELECTED
    If mvLast > 0 Then
        DrawSquare Src(mvLast)
        DrawSquare Dst(mvLast)
    End If
    PlayWavSound "CLICK"
ElseIf sqSelected > 0 Then
    mv = mdlCChess.Move(sqSelected, sq)
    If CchessTryMove(pos, nStatus, mv) Then
        DrawSquare Src(mv), DRAW_SELECTED
        DrawSquare Dst(mv), DRAW_SELECTED
        mvLast = mv
        If GetResult(nStatus) Then
            nPhase = PHASE_END
        Else
            Thinking
        End If
    ElseIf (nStatus And MOVE_INCHECK) <> 0 Then
        PlayWavSound "ILLEGAL"
    End If
End If

End Sub
