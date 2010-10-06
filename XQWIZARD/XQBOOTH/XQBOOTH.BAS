Attribute VB_Name = "mdlXQBooth"
' XQBOOTH.BAS - Source Code for XiangQi Booth, Part I
'
' XiangQi Booth - a Chinese Chess Endgame Challenge Game
' Designed by Morning Yellow, Version: 4.79, Last Modified: Oct. 2010
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

Private Declare Sub InitCipher Lib "XQBLCODE.DLL" Alias "_InitCipher@0" ()
Private Declare Function Encrypt Lib "XQBLCODE.DLL" Alias "_Encrypt@4" (ByVal nData As Long) As Long
Private Declare Function Decrypt Lib "XQBLCODE.DLL" Alias "_Decrypt@4" (ByVal nData As Long) As Long

' 全局常量——象棋巫师参数
Public Const MAX_ENDGAMES       As Integer = 4096   ' 残局的最大条目数
Public Const ENDGAME_FILE       As String = "ENDGAMES\BOOTH.EPD"    ' 残局文件
Public Const ENGINE_FILE        As String = "ELEEYE.EXE"            ' 引擎文件
Public Const XQAPP_URL          As String = "http://www.xqbase.com/xqbooth/"    ' 魔法学校地址
' Public Const XQAPP_URL          As String = "http://localhost:8080/xqbooth/"    ' 魔法学校地址
' 全局常量——登录状态
Public Const LOGIN_OK           As Integer = 0
Public Const LOGIN_FIRST        As Integer = 1
Public Const LOGIN_ERROR        As Integer = 2
Public Const LOGIN_CANCELED     As Integer = 3
' 全局常量——可选参数
Public Const DRAW_SELECTED      As Boolean = True
Public Const DRAW_MATE          As Boolean = True
Public Const DRAW_REFRESH       As Boolean = True
' 全局常量——闯关阶段
Public Const PHASE_READY        As Integer = 0
Public Const PHASE_WIN          As Integer = 1
Public Const PHASE_LOSS         As Integer = 2
' 全局常量——提示状态
Public Const HINT_NONE          As Integer = 0
Public Const HINT_RESTART       As Integer = 1
Public Const HINT_RETRY         As Integer = 2

' 全局变量——程序
Public App_frmMain              As Form     ' 主窗口对象引用
Public App_szPath               As String   ' 主程序所在的文件夹，以"\"结尾
Public App_bRunning             As Boolean  ' 程序运行标志，启动时设成True，如果是False，则跳出事件检测循环
Public App_nEndgames            As Integer  ' 读入的残局数量
Public App_szEndgames(0 To MAX_ENDGAMES - 1) As String  ' 读入的残局
Public App_pos                  As PositionStruct   ' 棋局
Public App_mvLast               As Long     ' 最新的一个着法，棋盘上有标记
Public App_sqSelected           As Integer  ' 鼠标选中的棋子
Public App_nPhase               As Integer  ' 闯关阶段
Public App_nUsersEvent          As Integer  ' 用户中心事件
Public App_nHint                As Integer  ' 提示状态
Public App_dfHintTime           As Double   ' 提示允许时间
' 全局变量——进度
Public Gui_nCurr                As Integer  ' 当前残局的条目序号
Public Gui_nLast                As Integer  ' 最后残局的条目序号
' 全局变量——登录
Public Login_nStatus            As Integer  ' 登录状态
Public Login_szAct              As String   ' 登录动作
Public Login_szResult           As String   ' 登录结果
Public Login_szUserName         As String   ' 登录用户名
Public Login_szPassword         As String   ' 登录密码
Public Login_bRemember          As Boolean  ' 记住密码
' 全局变量——引擎
Public Engine_pipe              As PipeStruct ' 引擎管道

' 播放声音
Public Sub PlayWavSound(ByVal szSoundFile As String)

If Options_bSounds Then
    PlaySoundA App_szPath & "SOUNDS\" & szSoundFile & ".WAV", 0, _
            SND_ASYNC + SND_NOWAIT + SND_FILENAME
End If

End Sub

' 清除提示
Public Sub ClearHint()

App_nHint = HINT_NONE
App_dfHintTime = Timer

End Sub

' 加载棋局
Public Sub LoadGame()

Dim bNext As Boolean
App_frmMain.mnGameXQWizard.Enabled = False
bNext = Gui_nCurr < Gui_nLast And Gui_nCurr < App_nEndgames - 1
App_frmMain.mnGameNext.Enabled = bNext
App_frmMain.btnNext.Enabled = bNext
App_frmMain.mnGameHint.Enabled = True
App_frmMain.btnHint.Enabled = True
App_frmMain.mnGameRetract.Enabled = False
App_frmMain.btnRetract.Enabled = False
App_frmMain.Caption = L("第 ", "第 ") & (Gui_nCurr + 1) & L(" 关 - 象棋巫师魔法学校", " 關 - 象棋巫師魔法學校")
CchessFen2Board App_pos, App_szEndgames(Gui_nCurr)
BoardFlush
App_sqSelected = 0
App_mvLast = 0
App_nPhase = PHASE_READY
If App_nHint = HINT_RETRY Then
    App_nHint = HINT_RESTART
