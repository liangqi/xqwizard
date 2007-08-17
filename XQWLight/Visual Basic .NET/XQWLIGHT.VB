' XQWLIGHT.VB - Source Code for XiangQi Wizard Light, Part V
'
' XiangQi Wizard Light - a Chinese Chess Program for Windows CE
' Designed by Morning Yellow, Version: 1.0, Last Modified: Aug. 2007
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

Module XQWLight
    Public Const DRAW_SELECTED As Boolean = True
    Public Const RESULT_COMPUTER As Boolean = True

    Public Const LEFT_MARGIN As Integer = 6
    Public Const TOP_MARGIN As Integer = 8

    Public App_frm As MainForm
    Public App_bExit As Boolean, App_bFlipped As Boolean
    Public App_nHandicap As Integer, App_nLevel As Integer
    Public App_sqSelected As Integer, App_mvLast As Integer

    Public Function AddMove(ByVal sqSrc As Integer, ByVal sqDst As Integer) As Boolean
        Dim mv As Integer, pcCaptured As Integer
        mv = sqSrc + (sqDst << 8)
        If Search_pos.LegalMove(mv) Then
            pcCaptured = Search_pos.pcSquares(sqDst)
            If Search_pos.MakeMove(mv) Then
                If pcCaptured > 0 Then
                    Search_pos.SetIrrev()
                End If
                App_sqSelected = 0
                App_mvLast = mv
                App_frm.DrawSquare(sqSrc, DRAW_SELECTED)
                App_frm.DrawSquare(sqDst, DRAW_SELECTED)
                Return True
            End If
        End If
        Return False
    End Function

    Public Function GetResult(Optional ByVal bComputer As Boolean = False) As Boolean
        Dim vlRep As Integer
        If Search_pos.IsMate() Then
            MsgBox(IIf(bComputer, "请再接再厉！", "祝贺你取得胜利！"), MsgBoxStyle.Information, "棋局结束")
            Return True
        End If
        vlRep = Search_pos.IsRep(3)
        If vlRep > 0 Then
            vlRep = Search_pos.RepValue(vlRep)
            If bComputer Then
                vlRep = -vlRep
            End If
            MsgBox(IIf(vlRep > WIN_VALUE, "长打作负，请不要气馁！", IIf(vlRep < -WIN_VALUE, "电脑长打作负，祝贺你取得胜利！", "双方不变作和，辛苦了！")), MsgBoxStyle.Information, "棋局结束")
            Return True
        End If
        If Search_pos.nMoveNum = 100 Then
            MsgBox("超过自然限着作和，辛苦了！", MsgBoxStyle.Information, "棋局结束")
            Return True
        End If
        Return False
    End Function

    Public Function ResponseMove() As Boolean
        Dim mvResult As Integer
        If GetResult() Then
            Return False
        End If
        If ((App_mvLast >> 8) And 15) < 8 Xor App_bFlipped Then
            App_frm.imgThinking.Left = LEFT_MARGIN + 112
        Else
            App_frm.imgThinking.Left = LEFT_MARGIN
        End If
        If ((App_mvLast >> 8) >> 4) < 8 Xor App_bFlipped Then
            App_frm.imgThinking.Top = TOP_MARGIN + 128
        Else
            App_frm.imgThinking.Top = TOP_MARGIN
        End If
        App_frm.imgThinking.Visible = True
        App_frm.Refresh()
        SearchMain(CInt(4 ^ App_nLevel))
        App_frm.imgThinking.Visible = False
        If App_mvLast > 0 Then
            App_frm.DrawSquare(App_mvLast And 255)
            App_frm.DrawSquare(App_mvLast >> 8)
        End If
        Search_pos.MakeMove(Search_mvResult)
        App_mvLast = Search_mvResult
        App_frm.DrawSquare(App_mvLast And 255, DRAW_SELECTED)
        App_frm.DrawSquare(App_mvLast >> 8, DRAW_SELECTED)
        If GetResult(RESULT_COMPUTER) Then
            Return False
        End If
        Return True
    End Function

    Public Sub Main()
        Dim frmStartUp As StartUp
        Randomize()
        InitArrays()
        LoadBook()
        frmStartUp = New StartUp
        App_frm = New MainForm
        frmStartUp.ShowDialog()
        While Not App_bExit
            App_frm.ShowDialog()
            frmStartUp.ShowDialog()
        End While
    End Sub
End Module
