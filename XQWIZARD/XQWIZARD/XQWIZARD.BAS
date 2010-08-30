Attribute VB_Name = "mdlXQWizard"
' XQWIZARD.BAS - Source Code for XiangQi Wizard, Part I
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 4.73, Last Modified: Aug. 2010
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

Private Declare Sub SetFocus Lib "USER32.DLL" (ByVal hWnd As Long)

' 全局常量——象棋巫师参数
Public Const MAX_ENDGAMES       As Integer = 1024 ' 残局的最大条目数
Public Const MAX_EPD_MENU       As Integer = 15   ' 挑战菜单的数量
Public Const TIP_NUM            As Integer = 22   ' 日积月累条目数
Public Const TEMP_FILE_NAME_S   As String = "查看文本棋谱(只读).TXT"
Public Const TEMP_FILE_NAME_T   As String = "查看文本棋譜(只讀).TXT"
' 全局常量——可选参数
Public Const AUTO_SAVE          As Boolean = True ' ReadFile
Public Const WRITE_TEMP_FILE    As Boolean = True ' WriteFile
Public Const DRAW_SELECTED      As Boolean = True ' Draw...Square
Public Const DRAW_MATE          As Boolean = True ' Draw...Square
Public Const RESTART_KEEP_LABEL As Boolean = True ' RestartGame
Public Const RESTART_DEBUG_UCCI As Boolean = True ' RestartGame
Public Const MOVE_WITH_ECHO     As Boolean = True ' AddMove
Public Const MOVE_BY_ENGINE     As Boolean = True ' AddMove
Public Const VIEW_BMP_MONO      As Boolean = True ' ViewBitmap
Public Const FLASH_HOME         As Boolean = True ' CopyFlash
Public Const LOAD_WITH_INFO     As Boolean = True ' OpenEngine
Public Const SLAVE_ENGINE       As Boolean = True ' SetEngine / SendEngine / ReceiveEngineLog
' 全局常量——引擎状态
Public Const IDLE_UNLOAD        As Integer = 0 ' 没有加载引擎
Public Const IDLE_READY         As Integer = 1 ' 引擎待命(如果轮到电脑走棋，那么引擎立即工作)
Public Const IDLE_REST          As Integer = 2 ' 引擎休息(即使轮到电脑走棋，引擎也不工作，除非状态改变)
Public Const IDLE_PONDER        As Integer = 3 ' 后台思考结束(等待对手走完一步，再作相应处理)
Public Const BUSY_WAIT          As Integer = 4 ' 等待引擎停止思考
Public Const BUSY_ANALYZE       As Integer = 5 ' 引擎以分析方式思考(引擎不执任何一方，打开“引擎分析”功能)
Public Const BUSY_THINK         As Integer = 6 ' 引擎正常思考
Public Const BUSY_PONDER        As Integer = 7 ' 引擎后台思考
' 全局常量——棋局结果
Public Const RESULT_UNKNOWN     As Integer = 0
Public Const RESULT_REDWIN      As Integer = 1
Public Const RESULT_DRAW        As Integer = 2
Public Const RESULT_BLACKWIN    As Integer = 3
' 全局常量——引擎级别设置
Public Const LEVEL_GRANDMASTER  As Integer = -5
Public Const LEVEL_MASTER       As Integer = -4
Public Const LEVEL_EXPERT       As Integer = -3
Public Const LEVEL_AMATEUR      As Integer = -2
Public Const LEVEL_BEGINNER     As Integer = -1
Public Const LEVEL_TIMER        As Integer = 0
Public Const LEVEL_DEPTH_MIN    As Integer = 1
Public Const LEVEL_DEPTH_MAX    As Integer = 99
Public Const LEVEL_INFINITE     As Integer = 100
' 全局常量——引擎走棋参数
Public Const ENGINE_PLAY_NONE   As Integer = 0
Public Const ENGINE_PLAY_RED    As Integer = 1
Public Const ENGINE_PLAY_BLACK  As Integer = 2
Public Const ENGINE_PLAY_TURN   As Integer = 3
Public Const ENGINE_PLAY_RANDOM As Integer = 4
Public Const ENGINE_PLAY_MAX    As Integer = 5
' 全局常量——音乐设置选项
Public Const MUSIC_EXPRESS      As Integer = 0
Public Const MUSIC_FUNNY        As Integer = 1
Public Const MUSIC_CLASSIC      As Integer = 2
Public Const MUSIC_MOZART1      As Integer = 3
Public Const MUSIC_MOZART4      As Integer = 4
Public Const MUSIC_FULELISE     As Integer = 5
Public Const MUSIC_LOVDREAM     As Integer = 6
Public Const MUSIC_WALTZ        As Integer = 7
Public Const MUSIC_HUMOUR       As Integer = 8
Public Const MUSIC_MARIO1       As Integer = 9
Public Const MUSIC_MARIO2       As Integer = 10
Public Const MUSIC_PAL          As Integer = 11
Public Const MUSIC_CMUSIC       As Integer = 12
Public Const MUSIC_NONE         As Integer = 13
Public Const MUSIC_MAX          As Integer = 14
' 全局常量——棋盘坐标
Public Const COORD_CHAR         As String = "１２３４５６７８９九八七六五四三二一"
' 全局常量——让子
Public Const HANDICAP_A         As String = "rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKAB1R w - - 0 1"
Public Const HANDICAP_B         As String = "rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/R1BAKAB1R w - - 0 1"
Public Const HANDICAP_C         As String = "rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/9/1C5C1/9/RN2K2NR w - - 0 1"
' 全局常量——发布图片大小
Public Const PUB_SIZE_MINI      As Integer = 0
Public Const PUB_SIZE_PRINT     As Integer = 1
Public Const PUB_SIZE_SMALL     As Integer = 2
Public Const PUB_SIZE_LARGE     As Integer = 3
Public Const PUB_SIZE_MAX       As Integer = 4
' 全局常量——发布站点
Public Const PUB_LOCATION_ZHIDAO As Integer = 0
Public Const PUB_LOCATION_TIEBA As Integer = 1
Public Const PUB_LOCATION_SINA  As Integer = 2
Public Const PUB_LOCATION_QZONE As Integer = 3
Public Const PUB_LOCATION_OTHER As Integer = 4
Public Const PUB_LOCATION_MAX   As Integer = 5
' 全局常量——发布格式
Public Const PUB_FORMAT_TEXT    As Integer = 0
Public Const PUB_FORMAT_ANSI    As Integer = 1
Public Const PUB_FORMAT_UBB     As Integer = 2
Public Const PUB_FORMAT_HTML    As Integer = 3
Public Const PUB_FORMAT_WEB     As Integer = 4
Public Const PUB_FORMAT_MAX     As Integer = 5
' 全局常量——Windows参数常量
Public Const WM_MOVE            As Long = 3

' 全局变量——程序
Public App_frmMain              As Form     ' 主窗口对象引用
Public App_szPath               As String   ' 主程序所在的文件夹，以"\"结尾
Public App_picPieces(0 To 31)   As Picture  ' 棋子图片对象引用
Public App_picEngineRed         As Picture  ' 引擎执红的图片对象引用
Public App_picEngineBlack       As Picture  ' 引擎执黑的图片对象引用
Public App_lpMainPrev           As Long     ' 为主窗口保留的事件触发过程，用在"MainWindowProc"中
Public App_lpThinkPrev          As Long     ' 为显示思考窗口保留的事件触发过程，用在"ThinkWindowProc"中
Public App_bRunning             As Boolean  ' 程序运行标志，启动时设成True，如果是False，则跳出事件检测循环
Public App_szFileName           As String   ' 程序打开的PGN棋谱的文件名
Public App_bUpdated             As Boolean  ' 文件已更新的标志，设成True则允许启用“保存”功能，退出时也会提示保存
Public App_bAutoEcco            As Boolean  ' 是否启用自动解析开局的设置
Public App_bFlipped             As Boolean  ' 是否已经翻转棋盘
Public App_mvNewMove            As Long     ' 最新的一个着法，棋盘上有标记
Public App_sqSelected           As Integer  ' 鼠标选中的棋子
Public App_sqMate               As Integer  ' 被将死的帅(将)
Public App_bPlay                As Integer  ' 播放棋局
Public App_bRedTurn             As Boolean  ' 红黑轮流标志
Public App_bPromotion           As Boolean  ' 是否允许升变
Public App_bPrevInstance        As Boolean  ' 是否再一次启动
Public App_bEndgame             As Boolean  ' 残局模式
Public App_nEndgames            As Integer  ' 读入的残局数量
Public App_szEndgames(0 To MAX_ENDGAMES - 1) As String ' 读入的残局
' 全局变量——选项
Public Options_bAutoPlay        As Boolean  ' 自动播放
Public Options_nPlayIntv        As Integer  ' 播放间隔(秒)
Public Options_nMoveDelay       As Integer  ' 走子延时
Public Options_bAutoFlip        As Boolean  ' 自动翻转棋盘
Public Options_bEngineName      As Boolean  ' 显示引擎名称
Public Options_bAllowResign     As Boolean  ' 允许引擎认输
Public Options_bAlwaysPonder    As Boolean  ' 启用后台思考
Public Options_bEngineTime      As Boolean  ' 显示引擎速度
Public Options_bStatusBar       As Boolean  ' 输出到状态栏
Public Options_nEnginePlay      As Integer  ' 新局引擎状态
Public Options_nMusic           As Integer  ' 音乐
Public Options_bTopMost         As Integer  ' 总在最前面
Public Options_bPromptSave      As Boolean  ' 提示保存
Public Options_bAutoSave        As Boolean  ' 自动保存
Public Options_szUser           As String   ' 人机对弈用户
Public Options_bShowNew         As Boolean  ' 启动时显示“开始对局”对话框
Public Options_bTryAgain        As Boolean  ' 棋局结束后提示“再来一局”
' 全局变量——界面(杂项)
Public Gui_nLeft                As Long     ' 窗口坐标
Public Gui_nTop                 As Long     ' 窗口坐标
Public Gui_nThinkWidth          As Integer  ' 思考窗口的宽度
Public Gui_nThinkHeight         As Integer  ' 思考窗口的高度
Public Gui_nThinkLeft           As Integer  ' 思考窗口相对主窗口的左边线
Public Gui_nThinkTop            As Integer  ' 思考窗口相对主窗口的右边线
Public Gui_nEndgamesIndex       As Integer  ' 残局的条目序号
Public Gui_szEpdName            As String   ' 残局文件名
Public Gui_szEpdTitle           As String   ' 残局标题
Public Gui_nEpdMenu             As Integer  ' 残局菜单
Public Gui_bShowHowTo           As Boolean  ' 启动时显示“日积月累”
Public Gui_nTipIndex            As Integer  ' “日积月累”的条目序号
Public Gui_szTips(1 To TIP_NUM) As String   ' “日积月累”的条目
' 全局变量——发布设置
Public Publish_nSize            As Integer  ' 图片类型
Public Publish_bTrad            As Boolean  ' 是否繁体(简单/印刷)
Public Publish_nBoardS          As Integer  ' 棋盘类型(小)
Public Publish_nPiecesS         As Integer  ' 棋子类型(小)
Public Publish_nBoardL          As Integer  ' 棋盘类型(小)
Public Publish_nPiecesL         As Integer  ' 棋子类型(大)
Public Publish_bContent         As Boolean  ' 是否只发布当前局面
Public Publish_nLocation        As Integer  ' 发布站点
Public Publish_nFormat          As Integer  ' 发布格式
' 全局变量——棋局
Public Game_szEvent             As String   ' 赛事
Public Game_szRound             As String   ' 轮次
Public Game_szDate              As String   ' 日期
Public Game_szSite              As String   ' 地点
Public Game_szRedTeam           As String   ' 红方单位
Public Game_szRedPlayer         As String   ' 红方选手
Public Game_szBlackTeam         As String   ' 黑方单位
Public Game_szBlackPlayer       As String   ' 黑方选手
Public Game_nResult             As Integer  ' 结果
Public Game_szEcco              As String   ' 开局编号
Public Game_szOpen              As String   ' 开局
Public Game_szVar               As String   ' 变例
Public Game_bStartPos           As Boolean  ' 是否开始于初始局面
Public Game_cntStart            As Integer  ' 起始回合数
Public Game_sdStart             As Integer  ' 起始走子方
Public Game_cntCurr             As Integer  ' 当前回合数
Public Game_sdCurr              As Integer  ' 当前走子方
Public Game_sdMax               As Integer  ' 最后走子方
Public Game_nFormat             As Integer  ' 记谱格式
Public Game_mvMove(1 To 1998)   As Long     ' 着法列表
Public Game_szMoveText(0 To 2, 1 To 1998) As String ' 记谱列表
Public Game_szComment(0 To 1998) As String          ' 注释列表
Public Game_szIrrevFen(0 To 40) As String           ' 不可逆局面FEN串列表
Public Game_posIrrev(0 To 40)   As PositionStruct   ' 不可逆局面列表
Public Game_nCurrMove           As Integer  ' 当前着法序号(第一个着法序号是1)
Public Game_nMaxMove            As Integer  ' 最大着法序号
Public Game_nCurrIrrev          As Integer  ' 当前不可逆局面序号
Public Game_nMaxIrrev           As Integer  ' 最后不可逆局面序号
' 全局变量——时间
Public Timer_bEnabled           As Boolean  ' 是否开始计时
Public Timer_dfLastTime         As Double   ' 当前时间(每天00:00过去的秒数)
Public Timer_nDepth             As Integer  ' 引擎搜索深度
Public Timer_bIncMode           As Boolean  ' 是否加时模式
Public Timer_nInitTime          As Integer  ' 起始时间
Public Timer_nIncMove           As Integer  ' 时段制的每时段步数
Public Timer_nIncTime           As Integer  ' 加时制的加时秒数
Public Timer_nTimeLeft(0 To 1)  As Integer  ' 双方剩余时间
Public Timer_nTimeElapsed(0 To 1) As Integer ' 双方已经用去的时间
Public Timer_nMoveLeft(0 To 1)  As Integer  ' 加时制的该时段剩余要走的步数
Public Timer_bOver(0 To 1)      As Boolean  ' 双方是否超时
' 全局变量——引擎
Public Engine_bEngineLog        As Boolean  ' 是否记录引擎日志
Public Engine_szLogFile         As String   ' 引擎日志文件名
Public Engine_bUseBook          As Boolean  ' 是否使用开局库
Public Engine_bUseEgtb          As Boolean  ' 是否使用残局库
Public Engine_szBookFiles       As String   ' 开局库文件名
Public Engine_szEgtbPaths       As String   ' 残局库文件名
Public Engine_nHash             As Integer  ' 置换表大小
Public Engine_nThreads          As Integer  ' 引擎使用的线程数
Public Engine_nRandomness       As Integer  ' 随机
Public Engine_nStyle            As Integer  ' 风格
Public Engine_szFile            As String   ' 引擎文件
Public Engine_pipe          As PipeStruct   ' 引擎管道
Public Engine_nStatus           As Integer  ' 引擎状态
Public Engine_nTimeRatio        As Long     ' 引擎时间比例(秒制是1，毫秒制是1000)
Public Engine_szName            As String   ' 引擎名称
Public Engine_szVersion         As String   ' 引擎版本
Public Engine_szCopyright       As String   ' 引擎版权
Public Engine_szAuthor          As String   ' 引擎作者
Public Engine_szUser            As String   ' 引擎用户
Public Engine_posBoard  As PositionStruct   ' 引擎思考的局面
Public Engine_dwTime            As Double   ' 引擎思考的时间
Public Engine_nMoves            As Integer  ' 引擎思考的局面的总走法数
Public Engine_nDepth            As Integer  ' 引擎思考的深度
Public Engine_nCurrMove         As Integer  ' 引擎思考的局面的当前走法数
Public Engine_bRed              As Boolean  ' 引擎执红
Public Engine_bBlack            As Boolean  ' 引擎执黑
Public Engine_bPonder           As Boolean  ' 后台思考
Public Engine_bAnalyze          As Boolean  ' 引擎分析
Public Engine_mvPonder          As Long     ' 后台思考猜测着法
Public Engine_mvPonderFinished  As Long     ' 后台思考完成的着法
Public Engine_mvPonderFinishedPonder As Long ' 后台思考完成的猜测着法
Public Engine_bPonderFinishedResign As Long ' 后台思考完成后认输
Public Engine_bPonderFinishedDraw As Long   ' 后台思考完成后提和或接受提和
Public Engine_szPonderStr       As String   ' 后台思考指令串
Public Engine_bDraw             As Integer  ' 提和
Public Engine_mvBan             As Long     ' 禁着
Public Engine_bSlaveRed         As Boolean  ' 副引擎执红
Public Engine_bSlaveBlack       As Boolean  ' 副引擎执黑
Public Engine_pipeSlave     As PipeStruct   ' 副引擎管道
Public Engine_nTimeRatioSlave   As Long     ' 副引擎时间比例
Public Engine_szSlaveName       As String   ' 副引擎名称

' 以下是实用函数例程

' 把字符转换成数字，显示棋谱坐标时用
Public Function Byte2Digit(ByVal szChar As String) As Integer

If szChar >= "1" And szChar <= "9" Then
    Byte2Digit = Asc(szChar) - 48
Else
    Byte2Digit = 0
End If

End Function

' 把数字转换成字符，显示棋谱坐标时用
Public Function Digit2Word(ByVal nArg As Integer) As String

Digit2Word = Choose(nArg, "１", "２", "３", "４", "５", "６", "７", "８", "９")

End Function

' 显示着法前的回合数，红方格式是“???. 某某某某”，黑方格式是“     某某某某”，着法是对齐的
Public Function NumberText(cnt As Integer, sd As Integer) As String

NumberText = IIf(sd = 0, cnt & ".", Space(Len("" & cnt) + 1))

End Function

' 打开文件对话框
Public Function FileDialog(ByVal szTitle As String, ByVal szFileType As String, _
        ByVal szExt As String, Optional ByVal szSave As String = "") As String

Dim szFileName As String, szFilter As String
szFilter = szFileType & " (*." & szExt & ")|*." & szExt & "|" & L("所有文件", "所有文件") & " (*.*)|*.*"
If szSave = "" Then
    szFileName = OpenFileDialog(szTitle, szFilter)