End If

End Sub

' 在棋盘上显示棋子，如果指定"DRAW_SELECTED"参数，则再显示一个标记框
Public Sub DrawSquare(ByVal sq As Integer, Optional ByVal bSelected As Boolean = False, _
        Optional ByVal bMate As Boolean = False, Optional ByVal bRefresh As Boolean = False)

Dim pc As Integer, nPicId As Integer, img As Image, i As Integer, x As Integer, y As Integer
pc = App_pos.ucpcSquares(sq)
If pc = 0 Then
    nPicId = 0
Else
    nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
End If
nPicId = nPicId + IIf(bSelected, 15, 0)
Set img = App_frmMain.imgSquares((sq \ 16 - 3) * 9 + sq Mod 16 - 3)
If bMate Then
    nPicId = IIf(pc = 16, 30, IIf(pc = 32, 31, nPicId))
    img.ZOrder
    x = img.Left
    y = img.Top
    For i = 5 To 1 Step -1
        img.Move x + i * 20, y
        img.Refresh
        Sleep 50
        img.Move x - i * 20, y
        img.Refresh
        Sleep 50
    Next
    img.Move x, y
End If
If Options_bLargeGui Then
    img.Picture = frmHide.imgPiecesLarge(nPicId).Picture
Else
    img.Picture = frmHide.imgPiecesSmall(nPicId).Picture
End If
If bRefresh Then
    img.Refresh
End If

End Sub

' 刷新棋盘
Public Sub BoardFlush()

Dim i As Integer, j As Integer
For i = 3 To 12
    For j = 3 To 11
        DrawSquare i * 16 + j
    Next
Next

End Sub

' 动画
Public Sub Animate(ByVal mv As Long, ByVal nSteps As Integer)

Dim sqSrc As Integer, sqDst As Integer
Dim i As Integer, xSrc As Long, ySrc As Long, xDst As Long, yDst As Long, img As Image

sqSrc = Src(mv)
sqDst = Dst(mv)
yDst = sqDst \ 16
xDst = sqDst Mod 16
Set img = App_frmMain.imgSquares((yDst - 3) * 9 + xDst - 3)
xDst = img.Left
yDst = img.Top
ySrc = sqSrc \ 16
xSrc = sqSrc Mod 16
Set img = App_frmMain.imgSquares((ySrc - 3) * 9 + xSrc - 3)
xSrc = img.Left
ySrc = img.Top
img.ZOrder
For i = 1 To nSteps
    img.Move (xSrc * (nSteps - i) + xDst * i) \ nSteps, (ySrc * (nSteps - i) + yDst * i) \ nSteps
    img.Refresh
    Sleep 20
Next
If Options_bLargeGui Then
    img.Picture = frmHide.imgPiecesLarge(0).Picture
Else
    img.Picture = frmHide.imgPiecesSmall(0).Picture
End If
img.Move xSrc, ySrc
img.Refresh

End Sub

' 点击棋盘
Public Sub ClickSquare(ByVal sq As Integer)

Dim pc As Integer, mv As Long, nStatus As Long

pc = App_pos.ucpcSquares(sq)
If (pc And (16 + App_pos.sdPlayer * 16)) <> 0 Then
    If App_sqSelected > 0 Then
        DrawSquare App_sqSelected
    End If
    App_sqSelected = sq
    DrawSquare App_sqSelected, DRAW_SELECTED
    If App_mvLast > 0 Then
        DrawSquare Src(App_mvLast)
        DrawSquare Dst(App_mvLast)
    End If
    PlayWavSound "CLICK"
ElseIf App_sqSelected > 0 Then
    mv = Move(App_sqSelected, sq)
    If CchessTryMove(App_pos, nStatus, mv) Then
        If Options_nMoveDelay > 0 Then
            Animate mv, Options_nMoveDelay * 5
        End If
        ' 随后电脑思考可能会阻塞，所以要强制刷新
        DrawSquare Src(mv), DRAW_SELECTED, , DRAW_REFRESH
        DrawSquare Dst(mv), DRAW_SELECTED, , DRAW_REFRESH
        App_mvLast = mv
        App_sqSelected = 0
        App_nPhase = GetResult(nStatus)
        If App_nPhase = PHASE_READY Then
            mv = GetBestMove
            If App_mvLast > 0 Then
                DrawSquare Src(App_mvLast)
                DrawSquare Dst(App_mvLast)
            End If
            CchessTryMove App_pos, nStatus, mv
            If Options_nMoveDelay > 0 Then
                Sleep Options_nMoveDelay * 800
                Animate mv, Options_nMoveDelay * 5
            End If
            DrawSquare Src(mv), DRAW_SELECTED
            DrawSquare Dst(mv), DRAW_SELECTED
            App_mvLast = mv
            App_nPhase = GetResult(nStatus)
        End If
        If App_nPhase = PHASE_WIN And App_nHint = HINT_RETRY Then
            If MsgBox(L("您是使用提示功能通过本关的，是否不用提示再试一次？", _
                    "您是使用提示功能通過本關的，是否不用提示再試一次？"), vbQuestion + vbYesNo) = vbYes Then
                LoadGame
            End If
        End If
    ElseIf (nStatus And MOVE_INCHECK) <> 0 Then
        PlayWavSound "ILLEGAL"
    End If
