Attribute VB_Name = "mdlXQBooth"
' XQBOOTH.BAS - Source Code for XiangQi Witchcraft School, Part I
'
' XiangQi Witchcraft School - a Chinese Chess Endgame Challenge Game
' Designed by Morning Yellow, Version: 4.65, Last Modified: Jun. 2010
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

' 全局常量——象棋巫师参数
Public Const MAX_ENDGAMES       As Integer = 4096   ' 残局的最大条目数
Public Const ENDGAME_FILE       As String = "ENDGAMES\BOOTH.EPD"    ' 残局文件
Public Const ENGINE_FILE        As String = "ELEEYE.EXE"            ' 引擎文件
Public Const USERS_URL          As String = "http://www.xqbase.com/xqbooth/"    ' 用户中心地址
' Public Const USERS_URL          As String = "http://localhost:8080/xqbooth/"    ' 用户中心地址(调试用)
' 全局常量——可选参数
Public Const DRAW_SELECTED      As Boolean = True
Public Const DRAW_MATE          As Boolean = True
Public Const DRAW_REFRESH       As Boolean = True
' 全局常量——闯关阶段
Public Const PHASE_READY        As Integer = 0
Public Const PHASE_BUSY         As Integer = 1
Public Const PHASE_WIN          As Integer = 2
Public Const PHASE_LOSS         As Integer = 3
' 全局常量——提示状态
Public Const HINT_NONE          As Integer = 0
Public Const HINT_RESTART       As Integer = 1
Public Const HINT_RETRY         As Integer = 2
' 全局常量——用户中心事件
Public Const USERS_SAVE         As Integer = 0
Public Const USERS_LOAD         As Integer = 1
Public Const USERS_RANK         As Integer = 2
Public Const USERS_HINT         As Integer = 3
Public Const USERS_RETRACT      As Integer = 4
Public Const USERS_POINTS       As Integer = 5
Public Const USERS_GETCODE      As Integer = 6
Public Const USERS_PUTCODE      As Integer = 7

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
Public App_nPhaseSaved          As Integer  ' 待恢复的闯关阶段
Public App_nUsersEvent          As Integer  ' 用户中心事件
Public App_nHint                As Integer  ' 提示状态
Public App_dfHintTime           As Double   ' 提示允许时间
' 全局变量——进度
Public Gui_nCurr                As Integer  ' 当前残局的条目序号
Public Gui_nLast                As Integer  ' 最后残局的条目序号
' 全局变量——登录
Public Login_szTitle            As String   ' 登录框标题
Public Login_szPrompt           As String   ' 登录框提示
Public Login_bSuccess           As Boolean  ' 登录是否成功
Public Login_szUserName         As String   ' 登录用户名
Public Login_szPassword         As String   ' 登录密码
Public Login_bRemember          As Boolean  ' 记住密码
Public Login_szCode             As String   ' 手机存档码
' 全局变量——排名
Public Rank_nScore              As Integer  ' 排名成绩
Public Rank_nToday              As Long     ' 今日排名
Public Rank_nYesterday          As Long     ' 昨日排名
Public Rank_szList              As String   ' 排名列表
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
App_frmMain.btnNext.Visible = True
App_frmMain.btnRestart.Visible = False
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
        DrawSquare Src(mv), DRAW_SELECTED
        DrawSquare Dst(mv), DRAW_SELECTED
        App_mvLast = mv
        App_sqSelected = 0
        App_nPhase = GetResult(nStatus)
        If App_nPhase = PHASE_READY Then
            App_nPhase = PHASE_BUSY
            App_frmMain.MousePointer = vbHourglass
            mv = GetBestMove
            If App_mvLast > 0 Then
                DrawSquare Src(App_mvLast)
                DrawSquare Dst(App_mvLast)
            End If
            CchessTryMove App_pos, nStatus, mv
            DrawSquare Src(mv), DRAW_SELECTED
            DrawSquare Dst(mv), DRAW_SELECTED
            App_mvLast = mv
            App_nPhase = GetResult(nStatus)
            App_frmMain.MousePointer = vbDefault
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
App_frmMain.btnNext.Visible = False
App_frmMain.btnRestart.Visible = True
App_frmMain.mnGameRetract.Enabled = True
App_frmMain.btnRetract.Enabled = True
If (nStatus And MOVE_MATE) <> 0 Then
    App_frmMain.mnGameHint.Enabled = False
    App_frmMain.btnHint.Enabled = False
    If App_pos.sdPlayer = 0 Then
        PlayWavSound "PROMOTE2"
        If App_pos.ucsqPieces(16) > 0 Then
            DrawSquare App_pos.ucsqPieces(16), , DRAW_MATE
        End If
        MsgBoxIcon L("请再接再厉！", "請再接再厲！"), , , , ICON_LOSS
        GetResult = PHASE_LOSS
    Else
        App_frmMain.mnGameXQWizard.Enabled = True
        App_frmMain.btnRestart.Visible = False
        App_frmMain.btnNext.Visible = True
        If Gui_nCurr < App_nEndgames - 1 Then
            App_frmMain.mnGameNext.Enabled = True
            App_frmMain.btnNext.Enabled = True
        End If
        PlayWavSound "PROMOTE"
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
    PlayWavSound "PROMOTE2"
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
sz = "position fen " & App_szEndgames(Gui_nCurr)
If App_pos.nMoveNum > 1 Then
    sz = sz & " moves"
    For i = 1 To App_pos.nMoveNum - 1
        sz = sz & " " & Move2Coord(App_pos.rbsList(i).mvs And &HFFFF&)
    Next
