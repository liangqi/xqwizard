' 生成Java代码
Public Sub CopyJava()

Dim i As Integer, sq As Integer, sd As Integer, szJava As String, posJava As PositionStruct
szJava = "<applet width=""249"" height=""301""" + _
        " codebase=""" + Options_szJavaPath + """ code=""JavaXQ"">" + vbCrLf
If Not Game_bStartPos Then
    CchessFen2Board posJava, Game_szIrrevFen(0)
    szJava = szJava + "<param name=""Position"" value="""
    For sd = 0 To 1
        For i = 1 To 16
            sq = posJava.ucsqPieces(Choose(i, 23, 21, 19, 17, 16, 18, 20, 22, 24, 25, 26, 27, 28, 29, 30, 31) + sd * 16)
            szJava = szJava + IIf(sq = 0, "--", Chr(sq Mod 16 + 62) + Chr(60 - sq \ 16)) + ","
        Next
    Next
    szJava = szJava + """>" + vbCrLf
End If
szJava = szJava + "<param name=""MoveList"" value="""
For i = 1 To Game_nMaxMove
    szJava = szJava + Move2Iccs(Game_mvMove(i)) + " "
Next
szJava = szJava + """>" + vbCrLf
szJava = szJava + "请登录<a href=""http://www.java.com/"" target=""_blank"">www.java.com</a>下载Java运行包" + vbCrLf
szJava = szJava + "</applet>"
If Not Game_bStartPos Then
    szJava = szJava + "<p>" + Game_szIrrevFen(0) + "</p>"
End If
szJava = szJava + "<p>欢迎访问<a href=""http://www.elephantbase.net/"" target=""_blank"">www.elephantbase.net</a></p>"
Clipboard.Clear
Clipboard.SetText szJava
MsgBox "Java棋盘代码已复制到剪贴板。", vbInformation

End Sub

' 生成Web棋盘
Public Sub ViewWeb()

Dim i As Integer
Dim nFileNo As Integer, bReturned As Boolean, szCommStr As String
ReDim szFenStrTable(0 To Game_nMaxMove) As String
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath + "jsboard2.htm" For Output As #nFileNo
On Error GoTo 0
Print #nFileNo, "<html>"
Print #nFileNo, "<body>"
Print #nFileNo, "<script language=""JavaScript""><!--"
Print #nFileNo, "var RightReady = 0;"
Print #nFileNo, "--></script>"
Print #nFileNo, "<dl>"
Print #nFileNo, "<dt><center>" + EventString + "</center></dt>"
Print #nFileNo, "<dt><center>" + ResultString + "</center></dt>"
Print #nFileNo, "<dt><center>" + DateSiteString + "</center></dt>"
Print #nFileNo, "<dt><center><a href=""JavaScript:parent.frames[0].ViewFen(0)"">";
Print #nFileNo, IIf(OpenString = "", "===开始===", OpenString) + "</a></center></dt>"
Print #nFileNo, "<dt>";
szCommStr = Game_szComment(0)
i = InStr(szCommStr, vbCrLf)
Do While i > 0
    Print #nFileNo, Left(szCommStr, i - 1) + "</dt>"
    Print #nFileNo, "<dt>";
    szCommStr = Mid(szCommStr, i + 2)
    i = InStr(szCommStr, vbCrLf)
Loop
Print #nFileNo, szCommStr + "</dt>"
Print #nFileNo, "<dt>";
bReturned = True
Do While Game_nCurrMove > 0
    MoveBack
Loop
szFenStrTable(Game_nCurrMove) = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr)
Do While Game_nCurrMove < Game_nMaxMove
    If bReturned Then
        For i = 1 To 4 - Len(Str(Game_cntCurr))
            Print #nFileNo, "&nbsp;";
        Next
        Print #nFileNo, LTrim(Str(Game_cntCurr)) + ".&nbsp";
        If Game_sdCurr = 1 Then
            For i = 1 To Choose(Game_nFormat + 1, 8, 4, 5)
                Print #nFileNo, "&nbsp;";
            Next
        End If
    End If
    If Game_sdCurr = 0 Then
        Print #nFileNo, "<a href=""JavaScript:parent.frames[0].ViewFen(" + LTrim(Str(Game_nCurrMove + 1)) + ")"">" + _
                Game_szMoveText(Game_nFormat, Game_nCurrMove + 1) + "</a>";
        bReturned = False
    Else
        Print #nFileNo, "&nbsp;" + "<a href=""JavaScript:parent.frames[0].ViewFen(" + LTrim(Str(Game_nCurrMove + 1)) + ")"">" + _
                Game_szMoveText(Game_nFormat, Game_nCurrMove + 1) + "</a></dt>"
        Print #nFileNo, "<dt>";
        bReturned = True
    End If
    MoveForward
    szFenStrTable(Game_nCurrMove) = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr)
    If Game_szComment(Game_nCurrMove) <> "" Then
        If Not bReturned Then
            Print #nFileNo, "</dt>"
            Print #nFileNo, "<dt>";
        End If
        szCommStr = Game_szComment(Game_nCurrMove)
        i = InStr(szCommStr, vbCrLf)
        Do While i > 0
            Print #nFileNo, Left(szCommStr, i - 1) + "</dt>"
            Print #nFileNo, "<dt>";
            szCommStr = Mid(szCommStr, i + 2)
            i = InStr(szCommStr, vbCrLf)
        Loop
        Print #nFileNo, szCommStr + "</dt>"
        Print #nFileNo, "<dt>";
        bReturned = True
    End If
Loop
Print #nFileNo, "</dt>"
Print #nFileNo, "</dl>"
Print #nFileNo, "<script language=""JavaScript""><!--"
Print #nFileNo, "var MaxMove =" + Str(Game_nMaxMove) + ";"
Print #nFileNo, "var LastPos = 0;"
Print #nFileNo, "var FenStr = Array(" + LTrim(Str(Game_nMaxMove + 1)) + ");"
For i = 0 To Game_nMaxMove
    Print #nFileNo, "FenStr[" + LTrim(Str(i)); "] = """ + szFenStrTable(i) + """;"
Next
Print #nFileNo, "RightReady = 1;"
Print #nFileNo, "if (parent.frames[0].LeftReady) {"
Print #nFileNo, "  parent.frames[0].ViewFen(0);"
Print #nFileNo, "}"
Print #nFileNo, "--></script>"
Print #nFileNo, "</body>"
Print #nFileNo, "</html>"
Close #nFileNo
MoveFlush
Erase szFenStrTable
ShellExecuteA 0, vbNullString, App_szPath + "jsboard.htm", vbNullString, vbNullString, SW_SHOWNORMAL

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "无法打开文件 " + App_szPath + "jsboard2.htm", vbExclamation

End Sub

' 用ANSI定位光标
Public Function AnsiSetCursor(ByVal nRow As Integer, ByVal nColumn As Integer)

AnsiSetCursor = IIf(Options_bEscapeDouble, Chr(27), "") + Chr(27) + "[" + LTrim(Str(nRow)) + ";" + LTrim(Str(nColumn)) + "H"

End Function

' 生成ANSI动态棋盘
Public Sub CopyAnsi()

Dim nBoardTop As Integer, nBoardLeft As Integer
Dim szSquares As String, szPieces As String, szEscape As String
Dim szNormal As String, szRed As String, szBlack As String, szHighlight As String
nBoardTop = -2
nBoardLeft = 7
szSquares = _
        "┌┬┬┬┬┬┬┬┐" + _
        "├┼┼┼※┼┼┼┤" + _
        "├┼┼┼┼┼┼┼┤" + _
        "├┼┼┼┼┼┼┼┤" + _
        "├┴┴┴┴┴┴┴┤" + _
        "├┬┬┬┬┬┬┬┤" + _
        "├┼┼┼┼┼┼┼┤" + _
        "├┼┼┼┼┼┼┼┤" + _
        "├┼┼┼※┼┼┼┤" + _
        "└┴┴┴┴┴┴┴┘"
szPieces = _
        "帅仕仕相相马马车车炮炮兵兵兵兵兵" + _
        "将士士象象马马车车炮炮卒卒卒卒卒"
szEscape = IIf(Options_bEscapeDouble, Chr(27), "") + Chr(27) + "["
szNormal = szEscape + "0m"
szRed = szEscape + "1;31m"
szBlack = szEscape + "1;32m"
szHighlight = szEscape + "1;33m"

Dim sz As String, mv As Long
Dim nRank As Integer, nFile As Integer
Dim szSquare As String, szPiece As String
Dim szSrc As String, szDst As String

Do While Game_nCurrMove > 0
    MoveBack
Loop
sz = AllocString(CchessBoardText(Game_posIrrev(Game_nCurrIrrev), CCHESS_ANSI_TEXT))
If Options_bEscapeDouble Then
    sz = Replace(sz, Chr(27) + "[", szEscape)
End If
sz = Space(8) + "ANSI动态棋盘由" + szBlack + "象棋巫师" + szEscape + "0m生成，欢迎访问" + szHighlight + "www.elephantbase.net" + szNormal + vbCrLf + _
        Space(28) + "请按“" + szHighlight + "↓" + szNormal + "”键欣赏" + vbCrLf + vbCrLf + _
        Space(18) + Replace(sz, vbCrLf, vbCrLf + Space(18))
Do While Game_nCurrMove < Game_nMaxMove
    If Game_nCurrMove > 0 Then
        sz = sz + szSrc + szEscape + "0m" + IIf(nFile = 0, " ", "-") + szSquare + IIf(nFile = 8, " ", "-") + _
                szDst + IIf(Game_sdCurr = 0, szNormal + "[" + szBlack + szPiece + szNormal + "]", szNormal + "(" + szRed + szPiece + szNormal + ")")
    End If
    MoveForward
    mv = Game_mvMove(Game_nCurrMove)
    nRank = Src(mv) \ 16 - 3
    nFile = Src(mv) Mod 16 - 3
    szSquare = Mid(szSquares, nRank * 9 + nFile + 1, 1)
    szPiece = Mid(szPieces, Game_posIrrev(Game_nCurrIrrev).ucpcSquares(Dst(mv)) - 15, 1)
    szSrc = AnsiSetCursor((Src(mv) \ 16) * 2 + nBoardTop, (Src(mv) Mod 16) * 4 + nBoardLeft)
    szDst = AnsiSetCursor((Dst(mv) \ 16) * 2 + nBoardTop, (Dst(mv) Mod 16) * 4 + nBoardLeft)
    If Game_sdCurr = 0 Then
        sz = sz + szSrc + szHighlight + "[" + szNormal + szSquare + szHighlight + "]" + _
                szDst + szHighlight + "[" + szBlack + szPiece + szHighlight + "]"
    Else
        sz = sz + szSrc + szHighlight + "(" + szNormal + szSquare + szHighlight + ")" + _
                szDst + szHighlight + "(" + szRed + szPiece + szHighlight + ")"
    End If
    sz = sz + AnsiSetCursor(22, 1) + vbCrLf
Loop
Clipboard.Clear
Clipboard.SetText sz
MoveFlush
MsgBox "ANSI动态棋盘已复制到剪贴板。", vbInformation

End Sub