End If

End Sub

' 获得闯关结果
Public Function GetResult(ByVal nStatus As Long) As Integer

Dim sqMate As Integer
App_frmMain.mnGameRetract.Enabled = True
App_frmMain.btnRetract.Enabled = True
If (nStatus And MOVE_MATE) <> 0 Then
    App_frmMain.mnGameHint.Enabled = False
    App_frmMain.btnHint.Enabled = False
    If App_pos.sdPlayer = 0 Then
        PlayWavSound "LOSS"
        If App_pos.ucsqPieces(16) > 0 Then
            DrawSquare App_pos.ucsqPieces(16), , DRAW_MATE
        End If
        MsgBoxIcon L("请再接再厉！", "請再接再厲！"), , , , ICON_LOSS
        GetResult = PHASE_LOSS
    Else
        App_frmMain.mnGameXQWizard.Enabled = True
        If Gui_nCurr < App_nEndgames - 1 Then
            App_frmMain.mnGameNext.Enabled = True
            App_frmMain.btnNext.Enabled = True
        End If
        PlayWavSound "WIN"
        If App_pos.ucsqPieces(32) > 0 Then
            DrawSquare App_pos.ucsqPieces(32), , DRAW_MATE
        End If
        If Gui_nCurr = App_nEndgames - 1 Then
            MsgBoxIcon L("恭喜你闯过所有关卡！", "恭喜你闖過所有關卡！"), , , , ICON_WIN
        Else
            MsgBoxIcon L("恭喜你过关！", "恭喜你過關！"), , , , ICON_WIN
        End If
        If Gui_nCurr = Gui_nLast Then
            Gui_nLast = Gui_nLast + 1
        End If
        GetResult = PHASE_WIN
    End If
    Exit Function
End If
If (nStatus And (MOVE_PERPETUAL Or MOVE_DRAW)) <> 0 Then
    App_frmMain.mnGameHint.Enabled = False
    App_frmMain.btnHint.Enabled = False
    PlayWavSound "LOSS"
    MsgBoxIcon L("请不要气馁！", "請不要氣餒！"), , , , ICON_LOSS
    GetResult = PHASE_LOSS
    Exit Function
End If
' 由于"position fen ..."使用EPD文件中的初始局面，所以即便吃子也不能置pos为不可逆
If (nStatus And MOVE_CHECK) <> 0 Then
    PlayWavSound "CHECK" & IIf(App_pos.sdPlayer = 0, "2", "")
ElseIf (nStatus And MOVE_CAPTURE) <> 0 Then
    PlayWavSound "CAPTURE" & IIf(App_pos.sdPlayer = 0, "2", "")
Else
    PlayWavSound "MOVE" & IIf(App_pos.sdPlayer = 0, "2", "")
End If
GetResult = PHASE_READY

End Function

' 获得最佳走法
Public Function GetBestMove() As Long

Dim lpStr As Long, mv As Long, nStatus As Long
Dim i As Integer, sz As String

App_frmMain.MousePointer = vbHourglass
sz = "position fen " & App_szEndgames(Gui_nCurr)
If App_pos.nMoveNum > 1 Then
    sz = sz & " moves"
    For i = 1 To App_pos.nMoveNum - 1
        sz = sz & " " & Move2Coord(App_pos.rbsList(i).mvs And &HFFFF&)
    Next
End If
PipeLineOutput Engine_pipe, sz
PipeLineOutput Engine_pipe, "go nodes 10077696"
mv = 0
Do While mv = 0
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        ' DoEvents
        Sleep 1
    Else
        sz = AllocString(lpStr)
        If Left(sz, 9) = "bestmove " Then
            mv = Coord2Move(Mid(sz, 10, 4))
        End If
    End If
Loop
GetBestMove = mv
App_frmMain.MousePointer = vbDefault

End Function

' 获取存档
Public Sub DoLoad(ByVal nScore As Integer)

Dim bLoad As Boolean
bLoad = False
If nScore > Gui_nLast Then
    bLoad = True
ElseIf MsgBox(L("您将获取的成绩不如当前成绩，是否覆盖当前成绩？", _
        "您將獲取的成績不如當前成績，是否覆蓋當前成績？"), vbQuestion + vbYesNo) = vbYes Then
    bLoad = True