End If
PipeLineOutput Engine_pipe, sz
PipeLineOutput Engine_pipe, "go time 15000"
mv = 0
Do While mv = 0
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        DoEvents
        Sleep 1
    Else
        sz = AllocString(lpStr)
        If Left(sz, 9) = "bestmove " Then
            mv = Coord2Move(Mid(sz, 10, 4))
        End If
    End If
Loop
GetBestMove = mv

End Function

' 提示
Public Sub DoHint()

Dim mv As Long, i As Integer

App_nHint = HINT_RETRY
mv = GetBestMove
App_frmMain.MousePointer = vbDefault
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

' 悔棋
Public Sub DoRetract()

If App_pos.nDistance = 0 Then
    MsgBox L("悔棋失败。", "悔棋失敗。"), vbInformation
    Exit Sub
End If
If App_pos.nDistance Mod 2 = 0 Then
    CchessUndoMove App_pos
End If
CchessUndoMove App_pos
BoardFlush
App_sqSelected = 0
App_mvLast = 0
' DoRetract 都是在 EnterBusy 后调用的，所以要修改 nPhaseSaved 而不是 nPhase
App_nPhaseSaved = PHASE_READY
If App_pos.nDistance = 0 Then
    App_frmMain.mnGameRetract.Enabled = False
    App_frmMain.btnRetract.Enabled = False
End If
App_frmMain.mnGameHint.Enabled = True
App_frmMain.btnHint.Enabled = True

End Sub

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
If bLoad Then
    Gui_nLast = nScore
    ClearHint
    Gui_nCurr = IIf(Gui_nLast = App_nEndgames, Gui_nLast - 1, Gui_nLast)
    LoadGame
    ' 这里在 LeaveBusy 前，所以要修改 nPhaseSaved 重置状态
    App_nPhaseSaved = PHASE_READY
    MsgBox L("存档获取成功。", "存檔獲取成功。"), vbInformation
End If

End Sub

' 等待用户中心响应开始
Public Sub EnterBusy()

App_nPhaseSaved = App_nPhase
App_nPhase = PHASE_BUSY
App_frmMain.MousePointer = vbHourglass

End Sub

' 等待用户中心响应结束
Public Sub LeaveBusy()