Else
    szFileName = szSave
    szFileName = Replace(szFileName, "\", "＼")
    szFileName = Replace(szFileName, "/", "／")
    szFileName = Replace(szFileName, ":", "：")
    szFileName = Replace(szFileName, "*", "＊")
    szFileName = Replace(szFileName, "?", "？")
    ' 全角双引号用在某些操作系统上不正常，所以用半角单引号代替
    szFileName = Replace(szFileName, """", "'")
    szFileName = Replace(szFileName, "<", "＜")
    szFileName = Replace(szFileName, ">", "＞")
    szFileName = Replace(szFileName, "|", "｜")
    szFileName = SaveFileDialog(szTitle, szFilter, szFileName & "." & szExt, szExt)
End If
FileDialog = szFileName

End Function

' 总在最前面
Public Sub SetTopMost(ByVal hWnd As Long)

If Options_bTopMost Then
    SetWindowPos hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
End If

End Sub

' 以上是实用函数例程

' 以下是文件操作例程

' 从"szSrc"中获得PGN棋谱的标签，如果有此标签则返回True，标签内容保存到"szDst"变量中，反之返回False
Public Function GetLabel(ByRef szDst As String, ByVal szSrc As String, ByVal szLabelName As String) As Boolean

Dim nLen As Integer, i As Integer
nLen = Len(szLabelName)
If UCase(Left(szSrc, nLen + 3)) = "[" & szLabelName & " """ Then
    i = InStr(nLen + 4, szSrc, """")
    If i > 0 Then
        szDst = Mid(szSrc, nLen + 4, i - nLen - 4)
    Else
        szDst = Mid(szSrc, nLen + 4)
    End If
    GetLabel = True
Else
    GetLabel = False
End If

End Function

' 读入一行PGN文件的内容，返回True表示整个棋局结束，返回False表示后面还有内容，
' 读完后剩下的内容保存在szLineStr中，以后仍旧须用"ImportLine"去读
Public Function ImportLine(ByRef szLineStr As String, ByRef szRemStr As String, ByRef nRemLevel As Integer) As Boolean

Dim i As Integer, j As Integer, bEndFor As Boolean
Dim szMoveStr As String, szChar As String, mv As Long

If nRemLevel > 0 Then
    bEndFor = True
    For i = 1 To Len(szLineStr)
        szChar = Mid(szLineStr, i, 1)
        nRemLevel = nRemLevel + Switch(szChar = "(" Or szChar = "{", 1, szChar = ")" Or szChar = "}", -1, True, 0)
        If nRemLevel = 0 Then
            szLineStr = Mid(szLineStr, i + 1)
            Game_szComment(Game_nMaxMove) = Game_szComment(Game_nMaxMove) & szRemStr
            CommentMoveText Game_nMaxMove
            szRemStr = ""
            bEndFor = False
            Exit For
        End If
        szRemStr = szRemStr & szChar
    Next
    If bEndFor Then
        szRemStr = szRemStr & vbCrLf
        szLineStr = ""
    End If
    ImportLine = False
    Exit Function
End If

bEndFor = True
For i = 1 To Len(szLineStr)
    szChar = Mid(szLineStr, i, 1)
    Select Case szChar
    Case "(", "{"
        nRemLevel = 1
        szLineStr = Mid(szLineStr, i + 1)
        bEndFor = False
        Exit For
    Case "*"
        szLineStr = ""
        ImportLine = True
        Exit Function
    Case "0", "1"
        If Len(szLineStr) - i >= 6 Then
            If Mid(szLineStr, i, 7) = "1/2-1/2" Then
                Game_nResult = RESULT_DRAW
                App_frmMain.lblResult = ResultString
                szLineStr = ""
                ImportLine = True
                Exit Function
            End If
        End If
        If Len(szLineStr) - i >= 2 Then
            If Mid(szLineStr, i, 3) = "1-0" Then
                Game_nResult = RESULT_REDWIN
                App_frmMain.lblResult = ResultString
                szLineStr = ""
                ImportLine = True
                Exit Function
            ElseIf Mid(szLineStr, i, 3) = "0-1" Then
                Game_nResult = RESULT_BLACKWIN
                App_frmMain.lblResult = ResultString
                szLineStr = ""
                ImportLine = True
                Exit Function
            End If
        End If
    Case Else
        If Game_nFormat = 0 Then
            If Asc(szChar) > 255 Or Asc(szChar) < 0 Then
                j = InStr(i + 1, szLineStr, " ")
                If j = 0 Then
                    szMoveStr = Mid(szLineStr, i)
                    szLineStr = ""
                Else
                    szMoveStr = Mid(szLineStr, i, j - i)
                    szLineStr = Mid(szLineStr, j + 1)
                End If
                j = Byte2Digit(Mid(szMoveStr, 2, 1))
                If j > 0 Then
                    szMoveStr = Left(szMoveStr, 1) & Digit2Word(j) & Mid(szMoveStr, 3)
                End If
                j = Byte2Digit(Mid(szMoveStr, 4, 1))
                If j > 0 Then
                    szMoveStr = Left(szMoveStr, 3) & Digit2Word(j)
                End If
                mv = CchessFile2Move(CchessChin2File(CvC(szMoveStr)), Game_posIrrev(Game_nCurrIrrev))
                AddMove mv
                bEndFor = False
                Exit For
            End If
        Else
            If (szChar >= "A" And szChar <= "Z") Or (szChar >= "a" And szChar <= "z") Or _
                    szChar = "+" Or szChar = "-" Or szChar = "=" Then
                j = InStr(i + 1, szLineStr, " ")
                If j = 0 Then
                    szMoveStr = Mid(szLineStr, i)
                    szLineStr = ""
                Else
                    szMoveStr = Mid(szLineStr, i, j - i)
                    szLineStr = Mid(szLineStr, j + 1)
                End If
                If Game_nFormat = 1 Then
                    mv = CchessFile2Move(CvL(szMoveStr), Game_posIrrev(Game_nCurrIrrev))
                Else
                    mv = Iccs2Move(szMoveStr)
                End If
                AddMove mv
                bEndFor = False
                Exit For
            End If
        End If
    End Select
Next
If bEndFor Then
    szLineStr = ""
End If
ImportLine = False

End Function

' 读PGN棋谱，如果是XQF、MXQ、CHE、CHN或CCM棋谱则首先转换为PGN棋谱
Public Sub ReadFile(Optional ByVal bAutoSave As Boolean = False)

Dim i As Integer, nFileNo As Integer
Dim bNoTitle As Boolean, bCchess As Boolean, bDetail As Boolean
Dim szChineseChess As String, szResult As String, szFormat As String, szFenStr As String
Dim szLineStr As String, szLineStrEx As String, szRemStr As String, nRemLevel As Integer

bNoTitle = False
If UCase(Right(App_szFileName, 4)) = ".XQF" Then
    ConvXqf2Pgn App_szFileName, App_szPath & "AUTOSAVE.PGN"
    bNoTitle = True
ElseIf UCase(Right(App_szFileName, 4)) = ".MXQ" Then
    ConvMxq2Pgn App_szFileName, App_szPath & "AUTOSAVE.PGN"
    bNoTitle = True
ElseIf UCase(Right(App_szFileName, 4)) = ".CHE" Then
    ConvChe2Pgn App_szFileName, App_szPath & "AUTOSAVE.PGN"
    bNoTitle = True
ElseIf UCase(Right(App_szFileName, 4)) = ".CHN" Then
    ConvChn2Pgn App_szFileName, App_szPath & "AUTOSAVE.PGN"
    bNoTitle = True
ElseIf UCase(Right(App_szFileName, 4)) = ".CCM" Then
    ConvCcm2Pgn App_szFileName, App_szPath & "AUTOSAVE.PGN"
    bNoTitle = True
End If
If bAutoSave Or bNoTitle Then
    App_szFileName = ""
    RestartGame
    App_szFileName = App_szPath & "AUTOSAVE.PGN"
Else
    RestartGame
End If

nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szFileName For Input As #nFileNo
On Error GoTo 0
bCchess = False
bDetail = False
szLineStrEx = ""
szLineStr = ""
szRemStr = ""
nRemLevel = 0
Do While Not (EOF(nFileNo) And szLineStr = "" And szLineStrEx = "")
    If szLineStr = "" Then
        If szLineStrEx = "" Then
            Line Input #nFileNo, szLineStrEx
        End If
        i = InStr(szLineStrEx, Chr(10))
        If i > 0 Then
            szLineStr = Left(szLineStrEx, i - 1)
            szLineStrEx = Mid(szLineStrEx, i + 1)
        Else
            szLineStr = szLineStrEx
            szLineStrEx = ""
        End If
    End If
    If bDetail Then
        If Not (bCchess Or App_szFileName = "") Then
            MsgBox App_szFileName & L(" 可能不是中国象棋的PGN文件。", " 可能不是中國象棋的PGN文件。"), vbExclamation
            App_szFileName = ""
            SetTitle
        End If
        If ImportLine(szLineStr, szRemStr, nRemLevel) Then
            Exit Do
        End If
    Else
        szLineStr = LTrim(szLineStr)
        If szLineStr = "" Then
        ElseIf Left(szLineStr, 1) = "[" Then
            If GetLabel(szChineseChess, szLineStr, "GAME") Then
                If UCase(szChineseChess) = "CHINESE CHESS" Then
                    bCchess = True
                End If
            ElseIf GetLabel(Game_szEvent, szLineStr, "EVENT") Then
            ElseIf GetLabel(Game_szRound, szLineStr, "ROUND") Then
            ElseIf GetLabel(Game_szDate, szLineStr, "DATE") Then
            ElseIf GetLabel(Game_szSite, szLineStr, "SITE") Then
            ElseIf GetLabel(Game_szRedTeam, szLineStr, "REDTEAM") Then
            ElseIf GetLabel(Game_szRedPlayer, szLineStr, "RED") Then
            ElseIf GetLabel(Game_szBlackTeam, szLineStr, "BLACKTEAM") Then
            ElseIf GetLabel(Game_szBlackPlayer, szLineStr, "BLACK") Then
            ElseIf GetLabel(szResult, szLineStr, "RESULT") Then
                Game_nResult = Switch(szResult = "1-0", RESULT_REDWIN, szResult = "1/2-1/2", RESULT_DRAW, _
                        szResult = "0-1", RESULT_BLACKWIN, True, RESULT_UNKNOWN)
            ElseIf GetLabel(Game_szEcco, szLineStr, "ECCO") Then
                App_bAutoEcco = False
            ElseIf GetLabel(Game_szOpen, szLineStr, "OPENING") Then
                App_bAutoEcco = False
            ElseIf GetLabel(Game_szVar, szLineStr, "VARIATION") Then
                App_bAutoEcco = False
            ElseIf GetLabel(szFormat, szLineStr, "FORMAT") Then
                Game_nFormat = Switch(UCase(szFormat) = "WXF", 1, UCase(szFormat) = "ICCS", 2, True, 0)
            ElseIf GetLabel(szFenStr, szLineStr, "FEN") Then
                Game_szIrrevFen(0) = szFenStr
                CchessFen2Board Game_posIrrev(0), szFenStr
                Game_sdCurr = Game_posIrrev(0).sdPlayer
                i = InStr(szFenStr, " - - 0 ")
                If i > 0 Then
                    Game_cntCurr = Str2Int(Mid(szFenStr, i + 7), 1, 999)
                Else
                    Game_cntCurr = 1
                End If
                Game_sdStart = Game_sdCurr
                Game_cntStart = Game_cntCurr
                Game_sdMax = Game_sdStart
                Game_bStartPos = False
            End If
            szLineStr = ""
        Else
            bDetail = True
        End If
    End If
Loop
Close #nFileNo
BoardFlush
LabelFlush
If bAutoSave Then
    If Game_bStartPos And Game_nMaxMove = 0 Then
        EngineNewGame
    End If
Else
    Do While Game_nCurrMove > 0
        MoveBack
    Loop
End If
MoveFlush
If bAutoSave Or bNoTitle Then
    App_szFileName = ""
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0
If Not bAutoSave Then
    ErrorOpen App_szFileName
End If
BoardFlush
LabelFlush
MoveFlush
If bAutoSave Then
    EngineNewGame
End If
If bAutoSave Or bNoTitle Then
    App_szFileName = ""
End If

End Sub

' 存储标签
Public Function PutLabel(ByVal LabelName As String, ByVal LabelValue As String) As String

LabelValue = Replace(LabelValue, Chr(13), "")
LabelValue = Replace(LabelValue, Chr(10), "")
PutLabel = "[" & LabelName & " """ & LabelValue & """]"

End Function

' 写PGN棋谱
Public Sub WriteFile(Optional ByVal bTempFile As Boolean = False)

Dim sd As Integer, cnt As Integer
Dim i As Integer, bReturned As Boolean, nFileNo As Integer
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open IIf(bTempFile, App_szPath & L(TEMP_FILE_NAME_S, TEMP_FILE_NAME_T), App_szFileName) For Output As #nFileNo
On Error GoTo 0
Print #nFileNo, PutLabel("Game", "Chinese Chess")
Print #nFileNo, PutLabel("Event", Game_szEvent)
Print #nFileNo, PutLabel("Round", Game_szRound)
Print #nFileNo, PutLabel("Date", Game_szDate)
Print #nFileNo, PutLabel("Site", Game_szSite)
Print #nFileNo, PutLabel("RedTeam", Game_szRedTeam)
Print #nFileNo, PutLabel("Red", Game_szRedPlayer)
Print #nFileNo, PutLabel("BlackTeam", Game_szBlackTeam)
Print #nFileNo, PutLabel("Black", Game_szBlackPlayer)
Print #nFileNo, PutLabel("Result", Choose(Game_nResult + 1, "*", "1-0", "1/2-1/2", "0-1"))
Print #nFileNo, PutLabel("ECCO", Game_szEcco)
Print #nFileNo, PutLabel("Opening", Game_szOpen)
Print #nFileNo, PutLabel("Variation", Game_szVar)
If Not Game_bStartPos Then
    Print #nFileNo, PutLabel("FEN", Game_szIrrevFen(0))
End If
If Game_nFormat > 0 Then
    Print #nFileNo, PutLabel("Format", IIf(Game_nFormat = 1, "WXF", "ICCS"))
End If
If Game_szComment(0) <> "" Then
    Print #nFileNo, "{" & Game_szComment(0) & "}"
End If
bReturned = True
cnt = Game_cntStart
sd = Game_sdStart
For i = 1 To Game_nMaxMove
    If bReturned Then
        Print #nFileNo, Space(3 - Len("" & cnt)) & cnt & ". ";
        If sd = 1 Then
            Print #nFileNo, Space(Choose(Game_nFormat + 1, 8, 4, 5));
        End If
    End If
    If sd = 0 Then
        Print #nFileNo, Game_szMoveText(Game_nFormat, i);
        bReturned = False
    Else
        Print #nFileNo, " " & Game_szMoveText(Game_nFormat, i)
        bReturned = True
    End If
    If Game_szComment(i) <> "" Then
        If Not bReturned Then
            Print #nFileNo,
        End If
        Print #nFileNo, "{" & Game_szComment(i) & "}"
        bReturned = True
    End If
    sd = 1 - sd
    cnt = cnt + 1 - sd
Next
Print #nFileNo, Choose(Game_nResult + 1, " *", " 1-0", " 1/2-1/2", " 0-1")
Print #nFileNo, "======================"
Print #nFileNo, L("欢迎访问象棋百科全书网", "歡迎訪問象棋百科全書網")
Print #nFileNo, L("推荐用象棋巫师观赏棋谱", "推荐用象棋巫師觀賞棋譜")
Print #nFileNo, "http://www.xqbase.com/"
Close #nFileNo
If Not bTempFile Then
    App_bUpdated = False
    App_frmMain.mnFileSave.Enabled = False
    App_frmMain.tlb.Buttons("FileSave").Enabled = False
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0
ErrorOpen IIf(bTempFile, App_szPath & L(TEMP_FILE_NAME_S, TEMP_FILE_NAME_T), App_szFileName)

End Sub

' 如果棋局改动过，就要设置“已更新”状态，保存功能有效
Public Sub FileUpdated()

App_bUpdated = True
App_frmMain.mnFileSave.Enabled = True
App_frmMain.tlb.Buttons("FileSave").Enabled = True

End Sub

' 打开棋谱
Public Sub OpenFile()

Dim szFileName As String
If Options_nLanguage = LANGUAGE_ZH_CN Then
    szFileName = OpenFileDialog("打开棋谱文件", "所有棋谱 (*.PGN;*.XQF;*.MXQ;*.CHE;*.CHN;*.CCM)|" & _
            "*.PGN;*.XQF;*.MXQ;*.CHE;*.CHN;*.CCM|" & _
            "可移植棋谱 (*.PGN)|*.PGN|象棋演播室棋谱 (*.XQF)|*.XQF|弈天棋谱 (*.MXQ)|*.MXQ|" & _
            "QQ象棋棋谱 (*.CHE)|*.CHE|联众象棋棋谱 (*.CHN)|*.CHN|中游象棋棋谱 (*.CCM)|*.CCM|所有文件 (*.*)|*.*")
Else
    szFileName = OpenFileDialog("打開棋譜文件", "所有棋譜 (*.PGN;*.XQF;*.MXQ;*.CHE;*.CHN;*.CCM)|" & _
            "*.PGN;*.XQF;*.MXQ;*.CHE;*.CHN;*.CCM|" & _
            "可移植棋譜 (*.PGN)|*.PGN|象棋演播室棋譜 (*.XQF)|*.XQF|弈天棋譜 (*.MXQ)|*.MXQ|" & _
            "QQ象棋棋譜 (*.CHE)|*.CHE|聯眾象棋棋譜 (*.CHN)|*.CHN|中游象棋棋譜 (*.CCM)|*.CCM|所有文件 (*.*)|*.*")
End If
If szFileName <> "" Then
    App_szFileName = szFileName
    ReadFile
End If

End Sub

' 如果是“已更新”状态，那么提示保存PGN棋谱
Public Function CancelSave() As Boolean

Dim dwResult As Long
If Not (Options_bPromptSave And App_bUpdated) Then
    CancelSave = False
    Exit Function
End If
If Options_nLanguage = LANGUAGE_ZH_CN Then
    dwResult = MsgBox(IIf(App_szFileName = "", "棋局已更改。", "文件 " & App_szFileName & " 中的棋局已更改。") & vbCrLf & vbCrLf & _
            "想保存文件吗？", vbYesNoCancel + vbExclamation)
Else
    dwResult = MsgBox(IIf(App_szFileName = "", "棋局已更改。", "文件 " & App_szFileName & " 中的棋局已更改。") & vbCrLf & vbCrLf & _
            "想保存文件嗎？", vbYesNoCancel + vbExclamation)
End If
Select Case dwResult
Case vbYes
    If App_szFileName = "" Then
        If SaveFileAs() Then
            CancelSave = False
        Else
            CancelSave = True
        End If
    Else
        WriteFile
        CancelSave = False
    End If
Case vbNo
    CancelSave = False
Case Else
    CancelSave = True
End Select

End Function

' 实现“另存为”功能
Public Function SaveFileAs()

Dim sz As String
sz = FileDialog(L("保存棋谱文件", "保存棋譜文件"), L("可移植棋谱", "可移植棋譜"), "PGN", DefaultFileName)
If sz <> "" Then
    App_szFileName = sz
    SetTitle
    WriteFile
    SaveFileAs = True
Else
    SaveFileAs = False
End If

End Function

' 实现“输出为XQF格式”功能
Public Sub ExportXqf()

Dim sz As String
sz = FileDialog(L("输出为XQF格式", "輸出為XQF格式"), L("象棋演播室棋谱", "象棋演播室棋譜"), "XQF", DefaultFileName)
If sz <> "" Then
    WriteFile WRITE_TEMP_FILE
    ConvPgn2Xqf App_szPath & L(TEMP_FILE_NAME_S, TEMP_FILE_NAME_T), sz
End If

End Sub

' 打开FEN局面
Public Sub LoadFenFile(ByVal szFenFile As String)

Dim nFileNo As Integer, szFenStr As String
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open szFenFile For Input As #nFileNo
On Error GoTo 0
If EOF(nFileNo) Then
    szFenStr = ""
Else
    Line Input #nFileNo, szFenStr
End If
Close #nFileNo
LoadFenStr szFenStr

Exit Sub
lnErrorOpen:
On Error GoTo 0
ErrorOpen szFenFile

End Sub

' 装入FEN字符串
Public Sub LoadFenStr(ByVal szFenStr As String)

Dim i As Integer
If szFenStr = "" Then
    Exit Sub
End If
szFenStr = Replace(szFenStr, Chr(13), "")
szFenStr = Replace(szFenStr, Chr(10), "")
App_szFileName = ""
RestartGame
Game_bStartPos = False
Game_szIrrevFen(0) = szFenStr
CchessFen2Board Game_posIrrev(0), szFenStr
Game_sdCurr = Game_posIrrev(0).sdPlayer
i = InStr(szFenStr, " - - 0 ")
If i > 0 Then
    Game_cntCurr = Str2Int(Mid(szFenStr, i + 7), 1, 999)
Else
    Game_cntCurr = 1
End If
Game_sdStart = Game_sdCurr
Game_cntStart = Game_cntCurr
Game_sdMax = Game_sdStart
BoardFlush
LabelFlush
MoveFlush

End Sub

' 以上是文件操作例程

' 以下是界面控制例程

' 输出时间格式："hh:mm:ss"
Public Function TimeText(ByVal nSeconds As Long) As String

Dim sz As String
sz = Chr((nSeconds \ 36000) Mod 6 + 48) & Chr((nSeconds \ 3600) Mod 10 + 48) & ":"
sz = sz & Chr((nSeconds \ 600) Mod 6 + 48) & Chr((nSeconds \ 60) Mod 10 + 48) & ":"
sz = sz & Chr((nSeconds \ 10) Mod 6 + 48) & Chr((nSeconds \ 1) Mod 10 + 48)
TimeText = sz

End Function

' 显示时间，"0"=红方，"1"=黑方，"-1"=走棋方
Public Sub SetTimer(Optional ByVal sd As Integer = -1)

Dim nSeconds As Integer, sdThis As Integer
sdThis = IIf(sd = -1, Game_sdMax, sd)
nSeconds = IIf(sd = -1, Game_sdMax, sd)
If sdThis = 0 Eqv App_bFlipped Then
    If Timer_nDepth > 0 Then
        App_frmMain.lblTimeLeftUp.Caption = "-"
        App_frmMain.lblTimeRuleUp.Caption = ""
    Else
        App_frmMain.lblTimeLeftUp.Caption = TimeText(Timer_nTimeLeft(sdThis))
        If Options_nLanguage = LANGUAGE_ZH_CN Then
            App_frmMain.lblTimeRuleUp.Caption = IIf(Timer_bIncMode, "每步加 " & Timer_nIncTime & " 秒", _
                    "走完 " & Timer_nMoveLeft(sdThis) & " 步")
        Else
            App_frmMain.lblTimeRuleUp.Caption = IIf(Timer_bIncMode, "每步加 " & Timer_nIncTime & " 秒", _
                    "走完 " & Timer_nMoveLeft(sdThis) & " 步")
        End If
    End If
    App_frmMain.lblTimeElapsedUp.Caption = TimeText(Timer_nTimeElapsed(sdThis))
Else
    If Timer_nDepth > 0 Then
        App_frmMain.lblTimeLeftDown.Caption = "-"
        App_frmMain.lblTimeRuleDown.Caption = ""
    Else
        App_frmMain.lblTimeLeftDown.Caption = TimeText(Timer_nTimeLeft(sdThis))
        If Options_nLanguage = LANGUAGE_ZH_CN Then
            App_frmMain.lblTimeRuleDown.Caption = IIf(Timer_bIncMode, "每步加 " & Timer_nIncTime & " 秒", _
                    "走完 " & Timer_nMoveLeft(sdThis) & " 步")
        Else
            App_frmMain.lblTimeRuleDown.Caption = IIf(Timer_bIncMode, "每步加 " & Timer_nIncTime & " 秒", _
                    "走完 " & Timer_nMoveLeft(sdThis) & " 步")
        End If
        App_frmMain.lblTimeElapsedDown.Caption = TimeText(Timer_nTimeElapsed(sdThis))
    End If
End If

End Sub

' 赛事字符串
Public Function EventString() As String
    
Dim sz As String, nRound As Integer
sz = Game_szEvent
If Game_szRound <> "" Then
    sz = sz & IIf(Game_szEvent = "", "", " ")
    nRound = Str2Int(Game_szRound)
    sz = sz & IIf(nRound = 0, Game_szRound, L("第", "第") & Game_szRound & L("轮", "輪"))
End If
EventString = sz

End Function

' 比赛结果字符串
Public Function ResultString() As String

Dim szWinLoss As String
If Game_szRedPlayer = "" Or Game_szBlackPlayer = "" Then
    If Options_nLanguage = LANGUAGE_ZH_CN Then
        szWinLoss = Choose(Game_nResult + 1, "", IIf(Game_sdStart = 0, "胜", "负"), _
                "和", IIf(Game_sdStart = 0, "负", "胜"))
        ResultString = "(着法：" & IIf(Game_sdStart = 0, "红先", "黑先") & szWinLoss & ")"
    Else
        szWinLoss = Choose(Game_nResult + 1, "", IIf(Game_sdStart = 0, "勝", "负"), _
                "和", IIf(Game_sdStart = 0, "負", "勝"))
        ResultString = "(著法：" & IIf(Game_sdStart = 0, "紅先", "黑先") & szWinLoss & ")"
    End If
Else
    If Options_nLanguage = LANGUAGE_ZH_CN Then
        szWinLoss = Choose(Game_nResult + 1, " (对) ", IIf(Game_sdStart = 0, " (先胜) ", " (后胜) "), _
                IIf(Game_sdStart = 0, " (先和) ", " (后和) "), IIf(Game_sdStart = 0, " (先负) ", " (后负) "))
        ResultString = Game_szRedTeam & IIf(Game_szRedTeam = "", "", " ") & Game_szRedPlayer & _
                szWinLoss & Game_szBlackTeam & IIf(Game_szBlackTeam = "", "", " ") & Game_szBlackPlayer
    Else
        szWinLoss = Choose(Game_nResult + 1, " (對) ", IIf(Game_sdStart = 0, " (先勝) ", " (後勝) "), _
                IIf(Game_sdStart = 0, " (先和) ", " (後和) "), IIf(Game_sdStart = 0, " (先負) ", " (後負) "))
        ResultString = Game_szRedTeam & IIf(Game_szRedTeam = "", "", " ") & Game_szRedPlayer & _
                szWinLoss & Game_szBlackTeam & IIf(Game_szBlackTeam = "", "", " ") & Game_szBlackPlayer
    End If
End If

End Function

' 日期和地点字符串
Public Function DateSiteString() As String

If Game_szDate = "" Then
    DateSiteString = IIf(Game_szSite = "", "", L("(弈于 ", "(弈於 ") & Game_szSite & ")")
Else
    DateSiteString = "(" & Game_szDate & IIf(Game_szSite = "", ")", L(" 弈于 ", " 弈於 ") & _
            Game_szSite & ")")
End If

End Function

' 开局字符串
Public Function OpenString() As String

Dim szOpenVar As String
szOpenVar = Game_szOpen & IIf(Game_szOpen = "" Or Game_szVar = "", "", "——") & Game_szVar
If Game_szEcco = "" Then
    OpenString = szOpenVar
ElseIf Game_szOpen = "" And Game_szVar = "" Then
    OpenString = szOpenVar & L("(ECCO开局编号：", "(ECCO開局編號：") & Game_szEcco & ")"
Else
    OpenString = szOpenVar & "(" & Game_szEcco & ")"
End If

End Function

' 缺省文件名
Public Function DefaultFileName() As String

Dim sz As String
sz = EventString
DefaultFileName = IIf(sz = "", "", sz & " - ") & ResultString

End Function

' 显示全部标签
Public Sub LabelFlush()

App_frmMain.imgUp.Picture = IIf(App_bFlipped, _
        IIf(Engine_bRed, App_picEngineRed, App_picPieces(1)), _
        IIf(Engine_bBlack, App_picEngineBlack, App_picPieces(8)))
App_frmMain.imgDown.Picture = IIf(App_bFlipped, _
        IIf(Engine_bBlack, App_picEngineBlack, App_picPieces(8)), _
        IIf(Engine_bRed, App_picEngineRed, App_picPieces(1)))
App_frmMain.cmbFormat.ListIndex = Game_nFormat
App_frmMain.lblEvent = EventString
App_frmMain.lblResult = ResultString
App_frmMain.lblDateSite = DateSiteString
App_frmMain.lblOpen = OpenString
SetTimer 0
SetTimer 1

End Sub

' 清空棋盘
Public Sub NewGame0()

RestartGame
BoardFlush
LabelFlush
MoveFlush

End Sub

' “新的对局”功能
Public Sub NewGame()

If Options_bShowNew Then
    frmNewGame.Show vbModal, App_frmMain
    Exit Sub
End If
App_szFileName = ""
NewGame0
EngineNewGame

End Sub

' 结束一局对局
Public Sub GameOver(ByVal szPrompt As String, ByVal nIcon As Integer)

PlayWavSound IIf(nIcon = ICON_WIN, "WIN", IIf(nIcon = ICON_LOSS, "LOSS", "DRAW"))
If App_sqMate > 0 Then
    DrawSquare App_sqMate, , DRAW_MATE
End If
If Options_bTryAgain Then
    If MsgBoxIcon(szPrompt & vbCrLf & vbCrLf & L("再来一局吗？", "再來一局嗎？"), vbYesNo, , , nIcon) = vbYes Then
        If Not CancelSave Then
            If App_bEndgame Then
                LoadEndgames Gui_szEpdName, Gui_szEpdTitle
            Else
                NewGame
            End If
        End If
    End If
Else
    MsgBoxIcon szPrompt, , , , nIcon
End If

End Sub

' 新开一局，在新建文件、编辑棋局等功能中使用，编辑棋局要加参数"RESTART_KEEP_LABEL"，不清除标签
Public Sub RestartGame(Optional ByVal bKeepLabel As Boolean = False, Optional ByVal bDebugUcci As Boolean = False)

If Engine_nStatus > IDLE_UNLOAD Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
    If Not bDebugUcci Then
        SendEngine "setoption newgame"
        If Engine_bSlaveRed Or Engine_bSlaveBlack Then
            SendEngine "setoption newgame", SLAVE_ENGINE
            SendEngine "setoption ponder false", SLAVE_ENGINE
            SendEngine "setoption ponder false"
        Else
            SendEngine "setoption ponder " & IIf(Options_bAlwaysPonder, "true", "false")
        End If
    End If
    EngineLoaded True
End If
Game_szIrrevFen(0) = CCHESS_START_FEN & " - - 0 1"
CchessFen2Board Game_posIrrev(0), Game_szIrrevFen(0)
SetTitle
App_frmMain.mnFileSave.Enabled = False
App_frmMain.tlb.Buttons("FileSave").Enabled = False
If Not bKeepLabel Then
    Game_szEvent = ""
    Game_szRound = ""
    Game_szDate = ""
    Game_szSite = ""
    Game_szRedTeam = ""
    Game_szRedPlayer = ""
    Game_szBlackTeam = ""
    Game_szBlackPlayer = ""
    Game_nResult = RESULT_UNKNOWN
    Game_nFormat = 0
    Game_szEcco = ""
    Game_szOpen = ""
    Game_szVar = ""
    Game_sdStart = 0
    Game_cntStart = 1
    Game_sdCurr = 0
    Game_cntCurr = 1
    App_frmMain.cmbFormat.ListIndex = 0
    App_bAutoEcco = True
End If
Game_nCurrMove = 0
Game_nCurrIrrev = 0
Game_bStartPos = True
MoveCut
Game_szComment(0) = ""
CommentMoveText 0
App_bUpdated = False
App_bFlipped = False
CoordFlush
App_mvNewMove = 0
App_frmMain.mnPosFlip.Checked = False
App_frmMain.tlb.Buttons("PosFlip").Value = tbrUnpressed
App_bPlay = Options_bAutoPlay
App_frmMain.mnWizardPlay.Checked = App_bPlay
App_frmMain.tlb.Buttons("WizardPlay").Value = IIf(App_bPlay, tbrPressed, tbrUnpressed)
Timer_bOver(0) = False
Timer_bOver(1) = False
Timer_nTimeLeft(0) = Timer_nInitTime * 60
Timer_nTimeLeft(1) = Timer_nInitTime * 60
Timer_nTimeElapsed(0) = 0
Timer_nTimeElapsed(1) = 0
Timer_nMoveLeft(0) = Timer_nIncMove
Timer_nMoveLeft(1) = Timer_nIncMove
Timer_dfLastTime = Timer
Timer_bEnabled = False
App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
App_bEndgame = False

End Sub

' 播放声音
Public Sub PlayWavSound(ByVal szSoundFile As String)

If Options_bSounds Then
    PlaySoundA App_szPath & "SOUNDS\" & szSoundFile & ".WAV", 0, SND_ASYNC + SND_NOWAIT + SND_FILENAME
End If

End Sub

' 在棋盘上显示棋子，如果指定"DRAW_SELECTED"参数，则再显示一个标记框
' "frmPosEdit"中还有个相应的"DrawPosSquare/DrawCapSquare"过程
Public Sub DrawSquare(ByVal sq As Integer, Optional ByVal bSelected As Boolean = False, _
        Optional ByVal bMate As Boolean = False)

Dim pc As Integer, nPicId As Integer, img As Image, i As Integer, x As Integer, y As Integer
pc = Game_posIrrev(Game_nCurrIrrev).ucpcSquares(sq)
If pc = 0 Then
    nPicId = 0
Else
    nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
End If
nPicId = nPicId + IIf(bSelected, 15, 0)
y = sq \ 16
x = sq Mod 16
Set img = App_frmMain.imgSquares(IIf(App_bFlipped, (12 - y) * 9 + 11 - x, (y - 3) * 9 + x - 3))
If bMate Then
    nPicId = IIf(pc = 16, 30, IIf(pc = 32, 31, nPicId))
    ' 以下是新功能 - 抖一下将死的子
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
    ' 以上是新功能 - 抖一下将死的子
End If
img.Picture = App_picPieces(nPicId)

End Sub

' 显示整个棋盘，"frmPosEdit"中还有一个相应的"PosBoardFlush"过程
Public Sub BoardFlush()

Dim i As Integer, j As Integer
App_sqSelected = 0
App_sqMate = 0
For i = 3 To 12
    For j = 3 To 11
        DrawSquare i * 16 + j
    Next
Next

End Sub

' 显示坐标
Public Sub CoordFlush()

Dim i As Integer
If App_bFlipped Then
    For i = 0 To 17
        App_frmMain.btnCoord(i).Caption = Mid(COORD_CHAR, 18 - i, 1)
    Next
Else
    For i = 0 To 17
        App_frmMain.btnCoord(i).Caption = Mid(COORD_CHAR, i + 1, 1)
    Next
End If

End Sub

' 显示当前走过的着法，并且根据哪方走棋更新主窗口的图标
Public Sub MoveFlush()

Dim bNotBegin As Boolean, bNotEnd As Boolean, bComputer As Boolean
If App_sqSelected > 0 Then
    DrawSquare App_sqSelected
    App_sqSelected = 0
End If
If App_sqMate > 0 Then
    DrawSquare App_sqMate
    App_sqMate = 0
End If
If App_mvNewMove <> 0 Then
    DrawSquare Src(App_mvNewMove)
    DrawSquare Dst(App_mvNewMove)
    App_mvNewMove = 0
End If
If Game_nCurrMove > 0 Then
    App_mvNewMove = Game_mvMove(Game_nCurrMove)
    DrawSquare Src(App_mvNewMove), DRAW_SELECTED
    DrawSquare Dst(App_mvNewMove), DRAW_SELECTED
End If
bNotBegin = (Game_nCurrMove > 0)
App_frmMain.mnMoveDel.Enabled = bNotBegin
App_frmMain.tlb.Buttons("MoveDel").Enabled = bNotBegin
App_frmMain.mnMoveStart.Enabled = bNotBegin
App_frmMain.tlb.Buttons("MoveStart").Enabled = bNotBegin
App_frmMain.mnMoveBack.Enabled = bNotBegin
App_frmMain.tlb.Buttons("MoveBack").Enabled = bNotBegin
bNotEnd = (Game_nCurrMove < Game_nMaxMove)
App_frmMain.mnMoveForward.Enabled = bNotEnd
App_frmMain.tlb.Buttons("MoveForward").Enabled = bNotEnd
App_frmMain.mnMoveEnd.Enabled = bNotEnd
App_frmMain.tlb.Buttons("MoveEnd").Enabled = bNotEnd
App_frmMain.mnEngineRetract.Enabled = bNotBegin And Not bNotEnd
App_frmMain.mnEngineBan.Enabled = bNotBegin And Not bNotEnd
If Not bNotEnd Then
    App_bPlay = False
    App_frmMain.mnWizardPlay.Checked = False
    App_frmMain.tlb.Buttons("WizardPlay").Value = tbrUnpressed
End If
App_frmMain.txtComment.Text = Game_szComment(Game_nCurrMove)
App_frmMain.Icon = IIf(Game_sdMax = 0, frmHide2.imgFormRed.Picture, frmHide2.imgFormBlack.Picture)
' 如果不是电脑走，那么显示“提和”与“认输”
bComputer = IIf(Game_sdMax = 0, Engine_bRed, Engine_bBlack)
App_frmMain.mnEngineDraw.Enabled = Not bComputer
App_frmMain.mnEngineResign.Enabled = Not bComputer
' 如果处于“电脑分析”模式，那么停止分析
If Engine_bAnalyze And Not (Engine_bRed Or Engine_bBlack) Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
End If
Engine_bDraw = False
Engine_mvBan = 0
App_frmMain.lstMoveText.ListIndex = Game_nCurrMove
App_frmMain.mnMovePromote.Enabled = False
App_frmMain.tlb.Buttons("MovePromote").Enabled = False

End Sub

' 后退一个着法
Public Sub MoveBack()

Dim i As Integer, Status As Long, mv As Long
If Game_posIrrev(Game_nCurrIrrev).nMoveNum = 1 Then
    Game_nCurrIrrev = Game_nCurrIrrev - 1
Else
    CchessUndoMove Game_posIrrev(Game_nCurrIrrev)
End If
DrawSquare Src(Game_mvMove(Game_nCurrMove))
DrawSquare Dst(Game_mvMove(Game_nCurrMove))
Game_nCurrMove = Game_nCurrMove - 1
Game_sdCurr = 1 - Game_sdCurr
Game_cntCurr = Game_cntCurr - Game_sdCurr

End Sub

' 前进一个着法
Public Sub MoveForward()

Dim nMoveStatus As Long
Game_nCurrMove = Game_nCurrMove + 1
CchessTryMove Game_posIrrev(Game_nCurrIrrev), nMoveStatus, Game_mvMove(Game_nCurrMove)
If (nMoveStatus And MOVE_CAPTURE) <> 0 Then
    CchessUndoMove Game_posIrrev(Game_nCurrIrrev)
    Game_nCurrIrrev = Game_nCurrIrrev + 1
End If
DrawSquare Dst(Game_mvMove(Game_nCurrMove))
DrawSquare Src(Game_mvMove(Game_nCurrMove))
Game_sdCurr = 1 - Game_sdCurr
Game_cntCurr = Game_cntCurr + 1 - Game_sdCurr

End Sub

' 清除后面所有的着法
Public Sub MoveCut()

Dim i As Integer
If Engine_nStatus > BUSY_WAIT Then
    Engine_nStatus = BUSY_WAIT
    StopEngine
End If
For i = Game_nMaxMove To Game_nCurrMove + 1 Step -1
    App_frmMain.lstMoveText.RemoveItem i
    Game_szComment(i) = ""
Next
Game_sdMax = Game_sdCurr
Game_nMaxMove = Game_nCurrMove
Game_nMaxIrrev = Game_nCurrIrrev

End Sub

' 从文本文件导入
Public Sub ImportFromTextFile()

Dim nFileNo As Integer, i As Integer, szFileName As String
Dim szLineStr As String, szRemStr As String, nRemLevel As Integer
szFileName = FileDialog(L("从文本文件导入", "從文本文件導入"), L("文本文件", "文本文件"), "TXT")
If szFileName = "" Then
    Exit Sub
End If
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open szFileName For Input As #nFileNo
On Error GoTo 0
Do While Game_nCurrMove < Game_nMaxMove
    MoveForward
Loop
szLineStr = ""
szRemStr = ""
nRemLevel = 0
Do While Not (EOF(nFileNo) And szRemStr = "")
    If szLineStr = "" Then
        Line Input #nFileNo, szLineStr
    End If
    ImportLine szLineStr, szRemStr, nRemLevel
Loop
Close #nFileNo
MoveFlush
FileUpdated

Exit Sub
lnErrorOpen:
On Error GoTo 0
ErrorOpen szFileName

End Sub

' 从剪贴板导入
Public Sub ImportFromClipboard()

Dim i As Integer, szClipStr As String
Dim szLineStr As String, szRemStr As String, nRemLevel As Integer
Do While Game_nCurrMove < Game_nMaxMove
    MoveForward
Loop
szClipStr = Clipboard.GetText
szLineStr = ""
szRemStr = ""
nRemLevel = 0
' 检测{$fen ... }标志
If Left(szClipStr, 6) = "{$fen " Then
    i = InStr(szClipStr, "}")
    If i > 0 Then
        If CancelSave Then
            Exit Sub
        End If
        LoadFenStr Mid(szClipStr, 7, i - 7)
        szClipStr = Mid(szClipStr, 8)
    End If
End If
' 读下面的行
Do While Not (szClipStr = "" And szLineStr = "")
    If szLineStr = "" Then
        i = InStr(szClipStr, vbCrLf)
        If i = 0 Then
            szLineStr = szClipStr
            szClipStr = ""
        Else
            szLineStr = Left(szClipStr, i - 1)
            szClipStr = Mid(szClipStr, i + 2)
        End If
    End If
    ImportLine szLineStr, szRemStr, nRemLevel
Loop
MoveFlush
FileUpdated

End Sub

' 点击棋盘
Public Sub ClickSquare(ByVal sq As Integer)

Dim pc As Integer, bCanPromote As Boolean, mv As Long
pc = Game_posIrrev(Game_nCurrIrrev).ucpcSquares(sq)
If (pc And (16 + Game_sdCurr * 16)) <> 0 Then
    If App_sqSelected > 0 Then
        DrawSquare App_sqSelected
    End If
    App_sqSelected = sq
    DrawSquare App_sqSelected, DRAW_SELECTED
    If Game_nCurrMove > 0 Then
        DrawSquare Src(Game_mvMove(Game_nCurrMove))
        DrawSquare Dst(Game_mvMove(Game_nCurrMove))
    End If
    PlayWavSound "CLICK"
    bCanPromote = (CchessCanPromote(Game_posIrrev(Game_nCurrIrrev), sq) <> 0)
    App_frmMain.mnMovePromote.Enabled = bCanPromote
    App_frmMain.tlb.Buttons("MovePromote").Enabled = bCanPromote
Else
    If App_sqSelected > 0 Then
        mv = Move(App_sqSelected, sq)
        If AddMove(mv, MOVE_WITH_ECHO) Then
            FileUpdated
        End If
    End If
End If

End Sub

' 修改注释时，更新着法列表后面的星号
Public Sub CommentMoveText(ByVal nMove As Integer)

Dim szMoveText
szMoveText = App_frmMain.lstMoveText.List(nMove)
szMoveText = IIf(Right(szMoveText, 1) = "*", Left(szMoveText, Len(szMoveText) - 1), szMoveText)
App_frmMain.lstMoveText.List(nMove) = szMoveText & IIf(Game_szComment(nMove) = "", "", "*")

End Sub

' 电脑认输
Public Sub EngineResign()

Game_nResult = IIf(Game_sdMax = 0, RESULT_BLACKWIN, RESULT_REDWIN)
App_frmMain.lblResult = ResultString
Timer_bEnabled = False
App_frmMain.mnEngineLevel.Checked = False
App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
Engine_nStatus = IDLE_REST
GameOver IIf(Game_sdMax = 0, L("红方认输。", "紅方認輸。"), L("黑方认输。", "黑方認輸。")), ICON_WIN

End Sub

' 电脑接受提和
Public Sub EngineAcceptDraw()

Game_nResult = RESULT_DRAW
App_frmMain.lblResult = ResultString
Timer_bEnabled = False
App_frmMain.mnEngineLevel.Checked = False
App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
Engine_nStatus = IDLE_REST
GameOver IIf(Game_sdMax = 0, L("红方接受提和。", "紅方接受提和。"), _
        L("黑方接受提和。", "黑方接受提和。")), ICON_DRAW

End Sub

' 电脑提和
Public Sub EngineOfferDraw()

Engine_bDraw = True
If IIf(Game_sdMax = 1, Engine_bBlack, Engine_bRed) Then
    Exit Sub
End If
If Options_nLanguage = LANGUAGE_ZH_CN Then
    MsgBox IIf(Game_sdMax = 1, "红方提和。", "黑方提和。") & vbCrLf & vbCrLf & _
            "如果接受提和，请选择“电脑”菜单的“提和/接受提和”功能。" & vbCrLf & _
            "如果拒绝提和，则可以不予理睬，继续下一着棋。", vbInformation
Else
    MsgBox IIf(Game_sdMax = 1, "紅方提和。", "黑方提和。") & vbCrLf & vbCrLf & _
            "如果接受提和，請選擇“電腦”菜單的“提和/接受提和”功能。" & vbCrLf & _
            "如果拒絕提和，則可以不予理睬，繼續下一著棋。", vbInformation
End If

End Sub

' 新增一个着法，可以是从文件中读入的，用户搬的，或引擎走的
Public Function AddMove(ByVal mv As Long, Optional ByVal bEcho = False, Optional ByVal bEngine = False) As Boolean

Dim i As Integer, nMoveStatus As Long, nIcon As Integer
Dim szMoveChinText As String, szMoveFileText As String, szMoveIccsText As String

If Game_cntCurr = 1000 Or Game_posIrrev(Game_nCurrIrrev).nMoveNum = 256 Then
    AddMove = False
    If bEcho Then
        MsgBox L("超过最大回合数限制！", "超過最大回合數限制！"), vbExclamation
    End If
    Exit Function
End If
szMoveIccsText = Move2Iccs(mv)
szMoveFileText = MkL(CchessMove2File(mv, Game_posIrrev(Game_nCurrIrrev)))
szMoveChinText = MkC(CchessFile2Chin(CvL(szMoveFileText), Game_sdCurr))
If CchessTryMove(Game_posIrrev(Game_nCurrIrrev), nMoveStatus, mv) = 0 Then
    If bEcho And (nMoveStatus And MOVE_INCHECK) <> 0 Then
        PlayWavSound "ILLEGAL"
    End If
    AddMove = False
    Exit Function
End If

CchessUndoMove Game_posIrrev(Game_nCurrIrrev)
If Engine_nStatus > BUSY_WAIT Then
    If Engine_nStatus = BUSY_PONDER And mv = Engine_mvPonder Then
        SendEngine "ponderhit", IIf(Engine_posBoard.sdPlayer = 0, Engine_bSlaveRed, Engine_bSlaveBlack)
        Engine_nStatus = BUSY_THINK
    Else
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
End If
If Game_nCurrMove < Game_nMaxMove Then
    If MsgBox(L("必须清除以后所有的着法。", "必須清除以後所有的著法。") & vbCrLf & vbCrLf _
            & L("是否继续？", "是否繼續？"), vbYesNo + vbQuestion) = vbYes Then
        MoveCut
    Else
        AddMove = False
        Exit Function
    End If
End If
AddMove = True
If (nMoveStatus And MOVE_CAPTURE) <> 0 Then
    Game_posIrrev(Game_nMaxIrrev + 1) = Game_posIrrev(Game_nMaxIrrev)
    Game_nMaxIrrev = Game_nMaxIrrev + 1
    CchessTryMove Game_posIrrev(Game_nMaxIrrev), nMoveStatus, mv
    CchessSetIrrev Game_posIrrev(Game_nMaxIrrev)
    Game_szIrrevFen(Game_nMaxIrrev) = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nMaxIrrev))) & _
            " - - 0 " & IIf(Game_sdCurr = 0, Game_cntCurr, Game_cntCurr + 1)
End If
If Timer_bEnabled And Not Timer_bOver(Game_sdMax) Then
    If Timer_bIncMode Then
        Timer_nTimeLeft(Game_sdMax) = Timer_nTimeLeft(Game_sdMax) + Timer_nIncTime
        If Timer_nTimeLeft(Game_sdMax) < 0 Then
            Timer_nTimeLeft(Game_sdMax) = 0
        ElseIf Timer_nTimeLeft(Game_sdMax) > 28800 Then
            Timer_nTimeLeft(Game_sdMax) = 28800
        End If
        SetTimer
    Else
        Timer_nMoveLeft(Game_sdMax) = Timer_nMoveLeft(Game_sdMax) - 1
        If Timer_nMoveLeft(Game_sdMax) = 0 Then
            Timer_nTimeLeft(Game_sdMax) = Timer_nInitTime * 60
            Timer_nMoveLeft(Game_sdMax) = Timer_nIncMove
            SetTimer
        End If
    End If
End If
Timer_dfLastTime = Timer
Game_nMaxMove = Game_nMaxMove + 1
Game_sdMax = 1 - Game_sdMax
Game_szMoveText(0, Game_nMaxMove) = szMoveChinText
Game_szMoveText(1, Game_nMaxMove) = szMoveFileText
Game_szMoveText(2, Game_nMaxMove) = szMoveIccsText
App_frmMain.lstMoveText.AddItem NumberText(Game_cntCurr, Game_sdCurr) & _
        Game_szMoveText(Game_nFormat, Game_nMaxMove), Game_nMaxMove
Game_mvMove(Game_nMaxMove) = mv
MoveForward
If bEcho Then
    MoveFlush
End If
AnalyzeEcco
If (nMoveStatus And MOVE_MATE) = 0 Then
    If bEcho Then
        If (nMoveStatus And MOVE_CHECK) <> 0 Then
            PlayWavSound "CHECK" & IIf(bEngine, "2", "")
        ElseIf (nMoveStatus And MOVE_CAPTURE) <> 0 Then
            PlayWavSound IIf(Src(mv) = Dst(mv), "PROMOTE", "CAPTURE") & IIf(bEngine, "2", "")
        Else
            PlayWavSound "MOVE" & IIf(bEngine, "2", "")
        End If
    End If
    If (nMoveStatus And MOVE_DRAW) <> 0 Then
        If bEcho Then
            GameOver L("自然作和。", "自然作和。"), ICON_DRAW
        End If
        Game_nResult = RESULT_DRAW
        App_frmMain.lblResult = ResultString
        Timer_bEnabled = False
        App_frmMain.mnEngineLevel.Checked = False
        App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
        If Engine_bRed Or Engine_bBlack Then
            EngineLoaded True
        End If
    ElseIf (nMoveStatus And MOVE_PERPETUAL) <> 0 Then
        Game_nResult = RESULT_DRAW
        If (nMoveStatus And MOVE_PERPETUAL_WIN) <> 0 Then
            Game_nResult = Game_nResult + 1 - Game_sdCurr * 2
        End If
        If (nMoveStatus And MOVE_PERPETUAL_LOSS) <> 0 Then
            Game_nResult = Game_nResult - 1 + Game_sdCurr * 2
        End If
        If bEcho Then
            If Game_nResult = 2 Then
                nIcon = ICON_DRAW
            Else
                nIcon = IIf((Game_nResult = 1 And Engine_bRed) Or (Game_nResult = 3 And Engine_bBlack), ICON_LOSS, ICON_WIN)
            End If
            If Options_nLanguage = LANGUAGE_ZH_CN Then
                GameOver Choose(Game_nResult, "黑方长打作负！", "双方不变作和。", "红方长打作负！"), nIcon
            Else
                GameOver Choose(Game_nResult, "黑方長打作負！", "雙方不變作和。", "紅方長打作負！"), nIcon
            End If
        End If
        App_frmMain.lblResult = ResultString
        Timer_bEnabled = False
        App_frmMain.mnEngineLevel.Checked = False
        App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
        If Engine_bRed Or Engine_bBlack Then
            EngineLoaded True
        End If
    End If
Else
    App_sqMate = Game_posIrrev(Game_nCurrIrrev).ucsqPieces(IIf(Game_sdCurr = 1, 32, 16))
    If bEcho Then
        nIcon = IIf((Game_sdCurr = 1 And Engine_bRed) Or (Game_sdCurr = 0 And Engine_bBlack), ICON_LOSS, ICON_WIN)
        GameOver IIf(Game_sdCurr = 1, L("红胜。", "紅勝。"), L("黑胜。", "黑勝。")), nIcon
    End If
    Game_nResult = IIf(Game_sdCurr = 1, RESULT_REDWIN, RESULT_BLACKWIN)
    App_frmMain.lblResult = ResultString
    Timer_bEnabled = False
    App_frmMain.mnEngineLevel.Checked = False
    App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
End If
If App_frmMain.mnEngineDraw.Checked Then
    App_frmMain.mnEngineDraw.Checked = False
    Engine_bDraw = True
End If

If Engine_nStatus <> IDLE_PONDER Then
    Exit Function
End If
If mv <> Engine_mvPonder Then
    Engine_nStatus = IDLE_READY
    Exit Function
End If
If Options_bAllowResign And Engine_bPonderFinishedResign Then
    EngineResign
ElseIf Engine_bDraw And Engine_bPonderFinishedDraw Then
    EngineAcceptDraw
Else
    Engine_nStatus = IDLE_READY
    AddMove Engine_mvPonderFinished, MOVE_WITH_ECHO, MOVE_BY_ENGINE
    If Options_bAllowResign And Engine_bPonderFinishedDraw Then
        EngineOfferDraw
    End If
    If Engine_mvPonderFinishedPonder <> 0 Then
        Engine_mvPonder = Engine_mvPonderFinishedPonder
        Engine_nStatus = BUSY_PONDER
        RunEngine
    End If
End If

End Function

' 分析开局
Public Sub AnalyzeEcco()

Dim i As Integer, dwEcco As Long
Dim szMoveStr As String
If App_bAutoEcco And Game_bStartPos And Game_nMaxMove <= 20 Then
    szMoveStr = ""
    For i = 1 To Game_nMaxMove
        szMoveStr = szMoveStr & Game_szMoveText(1, i)
    Next
    dwEcco = EccoIndex(szMoveStr)
    Game_szEcco = Left(MkL(dwEcco), 3)
    Game_szOpen = AllocString(EccoOpening(dwEcco))
    Game_szVar = AllocString(EccoVariation(dwEcco))
    App_frmMain.lblOpen = OpenString
End If

End Sub

' 以上是界面控制例程

' 以下是引擎控制例程

' 显示引擎信息的对话框
Public Sub AboutEngine()

MessageBeep vbInformation
If Options_nLanguage = LANGUAGE_ZH_CN Then
    MsgBoxIcon IIf(Engine_szName = "", "", "引擎：" & Engine_szName & vbCrLf) & _
            IIf(Engine_szVersion = "", "", "版本：" & Engine_szVersion & vbCrLf) & _
            IIf(Engine_szCopyright = "", "", "版权：" & Engine_szCopyright & vbCrLf) & _
            IIf(Engine_szAuthor = "", "", "作者：" & Engine_szAuthor & vbCrLf) & _
            IIf(Engine_szUser = "", "", "用户：" & Engine_szUser), , "关于UCCI引擎", Engine_szFile
Else
    MsgBoxIcon IIf(Engine_szName = "", "", "引擎：" & Engine_szName & vbCrLf) & _
            IIf(Engine_szVersion = "", "", "版本：" & Engine_szVersion & vbCrLf) & _
            IIf(Engine_szCopyright = "", "", "版權：" & Engine_szCopyright & vbCrLf) & _
            IIf(Engine_szAuthor = "", "", "作者：" & Engine_szAuthor & vbCrLf) & _
            IIf(Engine_szUser = "", "", "用戶：" & Engine_szUser), , "關於UCCI引擎", Engine_szFile
End If

End Sub

' 根据引擎走子方翻转棋盘并显示对阵双方
Public Sub EnginePlayer()

Dim szName As String, szSlaveName As String
Engine_bPonder = False
App_frmMain.mnEnginePonder.Checked = False
If Engine_bRed Eqv Engine_bBlack Then
    App_frmMain.mnEnginePonder.Enabled = False
Else
    App_frmMain.mnEnginePonder.Enabled = True
    If Options_bAlwaysPonder Then
        Engine_bPonder = True
        App_frmMain.mnEnginePonder.Checked = True
    End If
    If Options_bAutoFlip Then
        App_bFlipped = Engine_bRed
        CoordFlush
        BoardFlush
    End If
End If
App_frmMain.mnPosFlip.Checked = App_bFlipped
App_frmMain.tlb.Buttons("PosFlip").Value = IIf(App_bFlipped, tbrPressed, tbrUnpressed)
If Options_bEngineName Then
    szName = IIf(Engine_szName = "ElephantEye", L("象棋巫师", "象棋巫師"), Engine_szName)
    szSlaveName = IIf(Engine_szSlaveName = "ElephantEye", L("象棋巫师", "象棋巫師"), Engine_szSlaveName)
    Game_szRedPlayer = IIf(Engine_bRed, IIf(Engine_bSlaveRed, szSlaveName, szName), Options_szUser)
    Game_szBlackPlayer = IIf(Engine_bBlack, IIf(Engine_bSlaveBlack, szSlaveName, szName), Options_szUser)
End If
LabelFlush
StartTimer

End Sub

' 根据引擎是否在思考，显示菜单和工具栏上的可用功能
Public Sub EngineBusy(ByVal bBusy As Boolean)

App_frmMain.mnPosMirror.Enabled = Not bBusy
App_frmMain.mnPosEdit.Enabled = Not bBusy
App_frmMain.tlb.Buttons("PosEdit").Enabled = Not bBusy
App_frmMain.mnPosPaste.Enabled = Not bBusy
App_frmMain.mnPosLoad.Enabled = Not bBusy
App_frmMain.mnWizardPlay.Enabled = Not bBusy
App_frmMain.tlb.Buttons("WizardPlay").Enabled = Not bBusy
App_frmMain.mnWizardHandicap_.Enabled = Not bBusy
App_frmMain.mnEndgamesStart.Enabled = Not bBusy
App_frmMain.tlb.Buttons("EndgamesStart").Enabled = Not bBusy
App_frmMain.mnEndgames_.Enabled = Not bBusy
App_frmMain.mnEngineLevel.Enabled = Not bBusy
App_frmMain.tlb.Buttons("EngineLevel").Enabled = Not bBusy
App_frmMain.mnEngineSet.Enabled = Not bBusy
App_frmMain.mnEngineStop.Enabled = bBusy
App_frmMain.tlb.Buttons("EngineStop").Enabled = bBusy
If bBusy And App_bPlay Then
    App_bPlay = False
    App_frmMain.mnWizardPlay.Checked = False
    App_frmMain.tlb.Buttons("WizardPlay").Value = tbrUnpressed
End If

End Sub

' 向引擎发送指令，并记录日志，可以选择是主引擎还是负引擎
Public Sub SendEngine(ByVal szLineStr As String, Optional ByVal bSlaveEngine As Boolean = False)

Dim nLogFileNo As Integer
If bSlaveEngine Then
    PipeLineOutput Engine_pipeSlave, szLineStr
Else
    PipeLineOutput Engine_pipe, szLineStr
End If
If Engine_bEngineLog And Engine_szLogFile <> "" Then
    nLogFileNo = FreeFile
    On Error GoTo lnErrorOpen
    Open Engine_szLogFile For Append As #nLogFileNo
    Print #nLogFileNo, "<font color=""" & IIf(bSlaveEngine, "#FF00FF", "#FF0000") & """>" & szLineStr & "</font><br>"
    Close #nLogFileNo
End If

lnErrorOpen:
On Error GoTo 0

End Sub

' 把接收到的引擎反馈记入日志
Public Sub ReceiveEngineLog(ByVal szLineStr As String, Optional ByVal bSlaveEngine As Boolean = False)

Dim nLogFileNo As Integer
If Engine_bEngineLog And Engine_szLogFile <> "" Then
    nLogFileNo = FreeFile
    On Error GoTo lnErrorOpen
    Open Engine_szLogFile For Append As #nLogFileNo
    Print #nLogFileNo, "<font color=""" & IIf(bSlaveEngine, "#000080", "#0000FF") & """>" & szLineStr & "</font><br>"
    Close #nLogFileNo
End If

lnErrorOpen:
On Error GoTo 0

End Sub

' 让引擎思考，思考前必须设置思考状态(BUSY_ANALYZE/BUSY_THINK/BUSY_PONDER)
Public Sub RunEngine()

Dim i As Integer, nIrrevMove As Integer, bSlaveEngine As Boolean
Dim nTimeRatio As Long, nMoveStatus As Long
Dim szFenStr As String, szGoPonder As String
Dim nMoveList(1 To 128) As Long

Engine_posBoard = Game_posIrrev(Game_nCurrIrrev)
Engine_dwTime = Timer
Engine_nMoves = CchessGenMoves(Engine_posBoard, nMoveList(1))
Engine_nDepth = 0
Engine_nCurrMove = 0
If Engine_bAnalyze Then
    frmThink.txtThink.Text = ""
End If
szFenStr = Game_szIrrevFen(Game_nCurrIrrev)
nIrrevMove = Game_nCurrMove + 1 - Game_posIrrev(Game_nCurrIrrev).nMoveNum
If Game_nCurrMove > nIrrevMove Then
    szFenStr = szFenStr & " moves"
    For i = nIrrevMove + 1 To Game_nCurrMove
        szFenStr = szFenStr & " " & Move2Coord(Game_mvMove(i))
    Next
End If
szGoPonder = "go"
If Engine_nStatus = BUSY_PONDER Then
    Select Case Game_nFormat
    Case 0
        Engine_szPonderStr = MkC(CchessFile2Chin(CchessMove2File(Engine_mvPonder, Engine_posBoard), Engine_posBoard.sdPlayer))
    Case 1
        Engine_szPonderStr = MkL(CchessMove2File(Engine_mvPonder, Engine_posBoard))
    Case 2
        Engine_szPonderStr = Move2Iccs(Engine_mvPonder)
    End Select
    If CchessTryMove(Engine_posBoard, nMoveStatus, Engine_mvPonder) <> 0 Then
        szFenStr = szFenStr & IIf(Game_nCurrMove > nIrrevMove, "", " moves")
        szFenStr = szFenStr & " " & Move2Coord(Engine_mvPonder)
        szGoPonder = szGoPonder & " ponder"
    End If
Else
    If Engine_bDraw Then
        szGoPonder = szGoPonder & " draw"
    End If
End If
bSlaveEngine = IIf(Engine_posBoard.sdPlayer = 0, Engine_bSlaveRed, Engine_bSlaveBlack)
nTimeRatio = IIf(bSlaveEngine, Engine_nTimeRatioSlave, Engine_nTimeRatio)
SendEngine "position fen " & szFenStr, bSlaveEngine
If Engine_mvBan <> 0 Then
    SendEngine "banmoves " & Move2Coord(Engine_mvBan), bSlaveEngine
End If
If Engine_nStatus = BUSY_ANALYZE Then
    SendEngine "go infinite", bSlaveEngine
Else
    If Timer_nDepth <= 0 Then
        If Timer_bIncMode Then
            SendEngine szGoPonder & " time " & (nTimeRatio * Timer_nTimeLeft(Engine_posBoard.sdPlayer)) & _
                    " increment " & IIf(Timer_nIncTime < 0, 0, nTimeRatio * Timer_nIncTime) & _
                    " opptime " & (nTimeRatio * Timer_nTimeLeft(1 - Engine_posBoard.sdPlayer)) & _
                    " oppincrement " & IIf(Timer_nIncTime < 0, 0, nTimeRatio * Timer_nIncTime), bSlaveEngine
        Else
            SendEngine szGoPonder & " time " & (nTimeRatio * Timer_nTimeLeft(Engine_posBoard.sdPlayer)) & _
                    " movestogo " & Timer_nMoveLeft(Engine_posBoard.sdPlayer) & _
                    " opptime " & (nTimeRatio * Timer_nTimeLeft(1 - Engine_posBoard.sdPlayer)) & _
                    " oppmovestogo " & (Timer_nMoveLeft(1 - Engine_posBoard.sdPlayer)), bSlaveEngine
        End If
    Else
        SendEngine szGoPonder & " depth " & Timer_nDepth, bSlaveEngine
    End If
End If
App_frmMain.stb.Panels("Curr").Text = ""
App_frmMain.stb.Panels("Nps").Text = ""
App_frmMain.stb.Panels("Pv").Text = ""
App_frmMain.stb.Panels("Msg").Text = ""
EngineBusy True

End Sub

' 在思考细节框中输出信息，并定位光标
Public Sub AppendThink(ByVal sz As String)

Dim nTextLen As Long
If frmThink.txtThink.Text = "" Then
    frmThink.txtThink.Text = sz
    frmThink.txtThink.SelStart = 0
Else
    frmThink.txtThink.Text = frmThink.txtThink.Text & vbCrLf
    nTextLen = Len(frmThink.txtThink.Text)
    frmThink.txtThink.Text = frmThink.txtThink.Text & sz
    frmThink.txtThink.SelStart = nTextLen
End If

End Sub

' 输出引擎的信息，显示到显示思考窗口和状态栏
Public Sub PopEngine(ByVal szReceived As String)

Dim i As Integer, nScore As Integer, nOldDepth As Integer
Dim nTime As Long, nNodes As Long
Dim szMoveList As String, nMoveStatus As Long, mv As Long
Dim pos As PositionStruct

' 输出当前思考着法
i = InStr(szReceived, " currmove ")
If i > 0 Then
    Engine_nCurrMove = Engine_nCurrMove + 1
    If Options_bStatusBar Then
        mv = Coord2Move(Mid(szReceived, i + 10))
        Select Case Game_nFormat
        Case 0
            szMoveList = MkC(CchessFile2Chin(CchessMove2File(mv, Engine_posBoard), Engine_posBoard.sdPlayer))
        Case 1
            szMoveList = MkL(CchessMove2File(mv, Engine_posBoard))
        Case 2
            szMoveList = Move2Iccs(mv)
        End Select
        App_frmMain.stb.Panels("Curr").Text = Engine_nDepth & _
                " (" & Engine_nCurrMove & "/" & Engine_nMoves & ") " & szMoveList
    End If
End If

' 输出速度
If Options_bStatusBar Then
    i = InStr(szReceived, " nodes ")
    If i > 0 Then
        nNodes = Str2Lng(Mid(szReceived, i + 7))
        nTime = (Timer - Engine_dwTime) * 1000
        nTime = IIf(nTime < 0, nTime + 86400000, nTime)
        If nTime > 0 Then
            App_frmMain.stb.Panels("Nps").Text = "NPS " & (nNodes \ nTime) & "K"
        End If
    End If
End If

' 输出主要变例
i = InStr(szReceived, " depth ")
If i > 0 Then
    nOldDepth = Engine_nDepth
    Engine_nDepth = Str2Int(Mid(szReceived, i + 7), -999, 999)
    If Engine_nDepth > nOldDepth Then
        Engine_nCurrMove = 0
    End If
    If Engine_nDepth > 0 Then
        If Engine_bAnalyze And Options_bEngineTime Then
            nTime = Int((Timer - Engine_dwTime) * 1000)
            nTime = IIf(nTime < 0, nTime + 86400000, nTime)
            AppendThink TimeText(nTime \ 1000) & "." & ((nTime \ 100) Mod 10) & " ->"
        End If
    End If
    szMoveList = Space(3 - Len("" & Engine_nDepth)) & Engine_nDepth
    i = InStr(szReceived, " score ")
    If i > 0 Then
        If Mid(szReceived, i + 7, 5) = "mate " Then
            nScore = Str2Int(Mid(szReceived, i + 12))
            nScore = IIf(nScore < 0, -10000, 10000) - nScore
        Else
            nScore = Str2Int(Mid(szReceived, i + 7))
        End If
        If nScore > 0 Then
            szMoveList = szMoveList & Space(5 - Len("" & nScore)) & "(+" & nScore & ")"
        ElseIf nScore < 0 Then
            szMoveList = szMoveList & Space(6 - Len("" & nScore)) & "(" & nScore & ")"
        Else
            szMoveList = szMoveList & "     (0)"
        End If
        i = InStr(szReceived, " pv ")
        If i > 0 Then
            pos = Engine_posBoard
            If Engine_nStatus = BUSY_PONDER Then
                szMoveList = szMoveList & " (" & Engine_szPonderStr & ")"
            End If
            i = i + 4
            Do While i < Len(szReceived)
                mv = Coord2Move(Mid(szReceived, i))
                Select Case Game_nFormat
                Case 0
                    szMoveList = szMoveList & " " & MkC(CchessFile2Chin(CchessMove2File(mv, pos), pos.sdPlayer))
                Case 1
                    szMoveList = szMoveList & " " & MkL(CchessMove2File(mv, pos))
                Case 2
                    szMoveList = szMoveList & " " & Move2Iccs(mv)
                End Select
                CchessTryMove pos, nMoveStatus, mv
                i = i + 5
            Loop
        End If
        If Options_bStatusBar And Engine_nDepth > 0 Then
            App_frmMain.stb.Panels("Pv").Text = szMoveList
        End If
    End If
    If Engine_bAnalyze Then
        AppendThink szMoveList
    End If
End If

' 输出引擎提示信息
i = InStr(szReceived, " message ")
If i > 0 Then
    If Options_bStatusBar Then
        App_frmMain.stb.Panels("Msg").Text = Mid(szReceived, i + 9)
    End If
    If Engine_bAnalyze Then
        AppendThink Mid(szReceived, i + 9)
    End If
End If

End Sub

' 在引擎思考时，接收引擎信息
Public Function ReceiveEngine() As Boolean

Dim lpStr As Long, bSlaveEngine As Boolean, szReceived As String
Dim i As Integer, mv As Long

If Engine_nStatus = IDLE_UNLOAD Then
    ReceiveEngine = False
    Exit Function
End If
bSlaveEngine = (Engine_nStatus >= BUSY_WAIT And _
        IIf(Engine_posBoard.sdPlayer = 0, Engine_bSlaveRed, Engine_bSlaveBlack))
If bSlaveEngine Then
    lpStr = PipeLineInput(Engine_pipeSlave)
Else
    lpStr = PipeLineInput(Engine_pipe)
End If
If lpStr = 0 Then
    ReceiveEngine = False
    Exit Function
End If

szReceived = AllocString(lpStr)
ReceiveEngineLog szReceived, bSlaveEngine
If Left(szReceived, 9) = "bestmove " Then
    EngineBusy False
    mv = Coord2Move(Mid(szReceived, 10, 4))
    Select Case Engine_nStatus
    Case BUSY_WAIT
        Engine_nStatus = IDLE_READY
    Case BUSY_PONDER
        Engine_mvPonderFinished = mv
        If Engine_bPonder And Mid(szReceived, 14, 8) = " ponder " Then
            Engine_mvPonderFinishedPonder = Coord2Move(Mid(szReceived, 22, 4))
        Else
            Engine_mvPonderFinishedPonder = 0
        End If
        Engine_bPonderFinishedResign = (Right(szReceived, 7) = " resign")
        Engine_bPonderFinishedDraw = (Right(szReceived, 5) = " draw")
        Engine_nStatus = IDLE_PONDER
    Case BUSY_ANALYZE
        Engine_nStatus = IDLE_REST
    Case BUSY_THINK
        If Options_nMoveDelay > 0 Then
            Sleep Options_nMoveDelay * 1000
        End If
        Do While Game_nCurrMove < Game_nMaxMove
            MoveForward
        Loop
        If Options_bAllowResign And Right(szReceived, 7) = " resign" Then
            EngineResign
        ElseIf Engine_bDraw And Right(szReceived, 5) = " draw" Then
            EngineAcceptDraw
        Else
            Engine_nStatus = IDLE_READY
            ' 一定要在 IDLE_READY 的时候 AddMove
            If AddMove(mv, MOVE_WITH_ECHO, MOVE_BY_ENGINE) Then
                App_frmMain.SetFocus
                If Options_bAllowResign And Right(szReceived, 5) = " draw" Then
                    EngineOfferDraw
                End If
                If Engine_bPonder And Mid(szReceived, 14, 8) = " ponder " Then
                    Engine_mvPonder = Coord2Move(Mid(szReceived, 22, 4))
                    Engine_nStatus = BUSY_PONDER
                    RunEngine
                End If
            Else
                ' 走棋没有成功，则不让引擎思考
                Engine_nStatus = IDLE_REST
            End If
        End If
    Case Else
        If (MsgBox(L("不该接收到的引擎信息：", "不該接收到的引擎信息：") & szReceived & vbCrLf & vbCrLf & _
                L("是否把这个情况汇报给象棋巫师开发团队？", "是否把這個情況匯報給象棋巫師開發團隊？"), _
                vbQuestion + vbYesNo)) = vbYes Then
            ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/help_engine.htm#receive", _
                    vbNullString, vbNullString, vbNormalFocus
        End If
    End Select
    If Options_bStatusBar Then
        App_frmMain.stb.Panels("Curr").Text = ""
    End If
ElseIf Left(szReceived, 10) = "nobestmove" Then
    EngineBusy False
    Select Case Engine_nStatus
    Case BUSY_WAIT
        Engine_nStatus = IDLE_READY
    Case BUSY_PONDER
        Engine_nStatus = IDLE_READY
    Case BUSY_ANALYZE
        Engine_nStatus = IDLE_REST
    Case BUSY_THINK
        Engine_nStatus = IDLE_REST
    Case Else
        ' MsgBox "不该接收到引擎的信息：" & szReceived, vbExclamation
    End Select
    If Options_bStatusBar Then
        App_frmMain.stb.Panels("Curr").Text = ""
    End If
ElseIf Left(szReceived, 12) = "info string " Then
ElseIf Left(szReceived, 5) = "info " Then
    PopEngine szReceived
End If
ReceiveEngine = True

End Function

' 中止引擎思考
Public Sub StopEngine()

Dim nOldStatus As Integer
Dim dfLastTime As Double, dfThisTime As Double
SendEngine "stop", IIf(Engine_posBoard.sdPlayer = 0, Engine_bSlaveRed, Engine_bSlaveBlack)
dfLastTime = Timer
nOldStatus = Engine_nStatus
Do While Engine_nStatus = nOldStatus
    If Not ReceiveEngine Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        If dfThisTime > dfLastTime + 1# Then
            Exit Do
        End If
    End If
Loop
If Engine_nStatus = nOldStatus Then
    Engine_nStatus = IDLE_READY
    EngineBusy False
End If

End Sub

' 设置引擎参数
Public Sub SetEngine(Optional ByVal bSlaveEngine As Boolean = False)

SendEngine "setoption promotion " & IIf(App_bPromotion, "true", "false"), bSlaveEngine
SendEngine "setoption usebook " & IIf(Engine_bUseBook, "true", "false"), bSlaveEngine
SendEngine "setoption useegtb " & IIf(Engine_bUseEgtb, "true", "false"), bSlaveEngine
If Engine_szBookFiles <> "" Then
    SendEngine "setoption bookfiles " & Engine_szBookFiles, bSlaveEngine
End If
If Engine_szEgtbPaths <> "" Then
    SendEngine "setoption egtbpaths " & Engine_szEgtbPaths, bSlaveEngine
End If
SendEngine "setoption hashsize " & IIf(Engine_nHash = 0, 0, 16 * 2 ^ (Engine_nHash - 1)), bSlaveEngine
If Engine_nThreads = 0 Then
    SendEngine "setoption threads 0"
    SendEngine "setoption idle none"
ElseIf Engine_nThreads < 4 Then
    SendEngine "setoption threads 1"
    SendEngine "setoption idle " & Choose(Engine_nThreads, "large", "medium", "small"), bSlaveEngine
Else
    SendEngine "setoption threads " & (2 ^ (Engine_nThreads - 4)), bSlaveEngine
    SendEngine "setoption idle none"
End If
SendEngine "setoption randomness " & Choose(Engine_nRandomness + 1, "none", "small", "medium", "large"), bSlaveEngine
SendEngine "setoption style " & Choose(Engine_nStyle + 1, "solid", "normal", "risky"), bSlaveEngine

End Sub

' 根据引擎是否已加载，显示菜单和工具栏上的可用功能
Public Sub EngineLoaded(ByVal bLoaded As Boolean)

App_frmMain.mnEngineSet.Enabled = bLoaded
Engine_bRed = False
App_frmMain.mnEngineRed.Enabled = bLoaded
App_frmMain.mnEngineRed.Checked = False
App_frmMain.tlb.Buttons("EngineRed").Enabled = bLoaded
App_frmMain.tlb.Buttons("EngineRed").Value = tbrUnpressed
Engine_bBlack = False
App_frmMain.mnEngineBlack.Enabled = bLoaded
App_frmMain.mnEngineBlack.Checked = False
App_frmMain.tlb.Buttons("EngineBlack").Enabled = bLoaded
App_frmMain.tlb.Buttons("EngineBlack").Value = tbrUnpressed
Engine_bPonder = False
App_frmMain.mnEnginePonder.Enabled = False
App_frmMain.mnEnginePonder.Checked = False
If Engine_bAnalyze Then
    Unload frmThink
End If
App_frmMain.mnEngineAnalyze.Enabled = bLoaded
App_frmMain.tlb.Buttons("EngineAnalyze").Enabled = bLoaded
App_frmMain.mnEngineStop.Enabled = False
App_frmMain.mnEngineRetract.Enabled = bLoaded
App_frmMain.mnEngineBan.Enabled = bLoaded
App_frmMain.mnEngineDraw.Checked = False
App_frmMain.tlb.Buttons("EngineStop").Enabled = False
App_frmMain.mnHelpEngine.Enabled = bLoaded
If Not bLoaded Then
    Timer_bEnabled = False
    App_frmMain.mnEngineLevel.Checked = False
    App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
End If

End Sub

' 关闭引擎(如果有副引擎，先关闭副引擎)
Public Sub CloseEngine()

Dim dfLastTime As Double, dfThisTime As Double, szReceived As String
Dim lpStr As Long
If Engine_nStatus > BUSY_WAIT Then
    Engine_nStatus = BUSY_WAIT
    StopEngine
End If
If Engine_bSlaveRed Or Engine_bSlaveBlack Then
    CloseSlaveEngine
End If
SendEngine "quit"
dfLastTime = Timer
Do While Engine_nStatus > IDLE_UNLOAD
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        If dfThisTime > dfLastTime + 1# Then
            Exit Do
        End If
    Else
        szReceived = AllocString(lpStr)
        ReceiveEngineLog szReceived
        If szReceived = "bye" Then
            Engine_nStatus = IDLE_UNLOAD
        End If
    End If
Loop
PipeClose Engine_pipe
If Engine_nStatus > IDLE_UNLOAD Then
    MsgBox L("无法正常卸载引擎！", "無法正常卸載引擎！"), vbExclamation
    Engine_nStatus = IDLE_UNLOAD
End If

End Sub

' 关闭副引擎
Public Sub CloseSlaveEngine()

Dim dfLastTime As Double, dfThisTime As Double, szReceived As String
Dim lpStr As Long
SendEngine "quit", SLAVE_ENGINE
dfLastTime = Timer
Do While (Engine_bSlaveRed Or Engine_bSlaveBlack)
    lpStr = PipeLineInput(Engine_pipeSlave)
    If lpStr = 0 Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        If dfThisTime > dfLastTime + 1# Then
            Exit Do
        End If
    Else
        szReceived = AllocString(lpStr)
        ReceiveEngineLog szReceived, SLAVE_ENGINE
        If szReceived = "bye" Then
            Engine_bSlaveRed = False
            Engine_bSlaveBlack = False
        End If
    End If
Loop
PipeClose Engine_pipeSlave
If Engine_bSlaveRed Or Engine_bSlaveBlack Then
    MsgBox L("无法正常卸载副引擎！", "無法正常卸載副引擎！"), vbExclamation
    Engine_bSlaveRed = False
    Engine_bSlaveBlack = False
End If

End Sub

' 加载引擎失败
Public Sub ErrorOpenEngine()

Engine_szFile = ""
EngineLoaded False
SetTitle
If (MsgBox(L("无法加载引擎：", "無法加載引擎：") & Engine_szFile & vbCrLf & vbCrLf & _
        L("是否把这个情况汇报给象棋巫师开发团队？", "是否把這個情況匯報給象棋巫師開發團隊？"), _
        vbQuestion + vbYesNo)) = vbYes Then
    ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/help_engine.htm#load", _
            vbNullString, vbNullString, vbNormalFocus
End If

End Sub


' 打开引擎
Public Sub OpenEngine(Optional ByVal bInfo As Boolean = False)

Dim dfLastTime As Double, dfThisTime As Double
Dim lpStr As Long, szReceived As String

If Engine_nStatus > IDLE_UNLOAD Then
    CloseEngine
End If
If Engine_szFile = "" Then
    EngineLoaded False
    SetTitle
    Exit Sub
End If

PipeOpen Engine_pipe, Engine_szFile
SendEngine "ucci"
dfLastTime = Timer
Engine_szName = ""
Engine_szVersion = ""
Engine_szCopyright = ""
Engine_szAuthor = ""
Engine_szUser = ""
Engine_nTimeRatio = 1
Do While Engine_nStatus = IDLE_UNLOAD
    lpStr = PipeLineInput(Engine_pipe)
    If lpStr = 0 Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        ' 加载引擎的时间延长到30秒
        If dfThisTime > dfLastTime + 30# Then
            Exit Do
        End If
    Else
        szReceived = AllocString(lpStr)
        ReceiveEngineLog szReceived
        If Left(szReceived, 8) = "id name " Then
            Engine_szName = Mid(szReceived, 9)
        ElseIf Left(szReceived, 11) = "id version " Then
            Engine_szVersion = Mid(szReceived, 12)
        ElseIf Left(szReceived, 13) = "id copyright " Then
            Engine_szCopyright = Mid(szReceived, 14)
        ElseIf Left(szReceived, 10) = "id author " Then
            Engine_szAuthor = Mid(szReceived, 11)
        ElseIf Left(szReceived, 8) = "id user " Then
            Engine_szUser = Mid(szReceived, 9)
        ElseIf Left(szReceived, 19) = "option usemillisec " Then
            Engine_nTimeRatio = 1000
        ElseIf szReceived = "ucciok" Then
            Engine_nStatus = IDLE_READY
        End If
    End If
Loop
If Engine_nStatus > IDLE_UNLOAD Then
    Engine_bSlaveRed = False
    Engine_bSlaveBlack = False
    If Engine_nTimeRatio = 1000 Then
        SendEngine "setoption usemillisec true"
    End If
    SetEngine
    If bInfo Then
        AboutEngine
    End If
    EngineLoaded True
Else
    SendEngine "quit"
    PipeClose Engine_pipe
    ErrorOpenEngine
End If
SetTitle

End Sub

' 打开副引擎
Public Sub OpenSlaveEngine()

Dim szEngineFile As String, szVersion As String, szCopyright As String, szAuthor As String, szUser As String
Dim dfLastTime As Double, dfThisTime As Double
Dim lpStr As Long, szReceived As String

If Engine_bSlaveRed Or Engine_bSlaveBlack Then
    CloseSlaveEngine
    MsgBox L("副引擎已卸载。", "副引擎已卸載。"), vbInformation
    Exit Sub
End If
szEngineFile = FileDialog(L("加载副引擎", "加載副引擎"), L("引擎文件", "引擎文件"), "EXE")
If szEngineFile = "" Then
    Exit Sub
End If
If GetAppType(szEngineFile) <> IMAGE_SUBSYSTEM_WINDOWS_CUI Then
    MsgBox szEngineFile & L(" 不是中国象棋引擎文件！", " 不是中國象棋引擎文件！"), vbExclamation
    Exit Sub
End If
PipeOpen Engine_pipeSlave, szEngineFile
SendEngine "ucci", SLAVE_ENGINE
dfLastTime = Timer
Engine_szSlaveName = ""
szCopyright = ""
szAuthor = ""
szUser = ""
Engine_nTimeRatioSlave = 1
Do While Not Engine_bSlaveBlack
    lpStr = PipeLineInput(Engine_pipeSlave)
    If lpStr = 0 Then
        Sleep 1
        dfThisTime = Timer
        dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
        If dfThisTime > dfLastTime + 10# Then
            Exit Do
        End If
    Else
        szReceived = AllocString(lpStr)
        ReceiveEngineLog szReceived, SLAVE_ENGINE
        If Left(szReceived, 8) = "id name " Then
            Engine_szSlaveName = Mid(szReceived, 9)
        ElseIf Left(szReceived, 11) = "id version " Then
            szVersion = Mid(szReceived, 12)
        ElseIf Left(szReceived, 13) = "id copyright " Then
            szCopyright = Mid(szReceived, 14)
        ElseIf Left(szReceived, 10) = "id author " Then
            szAuthor = Mid(szReceived, 11)
        ElseIf Left(szReceived, 8) = "id user " Then
            szUser = Mid(szReceived, 9)
        ElseIf Left(szReceived, 19) = "option usemillisec " Then
            Engine_nTimeRatioSlave = 1000
        ElseIf szReceived = "ucciok" Then
            Engine_bSlaveBlack = True
        End If
    End If
Loop
If Engine_bSlaveBlack Then
    MessageBeep vbInformation
    If Options_nLanguage = LANGUAGE_ZH_CN Then
        MsgBoxIcon IIf(Engine_szSlaveName = "", "", "引擎：" & Engine_szSlaveName & vbCrLf) & _
                IIf(szVersion = "", "", "版本：" & szVersion & vbCrLf) & _
                IIf(szCopyright = "", "", "版权：" & szCopyright & vbCrLf) & _
                IIf(szAuthor = "", "", "作者：" & szAuthor & vbCrLf) & _
                IIf(szUser = "", "", "用户：" & szUser), , "关于UCCI引擎", szEngineFile
    Else
        MsgBoxIcon IIf(Engine_szSlaveName = "", "", "引擎：" & Engine_szSlaveName & vbCrLf) & _
                IIf(szVersion = "", "", "版本：" & szVersion & vbCrLf) & _
                IIf(szCopyright = "", "", "版權：" & szCopyright & vbCrLf) & _
                IIf(szAuthor = "", "", "作者：" & szAuthor & vbCrLf) & _
                IIf(szUser = "", "", "用戶：" & szUser), , "關於UCCI引擎", szEngineFile
    End If
    If Engine_nTimeRatioSlave = 1000 Then
        SendEngine "setoption usemillisec true", SLAVE_ENGINE
    End If
    SetEngine SLAVE_ENGINE
Else
    SendEngine "quit", SLAVE_ENGINE
    PipeClose Engine_pipeSlave
    MsgBox szEngineFile & L(" 不是中国象棋引擎文件！", " 不是中國象棋引擎文件！"), vbExclamation
End If

End Sub

' 启动时钟
Public Sub StartTimer()

Timer_bOver(0) = False
Timer_bOver(1) = False
Timer_nTimeLeft(0) = Timer_nInitTime * 60
Timer_nTimeLeft(1) = Timer_nInitTime * 60
Timer_nMoveLeft(0) = Timer_nIncMove
Timer_nMoveLeft(1) = Timer_nIncMove
SetTimer 0
SetTimer 1
If Timer_nDepth = 0 And (Engine_bRed Or Engine_bBlack) Then
    Timer_dfLastTime = Timer
    Timer_bEnabled = True
    App_frmMain.mnEngineLevel.Checked = True
    App_frmMain.tlb.Buttons("EngineLevel").Value = tbrPressed
Else
    Timer_bEnabled = False
    App_frmMain.mnEngineLevel.Checked = False
    App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
End If

End Sub

' 新局时选择引擎走哪方
Public Sub EngineNewGame(Optional ByVal nEnginePlay As Integer = -1)

If Engine_nStatus = IDLE_UNLOAD Then
    Exit Sub
End If
Select Case IIf(nEnginePlay < 0, Options_nEnginePlay, nEnginePlay)
Case ENGINE_PLAY_NONE
    Engine_bRed = False
    Engine_bBlack = False
Case ENGINE_PLAY_RED
    Engine_bRed = True
    Engine_bBlack = False
Case ENGINE_PLAY_BLACK
    Engine_bRed = False
    Engine_bBlack = True
Case ENGINE_PLAY_TURN
    If App_bRedTurn Then
        Engine_bRed = True
        Engine_bBlack = False
    Else
        Engine_bRed = False
        Engine_bBlack = True
    End If
    App_bRedTurn = Not App_bRedTurn
Case ENGINE_PLAY_RANDOM
    If Rnd < 0.5 Then
        Engine_bRed = True
        Engine_bBlack = False
    Else
        Engine_bRed = False
        Engine_bBlack = True
    End If
End Select
App_frmMain.mnEngineRed.Checked = Engine_bRed
App_frmMain.tlb.Buttons("EngineRed").Value = IIf(Engine_bRed, tbrPressed, tbrUnpressed)
App_frmMain.mnEngineBlack.Checked = Engine_bBlack
App_frmMain.tlb.Buttons("EngineBlack").Value = IIf(Engine_bBlack, tbrPressed, tbrUnpressed)
If Engine_bRed Or Engine_bBlack Then
    EnginePlayer
End If

End Sub

' 以上是引擎控制例程

' 以下是图片和声音的处理例程

' 设置隐藏棋盘(小)
Public Sub BoardSettingSmallHide(ByVal nBoardIndex As Integer)

On Error Resume Next
frmHide.imgBoardSmall.Picture = LoadPicture(App_szPath & "IMAGES_S\" & _
        Choose(nBoardIndex + 1, "WOOD", "GREEN", "WHITE", "SHEET", "CANVAS", "DROPS", _
        "CLOUDS", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL", "QIANHONG") & ".GIF")
On Error GoTo 0

End Sub

' 设置棋盘(小)
Public Sub BoardSettingSmall(ByVal nBoardIndex As Integer)

Dim i As Integer
BoardSettingSmallHide nBoardIndex
frmMainSmall.imgBoard.Picture = frmHide.imgBoardSmall.Picture
For i = 0 To BOARD_S_MAX - 1
    frmMainSmall.mnOptionsBoard(i).Checked = (nBoardIndex = i)
Next
Options_nBoardS = nBoardIndex

End Sub

' 设置隐藏棋盘(大)
Public Sub BoardSettingLargeHide(ByVal nBoardIndex As Integer)

On Error Resume Next
frmHide.imgBoardLarge.Picture = LoadPicture(App_szPath & "IMAGES_L\" & _
        Choose(nBoardIndex + 1, "WOOD", "GREEN", "WHITE", "SHEET", "CANVAS", "DROPS", "QIANHONG") & ".GIF")
On Error GoTo 0

End Sub

' 设置棋盘(大)
Public Sub BoardSettingLarge(ByVal nBoardIndex As Integer)

Dim i As Integer
BoardSettingLargeHide nBoardIndex
frmMainLarge.imgBoard.Picture = frmHide.imgBoardLarge
For i = 0 To BOARD_L_MAX - 1
    frmMainLarge.mnOptionsBoard(i).Checked = (nBoardIndex = i)
Next
Options_nBoardL = nBoardIndex

End Sub

' 设置隐藏棋子(小)
Public Sub PiecesSettingSmallHide(ByVal nPiecesIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath & "IMAGES_S\" & Choose(nPiecesIndex + 1, "WOOD", "DELICATE", "POLISH", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL") & "\"
On Error Resume Next
For i = 0 To 31
    frmHide.imgPiecesSmall(i).Picture = LoadPicture(sz & PieceFileName(i) & ".GIF")
Next
On Error GoTo 0

End Sub

' 设置棋子(小)
Public Sub PiecesSettingSmall(ByVal nPiecesIndex As Integer)

Dim i As Integer
PiecesSettingSmallHide nPiecesIndex
For i = 0 To 31
    Set App_picPieces(i) = frmHide.imgPiecesSmall(i).Picture
Next
For i = 0 To PIECES_S_MAX - 1
    frmMainSmall.mnOptionsPieces(i).Checked = (nPiecesIndex = i)
Next
BoardFlush
LabelFlush
Options_nPiecesS = nPiecesIndex

End Sub

' 设置隐藏棋子(大)
Public Sub PiecesSettingLargeHide(ByVal nPiecesIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath & "IMAGES_L\" & Choose(nPiecesIndex + 1, "WOOD", "DELICATE", "POLISH") & "\"
On Error Resume Next
For i = 0 To 31
    frmHide.imgPiecesLarge(i).Picture = LoadPicture(sz & PieceFileName(i) & ".GIF")
Next
On Error GoTo 0

End Sub

' 设置棋子(大)
Public Sub PiecesSettingLarge(ByVal nPiecesIndex As Integer)

Dim i As Integer
PiecesSettingLargeHide nPiecesIndex
For i = 0 To 31
    Set App_picPieces(i) = frmHide.imgPiecesLarge(i).Picture
Next
For i = 0 To PIECES_L_MAX - 1
    frmMainLarge.mnOptionsPieces(i).Checked = (nPiecesIndex = i)
Next
BoardFlush
LabelFlush
Options_nPiecesL = nPiecesIndex

End Sub

' 设置音乐
Public Sub MusicSetting(ByVal nMusicIndex As Integer)

Dim i As Integer
frmHide2.mci.Command = "Close"
If nMusicIndex < MUSIC_NONE Then
    frmHide2.mci.FileName = App_szPath & "MUSICS\" & _
            Choose(nMusicIndex + 1, "EXPRESS", "FUNNY", "CLASSIC", "MOZART1", "MOZART4", _
            "FURELISE", "LOVDREAM", "WALTZ", "HUMOUR", "MARIO1", "MARIO2", "PAL", "CMUSIC") & ".MID"
    If Not App_bPrevInstance Then
        frmHide2.mci.Command = "Open"
        frmHide2.mci.Command = "Play"
    End If
End If
For i = 0 To MUSIC_MAX - 1
    App_frmMain.mnOptionsMusic(i).Checked = (nMusicIndex = i)
Next
Options_nMusic = nMusicIndex

End Sub

' 生成图片棋盘
Public Sub WizardBitmap()

Dim nBoard As Integer, nPieces As Integer, szFen As String, szUrl As String
Select Case Publish_nSize
Case PUB_SIZE_MINI, PUB_SIZE_PRINT
    nBoard = 0
    nPieces = IIf(Publish_bTrad, 1, 0)
Case PUB_SIZE_SMALL
    nBoard = Publish_nBoardS
    nPieces = Publish_nPiecesS
Case PUB_SIZE_LARGE
    nBoard = Publish_nBoardL
    nPieces = Publish_nPiecesL
End Select
szFen = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev)))
szUrl = "http://www.xqbase.com/pub/board.php?fen=" & UrlEncode(szFen) & _
        "&size=" & Publish_nSize & "&board=" & nBoard & "&pieces=" & nPieces
ShellExecuteA 0, vbNullString, szUrl, vbNullString, vbNullString, vbNormalFocus
MsgBox L("对页面上的图片棋盘按右键，就可保存或复制了。", "對頁面上的圖片棋盤按右鍵，就可保存或複制了。") & vbCrLf & vbCrLf & _
        L("如需更改棋盘棋子样式，请在“发布棋谱”功能中设置。", "如需更改棋盤棋子樣式，請在“發布棋譜”功能中設置。"), vbInformation

End Sub

' 以上是图片和声音的处理例程

' 以下是参数设置例程

' 加载“日积月累”
Public Sub LoadTips()

If Options_nLanguage = LANGUAGE_ZH_CN Then

Gui_szTips(1) = "　　象棋巫师是一款功能超强的象棋教学、电脑对弈和棋谱编辑软件，具有方便的人机对战、棋谱记录、欣赏、发布、管理棋局的功能，还内置大量象棋习题，完全可以满足各层次象棋爱好者、棋手、裁判员及象棋文字工作者的各种需要。"
Gui_szTips(2) = "　　象棋巫师支持多个通用象棋引擎，他们大都具有专业棋手的水平，是象棋爱好者和专业棋手提高棋艺的良师益友。" & vbCrLf & _
        "　　如果您对象棋巫师自带的引擎 ElephantEye 的表现不满意，可以登录 http://www.xqbase.com/league.htm ，下载到其他各具特色的引擎。"
Gui_szTips(3) = "　　点击“新的棋局”按钮，就可以展开人机对弈，象棋巫师提供了八种的难度和四种的让子模式给用户体验。"
Gui_szTips(4) = "　　如果您不希望让电脑走棋，而仅仅是想知道电脑在想些什么，或者让电脑给你一些启发，可以点击“电脑分析”按钮，打开思考细节窗口。" & vbCrLf & _
        "　　您可以把思考细节窗口中的思考路线复制下来，粘贴到主窗口中，对思考线路进行推演。"
Gui_szTips(5) = "　　点击“发布棋谱”按钮，就可以在网上和棋友交流棋谱，或者向高手求助。" & vbCrLf & _
        "　　象棋巫师推荐了几个著名的象棋论坛，并给用户提供快捷的发帖引导，很方便地让用户在这些象棋论坛上发布棋谱或发起求助。"
Gui_szTips(6) = "　　象棋巫师目前主要通过网络发行，最新的版本可以从象棋百科全书网获得：" & vbCrLf & "　　http://www.xqbase.com/"
Gui_szTips(7) = "　　目前网络上已经有数以万计通用格式的棋谱文件(后缀.PGN)可供下载。您可以到以下页面下载近20年内全国顶级象棋比赛的棋谱：http://www.xqbase.com/xqbase/" & vbCrLf & _
        "　　同时也欢迎您将自己制作的文件上传给我们。"
Gui_szTips(8) = "　　如果您对象棋巫师有什么意见或建议，可以跟象棋巫师开发团队联系，邮件地址是：" & vbCrLf & "　　webmaster@xqbase.com" & vbCrLf & _
        "　　象棋巫师开发团队非常希望和大家保持联系。"
Gui_szTips(9) = "　　您可以双击桌面上的象棋巫师图标(由棋子“象”、棋盘和巫师棒组成)直接启动象棋巫师。"
Gui_szTips(10) = "　　如果您是一个象棋巫师的初学者，请您仔细阅读本软件“帮助”选单中的“帮助主题”并多加练习，祝您早日精通象棋巫师的各种功能。"
Gui_szTips(11) = "　　象棋巫师支持文件关联功能，双击PGN文件(图标是棋子“象”)可以打开棋谱，双击FEN文件(图标是棋盘)可以打开局面。"
Gui_szTips(12) = "　　象棋巫师支持“象棋演播室”的棋谱。只要双击XQF文件(图标是隶书“象”字)，或者点击“打开”按钮并选择一个XQF文件，象棋巫师就会打开这个棋谱。"
Gui_szTips(13) = "　　象棋巫师最适合800x600和1024x768的显示分辩率，把“选项”菜单的“界面”一项设成“大”，就可在1024x768的显示分辩率下得到最舒适的显示效果，反之亦然。"
Gui_szTips(14) = "　　点击“查看文本棋谱”按钮，就可以看到棋谱文本，为粘贴到BBS上或者Word文档中提供了方便。"
Gui_szTips(15) = "　　象棋巫师可读入弈天、QQ、联众、中游等象棋存盘文件和大部分的文本棋谱文件，把这些含有着法的文本复制到剪贴板，点击“从剪贴板导入”按钮，这些着法就会录制到象棋巫师中。"
Gui_szTips(16) = "　　象棋巫师提供的棋谱键盘输入法为喜欢键盘录入棋谱的棋友提供了一种高效的棋谱输入方法，棋友可根据自己的习惯在数字小键盘或WXF字母格式中任意选择。"
Gui_szTips(17) = "　　在欣赏棋谱的过程中，点击“播放”按钮就可从该步自动演示，演示的时间间隔可以自由调整。再次点击“播放棋局”按钮可停止自动演示。"
Gui_szTips(18) = "　　在欣赏棋谱的过程中，可以使用棋盘倒置和左右调换功能来从不同的角度欣赏棋局。其中左右调换功能还可以一次将类似于“炮八平五”开局这样的棋谱自动转换成大家习惯的“炮二平五”。反之亦然。"
Gui_szTips(19) = "　　如果在欣赏棋谱时遇到复杂的局面，可以点击“分析局面”按钮，将当前棋局新开设一个象棋巫师的窗口，自由推演后续的变化。"
Gui_szTips(20) = "　　在两个象棋巫师窗口中，灵活运用“查看文本棋谱”和“从剪贴板导入”功能，可将推演棋盘中的棋谱记录导入到当前棋局中。"
Gui_szTips(21) = "　　象棋巫师是个自由软件，如果您觉得好用，可以自由地将本软件上载到任一个共享软件下载站点。" & vbCrLf & _
        "　　象棋巫师的源程序发布在 http://sourceforge.net/projects/xqwizard/ 这个页面上，您可以根据自己的需要对源程序进行修改，并依照GPL协议发布您修改过的源程序。"
Gui_szTips(22) = "　　象棋巫师在开发过程中得到了广大棋迷朋友的热情支持，作者在此表示衷心的感谢，同时也希望您继续支持象棋巫师，关注 http://www.xqbase.com/ 。" & vbCrLf & _
        "　　您也可以将本软件的主页链接到自己的站点上。请您使用 http://www.xqbase.com/ 作为链接的路径。"

Else

Gui_szTips(1) = "　　象棋巫師是一款功能超強的象棋教學、電腦對弈和棋譜編輯軟件，具有方便的人機對戰、棋譜記錄、欣賞、發布、管理棋局的功能，還內置大量象棋習題，完全可以滿足各層次象棋愛好者、棋手、裁判員及象棋文字工作者的各種需要。"
Gui_szTips(2) = "　　象棋巫師支持多個通用象棋引擎，他們大都具有專業棋手的水平，是象棋愛好者和專業棋手提高棋藝的良師益友。" & vbCrLf & _
        "　　如果您對象棋巫師自帶的引擎 ElephantEye 的表現不滿意，可以登錄 http://www.xqbase.com/league.htm ，下載到其他各具特色的引擎。"
Gui_szTips(3) = "　　點擊“新的棋局”按鈕，就可以展開人機對弈，象棋巫師提供了八種的難度和四種的讓子模式給用戶體驗。"
Gui_szTips(4) = "　　如果您不希望讓電腦走棋，而僅僅是想知道電腦在想些什么，或者讓電腦給你一些啟發，可以點擊“電腦分析”按鈕，打開思考細節窗口。" & vbCrLf & _
        "　　您可以把思考細節窗口中的思考路線複製下來，粘貼到主窗口中，對思考線路進行推演。"
Gui_szTips(5) = "　　點擊“發布棋譜”按鈕，就可以在網上和棋友交流棋譜，或者向高手求助。" & vbCrLf & _
        "　　象棋巫師推薦了幾個著名的象棋論壇，並給用戶提供快捷的發帖引導，很方便地讓用戶在這些象棋論壇上發布棋譜或發起求助。"
Gui_szTips(6) = "　　象棋巫師目前主要通過網絡發行，最新的版本可以從象棋百科全書網獲得：" & vbCrLf & "　　http://www.xqbase.com/"
Gui_szTips(7) = "　　目前網絡上已經有數以万計通用格式的棋譜文件(後綴.PGN)可供下載。您可以到以下頁面下載近20年內全國頂級象棋比賽的棋譜：http://www.xqbase.com/xqbase/" & vbCrLf & _
        "　　同時也歡迎您將自己製作的文件上傳給我們。"
Gui_szTips(8) = "　　如果您對象棋巫師有什么意見或建議，可以跟象棋巫師開發團隊聯系，郵件地址是：" & vbCrLf & "　　webmaster@xqbase.com" & vbCrLf & _
        "　　象棋巫師開發團隊非常希望和大家保持聯系。"
Gui_szTips(9) = "　　您可以雙擊桌面上的象棋巫師圖標(由棋子“象”、棋盤和巫師棒組成)直接啟動象棋巫師。"
Gui_szTips(10) = "　　如果您是一個象棋巫師的初學者，請您仔細閱讀本軟件“幫助”選單中的“幫助主題”并多加練習，祝您早日精通象棋巫師的各种功能。"
Gui_szTips(11) = "　　象棋巫師支持文件關聯功能，雙擊PGN文件(圖標是棋子“象”)可以打開棋譜，雙擊FEN文件(圖標是棋盤)可以打開局面。"
Gui_szTips(12) = "　　象棋巫師支持“象棋演播室”的棋譜。只要雙擊XQF文件(圖標是隸書“象”字)，或者點擊“打開”按鈕并選擇一個XQF文件，象棋巫師就會打開這個棋譜。"
Gui_szTips(13) = "　　象棋巫師最適合800x600和1024x768的顯示分辯率，把“選項”菜單的“界面”一項設成“大”，就可在1024x768的顯示分辯率下得到最舒適的顯示效果，反之亦然。"
Gui_szTips(14) = "　　點擊“查看文本棋譜”按鈕，就可以看到棋譜文本，為粘貼到BBS上或者Word文檔中提供了方便。"
Gui_szTips(15) = "　　象棋巫師可讀入弈天、QQ、聯眾、中游等象棋存盤文件和大部分的文本棋譜文件，把這些含有著法的文本複製到剪貼板，點擊“從剪貼板導入”按鈕，這些著法就會錄製到象棋巫師中。"
Gui_szTips(16) = "　　象棋巫師提供的棋譜鍵盤輸入法為喜歡鍵盤錄入棋譜的棋友提供了一种高效的棋譜輸入方法，棋友可根据自己的習慣在數字小鍵盤或WXF字母格式中任意選擇。"
Gui_szTips(17) = "　　在欣賞棋譜的過程中，點擊“播放”按鈕就可從該步自動演示，演示的時間間隔可以自由調整。再次點擊“播放棋局”按鈕可停止自動演示。"
Gui_szTips(18) = "　　在欣賞棋譜的過程中，可以使用棋盤倒置和左右調換功能來從不同的角度欣賞棋局。其中左右調換功能還可以一次將類似於“炮八平五”開局這樣的棋譜自動轉換成大家習慣的“炮二平五”。反之亦然。"
Gui_szTips(19) = "　　如果在欣賞棋譜時遇到複雜的局面，可以點擊“分析局面”按鈕，將當前棋局新開設一個象棋巫師的窗口，自由推演後續的變化。"
Gui_szTips(20) = "　　在兩個象棋巫師窗口中，靈活運用“查看文本棋譜”和“從剪貼板導入”功能，可將推演棋盤中的棋譜記錄導入到當前棋局中。"
Gui_szTips(21) = "　　象棋巫師是個自由軟件，如果您覺得好用，可以自由地將本軟件上載到任一個共享軟件下載站點。" & vbCrLf & _
        "　　象棋巫師的源程序發布在 http://sourceforge.net/projects/xqwizard/ 這個頁面上，您可以根据自己的需要對源程序進行修改，并依照GPL協議發布您修改過的源程序。"
Gui_szTips(22) = "　　象棋巫師在開發過程中得到了廣大棋迷朋友的熱情支持，作者在此表示衷心的感謝，同時也希望您繼續支持象棋巫師，關注 http://www.xqbase.com/ 。" & vbCrLf & _
        "　　您也可以將本軟件的主頁鏈接到自己的站點上。請您使用 http://www.xqbase.com/ 作為鏈接的路徑。"

End If

End Sub

' 加载残局
Public Sub LoadEndgames(ByVal szEpdName As String, ByVal szTitle As String)

Dim nFileNo As Integer, i As Integer, sz As String, szs() As String
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath & "ENDGAMES\" & szEpdName & ".EPD" For Input As #nFileNo
On Error GoTo 0
App_nEndgames = 0
Do While App_nEndgames < MAX_ENDGAMES And Not EOF(nFileNo)
    Line Input #nFileNo, sz
    i = InStr(sz, "; ")
    If i > 0 Then
        App_szEndgames(App_nEndgames) = RTrim(Left(sz, i - 1))
        szs = Split(LTrim(Mid(sz, i + 1)), "|")
        If UBound(szs) < Options_nLanguage Then
            frmEndgames.lstGames.AddItem szs(0)
        Else
            frmEndgames.lstGames.AddItem szs(Options_nLanguage)
        End If
        App_nEndgames = App_nEndgames + 1
    End If
Loop
Close #nFileNo
If App_nEndgames = 0 Then
    ErrorOpen App_szPath & "ENDGAMES\" & szEpdName & ".EPD"
    ' Unload frmEndgames ' App_nEndgames = 0 说明 frmEndgames 未被加载过
Else
    If Gui_nEndgamesIndex >= App_nEndgames Then
        Gui_nEndgamesIndex = App_nEndgames - 1
    End If
    frmEndgames.lstGames.ListIndex = Gui_nEndgamesIndex
    frmEndgames.Caption = szTitle
    frmEndgames.Show vbModal, App_frmMain
    Gui_szEpdName = szEpdName
    Gui_szEpdTitle = szTitle
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0
ErrorOpen App_szPath & "ENDGAMES\" & szEpdName & ".EPD"

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

Options_bAutoPlay = (Str2Int(GetSetting("XQWizard", "Options", "AutoPlay", "0")) <> 0)
Options_nPlayIntv = Str2Int(GetSetting("XQWizard", "Options", "PlayIntv", "1"), 1, 10)
Options_nMoveDelay = Str2Int(GetSetting("XQWizard", "Options", "MoveDelay", "1"), 0, 5)
Options_bAutoFlip = (Str2Int(GetSetting("XQWizard", "Options", "AutoFlip", "1")) <> 0)
Options_bEngineName = (Str2Int(GetSetting("XQWizard", "Options", "EngineName", "1")) <> 0)
Options_bAlwaysPonder = (Str2Int(GetSetting("XQWizard", "Options", "AlwaysPonder", "0")) <> 0)
Options_bAllowResign = (Str2Int(GetSetting("XQWizard", "Options", "AllowResign", "1")) <> 0)
Options_bEngineTime = (Str2Int(GetSetting("XQWizard", "Options", "EngineTime", "0")) <> 0)
Options_bStatusBar = (Str2Int(GetSetting("XQWizard", "Options", "StatusBar", "1")) <> 0)
Options_nEnginePlay = Str2Int(GetSetting("XQWizard", "Options", "EnginePlay", "3"), 0, ENGINE_PLAY_MAX - 1)
Options_nMusic = Str2Int(GetSetting("XQWizard", "Options", "Music", "8"), 0, MUSIC_MAX - 1)
Options_bTopMost = (Str2Int(GetSetting("XQWizard", "Options", "TopMost", "0")) <> 0)
Options_bPromptSave = (Str2Int(GetSetting("XQWizard", "Options", "PromptSave", "1")) <> 0)
Options_bAutoSave = (Str2Int(GetSetting("XQWizard", "Options", "AutoSave", "0")) <> 0)
Options_szUser = GetSetting("XQWizard", "Options", "User", L("象棋巫师测试团队", "象棋巫師測試團隊"))
Options_bShowNew = (Str2Int(GetSetting("XQWizard", "Options", "ShowNew", "1")) <> 0)
Options_bTryAgain = (Str2Int(GetSetting("XQWizard", "Options", "TryAgain", "1")) <> 0)
Gui_nLeft = Str2Int(GetSetting("XQWizard", "Gui", "Left", "480"), 0, Int(Screen.Width * 0.75))
Gui_nTop = Str2Int(GetSetting("XQWizard", "Gui", "Top", "480"), 0, Int(Screen.Height * 0.75))
Gui_nThinkWidth = Str2Int(GetSetting("XQWizard", "Gui", "ThinkWidth", "4800"), 2400)
Gui_nThinkHeight = Str2Int(GetSetting("XQWizard", "Gui", "ThinkHeight", "2400"), 1200)
Gui_nThinkLeft = Str2Int(GetSetting("XQWizard", "Gui", "ThinkLeft", "8100"))
Gui_nThinkTop = Str2Int(GetSetting("XQWizard", "Gui", "ThinkTop", "6300"))
Gui_nEndgamesIndex = Str2Int(GetSetting("XQWizard", "Gui", "EndgamesIndex", "0"), 0, MAX_ENDGAMES - 1)
Gui_szEpdName = GetSetting("XQWizard", "Gui", "EpdName", "FUNNY")
Gui_szEpdTitle = GetSetting("XQWizard", "Gui", "EpdTitle", L("趣味象棋", "趣味象棋"))
Gui_nEpdMenu = Str2Int(GetSetting("XQWizard", "Gui", "EpdMenu", "0"), 0, MAX_EPD_MENU - 1)
Gui_bShowHowTo = (Str2Int(GetSetting("XQWizard", "Gui", IIf(App_bPromotion, "ShowHowTo2", "ShowHowTo"), "1")) <> 0)
Gui_nTipIndex = Str2Int(GetSetting("XQWizard", "Gui", "TipIndex", "1"), 1, TIP_NUM)
Publish_nSize = Str2Int(GetSetting("XQWizard", "Publish", "Size", "0"), 0, PUB_SIZE_MAX - 1)
Publish_bTrad = (Str2Int(GetSetting("XQWizard", "Publish", "Trad", "0")) <> 0)
Publish_nBoardS = Str2Int(GetSetting("XQWizard", "Publish", "BoardS", "0"), 0, BOARD_S_MAX - 1)
Publish_nPiecesS = Str2Int(GetSetting("XQWizard", "Publish", "PiecesS", "0"), 0, PIECES_S_MAX - 1)
Publish_nBoardL = Str2Int(GetSetting("XQWizard", "Publish", "BoardL", "0"), 0, BOARD_L_MAX - 1)
Publish_nPiecesL = Str2Int(GetSetting("XQWizard", "Publish", "PiecesL", "0"), 0, PIECES_L_MAX - 1)
Publish_bContent = (Str2Int(GetSetting("XQWizard", "Publish", "Content", "0")) <> 0)
Publish_nLocation = Str2Int(GetSetting("XQWizard", "Publish", "Location", "0"), 0, PUB_LOCATION_MAX - 1)
Publish_nFormat = Str2Int(GetSetting("XQWizard", "Publish", "Format", "0"), 0, PUB_FORMAT_MAX - 1)
Timer_nDepth = Str2Int(GetSetting("XQWizard", "Timer", "Depth", "2"), LEVEL_GRANDMASTER, LEVEL_INFINITE)
Timer_bIncMode = Str2Int(GetSetting("XQWizard", "Timer", "IncMode", "0")) <> 0
Timer_nInitTime = Str2Int(GetSetting("XQWizard", "Timer", "InitTime", "1"), 1, 480)
Timer_nIncMove = Str2Int(GetSetting("XQWizard", "Timer", "IncMove", "999"), 1, 999)
Timer_nIncTime = Str2Int(GetSetting("XQWizard", "Timer", "IncTime", "1"), -60, 600)
Engine_bEngineLog = (Str2Int(GetSetting("XQWizard", "Engine", "EngineLog", "0")) <> 0)
Engine_szLogFile = GetSetting("XQWizard", "Engine", "LogFile", "")
Engine_bUseBook = (Str2Int(GetSetting("XQWizard", "Engine", "UseBook", "1")) <> 0)
Engine_bUseEgtb = (Str2Int(GetSetting("XQWizard", "Engine", "UseEgtb", "1")) <> 0)
Engine_szBookFiles = GetSetting("XQWizard", "Engine", "BookFiles", "")
Engine_szEgtbPaths = GetSetting("XQWizard", "Engine", "EgtbPaths", "")
Engine_nHash = Str2Int(GetSetting("XQWizard", "Engine", "Hash", "0"), 0, 7)
Engine_nThreads = Str2Int(GetSetting("XQWizard", "Engine", "Threads", "0"), 0, 9)
Engine_nRandomness = Str2Int(GetSetting("XQWizard", "Engine", "Randomness", "1"), 0, 3)
Engine_nStyle = Str2Int(GetSetting("XQWizard", "Engine", "Style", "1"), 0, 2)
Engine_szFile = GetSetting("XQWizard", "Engine", "FileName", App_szPath & "ELEEYE.EXE")

End Sub

' 保存参数到注册表
Public Sub SaveRegs2()

SaveSetting "XQWizard", "Options", "AutoPlay", IIf(Options_bAutoPlay, "1", "0")
SaveSetting "XQWizard", "Options", "PlayIntv", Options_nPlayIntv
SaveSetting "XQWizard", "Options", "MoveDelay", Options_nMoveDelay
SaveSetting "XQWizard", "Options", "AutoFlip", IIf(Options_bAutoFlip, "1", "0")
SaveSetting "XQWizard", "Options", "EngineName", IIf(Options_bEngineName, "1", "0")
SaveSetting "XQWizard", "Options", "AlwaysPonder", IIf(Options_bAlwaysPonder, "1", "0")
SaveSetting "XQWizard", "Options", "AllowResign", IIf(Options_bAllowResign, "1", "0")
SaveSetting "XQWizard", "Options", "EngineTime", IIf(Options_bEngineTime, "1", "0")
SaveSetting "XQWizard", "Options", "StatusBar", IIf(Options_bStatusBar, "1", "0")
SaveSetting "XQWizard", "Options", "EnginePlay", Options_nEnginePlay
SaveSetting "XQWizard", "Options", "Music", Options_nMusic
SaveSetting "XQWizard", "Options", "TopMost", IIf(Options_bTopMost, "1", "0")
SaveSetting "XQWizard", "Options", "PromptSave", IIf(Options_bPromptSave, "1", "0")
SaveSetting "XQWizard", "Options", "AutoSave", IIf(Options_bAutoSave, "1", "0")
SaveSetting "XQWizard", "Options", "User", Options_szUser
SaveSetting "XQWizard", "Options", "ShowNew", IIf(Options_bShowNew, "1", "0")
SaveSetting "XQWizard", "Options", "TryAgain", IIf(Options_bTryAgain, "1", "0")
SaveSetting "XQWizard", "Gui", "Left", Gui_nLeft
SaveSetting "XQWizard", "Gui", "Top", Gui_nTop
SaveSetting "XQWizard", "Gui", "ThinkWidth", Gui_nThinkWidth
SaveSetting "XQWizard", "Gui", "ThinkHeight", Gui_nThinkHeight
SaveSetting "XQWizard", "Gui", "ThinkLeft", Gui_nThinkLeft
SaveSetting "XQWizard", "Gui", "ThinkTop", Gui_nThinkTop
SaveSetting "XQWizard", "Gui", "EndgamesIndex", Gui_nEndgamesIndex
SaveSetting "XQWizard", "Gui", "EpdName", Gui_szEpdName
SaveSetting "XQWizard", "Gui", "EpdTitle", Gui_szEpdTitle
SaveSetting "XQWizard", "Gui", "EpdMenu", Gui_nEpdMenu
SaveSetting "XQWizard", "Gui", IIf(App_bPromotion, "ShowHowTo2", "ShowHowTo"), IIf(Gui_bShowHowTo, "1", "0")
SaveSetting "XQWizard", "Gui", "TipIndex", Gui_nTipIndex
SaveSetting "XQWizard", "Publish", "Size", Publish_nSize
SaveSetting "XQWizard", "Publish", "Trad", IIf(Publish_bTrad, "1", "0")
SaveSetting "XQWizard", "Publish", "BoardS", Publish_nBoardS
SaveSetting "XQWizard", "Publish", "PiecesS", Publish_nPiecesS
SaveSetting "XQWizard", "Publish", "BoardL", Publish_nBoardL
SaveSetting "XQWizard", "Publish", "PiecesL", Publish_nPiecesL
SaveSetting "XQWizard", "Publish", "Content", IIf(Publish_bContent, "1", "0")
SaveSetting "XQWizard", "Publish", "Location", Publish_nLocation
SaveSetting "XQWizard", "Publish", "Format", Publish_nFormat
SaveSetting "XQWizard", "Timer", "Depth", Timer_nDepth
SaveSetting "XQWizard", "Timer", "IncMode", IIf(Timer_bIncMode, "1", "0")
SaveSetting "XQWizard", "Timer", "InitTime", Timer_nInitTime
SaveSetting "XQWizard", "Timer", "IncMove", Timer_nIncMove
SaveSetting "XQWizard", "Timer", "IncTime", Timer_nIncTime
SaveSetting "XQWizard", "Engine", "EngineLog", IIf(Engine_bEngineLog, "1", "0")
SaveSetting "XQWizard", "Engine", "LogFile", Engine_szLogFile
SaveSetting "XQWizard", "Engine", "UseBook", IIf(Engine_bUseBook, "1", "0")
SaveSetting "XQWizard", "Engine", "UseEgtb", IIf(Engine_bUseEgtb, "1", "0")
SaveSetting "XQWizard", "Engine", "BookFiles", Engine_szBookFiles
SaveSetting "XQWizard", "Engine", "EgtbPaths", Engine_szEgtbPaths
SaveSetting "XQWizard", "Engine", "Hash", Engine_nHash
SaveSetting "XQWizard", "Engine", "Threads", Engine_nThreads
SaveSetting "XQWizard", "Engine", "Randomness", Engine_nRandomness
SaveSetting "XQWizard", "Engine", "Style", Engine_nStyle
SaveSetting "XQWizard", "Engine", "FileName", Engine_szFile

End Sub

' 以上是参数设置例程

' 以下是语言例程

' 显示软件名称
Public Sub SetTitle()

Dim sz As String
sz = IIf(App_szFileName = "", "", Mid(App_szFileName, InStrRev(App_szFileName, "\") + 1))
If UCase(Right(sz, 4)) = ".PGN" Then
    sz = Left(sz, Len(sz) - 4)
End If
sz = IIf(sz = "", IIf(Engine_szName = "ElephantEye", "", Engine_szName), sz)
App_frmMain.Caption = IIf(sz = "", "", sz & " - ") & _
        IIf(App_bPromotion, L("超级象棋巫师", "超級象棋巫師"), L("象棋巫师", "象棋巫師"))

End Sub

' 主窗口语言
Public Sub SetLang()

Dim i As Integer
If Options_nLanguage = LANGUAGE_ZH_CN Then
    Exit Sub
End If
App.Title = "象棋巫師"
App_frmMain.Font.Charset = 136
App_frmMain.Font.Name = "細明體"
On Error Resume Next
For i = 0 To App_frmMain.Controls.Count - 1
    App_frmMain.Controls(i).Font = App_frmMain.Font
Next
On Error GoTo 0
' 菜单
App_frmMain.mnFile.Caption = "文件(&F)"
App_frmMain.mnFileNew.Caption = "新的對局(&N)..."
App_frmMain.mnFileOpen.Caption = "打開(&O)..."
App_frmMain.mnFileSave.Caption = "保存(&S)"
App_frmMain.mnFileSaveAs.Caption = "另存為(&A)..."
App_frmMain.mnFileExportXqf.Caption = "輸出為&XQF格式..."
App_frmMain.mnFilePgn.Caption = "查看文本棋譜(&V)"
App_frmMain.mnFileTags.Caption = "編輯標簽(&T)..."
App_frmMain.mnFileExit.Caption = "退出(&X)"

App_frmMain.mnMove.Caption = "著法(&M)"
App_frmMain.mnMovePromote.Caption = "升變(&P)"
App_frmMain.mnMoveStart.Caption = "起始局面(&S)"
App_frmMain.mnMoveBack.Caption = "上一著(&B)"
App_frmMain.mnMoveForward.Caption = "下一著(&F)"
App_frmMain.mnMoveEnd.Caption = "最後局面(&E)"
App_frmMain.mnMoveDel.Caption = "刪除(&D)"
App_frmMain.mnMoveImport.Caption = "從文本文件導入(&I)..."
App_frmMain.mnMovePaste.Caption = "從剪貼板導入(&C)"

App_frmMain.mnPos.Caption = "局面(&P)"
App_frmMain.mnPosFlip.Caption = "翻轉棋盤(&F)"
App_frmMain.mnPosMirror.Caption = "左右對稱(&M)"
App_frmMain.mnPosAnalyze.Caption = "在新窗口中推演(&A)"
App_frmMain.mnPosEdit.Caption = "編輯局面(&E)..."
App_frmMain.mnPosCopy.Caption = "复制FEN串(&C)"
App_frmMain.mnPosPaste.Caption = "粘貼FEN串(&P)"
App_frmMain.mnPosLoad.Caption = "從FEN文件導入(&L)..."
App_frmMain.mnPosStore.Caption = "導出到FEN文件(&S)..."

App_frmMain.mnWizard.Caption = "魔法(&W)"
App_frmMain.mnWizardPlay.Caption = "播放(&P)"
App_frmMain.mnWizardHandicap_.Caption = "讓子(&H)"
App_frmMain.mnWizardHandicap(0).Caption = "被讓單馬(&A)"
App_frmMain.mnWizardHandicap(1).Caption = "被讓雙馬(&B)"
App_frmMain.mnWizardHandicap(2).Caption = "被讓九子(&C)"
App_frmMain.mnWizardHandicap(4).Caption = "讓單馬(&D)"
App_frmMain.mnWizardHandicap(5).Caption = "讓單馬(&D)"
App_frmMain.mnWizardHandicap(6).Caption = "讓九子(&F)"
App_frmMain.mnSearchOpening.Caption = "搜索開局(&O)"
App_frmMain.mnSearchPosition.Caption = "搜索局面(&F)"
App_frmMain.mnSearchEndgame.Caption = "搜索殘局(&E)"
App_frmMain.mnWizardPublish.Caption = "發布棋譜(&U)..."
App_frmMain.mnWizardBitmap.Caption = "生成圖片棋盤(&B)"

App_frmMain.mnEndgames_.Caption = "挑戰(&C)"
App_frmMain.mnEndgamesStart.Caption = "當前題庫(&S)"
App_frmMain.mnEndgames(0).Caption = "基本殺法(&A)"
App_frmMain.mnEndgames(1).Caption = "基本戰術(&B)"
App_frmMain.mnEndgames(2).Caption = "中局殺法(&C)"
App_frmMain.mnEndgames(3).Caption = "象棋殺著大全(&D)"
App_frmMain.mnEndgames(4).Caption = "殘局攻殺譜(&E)"
App_frmMain.mnEndgames(5).Caption = "象棋實用殘局(第一集)(&F)"
App_frmMain.mnEndgames(6).Caption = "象棋實用殘局(第二集)(&G)"
App_frmMain.mnEndgames(8).Caption = "橘中秘(殘局篇)(&H)"
App_frmMain.mnEndgames(9).Caption = "适情雅趣(&I)"
App_frmMain.mnEndgames(10).Caption = "爛柯神机(&J)"
App_frmMain.mnEndgames(11).Caption = "象局匯存(&K)"
App_frmMain.mnEndgames(12).Caption = "江湖百局秘譜(&L)"
App_frmMain.mnEndgamesHelp.Caption = "求助(&P)"
App_frmMain.mnEndgamesPublish(0).Caption = "百度知道(&Z)"
App_frmMain.mnEndgamesPublish(1).Caption = "百度貼吧象棋吧(&T)"
App_frmMain.mnEndgamesPublish(2).Caption = "其他網站(&O)"
App_frmMain.mnEndgamesShare(0).Caption = "&QQ空間"
App_frmMain.mnEndgamesShare(1).Caption = "新浪微博(&S)"
App_frmMain.mnEndgamesShare(2).Caption = "開心網(&K)"
App_frmMain.mnEndgamesShare(3).Caption = "人人網(&R)"

App_frmMain.mnEngine.Caption = "電腦(&E)"
App_frmMain.mnEngineLevel.Caption = "級別設置(&L)..."
App_frmMain.mnEngineLoad.Caption = "加載引擎(&E)..."
App_frmMain.mnEngineSet.Caption = "設置參數(&S)..."
App_frmMain.mnEngineRed.Caption = "電腦執紅(&R)"
App_frmMain.mnEngineBlack.Caption = "電腦執黑(&B)"
App_frmMain.mnEnginePonder.Caption = "後台思考(&P)"
App_frmMain.mnEngineAnalyze.Caption = "電腦分析(&A)"
App_frmMain.mnEngineRetract.Caption = "悔棋(&T)"
App_frmMain.mnEngineBan.Caption = "設為禁著(&N)"
App_frmMain.mnEngineDraw.Caption = "提和/接受提和(&D)"
App_frmMain.mnEngineResign.Caption = "認輸(&G)"
App_frmMain.mnEngineStop.Caption = "停止思考/立即走棋(&O)"

App_frmMain.mnOptions.Caption = "選項(&O)"
App_frmMain.mnOptionsSettings.Caption = "設置(&O)..."
App_frmMain.mnOptionsGui.Caption = "界面(&G)"
App_frmMain.mnOptionsGuiSmall.Caption = "小(&S)"
App_frmMain.mnOptionsGuiLarge.Caption = "大(&L)"
App_frmMain.mnOptionsBoard_.Caption = "棋盤(&B)"
App_frmMain.mnOptionsPieces_.Caption = "棋子(&P)"
App_frmMain.mnOptionsSounds.Caption = "音效(&S)"
App_frmMain.mnOptionsMusic_.Caption = "音樂(&M)"
App_frmMain.mnOptionsMusic(0).Caption = "緊張(&A)"
App_frmMain.mnOptionsMusic(1).Caption = "風趣(&B)"
App_frmMain.mnOptionsMusic(2).Caption = "巴赫(&C)"
App_frmMain.mnOptionsMusic(3).Caption = "莫扎特一(&D)"
App_frmMain.mnOptionsMusic(4).Caption = "莫扎特四(&E)"
App_frmMain.mnOptionsMusic(5).Caption = "貝多芬(&F)"
App_frmMain.mnOptionsMusic(6).Caption = "李斯特(&G)"
App_frmMain.mnOptionsMusic(7).Caption = "柴可夫斯基(&H)"
App_frmMain.mnOptionsMusic(8).Caption = "德沃夏克(&I)"
App_frmMain.mnOptionsMusic(9).Caption = "馬里奧一(&J)"
App_frmMain.mnOptionsMusic(10).Caption = "馬里奧二(&K)"
App_frmMain.mnOptionsMusic(11).Caption = "仙劍奇俠傳(&L)"
App_frmMain.mnOptionsMusic(12).Caption = "望江南(&M)"
App_frmMain.mnOptionsMusic(13).Caption = "無聲(&N)"
App_frmMain.mnOptionsTopMost.Caption = "總在最前面(&T)"
App_frmMain.mnOptionsLanguage_.Caption = "語言/&Language"
App_frmMain.mnOptionsLanguage(0).Caption = "簡體中文/&Simplified Chinese"
App_frmMain.mnOptionsLanguage(1).Caption = "繁體中文/&Traditional Chinese"

App_frmMain.mnTools.Caption = "工具(&T)"
App_frmMain.mnToolSchool.Caption = "象棋巫師魔法學校(&T)"
App_frmMain.mnToolPgns2Jar.Caption = "制作手机棋譜(&J)"
App_frmMain.mnToolConvert.Caption = "批量轉換棋譜(&C)"
App_frmMain.mnToolBook.Caption = "管理開局庫(&B)"

App_frmMain.mnHelp.Caption = "幫助(&H)"
App_frmMain.mnHelpContents.Caption = "幫助主題(&C)"
App_frmMain.mnHelpHowTo.Caption = "日積月累(&W)..."
App_frmMain.mnHelpQuote.Caption = "名言(&Q)..."
App_frmMain.mnHelpShare_.Caption = "推薦給好友(&F)"
App_frmMain.mnHelpShare(0).Caption = "&QQ空間"
App_frmMain.mnHelpShare(1).Caption = "新浪微博(&S)"
App_frmMain.mnHelpShare(2).Caption = "開心網(&K)"
App_frmMain.mnHelpShare(3).Caption = "人人網(&R)"
App_frmMain.mnHelpShare(5).Caption = "其他網站(&O)"
App_frmMain.mnHelpUpdate.Caption = "檢查最新版本(&P)"
App_frmMain.mnHelpHome.Caption = "象棋百科全書(&H)"
App_frmMain.mnHelpLeague.Caption = "獲取UCCI引擎(&G)"
App_frmMain.mnHelpXQWLight.Caption = "手機象棋(&L)"
App_frmMain.mnHelpBase.Caption = "棋譜倉庫(&B)"
App_frmMain.mnHelpSuggest.Caption = "意見反饋(&S)"
App_frmMain.mnHelpEngine.Caption = "關于&UCCI引擎..."
App_frmMain.mnHelpAbout.Caption = "關于象棋巫師(&A)..."

' 工具栏
App_frmMain.tlb.Buttons("FileNew").ToolTipText = "新的對局"
App_frmMain.tlb.Buttons("FileOpen").ToolTipText = "打開"
App_frmMain.tlb.Buttons("FileSave").ToolTipText = "保存"
App_frmMain.tlb.Buttons("FileViewPgn").ToolTipText = "查看文本棋譜"
App_frmMain.tlb.Buttons("FileEditTags").ToolTipText = "編輯標簽"
App_frmMain.tlb.Buttons("MovePromote").ToolTipText = "升變"
App_frmMain.tlb.Buttons("MoveStart").ToolTipText = "起始局面"
App_frmMain.tlb.Buttons("MoveBack").ToolTipText = "上一著"
App_frmMain.tlb.Buttons("MoveForward").ToolTipText = "下一著"
App_frmMain.tlb.Buttons("MoveEnd").ToolTipText = "最後局面"
App_frmMain.tlb.Buttons("MoveDel").ToolTipText = "刪除"
App_frmMain.tlb.Buttons("MovePaste").ToolTipText = "從剪貼板導入"
App_frmMain.tlb.Buttons("PosFlip").ToolTipText = "翻轉棋盤"
App_frmMain.tlb.Buttons("PosAnalyze").ToolTipText = "在新窗口中推演"
App_frmMain.tlb.Buttons("PosEdit").ToolTipText = "編輯局面"
App_frmMain.tlb.Buttons("WizardPlay").ToolTipText = "播放"
App_frmMain.tlb.Buttons("SearchPosition").ToolTipText = "搜索局面"
App_frmMain.tlb.Buttons("WizardPublish").ToolTipText = "發布棋譜"
App_frmMain.tlb.Buttons("WizardBitmap").ToolTipText = "生成圖片棋盤"
App_frmMain.tlb.Buttons("EndgamesStart").ToolTipText = "挑戰 - 當前題庫"
App_frmMain.tlb.Buttons("EngineLevel").ToolTipText = "設置級別"
App_frmMain.tlb.Buttons("EngineRed").ToolTipText = "電腦執紅"
App_frmMain.tlb.Buttons("EngineBlack").ToolTipText = "電腦執黑"
App_frmMain.tlb.Buttons("EngineAnalyze").ToolTipText = "電腦分析"
App_frmMain.tlb.Buttons("EngineStop").ToolTipText = "停止思考/立即走棋"
' 界面
App_frmMain.strpRight.Tabs(1).Caption = "棋局信息"
App_frmMain.lblTimeLeftUp1.Caption = "時限"
App_frmMain.lblTimeElapsedUp1.Caption = "用時"
App_frmMain.lblTimeLeftDown1.Caption = "時限"
App_frmMain.lblTimeElapsedDown1.Caption = "用時"
App_frmMain.frmMove.Caption = "著法列表"
App_frmMain.lblInput.Caption = "輸入"
App_frmMain.lblInputHelp.Caption = "？"
App_frmMain.lblFormat.Caption = "格式"
App_frmMain.lblComment.Caption = "註釋"
App_frmMain.stb.Panels(1).ToolTipText = "思考著法"
App_frmMain.stb.Panels(2).ToolTipText = "每秒鐘分析的節點數"
App_frmMain.stb.Panels(3).ToolTipText = "思考路線"
App_frmMain.stb.Panels(4).ToolTipText = "提示信息"

End Sub

' 以上是语言例程

' 以下是窗口的移动过程处理

' 主窗口移动时，显示思考窗口要跟着移动
Public Function MainWindowProc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Dim lResult As Long
lResult = CallWindowProcA(App_lpMainPrev, hWnd, uMsg, wParam, lParam)
If uMsg = WM_MOVE And Engine_bAnalyze Then
    SetWindowLongA frmThink.hWnd, GWL_WNDPROC, App_lpThinkPrev
    frmThink.Left = App_frmMain.Left + Gui_nThinkLeft
    frmThink.Top = App_frmMain.Top + Gui_nThinkTop
    SetWindowLongA frmThink.hWnd, GWL_WNDPROC, AddressOf ThinkWindowProc
End If
MainWindowProc = lResult

End Function

' 显示思考窗口移动时，记录该窗口跟主窗口的相对位置
Public Function ThinkWindowProc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Dim lResult As Long
lResult = CallWindowProcA(App_lpThinkPrev, hWnd, uMsg, wParam, lParam)
If uMsg = WM_MOVE Then
    Gui_nThinkLeft = frmThink.Left - App_frmMain.Left
    Gui_nThinkTop = frmThink.Top - App_frmMain.Top
End If
ThinkWindowProc = lResult

End Function

' 以上是窗口的移动过程处理

' 以下是主函数例程

' 空闲事件
Public Sub DoIdleEvents()

Dim dfThisTime As Double, hWnd As Long
' 依次检测以下几个事件
' 时间
If Timer_bEnabled And Not Timer_bOver(Game_sdMax) Then
    dfThisTime = Timer
    dfThisTime = dfThisTime + IIf(dfThisTime < Timer_dfLastTime, 86400#, 0#)
    If dfThisTime > Timer_dfLastTime + 1# Then
        Timer_dfLastTime = Timer
        Timer_nTimeLeft(Game_sdMax) = Timer_nTimeLeft(Game_sdMax) - 1
        Timer_nTimeElapsed(Game_sdMax) = Timer_nTimeElapsed(Game_sdMax) + 1
        If Timer_nTimeElapsed(Game_sdMax) > 28800 Then
            Timer_nTimeElapsed(Game_sdMax) = 28800
        End If
        If Timer_nTimeLeft(Game_sdMax) < 0 Then
            MsgBox IIf(Game_sdMax = 0, L("红方超时作负！", "紅方超時作負！"), _
                    L("黑方超时作负！", "黑方超時作負！")), vbInformation
            Game_nResult = IIf(Game_sdMax = 0, RESULT_BLACKWIN, RESULT_REDWIN)
            Timer_bOver(Game_sdMax) = True
            Timer_nTimeLeft(Game_sdMax) = 0
            App_frmMain.lblResult = ResultString
        End If
        SetTimer
    End If
End If
' 播放棋局
If App_bPlay Then
    dfThisTime = Timer
    dfThisTime = dfThisTime + IIf(dfThisTime < Timer_dfLastTime, 86400#, 0#)
    If dfThisTime > Timer_dfLastTime + Options_nPlayIntv Then
        Timer_dfLastTime = Timer
        MoveForward
        MoveFlush
    End If
End If
' 引擎(是否应该开始思考了)
If Engine_nStatus = IDLE_READY Then
    If IIf(Game_sdMax = 0, Engine_bRed, Engine_bBlack) Then
        If Game_nCurrMove < Game_nMaxMove Then
            Do While Game_nCurrMove < Game_nMaxMove
                MoveForward
            Loop
            MoveFlush
        End If
        Engine_nStatus = BUSY_THINK
        RunEngine
    ElseIf Engine_bAnalyze And Not (Engine_bRed Or Engine_bBlack) Then
        Engine_nStatus = BUSY_ANALYZE
        RunEngine
    End If
End If
' 音乐
If Options_nMusic < MUSIC_NONE And Not App_bPrevInstance Then
    If frmHide2.mci.Length = frmHide2.mci.Position Then
        frmHide2.mci.To = 0
        frmHide2.mci.Command = "Seek"
        frmHide2.mci.Command = "Play"
    End If
End If
' 广告
' 播放广告可以跟引擎和播放棋局同时进行，所以不能用 Timer_dfLastTime，而是用 Gui_dfLastTime
dfThisTime = Timer
dfThisTime = dfThisTime + IIf(dfThisTime < Gui_dfLastTime, 86400#, 0#)
If dfThisTime > Gui_dfLastTime + Gui_nAdvertTimes(Gui_nAdvertIndex) Then
    Gui_dfLastTime = Timer
    Gui_nAdvertIndex = Gui_nAdvertIndex + 1
    If Gui_nAdvertIndex > Gui_nAdvertNum Then
        Gui_nAdvertIndex = 1
    End If
    ' hWnd = GetFocus
    hWnd = 0
    On Error Resume Next
    hWnd = App_frmMain.ActiveControl.hWnd
    On Error GoTo 0
    App_frmMain.web.Visible = False
    App_frmMain.web.Navigate2 App_szPath & "ADVERT\" & Gui_szAdvertFiles(Gui_nAdvertIndex) & ".htm"
    App_frmMain.web.Visible = True
    ' 切换广告时，把浏览器控件隐藏掉，就不会发出“咔嗒”声了，但要恢复焦点
    If hWnd <> 0 Then
        SetFocus hWnd
    End If
End If
' 界面
DoEvents
Sleep 1

End Sub

Public Sub Main()

Dim nLogFileNo As Integer
Dim hWnd As Long, i As Integer, bNewGame As Boolean, sz As String

' 弹出启动画面，初始化
Randomize Timer
App_bPrevInstance = App.PrevInstance
App_szPath = App.Path & IIf(Right(App.Path, 1) = "\", "", "\")
hWnd = TransparentWindow(App.hInstance, frmHide2.imgMickey.Picture.Handle, frmHide2.imgMickeyAlpha.Picture.Handle, _
        frmHide2.imgMickey.Width, frmHide2.imgMickey.Height)
LoadRegs
CchessInit Options_nLanguage
' 判断是否允许升变
If UCase(Left(Command, 2)) = "/P" Or UCase(Left(Command, 2)) = "-P" Then
    CchessPromotion 1
    App_bPromotion = True
    sz = Mid(Command, 4)
Else
    CchessPromotion 0
    App_bPromotion = False
    sz = Command
End If
LoadRegs2
EccoInitOpenVar Options_nLanguage
ConvInit Options_nLanguage
LoadQuotes
LoadTips
If Options_bLargeGui Then
    Set App_frmMain = frmMainLarge
    For i = 0 To 31
        Set App_picPieces(i) = frmHide.imgPiecesLarge(i)
    Next
    Set App_picEngineRed = frmHide2.imgEngineRedLarge.Picture
    Set App_picEngineBlack = frmHide2.imgEngineBlackLarge.Picture
    BoardSettingLarge Options_nBoardL
    PiecesSettingLarge Options_nPiecesL
    ' 初始化 frmHide 中的小棋盘和小棋子，这些图片会被 frmPosEdit 用到
    BoardSettingSmallHide Options_nBoardS
    PiecesSettingSmallHide Options_nPiecesS
Else
    Set App_frmMain = frmMainSmall
    For i = 0 To 31
        Set App_picPieces(i) = frmHide.imgPiecesSmall(i)
    Next
    Set App_picEngineRed = frmHide2.imgEngineRed.Picture
    Set App_picEngineBlack = frmHide2.imgEngineBlack.Picture
    BoardSettingSmall Options_nBoardS
    PiecesSettingSmall Options_nPiecesS
End If
MusicSetting Options_nMusic
Timer_bEnabled = False
' 加载引擎，可能有等待，启动画面保持
Engine_nStatus = IDLE_UNLOAD
If Engine_bEngineLog And Engine_szLogFile <> "" Then
    nLogFileNo = FreeFile
    On Error Resume Next
    Open Engine_szLogFile For Output As #nLogFileNo
    Close #nLogFileNo
    On Error GoTo 0
End If
If GetAppType(Engine_szFile) = IMAGE_SUBSYSTEM_WINDOWS_CUI Then
    OpenEngine
Else
    Engine_szFile = App_szPath & "ELEEYE.EXE"
    Engine_szBookFiles = ""
    If GetAppType(Engine_szFile) = IMAGE_SUBSYSTEM_WINDOWS_CUI Then
        OpenEngine
    Else
        ErrorOpenEngine
    End If
End If

App_bRedTurn = False
bNewGame = False
If sz = "" Then
    App_szFileName = ""
    If Options_bAutoSave Then
        ReadFile AUTO_SAVE
    Else
        NewGame0
        ' 日积月累窗口关闭后，才能显示“开始对局”窗口
        bNewGame = True
    End If
Else
    If UCase(Left(sz, 3)) = "/S " Or UCase(Left(sz, 3)) = "-S " Then
        sz = Mid(sz, 4)
        If Left(sz, 1) = """" And Right(sz, 1) = """" Then
            sz = Mid(sz, 2, Len(sz) - 2)
        End If
        LoadFenStr sz
    ElseIf UCase(Left(sz, 3)) = "/F " Or UCase(Left(sz, 3)) = "-F " Then
        sz = Mid(sz, 4)
        If Left(sz, 1) = """" And Right(sz, 1) = """" Then
            sz = Mid(sz, 2, Len(sz) - 2)
        End If
        LoadFenFile sz
    Else
        App_szFileName = sz
        If Left(App_szFileName, 1) = """" And Right(App_szFileName, 1) = """" Then
            App_szFileName = Mid(App_szFileName, 2, Len(App_szFileName) - 2)
        End If
        ReadFile
    End If
End If
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
' 初始化 frmHide2.web
frmHide2.web.Navigate "about:blank"
' 检查更新，如果用户决定更新，会弹出下载页面，出现在象棋巫师页面之前
If Gui_szUpgradeDate <> Date Then
    CheckUpdate "xqwizard"
End If
' 显示并调整主窗口
If Not App_bPrevInstance Then
    App_frmMain.Left = Gui_nLeft
    App_frmMain.Top = Gui_nTop
End If
' 在显示窗口以前，先把语言设置好
SetLang
App_frmMain.Show
App_frmMain.web.Navigate2 App_szPath & "ADVERT\xqbase.htm"
App_frmMain.txtMove.SetFocus
App_frmMain.tlb.ImageList = frmHide2.imglst
For i = 1 To 30
    App_frmMain.tlb.Buttons(i).Image = i
Next
If Not App_bPromotion Then
    App_frmMain.mnMovePromote.Visible = False
    App_frmMain.mnMoveSep1.Visible = False
    App_frmMain.tlb.Buttons("MovePromote").Visible = False
End If
On Error Resume Next
App_frmMain.mnEndgames(Gui_nEpdMenu).Checked = True
On Error GoTo 0
App_frmMain.mnOptionsGuiSmall.Checked = Not Options_bLargeGui
App_frmMain.mnOptionsGuiLarge.Checked = Options_bLargeGui
App_frmMain.mnOptionsSounds.Checked = Options_bSounds
App_frmMain.mnOptionsTopMost.Checked = Options_bTopMost
App_frmMain.mnOptionsLanguage(Options_nLanguage).Checked = True
DestroyWindow hWnd
If Gui_bShowHowTo Then
    frmHowTo.Show vbModal, App_frmMain
End If
' 日积月累窗口关闭后，才能显示“开始对局”窗口
If bNewGame Then
    NewGame
End If

' 进入用户状态，接收事件
App_bRunning = True
Do While App_bRunning
    ' 始终把接收引擎的事件放在第一位(高优先级)
    If ReceiveEngine Then
        ' 即使接收引擎繁忙，也要即时处理用户事件
        DoEvents
    Else
        ' 引擎空闲，可以处理其他事件
        DoIdleEvents
    End If
Loop
' 退出前下载广告列表
If Gui_szAdvertDate <> Date Then
    DownloadAdvertList "advert_0450.txt"
    LoadAdvertList
    If Gui_nAdvertNum > 0 Then
        Gui_szAdvertDate = Date
    End If
End If
SaveRegs
SaveRegs2
PlaySoundA vbNullString, 0, 0
frmHide2.mci.Command = "Close"
ExitPopup
Unload frmHide
Unload frmHide2

End Sub

' 以上是主函数例程
