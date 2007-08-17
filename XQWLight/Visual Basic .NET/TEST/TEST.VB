Imports System.IO

Module Test
    Public Sub TestPos()
        Dim pos As PositionStruct
        Dim fpRead As FileStream
        Dim sd As Integer, sq As Integer
        Dim mvList(128) As MoveStruct
        Dim nGenMoves As Integer, nLegalMoves As Integer, nCheckPos As Integer
        Dim sqSrc As Integer, sqDst As Integer
        fpRead = File.Open("C:\TESTPOS.DAT", FileMode.Open, FileAccess.Read)
        nGenMoves = 0
        nLegalMoves = 0
        nCheckPos = 0
        sd = fpRead.ReadByte()
        While sd <> 255
            pos.ClearBoard()
            If (sd <> 0) Then
                pos.ChangeSide()
            End If
            sq = fpRead.ReadByte()
            While sq > 0
                pos.AddPiece(sq, fpRead.ReadByte())
                sq = fpRead.ReadByte()
            End While
            nGenMoves += pos.GenerateMoves(mvList)
            For sqSrc = 0 To 255
                If IN_BOARD(sqSrc) Then
                    For sqDst = 0 To 255
                        If (IN_BOARD(sqDst)) Then
                            If pos.LegalMove(sqSrc + (sqDst << 8)) Then
                                nLegalMoves += 1
                            End If
                        End If
                    Next
                End If
            Next
            nCheckPos += IIf(pos.Checked(pos.sdPlayer), 1, 0)
            sd = fpRead.ReadByte()
        End While
        ' 测试结果：着法 = 149203，将军局面 = 227
        MsgBox("GenerateMoves 识别的着法：" + Str(nGenMoves) + vbCrLf + _
                "LegalMove 识别的着法：" + Str(nLegalMoves) + vbCrLf + _
                "Checked 识别的将军局面：" + Str(nCheckPos))
        fpRead.Close()
    End Sub
End Module