End If
If Not bLoad Then
    Exit Sub
End If
Gui_nLast = nScore
ClearHint
Gui_nCurr = IIf(Gui_nLast = App_nEndgames, Gui_nLast - 1, Gui_nLast)
LoadGame
MsgBox L("存档获取成功。", "存檔獲取成功。"), vbInformation

End Sub

' 获取存档
Public Sub OpenCode()

Dim szCode As String, nScore As Long
szCode = InputBox(L("您可以把存档码更新到其他电脑或手机上，也可以从其他电脑或手机上更新到这里。", _
        "您可以把存檔碼更新到其他電腦或手機上，也可以從其他電腦或手機上更新到這裡。"), _
        L("存档码", "存檔碼"), Mid(100000000 + Encrypt(Gui_nLast), 2))
If szCode = "" Then
    Exit Sub
End If
If Len(szCode) <> 8 Then
    MsgBox L("存档码必须是8为数字。", "存档码必须是8为数字。"), vbExclamation
    Exit Sub
End If
nScore = Decrypt(Str2Lng(szCode, 0, 99999999))
If nScore < 0 Or nScore > App_nEndgames Then
    MsgBox L("存档码错误，请仔细核对。", "存档码错误，请仔细核对。"), vbExclamation
    Exit Sub
End If
If nScore <> Gui_nLast Then
    DoLoad nScore
End If

End Sub

' 连接错误提示
Public Sub ConnError()

MsgBox L("无法登录到象棋巫师用户中心，请稍后再试。", _
        "無法登錄到像棋巫師用戶中心，請稍後再試。"), vbExclamation

End Sub

' 是否登录用户中心
Public Sub NoRegError(ByVal szPrompt As String)

If MsgBox(szPrompt, vbQuestion + vbYesNo) = vbYes Then
    ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=xqblight", _
            vbNullString, vbNullString, vbNormalFocus
End If

End Sub

' 尝试提示
Public Sub TryHint()

Dim dfThinkTime As Double, mv As Long, i As Integer

