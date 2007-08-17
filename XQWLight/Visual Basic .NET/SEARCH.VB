' SEARCH.VB - Source Code for XiangQi Wizard Light, Part II
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

Module Search
    Public Const HASH_SIZE As Integer = 16384
    Public Const HASH_ALPHA As Integer = 1
    Public Const HASH_BETA As Integer = 2
    Public Const HASH_PV As Integer = 3
    Public Const LIMIT_DEPTH As Integer = 64
    Public Const NULL_DEPTH As Integer = 2
    Public Const NO_NULL As Boolean = True
    Public Const UNKNOWN_VALUE As Integer = MATE_VALUE + 1

    Public Structure HashStruct
        Public dwZobristLock0 As Integer, dwZobristLock1 As Integer
        Public nDepth As Integer, nFlag As Integer, vl As Integer, mv As Integer
    End Structure

    Public Search_hash(HASH_SIZE) As HashStruct
    Public Search_nAllNodes As Integer
    Public Search_pos As PositionStruct
    Public Search_nHistory(65536) As Integer
    Public Search_mvKiller(LIMIT_DEPTH, 2) As Integer
    Public Search_mvResult As Integer

    Public Function ProbeHash(ByVal vlAlpha As Integer, ByVal vlBeta As Integer, ByVal nDepth As Integer, ByRef mv As Integer) As Integer
        Dim hash As HashStruct
        Dim bMate As Boolean
        hash = Search_hash(Search_pos.dwZobristKey And (HASH_SIZE - 1))
        If hash.dwZobristLock0 <> Search_pos.dwZobristLock0 Or hash.dwZobristLock1 <> Search_pos.dwZobristLock1 Then
            Return UNKNOWN_VALUE
        End If
        mv = hash.mv
        bMate = False
        If hash.vl > WIN_VALUE Then
            hash.vl -= Search_pos.nDistance
            bMate = True
        ElseIf hash.vl < -WIN_VALUE Then
            hash.vl += Search_pos.nDistance
            bMate = True
        End If
        If hash.nDepth >= nDepth Or bMate Then
            If hash.nFlag = HASH_BETA Then
                If hash.vl >= vlBeta Then
                    Return hash.vl
                End If
            ElseIf hash.nFlag = HASH_ALPHA Then
                If hash.vl <= vlAlpha Then
                    Return hash.vl
                End If
            Else
                Return hash.vl
            End If
        End If
        Return UNKNOWN_VALUE
    End Function

    Public Sub RecordHash(ByVal nFlag As Integer, ByVal vl As Integer, ByVal nDepth As Integer, ByVal mv As Integer)
        Dim hash As HashStruct
        hash = Search_hash(Search_pos.dwZobristKey And (HASH_SIZE - 1))
        If hash.nDepth > nDepth Then
            Return
        End If
        hash.dwZobristLock0 = Search_pos.dwZobristLock0
        hash.dwZobristLock1 = Search_pos.dwZobristLock1
        hash.nFlag = nFlag
        hash.nDepth = nDepth
        If vl > WIN_VALUE Then
            hash.vl = vl + Search_pos.nDistance
        ElseIf vl < -WIN_VALUE Then
            hash.vl = vl - Search_pos.nDistance
        Else
            hash.vl = vl
        End If
        hash.mv = mv
        Search_hash(Search_pos.dwZobristKey And (HASH_SIZE - 1)) = hash
    End Sub

    Public Const PHASE_HASH As Integer = 0
    Public Const PHASE_KILLER_1 As Integer = 1
    Public Const PHASE_KILLER_2 As Integer = 2
    Public Const PHASE_GEN_MOVES As Integer = 3
    Public Const PHASE_REST As Integer = 4

    Public Structure SortStruct
        Public mvs() As MoveStruct
        Public nIndex As Integer, nMoves As Integer, nPhase As Integer
        Public mvHash As Integer, mvKiller1 As Integer, mvKiller2 As Integer

        Public Sub Init(ByVal mvHash As Integer)
            Me.mvHash = mvHash
            mvKiller1 = Search_mvKiller(Search_pos.nDistance, 0)
            mvKiller2 = Search_mvKiller(Search_pos.nDistance, 1)
            nPhase = PHASE_HASH
        End Sub

        Public Function NextMove() As Integer
            Dim i As Integer, mv As Integer
            If nPhase = PHASE_HASH Then
                nPhase = PHASE_KILLER_1
                If mvHash > 0 Then
                    Return mvHash
                End If
            End If
            If nPhase = PHASE_KILLER_1 Then
                nPhase = PHASE_KILLER_2
                If mvKiller1 <> mvHash AndAlso mvKiller1 > 0 AndAlso Search_pos.LegalMove(mvKiller1) Then
                    Return mvKiller1
                End If
            End If
            If nPhase = PHASE_KILLER_2 Then
                nPhase = PHASE_GEN_MOVES
                If mvKiller2 <> mvHash AndAlso mvKiller2 > 0 AndAlso Search_pos.LegalMove(mvKiller2) Then
                    Return mvKiller2
                End If
            End If
            If nPhase = PHASE_GEN_MOVES Then
                nPhase = PHASE_REST
                ReDim mvs(128)
                nMoves = Search_pos.GenerateMoves(mvs)
                For i = 0 To nMoves - 1
                    mvs(i).vl = Search_nHistory(mvs(i).mv)
                Next
                Array.Sort(mvs, 0, nMoves, MoveComparer.Instance)
                nIndex = 0
            End If
            While nIndex < nMoves
                mv = mvs(nIndex).mv
                nIndex += 1
                If mv <> mvHash AndAlso mv <> mvKiller1 AndAlso mv <> mvKiller2 Then
                    Return mv
                End If
            End While
            Return 0
        End Function
    End Structure

    Public Function SearchQuiesc(ByVal vlAlpha As Integer, ByVal vlBeta As Integer) As Integer
        Dim vl As Integer, vlRep As Integer, vlBest As Integer
        Dim i As Integer, nGenMoves As Integer, sqSide As Integer
        Dim mvs(128) As MoveStruct

        Search_nAllNodes += 1
        ' 1. 杀棋步数裁剪
        vl = Search_pos.nDistance - MATE_VALUE
        If vl >= vlBeta Then
            Return vl
        End If
        ' 2. 重复裁剪
        vlRep = Search_pos.IsRep()
        If vlRep > 0 Then
            Return Search_pos.RepValue(vlRep)
        End If
        ' 3. 达到极限深度就返回
        If Search_pos.nDistance = LIMIT_DEPTH Then
            Return Search_pos.Evaluate()
        End If
        ' 4. 初始化
        vlBest = -MATE_VALUE
        If Search_pos.mvsList(Search_pos.nMoveNum - 1).bCheck Then
            nGenMoves = Search_pos.GenerateMoves(mvs)
            For i = 0 To nGenMoves - 1
                mvs(i).vl = Search_nHistory(mvs(i).mv)
            Next
            Array.Sort(mvs, 0, nGenMoves, MoveComparer.Instance)
        Else
            ' 5. 对于没有将军的局面，首先尝试不吃子就截断
            vl = Search_pos.Evaluate()
            If vl > vlBest Then
                If vl >= vlBeta Then
                    Return vl
                End If
                vlBest = vl
                If vl > vlAlpha Then
                    vlAlpha = vl
                End If
            End If
            ' 6. 根据MVV/LVA排序，并过滤价值不大的吃子
            sqSide = (1 - Search_pos.sdPlayer) << 7
            nGenMoves = Search_pos.GenerateMoves(mvs, CAP_ONLY)
            Array.Sort(mvs, 0, nGenMoves, MoveComparer.Instance)
            For i = 0 To nGenMoves - 1
                If mvs(i).vl < 10 OrElse (mvs(i).vl < 20 AndAlso ((mvs(i).mv >> 8) And 128) = sqSide) Then
                    Exit For
                End If
            Next
            nGenMoves = i
        End If
        ' 7. Alpha-Beta搜索
        For i = 0 To nGenMoves - 1
            If Search_pos.MakeMove(mvs(i).mv) Then
                vl = -SearchQuiesc(-vlBeta, -vlAlpha)
                Search_pos.UndoMakeMove()
                If vl > vlBest Then
                    If vl >= vlBeta Then
                        Return vl
                    End If
                    vlBest = vl
                    If vl > vlAlpha Then
                        vlAlpha = vl
                    End If
                End If
            End If
        Next
        If vlBest = -MATE_VALUE Then
            Return Search_pos.nDistance - MATE_VALUE
        Else
            Return vlBest
        End If
    End Function

    Public Function SearchFull(ByVal vlAlpha As Integer, ByVal vlBeta As Integer, ByVal nDepth As Integer, Optional ByVal bNoNull As Boolean = False) As Integer
        Dim vl As Integer, vlRep As Integer, vlBest As Integer, vlSelfSide As Integer
        Dim mv As Integer, mvHash As Integer, mvBest As Integer, nHashFlag As Integer, nNewDepth As Integer
        Dim bInCheck As Boolean
        Dim sort As SortStruct
        ' 1. 叶子结点处调用静态搜索
        If nDepth <= 0 Then
            Return SearchQuiesc(vlAlpha, vlBeta)
        End If
        Search_nAllNodes += 1
        ' 2. 杀棋步数裁剪
        vl = Search_pos.nDistance - MATE_VALUE
        If vl >= vlBeta Then
            Return vl
        End If
        ' 3. 重复裁剪
        vlRep = Search_pos.IsRep()
        If vlRep > 0 Then
            Return Search_pos.RepValue(vlRep)
        End If
        ' 4. 置换裁剪
        vl = ProbeHash(vlAlpha, vlBeta, nDepth, mvHash)
        If vl <> UNKNOWN_VALUE Then
            Return vl
        End If
        ' 5. 达到极限深度就返回
        If Search_pos.nDistance = LIMIT_DEPTH Then
            Return Search_pos.Evaluate()
        End If
        ' 6. 尝试空着裁
        If Search_pos.sdPlayer = 0 Then
            vlSelfSide = Search_pos.vlWhite
        Else
            vlSelfSide = Search_pos.vlBlack
        End If
        If Not bNoNull AndAlso Not Search_pos.mvsList(Search_pos.nMoveNum - 1).bCheck AndAlso vlSelfSide > NULL_OKAY_MARGIN Then
            Search_pos.NullMove()
            vl = -SearchFull(-vlBeta, 1 - vlBeta, nDepth - NULL_DEPTH - 1, NO_NULL)
            Search_pos.UndoNullMove()
            If vl >= vlBeta AndAlso (vlSelfSide > NULL_SAFE_MARGIN OrElse SearchFull(vlBeta - 1, vlBeta, nDepth - NULL_DEPTH, NO_NULL) >= vlBeta) Then
                Return vl
            End If
        End If
        ' 7. 初始化
        nHashFlag = HASH_ALPHA
        vlBest = -MATE_VALUE
        mvBest = 0
        sort.Init(mvHash)
        ' 8. Alpha-Beta搜索
        mv = sort.NextMove()
        While mv > 0
            If Search_pos.MakeMove(mv) Then
                ' 9. 将军延伸
                nNewDepth = nDepth - 1
                If Search_pos.mvsList(Search_pos.nMoveNum - 1).bCheck Then
                    nNewDepth += 1
                End If
                ' 10. PVS
                If vlBest = -MATE_VALUE Then
                    vl = -SearchFull(-vlBeta, -vlAlpha, nNewDepth)
                Else
                    vl = -SearchFull(-vlAlpha - 1, -vlAlpha, nNewDepth)
                    If vl > vlAlpha AndAlso vl < vlBeta Then
                        vl = -SearchFull(-vlBeta, -vlAlpha, nNewDepth)
                    End If
                End If
                Search_pos.UndoMakeMove()
                ' 11. Alpha-Beta边界判定
                If vl > vlBest Then
                    vlBest = vl
                    If vl >= vlBeta Then
                        nHashFlag = HASH_BETA
                        mvBest = mv
                        Exit While
                    End If
                    If vl > vlAlpha Then
                        vlAlpha = vl
                        nHashFlag = HASH_PV
                        mvBest = mv
                    End If
                End If
            End If
            mv = sort.NextMove()
        End While
        ' 12. 更新置换表、历史表和杀手着法表
        If Search_pos.nDistance = 0 Then
            Search_mvResult = mvBest
        End If
        If vlBest = -MATE_VALUE Then
            Return Search_pos.nDistance - MATE_VALUE
        Else
            RecordHash(nHashFlag, vlBest, nDepth, mvBest)
            If mvBest > 0 Then
                Search_nHistory(mvBest) += nDepth * nDepth
                If Search_mvKiller(Search_pos.nDistance, 0) <> mvBest Then
                    Search_mvKiller(Search_pos.nDistance, 1) = Search_mvKiller(Search_pos.nDistance, 0)
                    Search_mvKiller(Search_pos.nDistance, 0) = mvBest
                End If
            End If
            Return vlBest
        End If
    End Function

    Public Sub SearchMain(ByVal nSeconds As Integer)
        Dim i As Integer, nGenMoves As Integer, vl As Integer
        Dim nTimer As Long
        Dim mvs(MAX_GEN_MOVES) As MoveStruct
        ' 1. 开局库
        Search_mvResult = Search_pos.BookMove()
        If Search_mvResult > 0 Then
            Search_pos.MakeMove(Search_mvResult)
            If Search_pos.IsRep(3) = 0 Then
                Search_pos.UndoMakeMove()
                Return
            End If
            Search_pos.UndoMakeMove()
        End If
        ' 2. 唯一着法
        vl = 0
        nGenMoves = Search_pos.GenerateMoves(mvs)
        For i = 0 To nGenMoves - 1
            If Search_pos.MakeMove(mvs(i).mv) Then
                Search_pos.UndoMakeMove()
                Search_mvResult = mvs(i).mv
                vl += 1
            End If
        Next
        If vl = 1 Then
            Return
        End If
        ' 3. 清空置换表
        For i = 0 To HASH_SIZE - 1
            Search_hash(i).dwZobristLock0 = 0
            Search_hash(i).dwZobristLock1 = 0
            Search_hash(i).nDepth = 0
            Search_hash(i).nFlag = 0
            Search_hash(i).vl = 0
            Search_hash(i).mv = 0
        Next
        ' 4. 清空杀手着法表
        For i = 0 To LIMIT_DEPTH - 1
            Search_mvKiller(i, 0) = 0
            Search_mvKiller(i, 1) = 0
        Next
        ' 5. 清空历史表
        For i = 0 To 65535
            Search_nHistory(i) = 0
        Next
        ' 6. 初始化
        Search_pos.nDistance = 0
        Search_nAllNodes = 0
        ' 7. 迭代加深
        nTimer = Now.Ticks
        For i = 1 To LIMIT_DEPTH
            vl = SearchFull(-MATE_VALUE, MATE_VALUE, i, NO_NULL)
            If vl > WIN_VALUE Or vl < -WIN_VALUE Then
                Exit For
            End If
            If Now.Ticks - nTimer > TimeSpan.TicksPerSecond * nSeconds Then
                Exit For
            End If
        Next
    End Sub
End Module