App_nPhase = App_nPhaseSaved
App_frmMain.MousePointer = vbDefault

End Sub

' 生成HTTP登录头信息
Public Function LoginHeaders() As String

LoginHeaders = "Login-UserName: " & Login_szUserName & vbCrLf & _
        "Login-Password: " & Login_szPassword & vbCrLf & _
        "Login-Charset: " & L("GBK", "BIG5") & vbCrLf

End Function

' 尝试提交
Public Sub TrySave()

If App_nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szTitle = L("提交存档", "提交存檔")
Login_szPrompt = ""
If Not Login_bSuccess Then
    frmLogin.Show vbModal, App_frmMain
End If
If Not Login_bSuccess Then
    Exit Sub
End If

EnterBusy
App_nUsersEvent = USERS_SAVE
On Error GoTo lnError
App_frmMain.Inet.Execute USERS_URL & "save", _
        "POST", "score=" & Gui_nLast, _
        "Content-Type: application/x-www-form-urlencoded" & vbCrLf & LoginHeaders
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
ConnError
LeaveBusy

End Sub

' 尝试获取
Public Sub TryLoad()

If App_nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szTitle = L("获取存档", "獲取存檔")
Login_szPrompt = ""
If Not Login_bSuccess Then
    frmLogin.Show vbModal, App_frmMain
End If
If Not Login_bSuccess Then
    Exit Sub
End If

EnterBusy
App_nUsersEvent = USERS_LOAD
On Error GoTo lnError
App_frmMain.Inet.Execute USERS_URL & "queryscore", "GET", "", LoginHeaders
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
MsgBox Err
ConnError
LeaveBusy

End Sub

' 尝试提示
Public Sub TryHint()

Dim dfThinkTime As Double
If App_nPhase = PHASE_BUSY Then
    Exit Sub
End If