dfThinkTime = Timer
dfThinkTime = dfThinkTime + IIf(dfThinkTime < App_dfHintTime, 86400#, 0#) - App_dfHintTime
If dfThinkTime < 60 Then
    MsgBox L("您只思考了不到1分钟，请再多想想吧。", "您只思考了不到1分鐘，請再多想想吧。"), vbExclamation
    Exit Sub
End If

#If Not RETAIL_VERSION Then
    If App_nHint = HINT_NONE And Gui_nCurr >= 500 Then
        Login_szAct = "hint"
        frmLogin.Show vbModal, App_frmMain
        If Login_nStatus <> LOGIN_OK Then
            Exit Sub
        End If
    End If
#End If

App_nHint = HINT_RETRY
mv = GetBestMove
If App_sqSelected > 0 Then
    DrawSquare App_sqSelected
ElseIf App_mvLast > 0 Then
    DrawSquare Src(App_mvLast)
    DrawSquare Dst(App_mvLast)
End If
For i = 1 To 5
    DrawSquare Src(mv), DRAW_SELECTED, , DRAW_REFRESH
    Sleep 250
    DrawSquare Dst(mv), DRAW_SELECTED, , DRAW_REFRESH
    DrawSquare Src(mv), , , DRAW_REFRESH
    Sleep 250
    DrawSquare Dst(mv), , , DRAW_REFRESH
Next
If App_sqSelected > 0 Then
    DrawSquare App_sqSelected, DRAW_SELECTED
ElseIf App_mvLast > 0 Then
    DrawSquare Src(App_mvLast), DRAW_SELECTED
    DrawSquare Dst(App_mvLast), DRAW_SELECTED
End If

End Sub

' 尝试悔棋
Public Sub TryRetract()

If App_pos.nDistance = 0 Then
    MsgBox L("悔棋失败。", "悔棋失敗。"), vbInformation
    Exit Sub
End If

#If Not RETAIL_VERSION Then
    If Gui_nCurr >= 500 Then
        Login_szAct = "retract"
        frmLogin.Show vbModal, App_frmMain
        If Login_nStatus <> LOGIN_OK Then
            Exit Sub
        End If
    End If
#End If

If App_pos.nDistance Mod 2 = 0 Then
    CchessUndoMove App_pos
End If
CchessUndoMove App_pos
BoardFlush
App_sqSelected = 0
App_mvLast = 0
App_nPhase = PHASE_READY
If App_pos.nDistance = 0 Then
    App_frmMain.mnGameRetract.Enabled = False
    App_frmMain.btnRetract.Enabled = False
End If
App_frmMain.mnGameHint.Enabled = True
App_frmMain.btnHint.Enabled = True

End Sub

' 用象棋巫师打开
Public Sub OpenWithXQWizard()

Dim nFileNo As Integer, i As Integer, szFile As String
Dim nStatus As Long, mv As Long, dwFileStr As Long
Dim posStart As PositionStruct

szFile = L("象棋巫师魔法学校.PGN", "象棋巫師魔法學校.PGN")
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath & szFile For Output As #nFileNo
On Error GoTo 0
Print #nFileNo, "[Game ""Chinese Chess""]"
If Options_nLanguage = LANGUAGE_ZH_CN Then
    Print #nFileNo, "[Event ""第 " & (Gui_nCurr + 1) & " 关 - 象棋巫师魔法学校""]"
Else
    Print #nFileNo, "[Event ""第 " & (Gui_nCurr + 1) & " 關 - 象棋巫師魔法學校""]"
End If
Print #nFileNo, "[Result ""1-0""]"
Print #nFileNo, "[FEN """ & App_szEndgames(Gui_nCurr) & """]"

CchessFen2Board posStart, App_szEndgames(Gui_nCurr)
For i = 0 To App_pos.nMoveNum - 2
    mv = App_pos.rbsList(i + 1).mvs And &HFFFF&
    dwFileStr = CchessMove2File(mv, posStart)
    If i Mod 2 = 0 Then ' 红
        Print #nFileNo, " " & (i \ 2 + 1) & ". " & MkC(CchessFile2Chin(dwFileStr, 0));
    Else ' 黑
        Print #nFileNo, " " & MkC(CchessFile2Chin(dwFileStr, 1))
    End If
    CchessTryMove posStart, nStatus, mv
Next
Print #nFileNo, " 1-0"
Print #nFileNo, "======================"
Print #nFileNo, L("欢迎访问象棋百科全书网", "歡迎訪問象棋百科全書網")
Print #nFileNo, L("推荐用象棋巫师观赏棋谱", "推荐用象棋巫師觀賞棋譜")
Print #nFileNo, "http://www.xqbase.com/"
Close #nFileNo

On Error GoTo lnErrorOpen
Shell App_szPath & "XQWIZARD.EXE """ & App_szPath & szFile & """", vbNormalFocus
On Error GoTo 0

Exit Sub
lnErrorOpen:
On Error GoTo 0
ErrorOpen App_szPath & szFile

End Sub

' 尝试提交
Public Sub TrySave()

Login_szAct = "save?score=" & Gui_nLast
frmLogin.Show vbModal, App_frmMain
If Login_nStatus = LOGIN_OK Then
    MsgBox L("存档提交成功。", "存檔提交成功。"), vbInformation
End If

End Sub

' 尝试获取
Public Sub TryLoad()

Login_szAct = "queryscore"
frmLogin.Show vbModal, App_frmMain
If Login_nStatus = LOGIN_OK Then
    DoLoad Str2Int(Login_szResult, 0, App_nEndgames)
End If

End Sub

' 尝试获取点数
Public Sub TryPoints()

Dim szResults() As String
Login_szAct = "querypoints"
frmLogin.Show vbModal, App_frmMain
If Login_nStatus <> LOGIN_OK Then
    Exit Sub
End If

szResults = Split(Login_szResult, "|")
If UBound(szResults) = 1 Then
    If Options_nLanguage = LANGUAGE_ZH_CN Then
        MsgBox "您还有 " & szResults(0) & " 点可用。" & IIf(Str2Int(szResults(1)) < 2800, "", _
                vbCrLf & vbCrLf & "您是黄金会员用户，可以无限次使用提示和悔棋功能。"), vbInformation
    Else
        MsgBox "您還有 " & szResults(0) & " 點可用。" & IIf(Str2Int(szResults(1)) < 2800, "", _
                vbCrLf & vbCrLf & "您是黄金會員用戶，可以無限次使用提示和悔棋功能。"), vbInformation
    End If
Else
    ConnError
End If

End Sub

' 尝试排名
Public Sub TryRank()
    
Login_szAct = "queryrank"
frmLogin.Show vbModal, App_frmMain
If Login_nStatus = LOGIN_OK Then
    If UBound(Split(Login_szResult, "|")) = 2 Then
        frmRank.Show vbModal, App_frmMain
    Else
        ConnError
    End If
End If

End Sub

' 尝试提交存档到手机
Public Sub TryGetCode()

Login_szAct = "getcode?score=" & Gui_nLast
frmLogin.Show vbModal, App_frmMain
If Login_nStatus = LOGIN_OK Then
    MsgBox L("存档码是[", "存檔碼是[") & Login_szResult & _
            L("]，请将这8位数字输入到手机。", "]，請將這8位數字輸入到手機。"), vbInformation
End If

End Sub

' 尝试提交存档到手机
Public Sub TryPutCode()

Dim szCode As String
szCode = ""
Do
    szCode = InputBox(L("请输入手机上显示的8位存档码：", "請輸入手機上顯示的8位存檔碼："), _
            L("从手机获取存档", "從手機獲取存檔"), szCode)
    If szCode = "" Then
        Exit Sub
    End If
    If Len(szCode) = 8 Then
        Exit Do
    End If
    MsgBox L("存档码必须是8位数字", "存檔碼必須是8位數字"), vbExclamation
Loop
Login_szAct = "putcode?code=" & szCode
frmLogin.Show vbModal, App_frmMain
If Login_nStatus = LOGIN_OK Then
    DoLoad Str2Int(Login_szResult, 0, App_nEndgames)
End If

End Sub

' 切换界面
Public Sub SwapGui()

Dim bLargeGui As Boolean
bLargeGui = App_frmMain.mnOptionsGuiSmall.Checked
App_frmMain.mnOptionsGuiSmall.Checked = Not bLargeGui
App_frmMain.mnOptionsGuiLarge.Checked = bLargeGui
SaveSetting "XQWizard", "Options", "LargeGui", IIf(bLargeGui, "1", "0")
MsgBox L("显示模式已经更改，重新启动程序后才能生效。", "顯示模式已經更改，重新啟動程序後才能生效。"), vbInformation

End Sub

' 从注册表加载参数
Public Sub LoadRegs2()

Dim nLastOld As Integer, nLastNew As Integer
nLastOld = Str2Int(GetSetting("XQBooth", "Gui", "Last", "0"), 0, MAX_ENDGAMES - 1)
nLastNew = Str2Int(GetSetting("XQWizard", "Booth", "Last", "0"), 0, MAX_ENDGAMES - 1)
Gui_nLast = IIf(nLastOld > nLastNew, nLastOld, nLastNew)
Gui_nCurr = Str2Int(GetSetting("XQWizard", "Booth", "Curr", "0"), 0, MAX_ENDGAMES - 1)
Login_szUserName = GetSetting("XQWizard", "Booth", "UserName", "")
Login_szPassword = GetSetting("XQWizard", "Booth", "Password", "")
Login_bRemember = GetSetting("XQWizard", "Booth", "Remember", "1") <> "0"

End Sub

' 保存参数到注册表
Public Sub SaveRegs2()

SaveSetting "XQWizard", "Booth", "Last", Gui_nLast
SaveSetting "XQWizard", "Booth", "Curr", Gui_nCurr
SaveSetting "XQWizard", "Booth", "UserName", Login_szUserName
' 只有32的位密码才是Cookie密码，可以保存在注册表
SaveSetting "XQWizard", "Booth", "Password", IIf(Login_bRemember And _
        Len(Login_szPassword) = 32, Login_szPassword, "")
SaveSetting "XQWizard", "Booth", "Remember", IIf(Login_bRemember, "1", "0")

End Sub

' 主窗口语言
Public Sub SetLang()

Dim i As Integer
If Options_nLanguage = LANGUAGE_ZH_CN Then
    Exit Sub
End If
App.Title = "象棋巫師魔法學校"
App_frmMain.Font.Charset = 136
App_frmMain.Font.Name = "細明體"
On Error Resume Next
For i = 0 To App_frmMain.Controls.Count - 1
    App_frmMain.Controls(i).Font = App_frmMain.Font
Next
On Error GoTo 0
' 菜单
App_frmMain.mnGame.Caption = "游戲(&G)"
App_frmMain.mnGameSelect.Caption = "選關(&O)..."
App_frmMain.mnGameNext.Caption = "下一關(&N)"
App_frmMain.mnGameRestart.Caption = "再試一次(&R)"
App_frmMain.mnGameXQWizard.Caption = "用象棋巫師打開(&X)"
App_frmMain.mnGameHint.Caption = "提示(&H)"
App_frmMain.mnGameRetract.Caption = "悔棋(&T)"
App_frmMain.mnGameCode.Caption = "存檔碼(&C)"
App_frmMain.mnGameExit.Caption = "离開(&X)"

App_frmMain.mnUsers.Caption = "用戶中心(&U)"
App_frmMain.mnUsersSave.Caption = "提交存檔(&S)"
App_frmMain.mnUsersLoad.Caption = "獲取存檔(&L)"
App_frmMain.mnUsersRank.Caption = "排名(&R)..."
App_frmMain.mnUsersPoints.Caption = "查詢點數(&P)..."
App_frmMain.mnUsersCenter.Caption = "用戶中心首頁(&C)"
App_frmMain.mnUsersHelp.Caption = "求助(&H)"
App_frmMain.mnUsersShare(0).Caption = "QQ空間(&Q)"
App_frmMain.mnUsersShare(1).Caption = "新浪微博(&S)"
App_frmMain.mnUsersShare(2).Caption = "開心網(&K)"
App_frmMain.mnUsersShare(3).Caption = "人人網(&R)"
App_frmMain.mnUsersPublish(0).Caption = "百度知道(&Z)"
App_frmMain.mnUsersPublish(1).Caption = "百度貼吧象棋吧(&T)"
App_frmMain.mnUsersPublish(2).Caption = "其他網站(&O)"

App_frmMain.mnMobile.Caption = "手機版(&M)"
App_frmMain.mnMobileSave.Caption = "提交存檔到手機(&S)..."
App_frmMain.mnMobileLoad.Caption = "從手機獲取存檔(&L)..."
App_frmMain.mnMobileDownload.Caption = "下載手機版(&D)"
App_frmMain.mnMobileRegister.Caption = "獲得許可證(&R)"

App_frmMain.mnHelp.Caption = "幫助(&H)"
App_frmMain.mnHelpQuote.Caption = "名言(&Q)..."
App_frmMain.mnHelpSuggest.Caption = "意見反饋(&S)"
App_frmMain.mnHelpShare_.Caption = "推薦給好友(&F)"
App_frmMain.mnHelpShare(0).Caption = "QQ空間(&Q)"
App_frmMain.mnHelpShare(1).Caption = "新浪微博(&S)"
App_frmMain.mnHelpShare(2).Caption = "開心網(&K)"
App_frmMain.mnHelpShare(3).Caption = "人人網(&R)"
App_frmMain.mnHelpShare(5).Caption = "其他網站(&O)"
App_frmMain.mnHelpUpdate.Caption = "檢查最新版本(&P)"
App_frmMain.mnHelpHome.Caption = "象棋巫師的網站(&H)"
App_frmMain.mnHelpAbout.Caption = "關于象棋巫師(&A)..."

' 按钮
App_frmMain.btnRetract.Caption = "悔棋"
App_frmMain.btnHint.Caption = "提示"
App_frmMain.btnRestart.Caption = "再試一次"
App_frmMain.btnNext.Caption = "下一關"

End Sub

' 主函数
Public Sub Main()

Dim i As Integer, nFileNo As Integer, bPrevInstance As Boolean, bLoaded As Boolean
Dim sz As String, lpStr As Long, dwResult As Long
Dim dfThisTime As Double, dfLastTime As Double

' 初始化
App_szPath = App.Path & IIf(Right(App.Path, 1) = "\", "", "\")
frmStartup.Show
frmStartup.Refresh
LoadRegs
CchessInit Options_nLanguage
LoadRegs2
LoadQuotes
#If RETAIL_VERSION Then
    InitCipher
#End If

' 加载残局
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath & ENDGAME_FILE For Input As #nFileNo
On Error GoTo 0
App_nEndgames = 0
Do While App_nEndgames < MAX_ENDGAMES And Not EOF(nFileNo)
    Line Input #nFileNo, sz
    i = InStr(sz, ";")
    If i > 0 Then
        App_szEndgames(App_nEndgames) = RTrim(Left(sz, i - 1))
        App_nEndgames = App_nEndgames + 1
    Else
        sz = RTrim(sz)
        If sz <> "" Then
            App_szEndgames(App_nEndgames) = sz
            App_nEndgames = App_nEndgames + 1
        End If
    End If
Loop
Close #nFileNo
If App_nEndgames = 0 Then
    Unload frmStartup
    ErrorOpen App_szPath & ENDGAME_FILE
    Exit Sub
End If
' Last的范围是[0, Endgames]
Gui_nLast = IIf(Gui_nLast > App_nEndgames, App_nEndgames, Gui_nLast)
' Curr的范围是[0, Min(Last, Endgames - 1)]
Gui_nCurr = IIf(Gui_nCurr > Gui_nLast, Gui_nLast, Gui_nCurr)
Gui_nCurr = IIf(Gui_nCurr > App_nEndgames - 1, App_nEndgames - 1, Gui_nCurr)

' 加载引擎
If GetAppType(App_szPath & "ELEEYE.EXE") <> IMAGE_SUBSYSTEM_WINDOWS_CUI Then
    Unload frmStartup
    MsgBox L("无法加载引擎：", "無法加載引擎：") & App_szPath & "ELEEYE.EXE", vbExclamation
    Exit Sub
End If
PipeOpen Engine_pipe, App_szPath & ENGINE_FILE
PipeLineOutput Engine_pipe, "ucci"
dfLastTime = Timer
bLoaded = False
Do While Not bLoaded
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        If dfThisTime > dfLastTime + 60# Then
            Exit Do
        End If
    Else
        sz = AllocString(lpStr)
        If sz = "ucciok" Then
            bLoaded = True
        End If
    End If
Loop
If Not bLoaded Then
    PipeLineOutput Engine_pipe, "quit"
    PipeClose Engine_pipe
    Unload frmStartup
    MsgBox L("无法加载引擎：", "無法加載引擎：") & App_szPath & "ELEEYE.EXE" & vbCrLf & vbCrLf & _
            L("这可能是由于您的电脑负荷过重而引起的，请退出象棋巫师魔法学校Ⅱ并重新运行试试看。", _
            "這可能是由於您的電腦負荷過重而引起的，請退出象棋巫師魔法學校Ⅱ並重新運行試試看。"), vbExclamation
    Exit Sub
End If
' 电脑执黑，不能只考虑将军走法
' PipeLineOutput Engine_pipe, "setoption alwayscheck true"

' 加载广告，如果加载失败，则下载广告列表，再次加载失败则放弃
Gui_dfLastTime = 0#
Gui_nAdvertIndex = 0
Gui_nAdvertTimes(0) = 10 ' 10秒钟后开始播放广告
LoadAdvertList
If Gui_nAdvertNum = 0 Then
    #If RETAIL_VERSION Then
        DownloadAdvertList "advert_retail.txt"
    #Else
        DownloadAdvertList "advert_0450.txt"
    #End If
    LoadAdvertList
    If Gui_nAdvertNum = 0 Then
        Gui_nAdvertNum = 1
        Gui_szAdvertFiles(1) = "xqbase"
        Gui_nAdvertTimes(1) = 32767
    Else
        Gui_szAdvertDate = Date
    End If
End If
' 检查更新，如果用户决定更新，会弹出下载页面，出现在象棋巫师页面之前
#If Not RETAIL_VERSION Then
    If Gui_szUpgradeDate <> Date Then
        CheckUpdate "xqwizard"
    End If
#End If
If Options_bLargeGui Then
    Set App_frmMain = frmMainLarge
Else
    Set App_frmMain = frmMainSmall
End If
ClearHint
LoadGame
' 在显示窗口以前，先把语言设置好
SetLang
SetLangOptions App_frmMain
' 如果是零售版，则隐藏“推荐给好友”和“检查更新”
#If RETAIL_VERSION Then
    App_frmMain.mnHelpShare_.Visible = False
    App_frmMain.mnHelpSep2.Visible = False
    App_frmMain.mnHelpUpdate.Visible = False
    App_frmMain.mnUsers.Visible = False
    App_frmMain.mnMobile.Visible = False
#Else
    App_frmMain.mnGameCode.Visible = False
    App_frmMain.mnGameSep4.Visible = False
#End If
App_frmMain.Show
App_frmMain.web.Navigate2 App_szPath & "ADVERT\xqbase.htm"
App_frmMain.mnOptionsGuiSmall.Checked = Not Options_bLargeGui
App_frmMain.mnOptionsGuiLarge.Checked = Options_bLargeGui
App_frmMain.mnOptionsSounds.Checked = Options_bSounds
App_frmMain.mnOptionsLanguage(Options_nLanguage).Checked = True
Unload frmStartup

Login_nStatus = LOGIN_FIRST
' 主循环
App_bRunning = True
bPrevInstance = App.PrevInstance
Do While App_bRunning
    ' 音乐
    If Options_nMusic > MUSIC_NONE And Not bPrevInstance Then
        If frmHide.mci.Length = frmHide.mci.Position Then
            frmHide.mci.To = 0
            frmHide.mci.Command = "Seek"
            frmHide.mci.Command = "Play"
        End If
    End If
    ' 广告
    dfThisTime = Timer
    dfThisTime = dfThisTime + IIf(dfThisTime < Gui_dfLastTime, 86400#, 0#)
    If dfThisTime > Gui_dfLastTime + Gui_nAdvertTimes(Gui_nAdvertIndex) Then
        Gui_dfLastTime = Timer
        Gui_nAdvertIndex = Gui_nAdvertIndex + 1
        If Gui_nAdvertIndex > Gui_nAdvertNum Then
            Gui_nAdvertIndex = 1
        End If
        App_frmMain.web.Visible = False
        App_frmMain.web.Navigate2 App_szPath & "ADVERT\" & Gui_szAdvertFiles(Gui_nAdvertIndex) & ".htm"
        App_frmMain.web.Visible = True
    End If
    DoEvents
    Sleep 1
Loop
' 退出前下载广告列表
If Gui_szAdvertDate <> Date Then
    #If RETAIL_VERSION Then
        DownloadAdvertList "advert_retail.txt"
    #Else
        DownloadAdvertList "advert_0450.txt"
    #End If
    LoadAdvertList
    If Gui_nAdvertNum > 0 Then
        Gui_szAdvertDate = Date
    End If
End If
' 关闭引擎
PipeLineOutput Engine_pipe, "quit"
PipeClose Engine_pipe
' 退出
SaveRegs
SaveRegs2
PlaySoundA vbNullString, 0, 0
frmHide.mci.Command = "Close"
' 零售版不退弹
#If Not RETAIL_VERSION Then
    ExitPopup
#End If
Unload frmHide
Unload frmHide2

Exit Sub
lnErrorOpen:
On Error GoTo 0
Unload frmStartup
ErrorOpen App_szPath & ENDGAME_FILE

End Sub
