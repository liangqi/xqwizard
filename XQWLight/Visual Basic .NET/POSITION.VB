' POSITION.VB - Source Code for XiangQi Wizard Light, Part I
'
' XiangQi Wizard Light - a Chinese Chess Program for Windows CE
' Designed by Morning Yellow, Version: 1.0 Beta2, Last Modified: Sep. 2007
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

Imports System.IO

Module Position
    Public Const PIECE_DEL As Boolean = True
    Public Const CAP_ONLY As Boolean = True

    Public Const RANK_FROM As Integer = 3
    Public Const FILE_FROM As Integer = 3

    Public Const PIECE_KING As Integer = 1
    Public Const PIECE_ADVISOR As Integer = 2
    Public Const PIECE_BISHOP As Integer = 3
    Public Const PIECE_KNIGHT As Integer = 4
    Public Const PIECE_ROOK As Integer = 5
    Public Const PIECE_CANNON As Integer = 6
    Public Const PIECE_PAWN As Integer = 7

    Public Const MAX_MOVE_NUM As Integer = 256
    Public Const MAX_GEN_MOVES As Integer = 128
    Public Const MATE_VALUE As Integer = 1000
    Public Const WIN_VALUE As Integer = MATE_VALUE - 100
    Public Const NULL_SAFE_MARGIN As Integer = 300
    Public Const NULL_OKAY_MARGIN As Integer = 120
    Public Const CONTEMPT_VALUE As Integer = 20
    Public Const ADVANCED_VALUE As Integer = 3

    Public IN_BOARD(256) As Boolean

    Private IN_FORT(256) As Boolean
    Private PIECE_VALUE(7, 256) As Integer
    Private BOARD_HANDICAP(4, 128) As Integer

    Private KING_DELTA(4) As Integer
    Private ADVISOR_DELTA(4) As Integer
    Private KNIGHT_DELTA(4, 2) As Integer
    Private KNIGHT_CHECK_DELTA(4, 2) As Integer
    Private MVV_VALUE(8) As Integer

    Private LEGAL_SPAN(512) As Integer
    Private KNIGHT_PIN(512) As Integer

    Private PreGen_dwZobristKeyPlayer As Integer
    Private PreGen_dwZobristKeyTable(14, 256) As Integer
    Private PreGen_dwZobristLockPlayer As Integer
    Private PreGen_dwZobristLockTable(14, 256) As Integer

    Public Function LongRand(ByRef dwRandSeed As Integer) As Integer
        Dim qwLongSeed As Long
        qwLongSeed = CLng(dwRandSeed) * 16807
        dwRandSeed = CInt(qwLongSeed Mod 2147483647)
        Return dwRandSeed
    End Function

    Public Sub SetBooleanArray(ByVal bArray() As Boolean, ByVal ParamArray nData() As Integer)
        Dim i As Integer, n As Integer
        n = nData.Length() - 1
        For i = 0 To n
            bArray(i) = nData(i) <> 0
        Next
    End Sub

    Public Sub SetIntArray(ByVal nArray() As Integer, ByVal ParamArray nData() As Integer)
        Dim i As Integer, n As Integer
        n = nData.Length() - 1
        For i = 0 To n
            nArray(i) = nData(i)
        Next
    End Sub

    Public Sub SetIntArray2(ByVal nArray(,) As Integer, ByVal nIndex As Integer, ByVal ParamArray nData() As Integer)
        Dim i As Integer, n As Integer
        n = nData.Length() - 1
        For i = 0 To n
            nArray(nIndex, i) = nData(i)
        Next
    End Sub

    Public Sub InitBoardFort()
        SetBooleanArray(IN_BOARD, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetBooleanArray(IN_FORT, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray(KING_DELTA, -16, -1, 1, 16)
        SetIntArray(ADVISOR_DELTA, -17, -15, 15, 17)
        SetIntArray2(KNIGHT_DELTA, 0, -33, -31)
        SetIntArray2(KNIGHT_DELTA, 1, -18, 14)
        SetIntArray2(KNIGHT_DELTA, 2, -14, 18)
        SetIntArray2(KNIGHT_DELTA, 3, 31, 33)
        SetIntArray2(KNIGHT_CHECK_DELTA, 0, -33, -18)
        SetIntArray2(KNIGHT_CHECK_DELTA, 1, -31, -14)
        SetIntArray2(KNIGHT_CHECK_DELTA, 2, 14, 31)
        SetIntArray2(KNIGHT_CHECK_DELTA, 3, 18, 33)
        SetIntArray(MVV_VALUE, 0, 50, 10, 10, 30, 40, 30, 20)
    End Sub

    Public Sub InitLegalSpan()
        SetIntArray(LEGAL_SPAN, _
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0)
        SetIntArray(KNIGHT_PIN, _
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, -16, 0, -16, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 16, 0, 16, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0)
    End Sub

    Public Sub InitPieceValue1()
        SetIntArray2(PIECE_VALUE, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 9, 9, 9, 11, 13, 11, 9, 9, 9, 0, 0, 0, 0, _
                0, 0, 0, 19, 24, 34, 42, 44, 42, 34, 24, 19, 0, 0, 0, 0, _
                0, 0, 0, 19, 24, 32, 37, 37, 37, 32, 24, 19, 0, 0, 0, 0, _
                0, 0, 0, 19, 23, 27, 29, 30, 29, 27, 23, 19, 0, 0, 0, 0, _
                0, 0, 0, 14, 18, 20, 27, 29, 27, 20, 18, 14, 0, 0, 0, 0, _
                0, 0, 0, 7, 0, 13, 0, 16, 0, 13, 0, 7, 0, 0, 0, 0, _
                0, 0, 0, 7, 0, 7, 0, 15, 0, 7, 0, 7, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 11, 15, 11, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray2(PIECE_VALUE, 1, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 18, 0, 0, 20, 23, 20, 0, 0, 18, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 20, 20, 0, 20, 20, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray2(PIECE_VALUE, 2, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 20, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 18, 0, 0, 20, 23, 20, 0, 0, 18, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 20, 20, 0, 20, 20, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    End Sub

    Public Sub InitPieceValue2()
        SetIntArray2(PIECE_VALUE, 3, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 90, 90, 90, 96, 90, 96, 90, 90, 90, 0, 0, 0, 0, _
                0, 0, 0, 90, 96, 103, 97, 94, 97, 103, 96, 90, 0, 0, 0, 0, _
                0, 0, 0, 92, 98, 99, 103, 99, 103, 99, 98, 92, 0, 0, 0, 0, _
                0, 0, 0, 93, 108, 100, 107, 100, 107, 100, 108, 93, 0, 0, 0, 0, _
                0, 0, 0, 90, 100, 99, 103, 104, 103, 99, 100, 90, 0, 0, 0, 0, _
                0, 0, 0, 90, 98, 101, 102, 103, 102, 101, 98, 90, 0, 0, 0, 0, _
                0, 0, 0, 92, 94, 98, 95, 98, 95, 98, 94, 92, 0, 0, 0, 0, _
                0, 0, 0, 93, 92, 94, 95, 92, 95, 94, 92, 93, 0, 0, 0, 0, _
                0, 0, 0, 85, 90, 92, 93, 78, 93, 92, 90, 85, 0, 0, 0, 0, _
                0, 0, 0, 88, 85, 90, 88, 90, 88, 90, 85, 88, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray2(PIECE_VALUE, 4, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 206, 208, 207, 213, 214, 213, 207, 208, 206, 0, 0, 0, 0, _
                0, 0, 0, 206, 212, 209, 216, 233, 216, 209, 212, 206, 0, 0, 0, 0, _
                0, 0, 0, 206, 208, 207, 214, 216, 214, 207, 208, 206, 0, 0, 0, 0, _
                0, 0, 0, 206, 213, 213, 216, 216, 216, 213, 213, 206, 0, 0, 0, 0, _
                0, 0, 0, 208, 211, 211, 214, 215, 214, 211, 211, 208, 0, 0, 0, 0, _
                0, 0, 0, 208, 212, 212, 214, 215, 214, 212, 212, 208, 0, 0, 0, 0, _
                0, 0, 0, 204, 209, 204, 212, 214, 212, 204, 209, 204, 0, 0, 0, 0, _
                0, 0, 0, 198, 208, 204, 212, 212, 212, 204, 208, 198, 0, 0, 0, 0, _
                0, 0, 0, 200, 208, 206, 212, 200, 212, 206, 208, 200, 0, 0, 0, 0, _
                0, 0, 0, 194, 206, 204, 212, 200, 212, 204, 206, 194, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray2(PIECE_VALUE, 5, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 100, 100, 96, 91, 90, 91, 96, 100, 100, 0, 0, 0, 0, _
                0, 0, 0, 98, 98, 96, 92, 89, 92, 96, 98, 98, 0, 0, 0, 0, _
                0, 0, 0, 97, 97, 96, 91, 92, 91, 96, 97, 97, 0, 0, 0, 0, _
                0, 0, 0, 96, 99, 99, 98, 100, 98, 99, 99, 96, 0, 0, 0, 0, _
                0, 0, 0, 96, 96, 96, 96, 100, 96, 96, 96, 96, 0, 0, 0, 0, _
                0, 0, 0, 95, 96, 99, 96, 100, 96, 99, 96, 95, 0, 0, 0, 0, _
                0, 0, 0, 96, 96, 96, 96, 96, 96, 96, 96, 96, 0, 0, 0, 0, _
                0, 0, 0, 97, 96, 100, 99, 101, 99, 100, 96, 97, 0, 0, 0, 0, _
                0, 0, 0, 96, 97, 98, 98, 98, 98, 98, 97, 96, 0, 0, 0, 0, _
                0, 0, 0, 96, 96, 97, 99, 99, 99, 97, 96, 96, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray2(PIECE_VALUE, 6, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 9, 9, 9, 11, 13, 11, 9, 9, 9, 0, 0, 0, 0, _
                0, 0, 0, 19, 24, 34, 42, 44, 42, 34, 24, 19, 0, 0, 0, 0, _
                0, 0, 0, 19, 24, 32, 37, 37, 37, 32, 24, 19, 0, 0, 0, 0, _
                0, 0, 0, 19, 23, 27, 29, 30, 29, 27, 23, 19, 0, 0, 0, 0, _
                0, 0, 0, 14, 18, 20, 27, 29, 27, 20, 18, 14, 0, 0, 0, 0, _
                0, 0, 0, 7, 0, 13, 0, 16, 0, 13, 0, 7, 0, 0, 0, 0, _
                0, 0, 0, 7, 0, 7, 0, 15, 0, 7, 0, 7, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 11, 15, 11, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    End Sub

    Public Sub InitBoardHandicap()
        SetIntArray2(BOARD_HANDICAP, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 0, 0, 0, _
                0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 5, 4, 3, 2, 1, 2, 3, 4, 5, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray2(BOARD_HANDICAP, 1, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 0, 0, 0, _
                0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 5, 4, 3, 2, 1, 2, 3, 0, 5, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray2(BOARD_HANDICAP, 2, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 0, 0, 0, _
                0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 5, 0, 3, 2, 1, 2, 3, 0, 5, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
        SetIntArray2(BOARD_HANDICAP, 3, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 5, 4, 0, 0, 1, 0, 0, 4, 5, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, _
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    End Sub

    Public Sub InitArrays()
        Dim i As Integer, j As Integer, dwRandSeed As Integer
        ' 注：由于常量过于庞大可能会导致程序崩溃，所以一些数组只能在函数中初始化
        InitBoardFort()
        InitLegalSpan()
        InitPieceValue1()
        InitPieceValue2()
        InitBoardHandicap()
        ' 初始化Zobrist
        dwRandSeed = 1
        PreGen_dwZobristKeyPlayer = LongRand(dwRandSeed)
        For i = 0 To 13
            For j = 0 To 255
                PreGen_dwZobristKeyTable(i, j) = LongRand(dwRandSeed)
            Next
        Next
        LongRand(dwRandSeed) ' 跳过 ZobristLock0
        PreGen_dwZobristLockPlayer = LongRand(dwRandSeed)
        For i = 0 To 13
            For j = 0 To 255
                LongRand(dwRandSeed) ' 跳过 ZobristLock0
                PreGen_dwZobristLockTable(i, j) = LongRand(dwRandSeed)
            Next
        Next
    End Sub

    Public Structure BookStruct
        Public dwZobristLock As Integer
        Public mv As Integer
        Public vl As Short
    End Structure

    Public Class BookComparer
        Implements IComparer

        Public Shared Instance As New BookComparer

        Public Overridable Function Compare(ByVal x As Object, ByVal y As Object) As Integer Implements IComparer.Compare
            Return CType(x, BookStruct).dwZobristLock - CType(y, BookStruct).dwZobristLock
        End Function
    End Class

    Public Book_nMoveNum As Integer
    Public Book_Table() As BookStruct

    Public Sub LoadBook()
        Dim szFile As String, nSlash As Integer, nBackSlash As Integer, fp As FileStream
        Dim i As Integer, Buffer(8) As Byte, BookRecord As BookStruct

        szFile = System.Reflection.Assembly.GetExecutingAssembly.GetName.CodeBase
        If Left(szFile, 8) = "file:///" Then
            szFile = Mid(szFile, 9)
        End If
        nSlash = InStrRev(szFile, "/")
        nBackSlash = InStrRev(szFile, "\")
        If nSlash > nBackSlash Then
            szFile = Left(szFile, nSlash) + "BOOK.DAT"
        ElseIf nSlash < nBackSlash Then
            szFile = Left(szFile, nBackSlash) + "BOOK.DAT"
        Else
            szFile = "BOOK.DAT"
        End If
        If File.Exists(szFile) Then
            fp = File.Open(szFile, FileMode.Open, FileAccess.Read)
            Book_nMoveNum = CInt(fp.Length \ 8)
            ReDim Book_Table(Book_nMoveNum)
            For i = 0 To Book_nMoveNum - 1
                fp.Read(Buffer, 0, 8)
                BookRecord.dwZobristLock = CInt(Buffer(0)) + (CInt(Buffer(1)) << 8) + (CInt(Buffer(2)) << 16) + (CInt(Buffer(3)) << 24)
                BookRecord.mv = CInt(Buffer(4)) + (CInt(Buffer(5)) << 8)
                BookRecord.vl = CShort(Buffer(6)) + (CShort(Buffer(7)) << 8)
                Book_Table(i) = BookRecord
            Next
            fp.Close()
        Else
            Book_nMoveNum = 0
        End If
    End Sub

    Public Structure MoveStruct
        Public vl As Integer, mv As Integer
    End Structure

    Public Class MoveComparer
        Implements IComparer

        Public Shared Instance As New MoveComparer

        Public Overridable Function Compare(ByVal x As Object, ByVal y As Object) As Integer Implements IComparer.Compare
            Return CType(y, MoveStruct).vl - CType(x, MoveStruct).vl
        End Function
    End Class

    Public Structure MoveStructEx
        Public vl As Integer, mv As Integer, pcCaptured As Integer
        Public bCheck As Boolean
    End Structure

    Public Function MirrorSquare(ByVal sq As Integer) As Integer
        Return (sq >> 4 << 4) + 14 - (sq And 15)
    End Function

    Public Structure PositionStruct
        Public sdPlayer As Integer
        Public pcSquares() As Integer
        Public dwZobristKey As Integer, dwZobristLock As Integer
        Public vlWhite As Integer, vlBlack As Integer
        Public nMoveNum As Integer, nDistance As Integer
        Public mvsList() As MoveStructEx

        Public Sub ClearBoard()
            Dim sq As Integer
            ReDim pcSquares(256)
            ReDim mvsList(MAX_MOVE_NUM)
            sdPlayer = 0
            dwZobristKey = 0
            dwZobristLock = 0
            For sq = 0 To 255
                pcSquares(sq) = 0
            Next
            vlWhite = 0
            vlBlack = 0
        End Sub

        Public Sub SetIrrev()
            mvsList(0).mv = 0
            mvsList(0).pcCaptured = 0
            mvsList(0).bCheck = Checked(sdPlayer)
            nMoveNum = 1
            nDistance = 0
        End Sub

        Public Sub AddPiece(ByVal sq As Integer, ByVal pc As Integer, Optional ByVal bDel As Boolean = False)
            Dim pcAdjust As Integer
            If bDel Then
                pcSquares(sq) = 0
            Else
                pcSquares(sq) = pc
            End If
            If pc < 16 Then
                pcAdjust = pc - 9
                If bDel Then
                    vlWhite -= PIECE_VALUE(pcAdjust, sq)
                Else
                    vlWhite += PIECE_VALUE(pcAdjust, sq)
                End If
            Else
                pcAdjust = pc - 17
                If bDel Then
                    vlBlack -= PIECE_VALUE(pcAdjust, 254 - sq)
                Else
                    vlBlack += PIECE_VALUE(pcAdjust, 254 - sq)
                End If
                pcAdjust += 7
            End If
            dwZobristKey = dwZobristKey Xor PreGen_dwZobristKeyTable(pcAdjust, sq)
            dwZobristLock = dwZobristLock Xor PreGen_dwZobristLockTable(pcAdjust, sq)
        End Sub

        Public Function MovePiece(ByVal mv As Integer) As Integer
            Dim sqSrc As Integer, sqDst As Integer, pc As Integer, pcCaptured As Integer
            sqSrc = mv And 255
            sqDst = mv >> 8
            pcCaptured = pcSquares(sqDst)
            If pcCaptured > 0 Then
                AddPiece(sqDst, pcCaptured, PIECE_DEL)
            End If
            pc = pcSquares(sqSrc)
            AddPiece(sqSrc, pc, PIECE_DEL)
            AddPiece(sqDst, pc)
            Return pcCaptured
        End Function

        Public Sub UndoMovePiece(ByVal mv As Integer, ByVal pcCaptured As Integer)
            Dim sqSrc As Integer, sqDst As Integer, pc As Integer
            sqSrc = mv And 255
            sqDst = mv >> 8
            pc = pcSquares(sqDst)
            AddPiece(sqDst, pc, PIECE_DEL)
            AddPiece(sqSrc, pc)
            If pcCaptured > 0 Then
                AddPiece(sqDst, pcCaptured)
            End If
        End Sub

        Public Function MakeMove(ByVal mv As Integer) As Boolean
            Dim pcCaptured As Integer
            mvsList(nMoveNum).vl = dwZobristKey
            pcCaptured = MovePiece(mv)
            If Checked(sdPlayer) Then
                UndoMovePiece(mv, pcCaptured)
                Return False
            End If
            ChangeSide()
            mvsList(nMoveNum).mv = mv
            mvsList(nMoveNum).pcCaptured = pcCaptured
            mvsList(nMoveNum).bCheck = Checked(sdPlayer)
            nMoveNum += 1
            nDistance += 1
            Return True
        End Function

        Public Sub UndoMakeMove()
            nMoveNum -= 1
            nDistance -= 1
            ChangeSide()
            UndoMovePiece(mvsList(nMoveNum).mv, mvsList(nMoveNum).pcCaptured)
        End Sub

        Public Sub NullMove()
            mvsList(nMoveNum).vl = dwZobristKey
            ChangeSide()
            mvsList(nMoveNum).mv = 0
            mvsList(nMoveNum).pcCaptured = 0
            mvsList(nMoveNum).bCheck = False
            nMoveNum += 1
            nDistance += 1
        End Sub

        Public Sub UndoNullMove()
            nMoveNum -= 1
            nDistance -= 1
            ChangeSide()
        End Sub

        Public Sub ChangeSide()
            sdPlayer = 1 - sdPlayer
            dwZobristKey = dwZobristKey Xor PreGen_dwZobristKeyPlayer
            dwZobristLock = dwZobristLock Xor PreGen_dwZobristLockPlayer
        End Sub

        Public Sub LoadBoard(ByVal nHandicap As Integer)
            Dim sq As Integer, pc As Integer
            ClearBoard()
            For sq = 0 To 127
                pc = BOARD_HANDICAP(nHandicap, sq)
                If pc > 0 Then
                    AddPiece(128 + sq, pc + 8)
                End If
            Next
            For sq = 0 To 127
                pc = BOARD_HANDICAP(0, sq)
                If pc > 0 Then
                    AddPiece(126 - sq, pc + 16)
                End If
            Next
            SetIrrev()
        End Sub

        Public Function GenerateMoves(ByVal mvs() As MoveStruct, Optional ByVal bCapOnly As Boolean = False) As Integer
            Dim sqSrc As Integer, sqDst As Integer, pcSrc As Integer, pcDst As Integer
            Dim i As Integer, nDelta As Integer, nMoves As Integer
            Dim sqSelfSide As Integer, pcSelfSide As Integer, pcOppSide As Integer
            nMoves = 0
            sqSelfSide = (1 - sdPlayer) << 7
            pcSelfSide = 8 + (sdPlayer << 3)
            pcOppSide = 24 - pcSelfSide
            For sqSrc = 0 To 255
                pcSrc = pcSquares(sqSrc)
                If (pcSrc And pcSelfSide) <> 0 Then
                    Select Case pcSrc - pcSelfSide
                        Case PIECE_KING
                            For i = 0 To 3
                                sqDst = sqSrc + KING_DELTA(i)
                                If IN_FORT(sqDst) Then
                                    pcDst = pcSquares(sqDst)
                                    If bCapOnly Then
                                        If (pcDst And pcOppSide) <> 0 Then
                                            mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                            mvs(nMoves).vl = MVV_VALUE(pcDst And 7) - 5
                                            nMoves += 1
                                        End If
                                    ElseIf (pcDst And pcSelfSide) = 0 Then
                                        mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                        nMoves += 1
                                    End If
                                End If
                            Next
                        Case PIECE_ADVISOR
                            For i = 0 To 3
                                sqDst = sqSrc + ADVISOR_DELTA(i)
                                If IN_FORT(sqDst) Then
                                    pcDst = pcSquares(sqDst)
                                    If bCapOnly Then
                                        If (pcDst And pcOppSide) <> 0 Then
                                            mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                            mvs(nMoves).vl = MVV_VALUE(pcDst And 7) - 1
                                            nMoves += 1
                                        End If
                                    ElseIf (pcDst And pcSelfSide) = 0 Then
                                        mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                        nMoves += 1
                                    End If
                                End If
                            Next
                        Case PIECE_BISHOP
                            For i = 0 To 3
                                sqDst = sqSrc + ADVISOR_DELTA(i)
                                If IN_BOARD(sqDst) AndAlso (sqDst And 128) = sqSelfSide AndAlso pcSquares(sqDst) = 0 Then
                                    sqDst += ADVISOR_DELTA(i)
                                    pcDst = pcSquares(sqDst)
                                    If bCapOnly Then
                                        If (pcDst And pcOppSide) <> 0 Then
                                            mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                            mvs(nMoves).vl = MVV_VALUE(pcDst And 7) - 1
                                            nMoves += 1
                                        End If
                                    ElseIf (pcDst And pcSelfSide) = 0 Then
                                        mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                        nMoves += 1
                                    End If
                                End If
                            Next
                        Case PIECE_KNIGHT
                            For i = 0 To 3
                                sqDst = sqSrc + KING_DELTA(i)
                                If pcSquares(sqDst) = 0 Then
                                    For nDelta = 0 To 1
                                        sqDst = sqSrc + KNIGHT_DELTA(i, nDelta)
                                        If IN_BOARD(sqDst) Then
                                            pcDst = pcSquares(sqDst)
                                            If bCapOnly Then
                                                If (pcDst And pcOppSide) <> 0 Then
                                                    mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                                    mvs(nMoves).vl = MVV_VALUE(pcDst And 7) - 3
                                                    nMoves += 1
                                                End If
                                            ElseIf (pcDst And pcSelfSide) = 0 Then
                                                mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                                nMoves += 1
                                            End If
                                        End If
                                    Next
                                End If
                            Next
                        Case PIECE_ROOK
                            For i = 0 To 3
                                nDelta = KING_DELTA(i)
                                sqDst = sqSrc + nDelta
                                While IN_BOARD(sqDst)
                                    pcDst = pcSquares(sqDst)
                                    If pcDst = 0 Then
                                        If Not bCapOnly Then
                                            mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                            nMoves += 1
                                        End If
                                    Else
                                        If (pcDst And pcOppSide) <> 0 Then
                                            mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                            mvs(nMoves).vl = MVV_VALUE(pcDst And 7) - 4
                                            nMoves += 1
                                        End If
                                        Exit While
                                    End If
                                    sqDst += nDelta
                                End While
                            Next
                        Case PIECE_CANNON
                            For i = 0 To 3
                                nDelta = KING_DELTA(i)
                                sqDst = sqSrc + nDelta
                                While IN_BOARD(sqDst)
                                    pcDst = pcSquares(sqDst)
                                    If pcDst = 0 Then
                                        If Not bCapOnly Then
                                            mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                            nMoves += 1
                                        End If
                                    Else
                                        Exit While
                                    End If
                                    sqDst += nDelta
                                End While
                                sqDst += nDelta
                                While IN_BOARD(sqDst)
                                    pcDst = pcSquares(sqDst)
                                    If pcDst > 0 Then
                                        If (pcDst And pcOppSide) <> 0 Then
                                            mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                            mvs(nMoves).vl = MVV_VALUE(pcDst And 7) - 3
                                            nMoves += 1
                                        End If
                                        Exit While
                                    End If
                                    sqDst += nDelta
                                End While
                            Next
                        Case PIECE_PAWN
                            sqDst = sqSrc + (sdPlayer << 5) - 16
                            If IN_BOARD(sqDst) Then
                                pcDst = pcSquares(sqDst)
                                If bCapOnly Then
                                    If (pcDst And pcOppSide) <> 0 Then
                                        mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                        mvs(nMoves).vl = MVV_VALUE(pcDst And 7) - 2
                                        nMoves += 1
                                    End If
                                ElseIf (pcDst And pcSelfSide) = 0 Then
                                    mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                    nMoves += 1
                                End If
                            End If
                            If (sqSrc And 128) <> sqSelfSide Then
                                For nDelta = -1 To 1 Step 2
                                    sqDst = sqSrc + nDelta
                                    If IN_BOARD(sqDst) Then
                                        pcDst = pcSquares(sqDst)
                                        If bCapOnly Then
                                            If (pcDst And pcOppSide) <> 0 Then
                                                mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                                mvs(nMoves).vl = MVV_VALUE(pcDst And 7) - 2
                                                nMoves += 1
                                            End If
                                        ElseIf (pcDst And pcSelfSide) = 0 Then
                                            mvs(nMoves).mv = sqSrc + (sqDst << 8)
                                            nMoves += 1
                                        End If
                                    End If
                                Next
                            End If
                    End Select
                End If
            Next
            Return nMoves
        End Function

        Public Function LegalMove(ByVal mv As Integer) As Boolean
            Dim sqSrc As Integer, sqDst As Integer, pcSrc As Integer, pcDst As Integer, sqPin As Integer
            Dim pcSelfSide As Integer, i As Integer, nDelta As Integer

            sqSrc = mv And 255
            pcSrc = pcSquares(sqSrc)
            pcSelfSide = 8 + (sdPlayer << 3)
            If (pcSrc And pcSelfSide) = 0 Then
                Return False
            End If

            sqDst = mv >> 8
            pcDst = pcSquares(sqDst)
            If (pcDst And pcSelfSide) <> 0 Then
                Return False
            End If

            Select Case pcSrc - pcSelfSide
                Case PIECE_KING
                    Return IN_FORT(sqDst) AndAlso LEGAL_SPAN(sqDst - sqSrc + 256) = 1
                Case PIECE_ADVISOR
                    Return IN_FORT(sqDst) AndAlso LEGAL_SPAN(sqDst - sqSrc + 256) = 2
                Case PIECE_BISHOP
                    Return ((sqSrc Xor sqDst) And 128) = 0 AndAlso LEGAL_SPAN(sqDst - sqSrc + 256) = 3 AndAlso pcSquares((sqSrc + sqDst) \ 2) = 0
                Case PIECE_KNIGHT
                    sqPin = sqSrc + KNIGHT_PIN(sqDst - sqSrc + 256)
                    Return sqPin <> sqSrc AndAlso pcSquares(sqPin) = 0
                Case PIECE_ROOK, PIECE_CANNON
                    If ((sqSrc Xor sqDst) And &HF) = 0 Then
                        If sqDst < sqSrc Then
                            nDelta = -16
                        Else
                            nDelta = 16
                        End If
                    ElseIf ((sqSrc Xor sqDst) And &HF0) = 0 Then
                        If sqDst < sqSrc Then
                            nDelta = -1
                        Else
                            nDelta = 1
                        End If
                    Else
                        Return False
                    End If
                    sqPin = sqSrc + nDelta
                    While sqPin <> sqDst AndAlso pcSquares(sqPin) = 0
                        sqPin += nDelta
                    End While
                    If sqPin = sqDst Then
                        Return pcDst = 0 OrElse pcSrc - pcSelfSide = PIECE_ROOK
                    ElseIf pcDst > 0 AndAlso pcSrc - pcSelfSide = PIECE_CANNON Then
                        sqPin += nDelta
                        While sqPin <> sqDst AndAlso pcSquares(sqPin) = 0
                            sqPin += nDelta
                        End While
                        Return sqPin = sqDst
                    Else
                        Return False
                    End If
                Case PIECE_PAWN
                    If (sqSrc And 128) = (sdPlayer << 7) AndAlso (sqDst = sqSrc + 1 OrElse sqDst = sqSrc - 1) Then
                        Return True
                    Else
                        Return sqDst = sqSrc - 16 + (sdPlayer << 5)
                    End If
                Case Else
                    Return False
            End Select
        End Function

        Public Function Checked(ByVal sd As Integer) As Boolean
            Dim sqSrc As Integer, sqDst As Integer, pcSrc As Integer, pcDst As Integer
            Dim pcSelfSide As Integer, pcOppSide, i As Integer, nDelta As Integer
            pcSelfSide = 8 + (sd << 3)
            pcOppSide = 24 - pcSelfSide
            For sqSrc = 0 To 255
                If pcSquares(sqSrc) = pcSelfSide + PIECE_KING Then
                    If pcSquares(sqSrc + (sd << 5) - 16) = pcOppSide + PIECE_PAWN Then
                        Return True
                    End If
                    For nDelta = -1 To 1 Step 2
                        If pcSquares(sqSrc + nDelta) = pcOppSide + PIECE_PAWN Then
                            Return True
                        End If
                    Next
                    For i = 0 To 3
                        If pcSquares(sqSrc + ADVISOR_DELTA(i)) = 0 Then
                            For nDelta = 0 To 1
                                pcDst = pcSquares(sqSrc + KNIGHT_CHECK_DELTA(i, nDelta))
                                If pcDst = pcOppSide + PIECE_KNIGHT Then
                                    Return True
                                End If
                            Next
                        End If
                    Next
                    For i = 0 To 3
                        nDelta = KING_DELTA(i)
                        sqDst = sqSrc + nDelta
                        While IN_BOARD(sqDst)
                            pcDst = pcSquares(sqDst)
                            If pcDst > 0 Then
                                If pcDst = pcOppSide + PIECE_ROOK OrElse pcDst = pcOppSide + PIECE_KING Then
                                    Return True
                                End If
                                Exit While
                            End If
                            sqDst += nDelta
                        End While
                        sqDst += nDelta
                        While IN_BOARD(sqDst)
                            pcDst = pcSquares(sqDst)
                            If pcDst > 0 Then
                                If pcDst = pcOppSide + PIECE_CANNON Then
                                    Return True
                                End If
                                Exit While
                            End If
                            sqDst += nDelta
                        End While
                    Next
                End If
            Next
            Return False
        End Function

        Public Function IsMate() As Boolean
            Dim mvs(MAX_GEN_MOVES) As MoveStruct
            Dim i As Integer, nMoves As Integer
            nMoves = GenerateMoves(mvs)
            For i = 0 To nMoves - 1
                If MakeMove(mvs(i).mv) Then
                    UndoMakeMove()
                    Return False
                End If
            Next
            Return True
        End Function

        Public Function Evaluate() As Integer
            If sdPlayer = 0 Then
                Return vlWhite - vlBlack + ADVANCED_VALUE
            Else
                Return vlBlack - vlWhite + ADVANCED_VALUE
            End If
        End Function

        Public Function RepValue(ByVal nArg As Integer) As Integer
            Dim vlReturn As Integer
            vlReturn = 0
            If (nArg And 2) <> 0 Then
                vlReturn += nDistance - MATE_VALUE
            End If
            If (nArg And 4) <> 0 Then
                vlReturn -= nDistance - MATE_VALUE
            End If
            If vlReturn = 0 Then
                If (nDistance And 1) = 0 Then
                    Return -CONTEMPT_VALUE
                Else
                    Return CONTEMPT_VALUE
                End If
            Else
                Return vlReturn
            End If
        End Function

        Public Function RepStatus(Optional ByVal nRecur As Integer = 1) As Integer
            Dim nIndex As Integer, vl As Integer
            Dim bSelfSide As Boolean, bPerpCheck As Boolean, bOppPerpCheck As Boolean
            ' 1. 初始化
            bSelfSide = False
            bPerpCheck = True
            bOppPerpCheck = True
            nIndex = nMoveNum - 1
            ' 2. 有空着或者吃子就中断
            While mvsList(nIndex).mv > 0 AndAlso mvsList(nIndex).pcCaptured = 0
                ' 3. 设置长将标志
                If bSelfSide Then
                    bPerpCheck = bPerpCheck And mvsList(nIndex).bCheck
                    ' 4. 检查循环
                    If mvsList(nIndex).vl = dwZobristKey Then
                        nRecur -= 1
                        If nRecur = 0 Then
                            vl = 1
                            If bPerpCheck Then
                                vl += 2
                            End If
                            If bOppPerpCheck Then
                                vl += 4
                            End If
                            Return vl
                        End If
                    End If
                Else
                    bOppPerpCheck = bOppPerpCheck And mvsList(nIndex).bCheck
                End If
                bSelfSide = Not bSelfSide
                nIndex -= 1
            End While
            Return 0
        End Function

        Public Function Mirror() As PositionStruct
            Dim pos As PositionStruct
            Dim sq As Integer, pc As Integer
            pos.ClearBoard()
            For sq = 0 To 255
                pc = pcSquares(sq)
                If pc > 0 Then
                    pos.AddPiece(MirrorSquare(sq), pc)
                End If
            Next
            If sdPlayer = 1 Then
                pos.ChangeSide()
            End If
            Return pos
        End Function

        Public Function BookMove() As Integer
            Dim pos As PositionStruct, bMirror As Boolean
            Dim bk As BookStruct, nIndex As Integer, i As Integer
            Dim mv As Integer, mvs(MAX_GEN_MOVES) As MoveStruct
            Dim nValue As Integer, nMoves As Integer

            If Book_nMoveNum = 0 Then
                Return 0
            End If
            ' 1. 搜索开局库表
            bMirror = False
            bk.dwZobristLock = dwZobristLock
            nIndex = Array.BinarySearch(Book_Table, 0, Book_nMoveNum, bk, BookComparer.Instance)
            If nIndex < 0 Then
                bMirror = True
                pos = Mirror()
                bk.dwZobristLock = pos.dwZobristLock
                nIndex = Array.BinarySearch(Book_Table, 0, Book_nMoveNum, bk, BookComparer.Instance)
            End If
            If nIndex < 0 Then
                Return 0
            End If
            nIndex -= 1
            While nIndex >= 0 AndAlso Book_Table(nIndex).dwZobristLock = bk.dwZobristLock
                nIndex -= 1
            End While
            ' 2. 获得着法列表
            nValue = 0
            nMoves = 0
            nIndex += 1
            While nIndex < Book_nMoveNum AndAlso Book_Table(nIndex).dwZobristLock = bk.dwZobristLock
                mv = Book_Table(nIndex).mv
                If bMirror Then
                    mv = MirrorSquare(mv And 255) + (MirrorSquare(mv >> 8) << 8)
                End If
                If LegalMove(mv) Then
                    mvs(nMoves).mv = mv
                    mvs(nMoves).vl = Book_Table(nIndex).vl
                    nValue += Book_Table(nIndex).vl
                    nMoves += 1
                    If nMoves = MAX_GEN_MOVES Then
                        Exit While
                    End If
                End If
                nIndex += 1
            End While
            ' 3. 从着法列表中选择着法
            If nValue = 0 Then
                Return 0
            End If
            nValue = CInt(Int(Rnd() * nValue))
            For nIndex = 0 To nMoves - 1
                nValue -= mvs(nIndex).vl
                If nValue < 0 Then
                    Exit For
                End If
            Next
            Return mvs(nIndex).mv
        End Function

        Public Function HistoryIndex(ByVal mv As Integer) As Integer
            Return ((pcSquares(mv And 255) - 8) << 8) + (mv >> 8)
        End Function
    End Structure
End Module