dfThinkTime = Timer
dfThinkTime = dfThinkTime + IIf(dfThinkTime < App_dfHintTime, 86400#, 0#) - App_dfHintTime
If dfThinkTime / 60 < 1 + Gui_nCurr \ 1000 Then
    MsgBox L("您只思考了不到", "您只思考了不到") & Int(1 + dfThinkTime / 60) & _
            L("分钟，请再多想想吧。", "分鐘，請再多想想吧。"), vbExclamation
    Exit Sub
End If

If App_nHint <> HINT_NONE Or Gui_nCurr < 200 Then
    EnterBusy
    DoHint
    LeaveBusy
    Exit Sub
End If

Login_szTitle = L("提示", "提示")
If Gui_nCurr < 500 Then
    Login_szPrompt = L("200关以后需要登录用户中心", "200關以後需要登錄用戶中心")
Else
    Login_szPrompt = L("提示需要消耗点数10点", "提示需要消耗點數10點")
End If
If Not Login_bSuccess Then
    frmLogin.Show vbModal, App_frmMain
End If
If Not Login_bSuccess Then
    Exit Sub
End If

EnterBusy
App_nUsersEvent = USERS_HINT
On Error GoTo lnError
App_frmMain.Inet.Execute USERS_URL & "hint", "POST", "stage=" & Gui_nCurr, _
        "Content-Type: application/x-www-form-urlencoded" & vbCrLf & LoginHeaders
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
ConnError
LeaveBusy

End Sub

' 尝试悔棋
Public Sub TryRetract()

If App_nPhase = PHASE_BUSY Then
    Exit Sub
End If

If Gui_nCurr < 200 Then
    EnterBusy
    DoRetract
    LeaveBusy
    Exit Sub
End If

Login_szTitle = L("悔棋", "悔棋")
If Gui_nCurr < 500 Then
    Login_szPrompt = L("200关以后需要登录用户中心", "200關以後需要登錄用戶中心")
Else
    Login_szPrompt = L("悔棋需要消耗点数1点", "悔棋需要消耗點數1點")
End If
If Not Login_bSuccess Then
    frmLogin.Show vbModal, App_frmMain
End If
If Not Login_bSuccess Then
    Exit Sub
End If

EnterBusy
App_nUsersEvent = USERS_RETRACT
On Error GoTo lnError
App_frmMain.Inet.Execute USERS_URL & "retract", "POST", "stage=" & Gui_nCurr, _
        "Content-Type: application/x-www-form-urlencoded" & vbCrLf & LoginHeaders
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
ConnError
LeaveBusy

End Sub

' 尝试查询排名
Public Sub TryRank()

If App_nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szTitle = L("查询排名", "查詢排名")
Login_szPrompt = ""
If Not Login_bSuccess Then
    frmLogin.Show vbModal, App_frmMain
End If
If Not Login_bSuccess Then
    Exit Sub
End If

EnterBusy
Rank_szList = ""
On Error Resume Next
Rank_szList = frmHide.Inet.OpenURL(USERS_URL & "ranklist?encoding=" & L("GBK", "BIG5"))
On Error GoTo 0
If Rank_szList = "" Then
    ConnError
    LeaveBusy
    Exit Sub
End If

App_nUsersEvent = USERS_RANK
On Error GoTo lnError
App_frmMain.Inet.Execute USERS_URL & "queryrank", "GET", "", LoginHeaders
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
ConnError
LeaveBusy

End Sub

' 尝试查询点数
Public Sub TryPoints()

If App_nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szTitle = L("查询点数", "查詢點數")
Login_szPrompt = ""
If Not Login_bSuccess Then
    frmLogin.Show vbModal, App_frmMain
End If
If Not Login_bSuccess Then
    Exit Sub
End If

EnterBusy
App_nUsersEvent = USERS_POINTS
On Error GoTo lnError
App_frmMain.Inet.Execute USERS_URL & "querypoints", "GET", "", LoginHeaders
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
MsgBox Err
ConnError
LeaveBusy

End Sub

' 尝试提交存档到手机
Public Sub TryGetCode()

If App_nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szTitle = L("提交存档到手机", "提交存檔到手機")
Login_szPrompt = ""
If Not Login_bSuccess Then
    frmLogin.Show vbModal, App_frmMain
End If
If Not Login_bSuccess Then
    Exit Sub
End If

EnterBusy
App_nUsersEvent = USERS_GETCODE
On Error GoTo lnError
App_frmMain.Inet.Execute USERS_URL & "getcode", _
        "POST", "score=" & Gui_nLast, _
        "Content-Type: application/x-www-form-urlencoded" & vbCrLf & LoginHeaders
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
MsgBox Err
ConnError
LeaveBusy

End Sub

' 尝试提交存档到手机
Public Sub TryPutCode()

If App_nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szCode = ""
Do
    Login_szCode = InputBox(L("请输入手机上显示的8位存档码：", "請輸入手機上顯示的8位存檔碼："), _
            L("从手机获取存档", "從手機獲取存檔"), Login_szCode)
    If Login_szCode = "" Then
        Exit Sub
    End If
    If Len(Login_szCode) = 8 Then
        Exit Do
    End If
    MsgBox L("存档码必须是8位数字", "存檔碼必須是8位數字"), vbExclamation
Loop

Login_szTitle = L("从手机获取存档", "從手機獲取存檔")
Login_szPrompt = ""
If Not Login_bSuccess Then
    frmLogin.Show vbModal, App_frmMain
End If
If Not Login_bSuccess Then
    Exit Sub
End If

EnterBusy
App_nUsersEvent = USERS_PUTCODE
On Error GoTo lnError
App_frmMain.Inet.Execute USERS_URL & "putcode", _
        "POST", "code=" & Login_szCode, _
        "Content-Type: application/x-www-form-urlencoded" & vbCrLf & LoginHeaders
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
MsgBox Err
ConnError
LeaveBusy

End Sub

' 连接错误提示
Public Sub ConnError()

MsgBox L("无法登录到象棋巫师用户中心，请稍后再试。", _
        "無法登錄到像棋巫師用戶中心，請稍後再試。"), vbExclamation

End Sub

' 密码错误提示
Public Sub LoginError()

MsgBox L("用户名或密码不正确。", "用戶名或密碼不正確。"), vbExclamation
Login_bSuccess = False

End Sub

' 禁止重试提示
Public Sub NoRetryError()

MsgBox L("您的密码已经连续5次输入错误，请过5分钟再做尝试。", _
        "您的密碼已經連續5次輸入錯誤，請過5分鐘再做嘗試。"), vbExclamation
Login_bSuccess = False

End Sub

' 点数不足提示
Public Sub NoPointsError(ByVal nPoints As Integer)

MsgBox L("您的点数不足", "您的點數不足") & nPoints & _
        L("点，补充点数后才能使用此功能。", "點，補充點數後才能使用此功能。"), vbExclamation
ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/charge.htm", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

' 是否登录用户中心
Public Sub NoRegError(ByVal szPrompt As String)

If MsgBox(szPrompt, vbQuestion + vbYesNo) = vbYes Then
    ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=xqblight", _
            vbNullString, vbNullString, vbNormalFocus
End If

End Sub

' 处理用户中心响应
Public Sub DoUsersEvent()

Dim szResult As String, szPassword As String
Dim nResult As Integer, szResults() As String

szPassword = App_frmMain.Inet.GetHeader("Login-Cookie")
If szPassword <> "" Then
    Login_szPassword = szPassword
End If
szResult = App_frmMain.Inet.GetHeader("Login-Result")
Select Case App_nUsersEvent

Case USERS_SAVE
    ' 请求“提交”，处理响应
    Select Case szResult
    Case "ok"
        MsgBox L("存档提交成功。", "存檔提交成功。"), vbInformation
    Case "nosave"
        MsgBox L("您以前提交的成绩比当前成绩好，当前成绩不予提交。", _
                "您以前提交的成績比當前成績好，當前成績不予提交。"), vbInformation
    Case "error"
        LoginError
        LeaveBusy
        TrySave
        Exit Sub
    Case "noretry"
        NoRetryError
    Case Else
        ConnError
    End Select

Case USERS_LOAD
    ' 请求“获取”，处理响应
    Select Case szResult
    Case "error"
        LoginError
        LeaveBusy
        TryLoad
        Exit Sub
    Case "noretry"
        NoRetryError
    Case Else
        If (Left(szResult, 3) = "ok ") Then
            DoLoad Str2Int(Mid(szResult, 4), 0, App_nEndgames)
        Else
            ConnError
        End If
    End Select

Case USERS_RANK
    ' 请求“排名”，获取响应
    Select Case szResult
    Case "error"
        LoginError
        LeaveBusy
        TryRank
        Exit Sub
    Case "noretry"
        NoRetryError
    Case Else
        If (Left(szResult, 3) = "ok ") Then
            szResults = Split(Mid(szResult, 4), "|")
            If UBound(szResults) = 2 Then
                Rank_nScore = Str2Int(szResults(0), 0, App_nEndgames)
                Rank_nToday = Str2Lng(szResults(1))
                Rank_nYesterday = Str2Lng(szResults(2))
                frmRank.Show vbModal, App_frmMain
            Else
                ConnError
            End If
        Else
            ConnError
        End If
    End Select

Case USERS_HINT
    ' 请求“提示”，获取响应
    Select Case szResult
    Case "ok"
        DoHint
    Case "error"
        LoginError
        LeaveBusy
        TryHint
        Exit Sub
    Case "noretry"
        NoRetryError
    Case "nopoints"
        NoPointsError IIf(Gui_nCurr > 1000, Gui_nCurr \ 100, 10)
    Case Else
        ConnError
    End Select

Case USERS_RETRACT
    ' 请求“悔棋”，获取响应
    Select Case szResult
    Case "ok"
        DoRetract
    Case "error"
        LoginError
        LeaveBusy
        TryRetract
        Exit Sub
    Case "noretry"
        NoRetryError
    Case "nopoints"
        NoPointsError 1
    Case Else
        ConnError
    End Select

Case USERS_POINTS
    ' 请求“查询点数”，处理响应
    Select Case szResult
    Case "error"
        LoginError
        LeaveBusy
        TryPoints
        Exit Sub
    Case "noretry"
        NoRetryError
    Case Else
        If (Left(szResult, 3) = "ok ") Then
            szResults = Split(Mid(szResult, 4), "|")
            If UBound(szResults) = 1 Then
                nResult = Str2Int(szResults(1))
                If Options_nLanguage = LANGUAGE_ZH_CN Then
                    MsgBox "您还有 " & szResults(0) & " 点可用。" & IIf(nResult < 2800, "", _
                            vbCrLf & vbCrLf & "您是黄金会员用户，可以无限次使用提示和悔棋功能。"), vbInformation
                Else
                    MsgBox "您還有 " & szResults(0) & " 點可用。" & IIf(nResult < 2800, "", _
                            vbCrLf & vbCrLf & "您是黄金會員用戶，可以無限次使用提示和悔棋功能。"), vbInformation
                End If
            Else
                ConnError
            End If
        Else
            ConnError
        End If
    End Select

Case USERS_GETCODE, USERS_PUTCODE
    ' 请求“提交存档到手机”和“从手机获取存档”，获取响应
    Select Case szResult
    Case "error"
        LoginError
        LeaveBusy
        TryGetCode
        Exit Sub
    Case "noretry"
        NoRetryError
    Case "incorrrect"
        MsgBox L("存档码错误，请仔细核对手机上显示的8位存档码。", _
                "存檔碼錯誤，請仔細核對手機上顯示的8位存檔碼。"), vbExclamation
    Case "trial"
        NoRegError L("您尚未获得手机版许可证，无法使用同步存档功能。" & vbCrLf & "是否现在就去获得许可证？", _
                "您尚未獲得手機版許可證，無法使用同步存檔功能。" & vbCrLf & "是否現在就去獲得許可證？")
    Case "basic"
        NoRegError L("只有高级版许可证才能使用同步存档功能。" & vbCrLf & "是否现在就把许可证升级到高级版？", _
                "只有高級版許可證才能使用同步存檔功能。" & vbCrLf & "是否現在就把許可證升級到高級版？")
    Case "noreg"
        NoRegError L("您的许可证尚未在手机上生效。" & vbCrLf & "是否现在就去生效许可证？", _
                "您的許可證尚未在手機上生效。" & vbCrLf & "是否現在就去生效許可證？")
    Case Else
        If (Left(szResult, 3) = "ok ") Then
            If App_nUsersEvent = USERS_GETCODE Then
                MsgBox L("存档码是[", "存檔碼是[") & Mid(szResult, 4) & _
                        L("]，请将这8位数字输入到手机。", "]，請將這8位數字輸入到手機。"), vbInformation
            Else
                DoLoad Str2Int(Mid(szResult, 4), 0, App_nEndgames)
            End If
        Else
            ConnError
        End If
    End Select

End Select
LeaveBusy

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

Gui_nLast = Str2Int(GetSetting("XQBooth", "Gui", "Last", "0"), 0, MAX_ENDGAMES - 1)
Gui_nCurr = Str2Int(GetSetting("XQBooth", "Gui", "Curr", "0"), 0, MAX_ENDGAMES - 1)
Login_szUserName = GetSetting("XQBooth", "Gui", "UserName", "")
Login_szPassword = GetSetting("XQBooth", "Gui", "Password", "")
Login_bRemember = GetSetting("XQBooth", "Gui", "Remember", "0") <> "0"

End Sub

' 保存参数到注册表
Public Sub SaveRegs2()

SaveSetting "XQBooth", "Gui", "Last", Gui_nLast
SaveSetting "XQBooth", "Gui", "Curr", Gui_nCurr
SaveSetting "XQBooth", "Gui", "UserName", Login_szUserName
' 只有32的位密码才是Cookie密码，可以保存在注册表
SaveSetting "XQBooth", "Gui", "Password", IIf(Login_bRemember And _
        Len(Login_szPassword) = 32, Login_szPassword, "")
SaveSetting "XQBooth", "Gui", "Remember", IIf(Login_bRemember, "1", "0")

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
App_frmMain.mnGameExit.Caption = "离開(&X)"

App_frmMain.mnUsers.Caption = "用戶中心(&U)"
App_frmMain.mnUsersSave.Caption = "提交存檔(&S)"
App_frmMain.mnUsersLoad.Caption = "獲取存檔(&L)"
App_frmMain.mnUsersRank.Caption = "排名(&R)..."
App_frmMain.mnUsersPoints.Caption = "查詢點數(&P)..."
App_frmMain.mnUsersCenter.Caption = "用戶中心首頁(&C)"
App_frmMain.mnUsersHelp.Caption = "求助(&E)..."
App_frmMain.mnUsers.Caption = "用戶中心(&U)"

App_frmMain.mnMobile.Caption = "手機版(&M)"
App_frmMain.mnMobileSave.Caption = "提交存檔到手機(&S)..."
App_frmMain.mnMobileLoad.Caption = "從手機獲取存檔(&L)..."
App_frmMain.mnMobileDownload.Caption = "下載手機版(&D)"
App_frmMain.mnMobileRegister.Caption = "獲得許可證(&R)"

App_frmMain.mnOptions.Caption = "選項(&O)"
App_frmMain.mnOptionsGui.Caption = "界面(&G)"
App_frmMain.mnOptionsGuiSmall.Caption = "小(&S)"
App_frmMain.mnOptionsGuiLarge.Caption = "大(&L)"
App_frmMain.mnOptionsBoard_.Caption = "棋盤(&B)"
App_frmMain.mnOptionsPieces_.Caption = "棋子(&P)"
App_frmMain.mnOptionsSounds.Caption = "音效(&S)"
App_frmMain.mnOptionsLanguage_.Caption = "語言/&Language"
App_frmMain.mnOptionsLanguage(0).Caption = "簡體中文/&Simplified Chinese"
App_frmMain.mnOptionsLanguage(1).Caption = "繁體中文/&Traditional Chinese"

App_frmMain.mnHelp.Caption = "幫助(&H)"
App_frmMain.mnHelpQuote.Caption = "名言(&Q)..."
App_frmMain.mnHelpSuggest.Caption = "意見反饋(&S)"
App_frmMain.mnHelpHome.Caption = "象棋巫師的網站(&H)"
App_frmMain.mnHelpUpdate.Caption = "檢查最新版本(&P)"
App_frmMain.mnHelpAbout.Caption = "關于象棋巫師(&A)..."

' 按钮
App_frmMain.btnRetract.Caption = "悔棋"
App_frmMain.btnHint.Caption = "提示"
App_frmMain.btnSave.Caption = "提交存檔"
App_frmMain.btnRestart.Caption = "再試一次"
App_frmMain.btnNext.Caption = "下一關"

End Sub

' 主函数
Public Sub Main()

Dim i As Integer, nFileNo As Integer, bLoaded As Boolean
Dim sz As String, lpStr As Long, dwResult As Long
Dim dfThisTime As Double, dfLastTime As Double

' 初始化
App_szPath = App.Path & IIf(Right(App.Path, 1) = "\", "", "\")
frmStartup.Show
frmStartup.Refresh
CchessInit
LoadRegs
LoadRegs2
LoadQuotes

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
        If dfThisTime > dfLastTime + 30# Then
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
    If (MsgBox(L("无法加载引擎：", "無法加載引擎：") & App_szPath & ENGINE_FILE & vbCrLf & _
            L("是否把这个情况汇报给象棋巫师开发团队？", "是否把這個情況匯報給象棋巫師開發團隊？"), _
            vbQuestion + vbYesNo)) = vbYes Then
        ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/help_engine.htm#load", _
                vbNullString, vbNullString, vbNormalFocus
    End If
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
    DownloadAdvertList "advert_0450.txt"
    LoadAdvertList
    If Gui_nAdvertNum = 0 Then
        Gui_nAdvertNum = 1
        Gui_szAdvertFiles(1) = "xqbase"
        Gui_nAdvertTimes(1) = 32767
    Else
        Gui_szAdvertDate = Date
    End If
End If
' 初始化 frmHide.web
frmHide.web.Navigate "about:blank"
' 检查更新，如果用户决定更新，会弹出下载页面，出现在象棋巫师页面之前
If Gui_szUpgradeDate <> Date Then
    CheckUpdate "xqbooth"
End If

If Options_bLargeGui Then
    Set App_frmMain = frmMainLarge
Else
    Set App_frmMain = frmMainSmall
End If
' 在显示窗口以前，先把语言设置好
SetLang
App_frmMain.Show
App_frmMain.web.Navigate2 App_szPath & "ADVERT\xqbase.htm"
App_frmMain.mnOptionsGuiSmall.Checked = Not Options_bLargeGui
App_frmMain.mnOptionsGuiLarge.Checked = Options_bLargeGui
App_frmMain.mnOptionsSounds.Checked = Options_bSounds
App_frmMain.mnOptionsLanguage(Options_nLanguage).Checked = True
Unload frmStartup

' 提示建立存档
If Login_szUserName = "" Then
    If Options_nLanguage = LANGUAGE_ZH_CN Then
        dwResult = MsgBox("　　建立象棋巫师魔法学校的闯关存档，就可以随时随地提交和获取闯关存档，" & _
                "并跟众多玩家一起参与闯关排名，充分享受提高棋艺的乐趣。" & vbCrLf & vbCrLf & _
                "　　是否现在就建立闯关存档？", vbQuestion + vbYesNo)
    Else
        dwResult = MsgBox("　　建立像棋巫師魔法學校的闖關存檔，就可以隨時隨地提交和獲取闖關存檔，" & _
                "並跟眾多玩家一起參與闖關排名，充分享受提高棋藝的樂趣。" & vbCrLf & vbCrLf & _
                "　　是否現在就建立闖關存檔？", vbQuestion + vbYesNo)
    End If
    If dwResult = vbYes Then
        ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=register", _
                vbNullString, vbNullString, vbNormalFocus
    End If
End If

' 主循环
Login_bSuccess = False
App_bRunning = True
Do While App_bRunning
    ' 播放广告可以跟引擎和播放棋局同时进行，所以不能用 Timer_dfLastTime，而是用 Gui_dfLastTime
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
    DownloadAdvertList "advert_0450.txt"
    LoadAdvertList
    If Gui_nAdvertNum > 0 Then
        Gui_szAdvertDate = Date
    End If
End If
' 关闭引擎
PipeLineOutput Engine_pipe, "quit"
dfLastTime = Timer
Do While bLoaded
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        If dfThisTime > dfLastTime + 1# Then
            Exit Do
        End If
    Else
        sz = AllocString(lpStr)
        If sz = "bye" Then
            bLoaded = False
        End If
    End If
Loop
PipeClose Engine_pipe
If bLoaded Then
    MsgBox L("无法正常卸载引擎！", "無法正常卸載引擎！"), vbExclamation
End If
' 退出
If Not Login_bRemember Then
    Login_szPassword = ""
End If
SaveRegs
SaveRegs2
PlaySoundA vbNullString, 0, 0
ExitPopup
Unload frmHide
Unload frmHide2

Exit Sub
lnErrorOpen:
On Error GoTo 0
Unload frmStartup
ErrorOpen App_szPath & ENDGAME_FILE

End Sub
