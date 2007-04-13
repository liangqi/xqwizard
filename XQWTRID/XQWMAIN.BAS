Attribute VB_Name = "mdlMain"
' XQWMAIN.BAS - Source Code for XiangQi Wizard, Part I
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 3.12, Last Modified: Apr. 2007
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

Option Explicit

' 全局常量——Windows參數常量
Public Const SW_SHOWNORMAL      As Long = 1
Public Const SND_ASYNC          As Long = 1
Public Const SND_NOWAIT         As Long = 8192
Public Const SND_FILENAME       As Long = 131072

Public Declare Sub Sleep Lib "KERNEL32.DLL" (ByVal dwMilliseconds As Long)
Public Declare Sub ShellExecuteA Lib "SHELL32.DLL" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long)
Public Declare Sub PlaySoundA Lib "WINMM.DLL" (ByVal lpszSound As String, ByVal hmod As Long, ByVal fdwSound As Long)

' 全局常量——象棋巫師信息
Public Const STRING_VERSION     As String = "3.12"
Public Const STRING_COPYRIGHT   As String = "(C) 2004-2007 www.elephantbase.net"
Public Const TIP_NUM            As Integer = 29 ' 日積月累條目數
' 全局常量——可選參數
Public Const SHOW_SAVE          As Boolean = True ' FileDialog
Public Const WRITE_TEMP_FILE    As Boolean = True ' WriteFile
Public Const DRAW_SELECTED      As Boolean = True ' Draw...Square
Public Const RESTART_KEEP_LABEL As Boolean = True ' RestartGame
Public Const MOVE_WITH_ECHO     As Boolean = True ' AddMove
Public Const MOVE_BY_ENGINE     As Boolean = True ' AddMove
Public Const VIEW_BMP_MONO      As Boolean = True ' ViewBitmap
Public Const LOAD_WITH_INFO     As Boolean = True ' OpenEngine
Public Const SLAVE_ENGINE       As Boolean = True ' SetEngine / SendEngine / ReceiveEngineLog
' 全局常量——引擎狀態
Public Const IDLE_UNLOAD        As Integer = 0 ' 沒有加載引擎
Public Const IDLE_READY         As Integer = 1 ' 引擎待命(如果輪到電腦走棋，那么引擎立即工作)
Public Const IDLE_REST          As Integer = 2 ' 引擎休息(即使輪到電腦走棋，引擎也不工作，除非狀態改變)
Public Const IDLE_PONDER        As Integer = 3 ' 後台思考結束(等待對手走完一步，再作相應處理)
Public Const BUSY_WAIT          As Integer = 4 ' 等待引擎停止思考
Public Const BUSY_ANALYZE       As Integer = 5 ' 引擎以分析方式思考(引擎不執任何一方，打開“引擎分析”功能)
Public Const BUSY_THINK         As Integer = 6 ' 引擎正常思考
Public Const BUSY_PONDER        As Integer = 7 ' 引擎後台思考
' 全局常量——棋局結果
Public Const RESULT_UNKNOWN     As Integer = 0
Public Const RESULT_REDWIN      As Integer = 1
Public Const RESULT_DRAW        As Integer = 2
Public Const RESULT_BLACKWIN    As Integer = 3
' 全局常量——引擎級別設置
Public Const LEVEL_GRANDMASTER  As Integer = -5
Public Const LEVEL_MASTER       As Integer = -4
Public Const LEVEL_EXPERT       As Integer = -3
Public Const LEVEL_AMATEUR      As Integer = -2
Public Const LEVEL_BEGINNER     As Integer = -1
Public Const LEVEL_TIMER        As Integer = 0
Public Const LEVEL_DEPTH_MIN    As Integer = 1
Public Const LEVEL_DEPTH_MAX    As Integer = 99
Public Const LEVEL_INFINITE     As Integer = 100
' 全局常量——引擎走棋參數
Public Const ENGINE_PLAY_NONE   As Integer = 0
Public Const ENGINE_PLAY_RED    As Integer = 1
Public Const ENGINE_PLAY_BLACK  As Integer = 2
Public Const ENGINE_PLAY_RANDOM As Integer = 3
Public Const ENGINE_PLAY_MAX    As Integer = 4
' 全局常量——棋盤(小)設置選項
Public Const BOARD_S_GREEN      As Integer = 0
Public Const BOARD_S_RED        As Integer = 1
Public Const BOARD_S_WHITE      As Integer = 2
Public Const BOARD_S_WOOD       As Integer = 3
Public Const BOARD_S_SHEET      As Integer = 4
Public Const BOARD_S_CANVAS     As Integer = 5
Public Const BOARD_S_DROPS      As Integer = 6
Public Const BOARD_S_CLOUDS     As Integer = 7
Public Const BOARD_S_STONE      As Integer = 8
Public Const BOARD_S_XQSTUDIO   As Integer = 9
Public Const BOARD_S_MOVESKY    As Integer = 10
Public Const BOARD_S_MRSJ       As Integer = 11
Public Const BOARD_S_ZMBL       As Integer = 12
Public Const BOARD_S_SIMPLE     As Integer = 13
Public Const BOARD_S_MAX        As Integer = 14
' 全局常量——棋子(小)設置選項
Public Const PIECES_S_NORMAL    As Integer = 0
Public Const PIECES_S_WOOD      As Integer = 1
Public Const PIECES_S_POLISH    As Integer = 2
Public Const PIECES_S_STONE     As Integer = 3
Public Const PIECES_S_XQSTUDIO  As Integer = 4
Public Const PIECES_S_MOVESKY   As Integer = 5
Public Const PIECES_S_MRSJ      As Integer = 6
Public Const PIECES_S_ZMBL      As Integer = 7
Public Const PIECES_S_SIMPLE    As Integer = 8
Public Const PIECES_S_MAX       As Integer = 9
' 全局常量——棋盤(大)設置選項
Public Const BOARD_L_WHITE      As Integer = 0
Public Const BOARD_L_WOOD       As Integer = 1
Public Const BOARD_L_SHEET      As Integer = 2
Public Const BOARD_L_CANVAS     As Integer = 3
Public Const BOARD_L_DROPS      As Integer = 4
Public Const BOARD_L_SIMPLE     As Integer = 5
Public Const BOARD_L_MAX        As Integer = 6
' 全局常量——棋子(大)設置選項
Public Const PIECES_L_WOOD      As Integer = 0
Public Const PIECES_L_POLISH    As Integer = 1
Public Const PIECES_L_COIN      As Integer = 2
Public Const PIECES_L_SIMPLE    As Integer = 3
Public Const PIECES_L_MAX       As Integer = 4
' 全局常量——音樂設置選項
Public Const MUSIC_CLASSIC      As Integer = 0
Public Const MUSIC_EXPRESS      As Integer = 1
Public Const MUSIC_FUNNY        As Integer = 2
Public Const MUSIC_WALTZ        As Integer = 3
Public Const MUSIC_MOZART1      As Integer = 4
Public Const MUSIC_MOZART4      As Integer = 5
Public Const MUSIC_FLIGHT       As Integer = 6
Public Const MUSIC_ANITRA       As Integer = 7
Public Const MUSIC_HUMOUR       As Integer = 8
Public Const MUSIC_JINGLE       As Integer = 9
Public Const MUSIC_PAL          As Integer = 10
Public Const MUSIC_CMUSIC       As Integer = 11
Public Const MUSIC_NONE         As Integer = 12
Public Const MUSIC_MAX          As Integer = 13
' 全局常量——循環事件
Public Const EVENT_TIMER        As Integer = 0
Public Const EVENT_PLAY         As Integer = 1
Public Const EVENT_ENGINE       As Integer = 2
Public Const EVENT_MUSIC        As Integer = 3
Public Const EVENT_GUI          As Integer = 4

' 全局變量——程序
Public App_frmMain              As Form     ' 主窗口對象引用
Public App_picCoord(0 To 5)     As Picture  ' 坐標圖片對象引用
Public App_picPieces(0 To 29)   As Picture  ' 棋子圖片對象引用
Public App_picEngineRed         As Picture  ' 引擎執紅的圖片對象引用
Public App_picEngineBlack       As Picture  ' 引擎執黑的圖片對象引用
Public App_lpMainPrev           As Long     ' 為主窗口保留的事件触發過程，用在"MainWindowProc"中
Public App_lpThinkPrev          As Long     ' 為顯示思考窗口保留的事件触發過程，用在"ThinkWindowProc"中
Public App_szPath               As String   ' 主程序所在的文件夾，以"\"結尾
Public App_bRunning             As Boolean  ' 程序運行標志，啟動時設成True，如果是False，則跳出事件檢測循環
Public App_szFileName           As String   ' 程序打開的PGN棋譜的文件名
Public App_bUpdated             As Boolean  ' 文件已更新的標志，設成True則允許啟用“保存”功能，退出時也會提示保存
Public App_bAutoEcco            As Boolean  ' 是否啟用自動解析開局的設置
Public App_bFlipped             As Boolean  ' 是否已經翻轉棋盤
Public App_mvNewMove            As Long     ' 最新的一個著法，棋盤上有標記
Public App_sqSelected           As Integer  ' 鼠標選中的棋子
Public App_bPlay                As Integer  ' 播放棋局
Public App_bRegistered          As Integer  ' 是否已注冊
' 全局變量——選項
Public Options_bLargeGui        As Boolean  ' 大界面
Public Options_bSounds          As Boolean  ' 聲音
Public Options_bAutoPlay        As Boolean  ' 自動播放
Public Options_nPlayIntv        As Integer  ' 播放間隔(秒)
Public Options_szJavaPath       As String   ' Java棋盤路徑
Public Options_bEscapeDouble    As Boolean  ' 用兩個Esc輸入ANSI
Public Options_bAnsiText        As Boolean  ' 使用ANSI文本棋盤
Public Options_bMonoBitmap      As Boolean  ' 圖片棋盤的紅子用白底紅字表示
Public Options_bAutoFlip        As Boolean  ' 自動翻轉棋盤
Public Options_bEngineName      As Boolean  ' 顯示引擎名稱
Public Options_bAllowResign     As Boolean  ' 允許引擎認輸
Public Options_bAlwaysPonder    As Boolean  ' 啟用後台思考
Public Options_bEngineTime      As Boolean  ' 顯示引擎速度
Public Options_bStatusBar       As Boolean  ' 輸出到狀態欄
Public Options_nEnginePlay      As Integer  ' 新局引擎狀態
Public Options_bShowCoord       As Boolean  ' 顯示坐標
Public Options_nBoardS          As Integer  ' 小界面的棋盤
Public Options_nPiecesS         As Integer  ' 小界面的棋子
Public Options_nBoardL          As Integer  ' 大界面的棋盤
Public Options_nPiecesL         As Integer  ' 大界面的棋子
Public Options_nMusic           As Integer  ' 音樂
Public Options_bCheckUpdate     As Boolean  ' 檢查最新版本
Public Options_bEngineUser      As Boolean  ' 人机對弈用戶
' 全局變量——界面
Public Gui_szUser               As String   ' 用戶注冊名稱
Public Gui_szRegCode            As String   ' 注冊碼
Public Gui_bShowHowTo           As Boolean  ' 啟動時顯示“日積月累”
Public Gui_nTipIndex            As Integer  ' “日積月累”的條目序號
Public Gui_szRegTip1            As String   ' “日積月累”的注冊提示一
Public Gui_szRegTip2            As String   ' “日積月累”的注冊提示二
Public Gui_szTips(1 To TIP_NUM) As String   ' “日積月累”的條目
Public Gui_szUpgrade            As String   ' 檢查升級的版本
' 全局變量——棋局
Public Game_szEvent             As String   ' 賽事
Public Game_szRound             As String   ' 輪次
Public Game_szDate              As String   ' 日期
Public Game_szSite              As String   ' 地點
Public Game_szRedTeam           As String   ' 紅方單位
Public Game_szRedPlayer         As String   ' 紅方選手
Public Game_szBlackTeam         As String   ' 黑方單位
Public Game_szBlackPlayer       As String   ' 黑方選手
Public Game_nResult             As Integer  ' 結果
Public Game_szEcco              As String   ' 開局編號
Public Game_szOpen              As String   ' 開局
Public Game_szVar               As String   ' 變例
Public Game_bStartPos           As Boolean  ' 是否開始于初始局面
Public Game_cntStart            As Integer  ' 起始回合數
Public Game_sdStart             As Integer  ' 起始走子方
Public Game_cntCurr             As Integer  ' 當前回合數
Public Game_sdCurr              As Integer  ' 當前走子方
Public Game_sdMax               As Integer  ' 最後走子方
Public Game_nFormat             As Integer  ' 記譜格式
Public Game_mvMove(1 To 1998)   As Long     ' 著法列表
Public Game_szMoveText(0 To 2, 1 To 1998) As String ' 記譜列表
Public Game_szComment(0 To 1998) As String          ' 注釋列表
Public Game_szIrrevFen(0 To 32) As String           ' 不可逆局面FEN串列表
Public Game_posIrrev(0 To 32)   As PositionStruct   ' 不可逆局面列表
Public Game_nCurrMove           As Integer  ' 當前著法序號(第一個著法序號是1)
Public Game_nMaxMove            As Integer  ' 最大著法序號
Public Game_nCurrIrrev          As Integer  ' 當前不可逆局面序號
Public Game_nMaxIrrev           As Integer  ' 最後不可逆局面序號
' 全局變量——時間
Public Timer_bEnabled           As Boolean  ' 是否開始計時
Public Timer_dfLastTime         As Double   ' 當前時間(每天00:00過去的秒數)
Public Timer_nDepth             As Integer  ' 引擎搜索深度
Public Timer_bIncMode           As Boolean  ' 是否加時模式
Public Timer_nInitTime          As Integer  ' 起始時間
Public Timer_nIncMove           As Integer  ' 時段制的每時段步數
Public Timer_nIncTime           As Integer  ' 加時制的加時秒數
Public Timer_nTimeLeft(0 To 1)  As Integer  ' 雙方剩余時間
Public Timer_nTimeElapsed(0 To 1) As Integer ' 雙方已經用去的時間
Public Timer_nMoveLeft(0 To 1)  As Integer  ' 加時制的該時段剩余要走的步數
Public Timer_bOver(0 To 1)      As Boolean  ' 雙方是否超時
' 全局變量——引擎
Public Engine_bEngineLog        As Boolean  ' 是否記錄引擎日志
Public Engine_szLogFile         As String   ' 引擎日志文件名
Public Engine_bUseBook          As Boolean  ' 是否使用開局庫
Public Engine_bUseEgtb          As Boolean  ' 是否使用殘局庫
Public Engine_szBookFiles       As String   ' 開局庫文件名
Public Engine_szEgtbPaths       As String   ' 殘局庫文件名
Public Engine_nHash             As Integer  ' 置換表大小
Public Engine_nThreads          As Integer  ' 引擎使用的線程數
Public Engine_nDrawMoves        As Integer  ' 自然限著回合數
Public Engine_nRepetition       As Integer  ' 循環局面适用規則
Public Engine_nPruning          As Integer  ' 裁剪
Public Engine_nKnowledge        As Integer  ' 知識
Public Engine_nSelectivity      As Integer  ' 隨机
Public Engine_nStyle            As Integer  ' 風格
Public Engine_szFile            As String   ' 引擎文件
Public Engine_pipe          As PipeStruct   ' 引擎管道
Public Engine_nStatus           As Integer  ' 引擎狀態
Public Engine_dwTimeRatio       As Long     ' 引擎時間比例(秒制是1，毫秒制是1000)
Public Engine_szName            As String   ' 引擎名稱
Public Engine_szCopyright       As String   ' 引擎版權
Public Engine_szAuthor          As String   ' 引擎作者
Public Engine_szUser            As String   ' 引擎用戶
Public Engine_posBoard  As PositionStruct   ' 引擎思考的局面
Public Engine_bRed              As Boolean  ' 引擎執紅
Public Engine_bBlack            As Boolean  ' 引擎執黑
Public Engine_bPonder           As Boolean  ' 後台思考
Public Engine_bAnalyze          As Boolean  ' 引擎分析
Public Engine_mvPonder          As Long     ' 後台思考猜測著法
Public Engine_mvPonderFinished  As Long     ' 後台思考完成的著法
Public Engine_mvPonderFinishedPonder As Long ' 後台思考完成的猜測著法
Public Engine_bPonderFinishedResign As Long ' 後台思考完成後認輸
Public Engine_bPonderFinishedDraw As Long   ' 後台思考完成後提和或接受提和
Public Engine_szPonderStr       As String   ' 後台思考指令串
Public Engine_bDraw             As Integer  ' 提和
Public Engine_mvBan             As Long     ' 禁著
Public Engine_bSlaveRed         As Boolean  ' 副引擎執紅
Public Engine_bSlaveBlack       As Boolean  ' 副引擎執黑
Public Engine_pipeSlave     As PipeStruct   ' 副引擎管道
Public Engine_dwTimeRatioSlave  As Long     ' 副引擎時間比例
Public Engine_szSlaveName       As String   ' 副引擎名稱

' 以下是實用函數例程

' 顯示軟件名稱
Public Function ProductName() As String

ProductName = "象棋巫師" + IIf(App_bRegistered, "", " (未注冊版)")

End Function

' 把字符轉換成數字，顯示棋譜坐標時用
Public Function Byte2Digit(ByVal szChar As String) As Integer

If szChar >= "1" And szChar <= "9" Then
    Byte2Digit = Asc(szChar) - 48
Else
    Byte2Digit = 0
End If

End Function

' 把數字轉換成字符，顯示棋譜坐標時用
Public Function Digit2Word(ByVal nArg As Integer) As String

Digit2Word = Choose(nArg, "１", "２", "３", "４", "５", "６", "７", "８", "９")

End Function

' 把字符串轉換成整數，用于多种場合
Public Function Str2Int(ByVal sz As String, Optional ByVal nMin As Integer = -32767, Optional ByVal nMax As Integer = 32767) As Integer

Dim df As Double
df = Val(sz)
If df < nMin Then
    Str2Int = nMin
ElseIf df > nMax Then
    Str2Int = nMax
Else
    Str2Int = df
End If

End Function

' 把字符串轉換成整數，用于多种場合
Public Function Str2Lng(ByVal sz As String, Optional ByVal nMin As Long = -2147483647, Optional ByVal nMax As Long = 2147483647) As Long

Dim df As Double
df = Val(sz)
If df < nMin Then
    Str2Lng = nMin
ElseIf df > nMax Then
    Str2Lng = nMax
Else
    Str2Lng = df
End If

End Function

' 顯示著法前的回合數，紅方格式是“???. 某某某某”，黑方格式是“     某某某某”，著法是對齊的
Public Function NumberText(cnt As Integer, sd As Integer) As String

NumberText = IIf(sd = 0, LTrim(Str(cnt)) + ".", Space(Len(Str(cnt))))

End Function

' 打開文件對話框
Public Function FileDialog(ByVal szTitle As String, ByVal szFileType As String, ByVal szExt1 As String, Optional ByVal szExt2 As String = "", Optional ByVal bShowSave As Boolean = False) As String

Dim szExt As String
szExt = "*." + szExt1 + IIf(szExt2 = "", "", ";*." + szExt2)
frmHide.comdlg.FileName = ""
frmHide.comdlg.DialogTitle = szTitle
frmHide.comdlg.DefaultExt = "." + szExt1
frmHide.comdlg.Filter = szFileType + "(" + szExt + ")|" + szExt + "|所有文件 (*.*)|*.*"
frmHide.comdlg.Flags = IIf(bShowSave, cdlOFNOverwritePrompt, 0) + cdlOFNHideReadOnly
If bShowSave Then
    frmHide.comdlg.ShowSave
Else
    frmHide.comdlg.ShowOpen
End If
FileDialog = frmHide.comdlg.FileName

End Function

' 播放聲音
Public Sub PlayWavSound(ByVal szSoundFile As String)

PlaySoundA App_szPath + "\SOUNDS\" + szSoundFile + ".WAV", 0, SND_ASYNC + SND_NOWAIT + SND_FILENAME

End Sub

' 以上是實用函數例程

' 以下是文件操作例程

' 從"szSrc"中獲得PGN棋譜的標簽，如果有此標簽則返回True，標簽內容保存到"szDst"變量中，反之返回False
Public Function GetLabel(ByRef szDst As String, ByVal szSrc As String, ByVal szLabelName As String) As Boolean

Dim nLen As Integer, i As Integer
nLen = Len(szLabelName)
If UCase(Left(szSrc, nLen + 3)) = "[" + szLabelName + " " + Chr(34) Then
    i = InStr(nLen + 4, szSrc, Chr(34))
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

' 讀入一行PGN文件的內容，返回True表示整個棋局結束，返回False表示後面還有內容，讀完後剩下的內容保存在szLineStr中，以後仍舊須用"ImportLine"去讀
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
            Game_szComment(Game_nMaxMove) = Game_szComment(Game_nMaxMove) + szRemStr
            szRemStr = ""
            bEndFor = False
            Exit For
        End If
        szRemStr = szRemStr + szChar
    Next
    If bEndFor Then
        szRemStr = szRemStr + vbCrLf
        szLineStr = ""
    End If
Else
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
                        szMoveStr = Left(szMoveStr, 1) + Digit2Word(j) + Mid(szMoveStr, 3)
                    End If
                    j = Byte2Digit(Mid(szMoveStr, 4, 1))
                    If j > 0 Then
                        szMoveStr = Left(szMoveStr, 3) + Digit2Word(j)
                    End If
                    MkLng mv, CchessFile2Move(CchessChin2File(CvC(szMoveStr)), Game_posIrrev(Game_nCurrIrrev))
                    AddMove mv
                    bEndFor = False
                    Exit For
                End If
            Else
                If (szChar >= "A" And szChar <= "Z") Or (szChar >= "a" And szChar <= "z") Or szChar = "+" Or szChar = "-" Or szChar = "=" Then
                    j = InStr(i + 1, szLineStr, " ")
                    If j = 0 Then
                        szMoveStr = Mid(szLineStr, i)
                        szLineStr = ""
                    Else
                        szMoveStr = Mid(szLineStr, i, j - i)
                        szLineStr = Mid(szLineStr, j + 1)
                    End If
                    If Game_nFormat = 1 Then
                        MkLng mv, CchessFile2Move(CvL(szMoveStr), Game_posIrrev(Game_nCurrIrrev))
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
End If
ImportLine = False

End Function

' 讀PGN棋譜，如果是XQF棋譜則首先轉換為PGN棋譜
Public Sub ReadFile()

Dim i As Integer, j As Integer, nFileNo As Integer
Dim bCchess As Boolean, bDetail As Boolean
Dim szChineseChess As String, szResult As String, szFormat As String, szFenStr As String
Dim szLineStr As String, szRemStr As String, nRemLevel As Integer


If UCase(Right(App_szFileName, 4)) = ".XQF" Then
    On Error GoTo lnErrorOpen
    Shell App_szPath + "XQF2PGN.EXE " + Chr(34) + App_szFileName + Chr(34) + " " + Chr(34) + App_szPath + "XQF2PGN.PGN" + Chr(34), vbHide
    On Error GoTo 0
    Sleep 1000
    App_szFileName = App_szPath + "XQF2PGN.PGN"
End If

RestartGame
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szFileName For Input As #nFileNo
On Error GoTo 0
bCchess = False
bDetail = False
szLineStr = ""
szRemStr = ""
nRemLevel = 0
Do While Not (EOF(nFileNo) And szLineStr = "")
    If szLineStr = "" Then
        Line Input #nFileNo, szLineStr
    End If
    If bDetail Then
        If Not (bCchess Or App_szFileName = "") Then
            MsgBox App_szFileName + " 可能不是中國象棋的PGN文件。", vbExclamation
            App_szFileName = ""
            App_frmMain.Caption = ProductName
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
                Game_nResult = Switch(szResult = "1-0", RESULT_REDWIN, szResult = "1/2-1/2", RESULT_DRAW, szResult = "0-1", RESULT_BLACKWIN, True, RESULT_UNKNOWN)
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
                Game_cntCurr = Str2Int(Mid(szFenStr, InStr(szFenStr, " - - 0 ") + 7), 1, 999)
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
BoardFlush
CoordFlush
LabelFlush
Do While Game_nCurrMove > 0
    MoveBack
Loop
MoveFlush
Close #nFileNo

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "無法打開文件 " + App_szFileName, vbExclamation
BoardFlush

End Sub

' 存儲標簽
Public Function PutLabel(ByVal LabelName As String, ByVal LabelValue As String) As String

Dim i As Integer
i = InStr(LabelValue, vbCrLf)
If i > 0 Then
    PutLabel = "[" + LabelName + " " + Chr(34) + Left(LabelValue, i - 1) + Chr(34) + "]"
Else
    PutLabel = "[" + LabelName + " " + Chr(34) + LabelValue + Chr(34) + "]"
End If

End Function

' 寫PGN棋譜
Public Sub WriteFile(Optional ByVal bTempFile As Boolean = False)

Dim sd As Integer, cnt As Integer
Dim i As Integer, bReturned As Boolean, nFileNo As Integer
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open IIf(bTempFile, App_szPath + "查看PGN文件(只讀).TXT", App_szFileName) For Output As #nFileNo
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
    Print #nFileNo, "{" + Game_szComment(0) + "}"
End If
bReturned = True
cnt = Game_cntStart
sd = Game_sdStart
For i = 1 To Game_nMaxMove
    If bReturned Then
        Print #nFileNo, Space(4 - Len(Str(cnt))) + LTrim(Str(cnt)) + ". ";
        If sd = 1 Then
            Print #nFileNo, Space(Choose(Game_nFormat + 1, 8, 4, 5));
        End If
    End If
    If sd = 0 Then
        Print #nFileNo, Game_szMoveText(Game_nFormat, i);
        bReturned = False
    Else
        Print #nFileNo, " " + Game_szMoveText(Game_nFormat, i)
        bReturned = True
    End If
    If Game_szComment(i) <> "" Then
        If Not bReturned Then
            Print #nFileNo,
        End If
        Print #nFileNo, "{" + Game_szComment(i) + "}"
        bReturned = True
    End If
    sd = 1 - sd
    cnt = cnt + 1 - sd
Next
Print #nFileNo, Choose(Game_nResult + 1, " *", " 1-0", " 1/2-1/2", " 0-1")
Print #nFileNo, "============================"
Print #nFileNo, "歡迎訪問《象棋百科全書》网站"
Print #nFileNo, "推荐用“象棋巫師”觀賞棋譜"
Print #nFileNo, "http://www.elephantbase.net/"
Close #nFileNo
If Not bTempFile Then
    App_bUpdated = False
    App_frmMain.mnFileSave.Enabled = False
    App_frmMain.tlb.Buttons("FileSave").Enabled = False
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "無法打開文件 " + IIf(bTempFile, App_szPath + "查看PGN文件(只讀).TXT", App_szFileName), vbExclamation

End Sub

' 如果棋局改動過，就要設置“已更新”狀態，保存功能有效
Public Sub FileUpdated()

App_bUpdated = True
App_frmMain.mnFileSave.Enabled = True
App_frmMain.tlb.Buttons("FileSave").Enabled = True

End Sub

' 打開PGN棋譜
Public Sub OpenFile()

Dim szFileName As String
szFileName = FileDialog("打開棋譜文件", "棋譜文件", "PGN", "XQF")
If szFileName <> "" Then
    App_szFileName = szFileName
    ReadFile
    LabelFlush
End If

End Sub

' 如果是“已更新”狀態，那么提示保存PGN棋譜
Public Function SaveFile() As Boolean

Select Case MsgBox(IIf(App_szFileName = "", "文件已更改。", "文件 " + App_szFileName + " 已更改。") + vbCrLf + "是否保存更改？", vbYesNoCancel + vbExclamation)
Case vbYes
    If App_szFileName = "" Then
        If SaveFileAs() Then
            SaveFile = True
        Else
            SaveFile = False
        End If
    Else
        WriteFile
        SaveFile = True
    End If
Case vbNo
    SaveFile = True
Case Else
    SaveFile = False
End Select

End Function

' 實現“另存為”功能
Public Function SaveFileAs()

Dim szFileName As String
szFileName = FileDialog("保存棋譜文件", "PGN文件", "PGN", , SHOW_SAVE)
If szFileName <> "" Then
    App_szFileName = szFileName
    App_frmMain.Caption = IIf(App_szFileName = "", "", Mid(App_szFileName, InStrRev(App_szFileName, "\") + 1) + " - ") + ProductName
    WriteFile
    SaveFileAs = True
Else
    SaveFileAs = False
End If

End Function

' 打開FEN局面
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
MsgBox "無法打開文件 " + szFenFile, vbExclamation

End Sub

' 裝入FEN字符串
Public Sub LoadFenStr(ByVal szFenStr As String)

If szFenStr = "" Then
    Exit Sub
End If
App_szFileName = ""
RestartGame
Game_bStartPos = False
Game_szIrrevFen(0) = szFenStr
CchessFen2Board Game_posIrrev(0), szFenStr
Game_sdCurr = Game_posIrrev(0).sdPlayer
Game_cntCurr = Str2Int(Mid(szFenStr, InStr(szFenStr, " - - 0 ") + 7), 1, 999)
Game_sdStart = Game_sdCurr
Game_cntStart = Game_cntCurr
Game_sdMax = Game_sdStart
BoardFlush
CoordFlush
LabelFlush
MoveFlush

End Sub

' 以上是文件操作例程

' 以下是界面控制例程

' 輸出時間格式："hh:mm:ss"
Public Function TimeText(ByVal nSeconds As Integer) As String

Dim sz As String
sz = Chr((nSeconds \ 36000) Mod 6 + 48) + Chr((nSeconds \ 3600) Mod 10 + 48) + ":"
sz = sz + Chr((nSeconds \ 600) Mod 6 + 48) + Chr((nSeconds \ 60) Mod 10 + 48) + ":"
sz = sz + Chr((nSeconds \ 10) Mod 6 + 48) + Chr((nSeconds \ 1) Mod 10 + 48)
TimeText = sz

End Function

' 顯示時間，"0"=紅方，"1"=黑方，"-1"=走棋方
Public Sub SetTimer(Optional ByVal sd As Integer = -1)

Dim nSeconds As Integer, sdThis As Integer
sdThis = IIf(sd = -1, Game_sdMax, sd)
nSeconds = IIf(sd = -1, Game_sdMax, sd)
If sdThis = 0 Eqv App_bFlipped Then
    App_frmMain.lblTimeLeftUp.Caption = TimeText(Timer_nTimeLeft(sdThis))
    App_frmMain.lblTimeRuleUp.Caption = IIf(Timer_bIncMode, "每步加" + Str(Timer_nIncTime) + " 秒", "走完" + Str(Timer_nMoveLeft(sdThis)) + " 步")
    App_frmMain.lblTimeElapsedUp.Caption = TimeText(Timer_nTimeElapsed(sdThis))
Else
    App_frmMain.lblTimeLeftDown.Caption = TimeText(Timer_nTimeLeft(sdThis))
    App_frmMain.lblTimeRuleDown.Caption = IIf(Timer_bIncMode, "每步加" + Str(Timer_nIncTime) + " 秒", "走完" + Str(Timer_nMoveLeft(sdThis)) + " 步")
    App_frmMain.lblTimeElapsedDown.Caption = TimeText(Timer_nTimeElapsed(sdThis))
End If

End Sub

' 賽事字符串
Public Function EventString() As String
    
Dim sz As String
sz = Game_szEvent
If Game_szRound <> "" Then
    sz = sz + IIf(Game_szEvent = "", "", " ")
    Select Case Str2Int(Game_szRound)
    Case 0
        sz = sz + Game_szRound
    Case 1 To 97
        sz = sz + "第" + Game_szRound + "輪"
    Case 98
        sz = sz + "半決賽"
    Case 99
        sz = sz + "決賽"
    End Select
End If
EventString = sz

End Function

' 時間和日期字符串
Public Function DateSiteString() As String

If Game_szDate = "" Then
    DateSiteString = IIf(Game_szSite = "", "", "(弈于 " + Game_szSite + ")")
Else
    DateSiteString = "(" + Game_szDate + IIf(Game_szSite = "", ")", " 弈于 " + Game_szSite + ")")
End If

End Function

' 比賽結果字符串
Public Function ResultString() As String

If Game_szRedPlayer = "" Or Game_szBlackPlayer = "" Then
    ResultString = "(著法: " + IIf(Game_sdStart = 0, "紅先", "黑先") + Choose(Game_nResult + 1, "", "胜", "和", "負") + ")"
Else
    ResultString = Game_szRedTeam + IIf(Game_szRedTeam = "", "", " ") + Game_szRedPlayer + Choose(Game_nResult + 1, " (對) ", " (先胜) ", " (先和) ", " (先負) ") + _
            Game_szBlackTeam + IIf(Game_szBlackTeam = "", "", " ") + Game_szBlackPlayer
End If

End Function

' 開局字符串
Public Function OpenString() As String

OpenString = Game_szOpen + IIf(Game_szOpen = "" Or Game_szVar = "", "", "——") + Game_szVar + _
        IIf(Game_szEcco = "", "", IIf(Game_szOpen = "" And Game_szVar = "", "(ECCO開局編號: " + Game_szEcco + ")", "(" + Game_szEcco + ")"))

End Function

' 顯示全部標簽
Public Sub LabelFlush()

App_frmMain.imgUp.Picture = IIf(App_bFlipped, IIf(Engine_bRed, App_picEngineRed, App_picPieces(1)), IIf(Engine_bBlack, App_picEngineBlack, App_picPieces(8)))
App_frmMain.imgDown.Picture = IIf(App_bFlipped, IIf(Engine_bBlack, App_picEngineBlack, App_picPieces(8)), IIf(Engine_bRed, App_picEngineRed, App_picPieces(1)))
App_frmMain.cmbFormat.ListIndex = Game_nFormat
App_frmMain.lblEvent = EventString
App_frmMain.lblResult = ResultString
App_frmMain.lblDateSite = DateSiteString
App_frmMain.lblOpen = OpenString
SetTimer 0
SetTimer 1

End Sub

' 新開一局，在新建文件、編輯棋局等功能中使用，編輯棋局要加參數"RESTART_KEEP_LABEL"，不清除標簽
Public Sub RestartGame(Optional ByVal bKeepLabel As Boolean = False)

If Engine_nStatus > IDLE_UNLOAD Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
    SendEngine "setoption newgame"
    If Engine_bSlaveRed Or Engine_bSlaveBlack Then
        SendEngine "setoption newgame", SLAVE_ENGINE
        SendEngine "setoption ponder false", SLAVE_ENGINE
        SendEngine "setoption ponder false"
    Else
        SendEngine "setoption ponder " + IIf(Options_bAlwaysPonder, "true", "false")
    End If
    EngineLoaded True
End If
Game_szIrrevFen(0) = MkBStr(CchessStartFen) + " - - 0 1"
CchessFen2Board Game_posIrrev(0), Game_szIrrevFen(0)
App_frmMain.Caption = IIf(App_szFileName = "", ProductName, Mid(App_szFileName, InStrRev(App_szFileName, "\") + 1) + " - " + ProductName)
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
App_bUpdated = False
App_bFlipped = False
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

End Sub

' 在棋盤上顯示棋子，如果指定"DRAW_SELECTED"參數，則再顯示一個標記框，"frmPosEdit"中還有個相應的"DrawPosSquare/DrawCapSquare"過程
Public Sub DrawSquare(ByVal sq As Integer, Optional ByVal bSelected As Boolean = False)

Dim pc As Integer, nPicId As Integer
pc = Game_posIrrev(Game_nCurrIrrev).ucpcSquares(sq)
If pc = 0 Then
    nPicId = 0
Else
    nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
End If
nPicId = nPicId + IIf(bSelected, 15, 0)
App_frmMain.imgSquares(IIf(App_bFlipped, (12 - sq \ 16) * 9 + 11 - sq Mod 16, (sq \ 16 - 3) * 9 + sq Mod 16 - 3)).Picture = App_picPieces(nPicId)

End Sub

' 顯示整個棋盤，"frmPosEdit"中還有一個相應的"PosBoardFlush"過程
Public Sub BoardFlush()

Dim i As Integer, j As Integer
App_sqSelected = 0
For i = 3 To 12
    For j = 3 To 11
        DrawSquare i * 16 + j
    Next
Next

End Sub

' 顯示棋盤的坐標
Public Sub CoordFlush()

If Options_bShowCoord Then
    App_frmMain.imgCoord.Picture = App_picCoord(Game_nFormat * 2 + IIf(App_bFlipped, 1, 0))
Else
    App_frmMain.imgCoord.Picture = LoadPicture()
End If

End Sub

' 顯示當前走過的著法，并且根据哪方走棋更新主窗口的圖標
Public Sub MoveFlush()

Dim bNotBegin As Boolean, bNotEnd As Boolean
If App_sqSelected > 0 Then
    DrawSquare App_sqSelected
    App_sqSelected = 0
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
App_frmMain.mnEngineBan.Enabled = bNotBegin And Not bNotEnd
If Not bNotEnd Then
    App_bPlay = False
    App_frmMain.mnWizardPlay.Checked = False
    App_frmMain.tlb.Buttons("WizardPlay").Value = tbrUnpressed
End If
App_frmMain.txtComment.Text = Game_szComment(Game_nCurrMove)
App_frmMain.Icon = IIf(Game_sdMax = 0, frmHide.imgFormRed.Picture, frmHide.imgFormBlack.Picture)
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

End Sub

' 後退一個著法
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

' 前進一個著法
Public Sub MoveForward()

Dim nMoveStatus As Long
Game_nCurrMove = Game_nCurrMove + 1
CchessTryMove Game_posIrrev(Game_nCurrIrrev), nMoveStatus, CvLng(Game_mvMove(Game_nCurrMove))
If (nMoveStatus And MOVE_CAPTURE) <> 0 Then
    CchessUndoMove Game_posIrrev(Game_nCurrIrrev)
    Game_nCurrIrrev = Game_nCurrIrrev + 1
End If
DrawSquare Dst(Game_mvMove(Game_nCurrMove))
DrawSquare Src(Game_mvMove(Game_nCurrMove))
Game_sdCurr = 1 - Game_sdCurr
Game_cntCurr = Game_cntCurr + 1 - Game_sdCurr

End Sub

' 清除後面所有的著法
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

' 新增一個著法，可以是從文件中讀入的，用戶搬的，或引擎走的
Public Function AddMove(mv As Long, Optional ByVal bEcho = False, Optional ByVal bEngine = False) As Boolean

Dim i As Integer, nMoveStatus As Long
Dim szMoveChinText As String, szMoveFileText As String, szMoveIccsText As String
If Game_cntCurr = 1000 Or Game_posIrrev(Game_nCurrIrrev).nMoveNum = 200 Then
    AddMove = False
    If bEcho Then
        MsgBox "超過最大回合數限制！", vbExclamation
    End If
    Exit Function
End If
szMoveIccsText = Move2Iccs(mv)
szMoveFileText = MkL(CchessMove2File(CvLng(mv), Game_posIrrev(Game_nCurrIrrev)))
szMoveChinText = MkC(CchessFile2Chin(CvL(szMoveFileText), Game_sdCurr))
If CchessTryMove(Game_posIrrev(Game_nCurrIrrev), nMoveStatus, CvLng(mv)) Then
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
        If MsgBox("必須清除以後所有的著法。" + vbCrLf + "是否繼續？", vbYesNo + vbQuestion) = vbYes Then
            MoveCut
        Else
            AddMove = False
            Exit Function
        End If
    End If
    If (nMoveStatus And MOVE_CAPTURE) <> 0 Then
        Game_posIrrev(Game_nMaxIrrev + 1) = Game_posIrrev(Game_nMaxIrrev)
        Game_nMaxIrrev = Game_nMaxIrrev + 1
        CchessTryMove Game_posIrrev(Game_nMaxIrrev), nMoveStatus, CvLng(mv)
        CchessSetIrrev Game_posIrrev(Game_nMaxIrrev)
        Game_szIrrevFen(Game_nMaxIrrev) = MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nMaxIrrev))) + " - - 0" + _
                Str(IIf(Game_sdCurr = 0, Game_cntCurr, Game_cntCurr + 1))
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
    App_frmMain.lstMoveText.AddItem NumberText(Game_cntCurr, Game_sdCurr) + Game_szMoveText(Game_nFormat, Game_nMaxMove), Game_nMaxMove
    Game_mvMove(Game_nMaxMove) = mv
    MoveForward
    If bEcho Then
        MoveFlush
    End If
    AnalyzeEcco
    If (nMoveStatus And MOVE_MATE) <> 0 Then
        If bEcho And Options_bSounds Then
            If (Game_sdCurr = 1 And Engine_bRed) Or (Game_sdCurr = 0 And Engine_bBlack) Then
                PlayWavSound "LOSS"
            Else
                PlayWavSound "WIN"
            End If
        End If
        Game_nResult = IIf(Game_sdCurr = 1, RESULT_REDWIN, RESULT_BLACKWIN)
        App_frmMain.lblResult = ResultString
        Timer_bEnabled = False
        App_frmMain.mnEngineLevel.Checked = False
        App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
    Else
        If bEcho And Options_bSounds Then
            If (nMoveStatus And MOVE_CHECK) <> 0 Then
                PlayWavSound "CHECK" + IIf(bEngine, "2", "")
            ElseIf (nMoveStatus And MOVE_CAPTURE) <> 0 Then
                PlayWavSound "CAPTURE" + IIf(bEngine, "2", "")
            Else
                PlayWavSound "MOVE" + IIf(bEngine, "2", "")
            End If
        End If
        If (nMoveStatus And MOVE_CONSECUTIVE) <> 0 Then
            If bEcho Then
                MsgBox "超過自然限著作和！", vbInformation
            End If
            Game_nResult = RESULT_DRAW
            App_frmMain.lblResult = ResultString
            Timer_bEnabled = False
            App_frmMain.mnEngineLevel.Checked = False
            App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
        ElseIf (nMoveStatus And MOVE_PERPETUAL) <> 0 Then
            Game_nResult = RESULT_DRAW
            If (nMoveStatus And MOVE_PERPETUAL_WIN) <> 0 Then
                Game_nResult = Game_nResult + 1 - Game_sdCurr * 2
            End If
            If (nMoveStatus And MOVE_PERPETUAL_LOSE) <> 0 Then
                Game_nResult = Game_nResult - 1 + Game_sdCurr * 2
            End If
            If bEcho Then
                MsgBox Choose(Game_nResult, "黑方長打作負！", "雙方不變作和。", "紅方長打作負！"), vbInformation
            End If
            App_frmMain.lblResult = ResultString
            Timer_bEnabled = False
            App_frmMain.mnEngineLevel.Checked = False
            App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
        End If
    End If
    If App_frmMain.mnEngineDraw.Checked Then
        App_frmMain.mnEngineDraw.Checked = False
        Engine_bDraw = True
    End If
    If Engine_nStatus = IDLE_PONDER Then
        If mv = Engine_mvPonder Then
            If Options_bAllowResign And Engine_bPonderFinishedResign Then
                MsgBox IIf(Game_sdMax = 0, "紅方認輸。", "黑方認輸。"), vbInformation
                Game_nResult = IIf(Game_sdMax = 0, RESULT_BLACKWIN, RESULT_REDWIN)
                App_frmMain.lblResult = ResultString
                Engine_nStatus = IDLE_REST
            ElseIf Engine_bDraw And Engine_bPonderFinishedDraw Then
                MsgBox IIf(Game_sdMax = 0, "紅方接受提和。", "黑方接受提和。"), vbInformation
                Game_nResult = RESULT_DRAW
                App_frmMain.lblResult = ResultString
                Engine_nStatus = IDLE_REST
            Else
                Engine_nStatus = IDLE_READY
                AddMove Engine_mvPonderFinished, MOVE_WITH_ECHO, MOVE_BY_ENGINE
                If Options_bAllowResign And Engine_bPonderFinishedDraw Then
                    Engine_bDraw = True
                    If Not IIf(Game_sdMax = 1, Engine_bBlack, Engine_bRed) Then
                        MsgBox IIf(Game_sdMax = 1, "紅方提和。", "黑方提和。") + vbCrLf + "如果接受提和，請選擇“引擎”菜單的“提和/接受提和”功能。" + _
                                vbCrLf + "如果拒絕提和，則可以不予理睬，繼續下一著棋。", vbInformation
                    End If
                End If
                If Engine_mvPonderFinishedPonder <> 0 Then
                    Engine_mvPonder = Engine_mvPonderFinishedPonder
                    Engine_nStatus = BUSY_PONDER
                    RunEngine
                End If
            End If
        Else
            Engine_nStatus = IDLE_READY
        End If
    End If
    AddMove = True
Else
    If bEcho And Options_bSounds And (nMoveStatus And MOVE_INCHECK) <> 0 Then
        PlayWavSound "ILLEGAL"
    End If
    AddMove = False
End If

End Function

' 分析開局
Public Sub AnalyzeEcco()

Dim i As Integer, dwEcco As Long
Dim szMoveStr As String
If App_bAutoEcco And Game_bStartPos And Game_nMaxMove <= 20 Then
    szMoveStr = ""
    For i = 1 To Game_nMaxMove
        szMoveStr = szMoveStr + Game_szMoveText(1, i)
    Next
    dwEcco = EccoIndex(szMoveStr)
    Game_szEcco = Left(MkL(dwEcco), 3)
    Game_szOpen = MkBStr(EccoOpening(dwEcco))
    Game_szVar = MkBStr(EccoVariation(dwEcco))
    App_frmMain.lblOpen = OpenString
End If

End Sub

' 以上是界面控制例程

' 以下是特色工具例程

' 生成Java代碼
Public Sub CopyJava()

Dim i As Integer, sq As Integer, sd As Integer, szJava As String, posJava As PositionStruct
szJava = "<applet width=" + Chr(34) + "249" + Chr(34) + " height=" + Chr(34) + "301" + Chr(34) + _
        " codebase=" + Chr(34) + Options_szJavaPath + Chr(34) + " code=" + Chr(34) + "JavaXQ" + Chr(34) + ">" + vbCrLf
If Not Game_bStartPos Then
    CchessFen2Board posJava, Game_szIrrevFen(0)
    szJava = szJava + "<param name=" + Chr(34) + "Position" + Chr(34) + " value=" + Chr(34)
    For sd = 0 To 1
        For i = 1 To 16
            sq = posJava.ucsqPieces(Choose(i, 23, 21, 19, 17, 16, 18, 20, 22, 24, 25, 26, 27, 28, 29, 30, 31) + sd * 16)
            szJava = szJava + IIf(sq = 0, "--", Chr(sq Mod 16 + 62) + Chr(60 - sq \ 16)) + ","
        Next
    Next
    szJava = szJava + Chr(34) + ">" + vbCrLf
End If
szJava = szJava + "<param name=" + Chr(34) + "MoveList" + Chr(34) + " value=" + Chr(34)
For i = 1 To Game_nMaxMove
    szJava = szJava + Move2Iccs(Game_mvMove(i)) + " "
Next
szJava = szJava + Chr(34) + ">" + vbCrLf
szJava = szJava + "請登錄<a href=" + Chr(34) + "http://www.java.com/" + Chr(34) + ">www.java.com</a>下載Java運行包" + vbCrLf
szJava = szJava + "</applet>"
If Not Game_bStartPos Then
    szJava = szJava + "<p>" + Game_szIrrevFen(0) + "</p>"
End If
szJava = szJava + "<p>歡迎訪問<a href=" + Chr(34) + "http://www.elephantbase.net/" + Chr(34) + ">www.elephantbase.net</a></p>"
Clipboard.Clear
Clipboard.SetText szJava
MsgBox "Java棋盤代碼已复制到剪貼板。", vbInformation

End Sub

' 生成Web棋盤
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
Print #nFileNo, "<script language=" + Chr(34) + "JavaScript" + Chr(34) + "><!--"
Print #nFileNo, "var RightReady = 0;"
Print #nFileNo, "--></script>"
Print #nFileNo, "<dl>"
Print #nFileNo, "<dt><center>" + EventString + "</center></dt>"
Print #nFileNo, "<dt><center>" + ResultString + "</center></dt>"
Print #nFileNo, "<dt><center>" + DateSiteString + "</center></dt>"
Print #nFileNo, "<dt><center><a href=" + Chr(34) + "JavaScript:parent.frames[0].ViewFen(0)" + Chr(34) + ">";
Print #nFileNo, IIf(OpenString = "", "===開始===", OpenString) + "</a></center></dt>"
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
szFenStrTable(Game_nCurrMove) = MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr)
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
        Print #nFileNo, "<a href=" + Chr(34) + "JavaScript:parent.frames[0].ViewFen(" + LTrim(Str(Game_nCurrMove + 1)) + ")" + Chr(34) + ">" + _
                Game_szMoveText(Game_nFormat, Game_nCurrMove + 1) + "</a>";
        bReturned = False
    Else
        Print #nFileNo, "&nbsp;" + "<a href=" + Chr(34) + "JavaScript:parent.frames[0].ViewFen(" + LTrim(Str(Game_nCurrMove + 1)) + ")" + Chr(34) + ">" + _
                Game_szMoveText(Game_nFormat, Game_nCurrMove + 1) + "</a></dt>"
        Print #nFileNo, "<dt>";
        bReturned = True
    End If
    MoveForward
    szFenStrTable(Game_nCurrMove) = MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr)
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
Print #nFileNo, "<script language=" + Chr(34) + "JavaScript" + Chr(34) + "><!--"
Print #nFileNo, "var MaxMove =" + Str(Game_nMaxMove) + ";"
Print #nFileNo, "var LastPos = 0;"
Print #nFileNo, "var FenStr = Array(" + LTrim(Str(Game_nMaxMove + 1)) + ");"
For i = 0 To Game_nMaxMove
    Print #nFileNo, "FenStr[" + LTrim(Str(i)); "] = " + Chr(34) + szFenStrTable(i) + Chr(34) + ";"
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
MsgBox "無法打開文件 " + App_szPath + "jsboard2.htm", vbExclamation

End Sub

' 用ANSI定位光標
Public Function AnsiSetCursor(ByVal nRow As Integer, ByVal nColumn As Integer)

AnsiSetCursor = IIf(Options_bEscapeDouble, Chr(27), "") + Chr(27) + "[" + LTrim(Str(nRow)) + ";" + LTrim(Str(nColumn)) + "H"

End Function

' 生成ANSI動態棋盤
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
        "帥仕仕相相馬馬車車炮炮兵兵兵兵兵" + _
        "將士士象象馬馬車車炮炮卒卒卒卒卒"
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
sz = MkBStr(CchessBoardText(Game_posIrrev(Game_nCurrIrrev), CCHESS_ANSI_TEXT))
If Options_bEscapeDouble Then
    sz = Replace(sz, Chr(27) + "[", szEscape)
End If
sz = Space(8) + "ANSI動態棋盤由" + szBlack + "象棋巫師" + szEscape + "0m生成，歡迎訪問" + szHighlight + "www.elephantbase.net" + szNormal + vbCrLf + _
        Space(28) + "請按“" + szHighlight + "↓" + szNormal + "”鍵欣賞" + vbCrLf + vbCrLf + _
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
MsgBox "ANSI動態棋盤已复制到剪貼板。", vbInformation

End Sub

' 生成圖片棋盤
Public Sub ViewBitmap(Optional ByVal bMono As Boolean = False)

Dim lpBmpHeader(1 To 118) As Byte, lpReadBuff(1 To 12) As Byte, lpWriteBuff(1 To 9) As Byte
Dim i As Integer, j As Integer, k As Integer, l As Integer
Dim nReadFileNo As Integer, nWriteFileNo As Integer, szBmpFile As String
nReadFileNo = FreeFile
szBmpFile = App_szPath + "BMPBOARD\BMPBOARD.BMP"
On Error GoTo lnErrorOpen
Open szBmpFile For Binary Access Read As #nReadFileNo
On Error GoTo 0
nWriteFileNo = FreeFile
szBmpFile = App_szPath + "查看圖片棋盤.BMP"
On Error GoTo lnErrorOpen
Open szBmpFile For Binary Access Write As #nWriteFileNo
On Error GoTo 0
Get #nReadFileNo, , lpBmpHeader
Put #nWriteFileNo, , lpBmpHeader
For i = 1 To 234
    For j = 1 To 9
        Get #nReadFileNo, , lpReadBuff
        Put #nWriteFileNo, , lpReadBuff
    Next
Next
Close #nReadFileNo
For i = 0 To 9
    For j = 0 To 8
        k = Game_posIrrev(Game_nCurrIrrev).ucpcSquares((12 - i) * 16 + j + 3)
        If k <> 0 Then
            nReadFileNo = FreeFile
            szBmpFile = App_szPath + "BMPBOARD\" + IIf(k < 32, "R", "B") + PieceByte(PieceType(k)) + IIf(bMono And k < 32, "M", "") + ".BMP"
            On Error GoTo lnErrorOpen
            Open szBmpFile For Binary Access Read As #nReadFileNo
            On Error GoTo 0
            Seek #nReadFileNo, 119
            For k = 0 To 17
                Get #nReadFileNo, , lpReadBuff
                Seek #nWriteFileNo, i * 2592& + k * 108 + j * 12 + 119
                For l = 1 To 9
                    lpWriteBuff(l) = lpReadBuff(l)
                Next
                Put #nWriteFileNo, , lpWriteBuff
            Next
            Close #nReadFileNo
        End If
    Next
Next
Close #nWriteFileNo
ShellExecuteA 0, vbNullString, App_szPath + "查看圖片棋盤.BMP", vbNullString, vbNullString, SW_SHOWNORMAL

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "無法打開文件 " + szBmpFile, vbExclamation

End Sub

' 生成印刷質量的圖片棋盤
Public Sub ViewPrintBitmap()

Dim lpBmpHeader(1 To 118) As Byte, lpReadBuff(1 To 20) As Byte, lpWriteBuff(1 To 17) As Byte
Dim i As Integer, j As Integer, k As Integer, l As Integer
Dim nReadFileNo As Integer, nWriteFileNo As Integer, szBmpFile As String
nReadFileNo = FreeFile
szBmpFile = App_szPath + "PRINTBRD\PRINTBRD.BMP"
On Error GoTo lnErrorOpen
Open szBmpFile For Binary Access Read As #nReadFileNo
On Error GoTo 0
nWriteFileNo = FreeFile
szBmpFile = App_szPath + "查看圖片棋盤.BMP"
On Error GoTo lnErrorOpen
Open szBmpFile For Binary Access Write As #nWriteFileNo
On Error GoTo 0
Get #nReadFileNo, , lpBmpHeader
Put #nWriteFileNo, , lpBmpHeader
For i = 1 To 394
    For j = 1 To 9
        Get #nReadFileNo, , lpReadBuff
        Put #nWriteFileNo, , lpReadBuff
    Next
Next
Close #nReadFileNo
For i = 0 To 9
    For j = 0 To 8
        k = Game_posIrrev(Game_nCurrIrrev).ucpcSquares((12 - i) * 16 + j + 3)
        If k <> 0 Then
            nReadFileNo = FreeFile
            szBmpFile = App_szPath + "PRINTBRD\" + IIf(k < 32, "R", "B") + PieceByte(PieceType(k)) + ".BMP"
            On Error GoTo lnErrorOpen
            Open szBmpFile For Binary Access Read As #nReadFileNo
            On Error GoTo 0
            Seek #nReadFileNo, 119
            For k = 0 To 33
                Get #nReadFileNo, , lpReadBuff
                Seek #nWriteFileNo, i * 7200& + k * 180& + j * 20 + 119
                For l = 1 To 17
                    lpWriteBuff(l) = lpReadBuff(l)
                Next
                Put #nWriteFileNo, , lpWriteBuff
            Next
            Close #nReadFileNo
        End If
    Next
Next
Close #nWriteFileNo
ShellExecuteA 0, vbNullString, App_szPath + "查看圖片棋盤.BMP", vbNullString, vbNullString, SW_SHOWNORMAL

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "無法打開文件 " + szBmpFile, vbExclamation

End Sub

' 以上是特色工具例程

' 以下是引擎控制例程

' 顯示引擎信息的對話框
Public Sub AboutEngine()

MsgBoxWithIcon "引擎：" + Engine_szName + vbCrLf + "版權：" + Engine_szCopyright + vbCrLf + _
        "作者：" + Engine_szAuthor + vbCrLf + "用戶：" + Engine_szUser, "關于UCCI引擎", Engine_szFile

End Sub

' 根据引擎走子方翻轉棋盤并顯示對陣雙方
Public Sub EnginePlayer()

Engine_bPonder = False
App_frmMain.mnEnginePonder.Checked = False
App_frmMain.tlb.Buttons("EnginePonder").Value = tbrUnpressed
If Engine_bRed Eqv Engine_bBlack Then
    App_frmMain.mnEnginePonder.Enabled = False
    App_frmMain.tlb.Buttons("EnginePonder").Enabled = False
Else
    App_frmMain.mnEnginePonder.Enabled = True
    App_frmMain.tlb.Buttons("EnginePonder").Enabled = True
    If Options_bAlwaysPonder Then
        Engine_bPonder = True
        App_frmMain.mnEnginePonder.Checked = True
        App_frmMain.tlb.Buttons("EnginePonder").Value = tbrPressed
    End If
    If Options_bAutoFlip Then
        App_bFlipped = Engine_bRed
        BoardFlush
        CoordFlush
    End If
End If
App_frmMain.mnPosFlip.Checked = App_bFlipped
App_frmMain.tlb.Buttons("PosFlip").Value = IIf(App_bFlipped, tbrPressed, tbrUnpressed)
If Options_bEngineName Then
    Game_szRedPlayer = IIf(Engine_bRed, IIf(Engine_bSlaveRed, Engine_szSlaveName, Engine_szName), IIf(Options_bEngineUser, Engine_szUser, Gui_szUser))
    Game_szBlackPlayer = IIf(Engine_bBlack, IIf(Engine_bSlaveBlack, Engine_szSlaveName, Engine_szName), IIf(Options_bEngineUser, Engine_szUser, Gui_szUser))
End If
LabelFlush
StartTimer

End Sub

' 根据引擎是否在思考，顯示菜單和工具欄上的可用功能
Public Sub EngineBusy(ByVal bBusy As Boolean)

App_frmMain.mnPosMirror.Enabled = Not bBusy
App_frmMain.mnPosEdit.Enabled = Not bBusy
App_frmMain.tlb.Buttons("PosEdit").Enabled = Not bBusy
App_frmMain.mnPosPaste.Enabled = Not bBusy
App_frmMain.mnPosLoad.Enabled = Not bBusy
App_frmMain.mnWizardPlay.Enabled = Not bBusy
App_frmMain.tlb.Buttons("WizardPlay").Enabled = Not bBusy
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

' 向引擎發送指令，并記錄日志，可以選擇是主引擎還是負引擎
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
    Print #nLogFileNo, "<font color=" + Chr(34) + IIf(bSlaveEngine, "#FF00FF", "#FF0000") + Chr(34) + ">" + szLineStr + "</font><br>"
    Close #nLogFileNo
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0

End Sub

' 把接收到的引擎反饋記入日志
Public Sub ReceiveEngineLog(ByVal szLineStr As String, Optional ByVal bSlaveEngine As Boolean = False)

Dim nLogFileNo As Integer
If Engine_bEngineLog And Engine_szLogFile <> "" Then
    nLogFileNo = FreeFile
    On Error GoTo lnErrorOpen
    Open Engine_szLogFile For Append As #nLogFileNo
    Print #nLogFileNo, "<font color=" + Chr(34) + IIf(bSlaveEngine, "#000080", "#0000FF") + Chr(34) + ">" + szLineStr + "</font><br>"
    Close #nLogFileNo
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0

End Sub

' 讓引擎思考，思考前必須設置思考狀態(BUSY_ANALYZE/BUSY_THINK/BUSY_PONDER)
Public Sub RunEngine()

Dim i As Integer, nIrrevMove As Integer, bSlaveEngine As Boolean, dwTimeRatio As Long
Dim nMoveStatus As Long
Dim szFenStr As String, szGoPonder As String
Engine_posBoard = Game_posIrrev(Game_nCurrIrrev)
If Engine_bAnalyze Then
    App_frmMain.txtThink.Text = ""
End If
szFenStr = Game_szIrrevFen(Game_nCurrIrrev)
nIrrevMove = Game_nCurrMove + 1 - Game_posIrrev(Game_nCurrIrrev).nMoveNum
If Game_nCurrMove > nIrrevMove Then
    szFenStr = szFenStr + " moves"
    For i = nIrrevMove + 1 To Game_nCurrMove
        szFenStr = szFenStr + " " + Move2Coord(Game_mvMove(i))
    Next
End If
szGoPonder = "go"
If Engine_nStatus = BUSY_PONDER Then
    Select Case Game_nFormat
    Case 0
        Engine_szPonderStr = MkC(CchessFile2Chin(CchessMove2File(CvLng(Engine_mvPonder), Engine_posBoard), Engine_posBoard.sdPlayer))
    Case 1
        Engine_szPonderStr = MkL(CchessMove2File(CvLng(Engine_mvPonder), Engine_posBoard))
    Case 2
        Engine_szPonderStr = Move2Iccs(Engine_mvPonder)
    End Select
    If CchessTryMove(Engine_posBoard, nMoveStatus, CvLng(Engine_mvPonder)) <> 0 Then
        szFenStr = szFenStr + IIf(Game_nCurrMove > nIrrevMove, "", " moves")
        szFenStr = szFenStr + " " + Move2Coord(Engine_mvPonder)
        szGoPonder = szGoPonder + " ponder"
    End If
Else
    If Engine_bDraw Then
        szGoPonder = szGoPonder + " draw"
    End If
End If
bSlaveEngine = IIf(Engine_posBoard.sdPlayer = 0, Engine_bSlaveRed, Engine_bSlaveBlack)
dwTimeRatio = IIf(bSlaveEngine, Engine_dwTimeRatioSlave, Engine_dwTimeRatio)
SendEngine "position fen " + szFenStr, bSlaveEngine
If Engine_mvBan <> 0 Then
    SendEngine "banmoves " + Move2Coord(Engine_mvBan), bSlaveEngine
End If
If Engine_nStatus = BUSY_ANALYZE Then
    SendEngine "go infinite", bSlaveEngine
Else
    If Timer_nDepth <= 0 Then
        If Timer_bIncMode Then
            SendEngine szGoPonder + " time" + Str(dwTimeRatio * Timer_nTimeLeft(Engine_posBoard.sdPlayer)) + _
                    " increment" + Str(IIf(Timer_nIncTime < 0, 0, dwTimeRatio * Timer_nIncTime)) + _
                    " opptime" + Str(dwTimeRatio * Timer_nTimeLeft(1 - Engine_posBoard.sdPlayer)) + _
                    " oppincrement" + Str(IIf(Timer_nIncTime < 0, 0, dwTimeRatio * Timer_nIncTime)), bSlaveEngine
        Else
            SendEngine szGoPonder + " time" + Str(dwTimeRatio * Timer_nTimeLeft(Engine_posBoard.sdPlayer)) + _
                    " movestogo" + Str(Timer_nMoveLeft(Engine_posBoard.sdPlayer)) + _
                    " opptime" + Str(dwTimeRatio * Timer_nTimeLeft(1 - Engine_posBoard.sdPlayer)) + _
                    " oppmovestogo" + Str(Timer_nMoveLeft(1 - Engine_posBoard.sdPlayer)), bSlaveEngine
        End If
    Else
        SendEngine szGoPonder + " depth" + Str(Timer_nDepth), bSlaveEngine
    End If
End If
App_frmMain.stb.Panels("Curr").Text = ""
App_frmMain.stb.Panels("Nps").Text = ""
App_frmMain.stb.Panels("Pv").Text = ""
App_frmMain.stb.Panels("Msg").Text = ""
EngineBusy True

End Sub

' 輸出引擎的信息，顯示到顯示思考窗口和狀態欄
Public Sub PopEngine(ByVal szReceived As String)

Dim i As Integer, nDepth As Integer, nScore As Integer
Dim nTime As Long, nNodes As Long
Dim szMoveList As String, nMoveStatus As Long, mv As Long
Dim pos As PositionStruct

' 輸出當前思考著法
If Options_bStatusBar Then
    i = InStr(szReceived, " currmove ")
    If i > 0 Then
        mv = Coord2Move(Mid(szReceived, i + 10))
        Select Case Game_nFormat
        Case 0
            szMoveList = MkC(CchessFile2Chin(CchessMove2File(CvLng(mv), Engine_posBoard), Engine_posBoard.sdPlayer))
        Case 1
            szMoveList = MkL(CchessMove2File(CvLng(mv), Engine_posBoard))
        Case 2
            szMoveList = Move2Iccs(mv)
        End Select
        App_frmMain.stb.Panels("Curr").Text = "-> " + szMoveList
    End If
End If

' 輸出時間和速度
i = InStr(szReceived, " time ")
If i > 0 Then
    nTime = Str2Lng(Mid(szReceived, i + 6), -28800000, 28800000)
    If Engine_bAnalyze And Options_bEngineTime Then
        App_frmMain.txtThink.Text = App_frmMain.txtThink.Text + TimeText(nTime \ 1000) + "." + Right(Str(nTime \ 100), 1) + " ->" + vbCrLf
        App_frmMain.txtThink.SelStart = Len(App_frmMain.txtThink.Text)
    End If
    If Options_bStatusBar Then
        i = InStr(szReceived, " nodes ")
        If i > 0 Then
            nNodes = Str2Lng(Mid(szReceived, i + 7))
            If nTime > 0 Then
                App_frmMain.stb.Panels("Nps").Text = "NPS" + Str(nNodes \ nTime) + "K"
            End If
        End If
    End If
End If

' 輸出主要變例
i = InStr(szReceived, " depth ")
If i > 0 Then
    nDepth = Str2Int(Mid(szReceived, i + 7), -999, 999)
    szMoveList = Space(4 - Len(Str(nDepth))) + LTrim(Str(nDepth))
    i = InStr(szReceived, " score ")
    If i > 0 Then
        nScore = Str2Int(Mid(szReceived, i + 7))
        If nScore > 0 Then
            szMoveList = szMoveList + Space(6 - Len(Str(nScore))) + "(+" + LTrim(Str(nScore)) + ")"
        ElseIf nScore < 0 Then
            szMoveList = szMoveList + Space(6 - Len(Str(nScore))) + "(" + Str(nScore) + ")"
        Else
            szMoveList = szMoveList + "     (0)"
        End If
        i = InStr(szReceived, " pv ")
        If i > 0 Then
            pos = Engine_posBoard
            If Engine_nStatus = BUSY_PONDER Then
                szMoveList = szMoveList + " (" + Engine_szPonderStr + ")"
            End If
            i = i + 4
            Do While i < Len(szReceived)
                mv = Coord2Move(Mid(szReceived, i))
                Select Case Game_nFormat
                Case 0
                    szMoveList = szMoveList + " " + MkC(CchessFile2Chin(CchessMove2File(CvLng(mv), pos), pos.sdPlayer))
                Case 1
                    szMoveList = szMoveList + " " + MkL(CchessMove2File(CvLng(mv), pos))
                Case 2
                    szMoveList = szMoveList + " " + Move2Iccs(mv)
                End Select
                CchessTryMove pos, nMoveStatus, CvLng(mv)
                i = i + 5
            Loop
        End If
        If Options_bStatusBar And nDepth > 0 Then
            App_frmMain.stb.Panels("Pv").Text = szMoveList
        End If
    End If
    If Engine_bAnalyze Then
        App_frmMain.txtThink.Text = App_frmMain.txtThink.Text + szMoveList + vbCrLf
        App_frmMain.txtThink.SelStart = Len(App_frmMain.txtThink.Text)
    End If
End If

' 輸出引擎提示信息
i = InStr(szReceived, " message ")
If i > 0 Then
    If Options_bStatusBar Then
        App_frmMain.stb.Panels("Msg").Text = Mid(szReceived, i + 9)
    End If
    If Engine_bAnalyze Then
        App_frmMain.txtThink.Text = App_frmMain.txtThink.Text + Mid(szReceived, i + 9) + vbCrLf
        App_frmMain.txtThink.SelStart = Len(App_frmMain.txtThink.Text)
    End If
End If

End Sub

' 在引擎思考時，接收引擎信息
Public Function ReceiveEngine() As Boolean

Dim lpStr As Long, bSlaveEngine As Boolean, szReceived As String
Dim i As Integer, mv As Long

If Engine_nStatus = IDLE_UNLOAD Then
    ReceiveEngine = False
    Exit Function
End If
bSlaveEngine = (Engine_nStatus >= BUSY_WAIT And IIf(Engine_posBoard.sdPlayer = 0, Engine_bSlaveRed, Engine_bSlaveBlack))
If bSlaveEngine Then
    lpStr = PipeLineInput(Engine_pipeSlave)
Else
    lpStr = PipeLineInput(Engine_pipe)
End If
If lpStr = 0 Then
    ReceiveEngine = False
Else
    szReceived = MkBStr(lpStr)
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
            Engine_nStatus = IDLE_REST
            Do While Game_nCurrMove < Game_nMaxMove
                MoveForward
            Loop
            If Options_bAllowResign And Right(szReceived, 7) = " resign" Then
                MsgBox IIf(Game_sdMax = 0, "紅方認輸。", "黑方認輸。"), vbInformation
                Game_nResult = IIf(Game_sdMax = 0, RESULT_BLACKWIN, RESULT_REDWIN)
                App_frmMain.lblResult = ResultString
                Engine_nStatus = IDLE_REST
            ElseIf Engine_bDraw And Right(szReceived, 5) = " draw" Then
                MsgBox IIf(Game_sdMax = 0, "紅方接受提和。", "黑方接受提和。"), vbInformation
                Game_nResult = RESULT_DRAW
                App_frmMain.lblResult = ResultString
                Engine_nStatus = IDLE_REST
            ElseIf AddMove(mv, MOVE_WITH_ECHO, MOVE_BY_ENGINE) Then
                App_frmMain.SetFocus
                If Options_bAllowResign And Right(szReceived, 5) = " draw" Then
                    Engine_bDraw = True
                    If Not IIf(Game_sdMax = 1, Engine_bBlack, Engine_bRed) Then
                        MsgBox IIf(Game_sdMax = 1, "紅方提和。", "黑方提和。") + vbCrLf + "如果接受提和，請選擇“引擎”菜單的“提和/接受提和”功能。" + _
                                vbCrLf + "如果拒絕提和，則可以不予理睬，繼續下一著棋。", vbInformation
                    End If
                End If
                If Engine_bPonder And Mid(szReceived, 14, 8) = " ponder " Then
                    Engine_mvPonder = Coord2Move(Mid(szReceived, 22, 4))
                    Engine_nStatus = BUSY_PONDER
                    RunEngine
                Else
                    Engine_nStatus = IDLE_READY
                End If
            End If
        Case Else
            MsgBox "不該接收到引擎的信息: " + szReceived, vbExclamation
        End Select
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
            MsgBox "不該接收到引擎的信息: " + szReceived, vbExclamation
        End Select
    ElseIf Left(szReceived, 12) = "info string " Then
    ElseIf Left(szReceived, 5) = "info " Then
        PopEngine szReceived
    End If
    ReceiveEngine = True
End If

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

' 設置引擎參數
Public Sub SetEngine(Optional ByVal bSlaveEngine As Boolean = False)

SendEngine "setoption usebook " + IIf(Engine_bUseBook, "true", "false"), bSlaveEngine
SendEngine "setoption useegtb " + IIf(Engine_bUseEgtb, "true", "false"), bSlaveEngine
If Engine_szBookFiles <> "" Then
    SendEngine "setoption bookfiles " + Engine_szBookFiles, bSlaveEngine
End If
If Engine_szEgtbPaths <> "" Then
    SendEngine "setoption egtbpaths " + Engine_szEgtbPaths, bSlaveEngine
End If
SendEngine "setoption hashsize" + IIf(Engine_nHash = 0, " 0", Str(16 * 2 ^ (Engine_nHash - 1))), bSlaveEngine
SendEngine "setoption threads" + IIf(Engine_nThreads < 4, " 0", Str(2 ^ (Engine_nThreads - 4))), bSlaveEngine
SendEngine "setoption idle " + IIf(Engine_nThreads = 1, "large", IIf(Engine_nThreads = 2, "medium", IIf(Engine_nThreads = 3, "small", "none"))), bSlaveEngine
SendEngine "setoption drawmoves" + Str(100 + Engine_nDrawMoves * 20), bSlaveEngine
SendEngine "setoption repetition " + Choose(Engine_nRepetition + 1, "alwaysdraw", "checkban", "asianrule", "chineserule"), bSlaveEngine
SendEngine "setoption pruning " + Choose(Engine_nPruning + 1, "none", "small", "medium", "large"), bSlaveEngine
SendEngine "setoption knowledge " + Choose(Engine_nKnowledge + 1, "none", "small", "medium", "large"), bSlaveEngine
SendEngine "setoption selectivity " + Choose(Engine_nSelectivity + 1, "none", "small", "medium", "large"), bSlaveEngine
SendEngine "setoption style " + Choose(Engine_nStyle + 1, "solid", "normal", "risky"), bSlaveEngine

End Sub

' 根据引擎是否已加載，顯示菜單和工具欄上的可用功能
Public Sub EngineLoaded(ByVal bLoaded As Boolean)

App_frmMain.mnEngineSet.Enabled = bLoaded
App_frmMain.mnEngineUnLoad.Enabled = bLoaded
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
App_frmMain.tlb.Buttons("EnginePonder").Enabled = False
App_frmMain.tlb.Buttons("EnginePonder").Value = tbrUnpressed
If Engine_bAnalyze Then
    StopAnalyze
End If
App_frmMain.mnEngineAnalyze.Enabled = bLoaded
App_frmMain.tlb.Buttons("EngineAnalyze").Enabled = bLoaded
App_frmMain.mnEngineStop.Enabled = False
App_frmMain.mnEngineBan.Enabled = bLoaded
App_frmMain.mnEngineDraw.Enabled = bLoaded
App_frmMain.mnEngineDraw.Checked = False
App_frmMain.tlb.Buttons("EngineStop").Enabled = False
App_frmMain.mnHelpEngine.Enabled = bLoaded
If Not bLoaded Then
    Timer_bEnabled = False
    App_frmMain.mnEngineLevel.Checked = False
    App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
End If

End Sub

' 關閉引擎(如果有副引擎，先關閉副引擎)
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
        szReceived = MkBStr(lpStr)
        ReceiveEngineLog szReceived
        If szReceived = "bye" Then
            Engine_nStatus = IDLE_UNLOAD
        End If
    End If
Loop
PipeClose Engine_pipe
If Engine_nStatus > IDLE_UNLOAD Then
    MsgBox "無法正常卸載引擎！", vbExclamation
    Engine_nStatus = IDLE_UNLOAD
End If

End Sub

' 關閉副引擎
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
        szReceived = MkBStr(lpStr)
        ReceiveEngineLog szReceived, SLAVE_ENGINE
        If szReceived = "bye" Then
            Engine_bSlaveRed = False
            Engine_bSlaveBlack = False
        End If
    End If
Loop
PipeClose Engine_pipeSlave
If Engine_bSlaveRed Or Engine_bSlaveBlack Then
    MsgBox "無法正常卸載引擎！", vbExclamation
    Engine_bSlaveRed = False
    Engine_bSlaveBlack = False
End If

End Sub

' 打開引擎
Public Sub OpenEngine(Optional ByVal bInfo As Boolean = False)

Dim bLoaded As Boolean
Dim dfLastTime As Double, dfThisTime As Double
Dim lpStr As Long, szReceived As String
If Engine_nStatus > IDLE_UNLOAD Then
    CloseEngine
End If
If Engine_szFile = "" Then
    bLoaded = False
Else
    PipeOpen Engine_pipe, Engine_szFile
    SendEngine "ucci"
    dfLastTime = Timer
    Engine_szName = "N/A"
    Engine_szCopyright = "N/A"
    Engine_szAuthor = "N/A"
    Engine_szUser = "N/A"
    Engine_dwTimeRatio = 1
    Do While Engine_nStatus = IDLE_UNLOAD
        lpStr = PipeLineInput(Engine_pipe)
        If lpStr = 0 Then
            Sleep 1
            dfThisTime = Timer
            dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
            If dfThisTime > dfLastTime + 10# Then
                Exit Do
            End If
        Else
            szReceived = MkBStr(lpStr)
            ReceiveEngineLog szReceived
            If Left(szReceived, 8) = "id name " Then
                Engine_szName = Mid(szReceived, 9)
            ElseIf Left(szReceived, 13) = "id copyright " Then
                Engine_szCopyright = Mid(szReceived, 14)
            ElseIf Left(szReceived, 10) = "id author " Then
                Engine_szAuthor = Mid(szReceived, 11)
            ElseIf Left(szReceived, 8) = "id user " Then
                Engine_szUser = Mid(szReceived, 9)
            ElseIf Left(szReceived, 19) = "option usemillisec " Then
                Engine_dwTimeRatio = 1000
            ElseIf szReceived = "ucciok" Then
                Engine_nStatus = IDLE_READY
            End If
        End If
    Loop
    If Engine_nStatus > IDLE_UNLOAD Then
        bLoaded = True
        Engine_bSlaveRed = False
        Engine_bSlaveBlack = False
        If Engine_dwTimeRatio = 1000 Then
            SendEngine "setoption usemillisec true"
        End If
        SetEngine
    Else
        SendEngine "quit"
        PipeClose Engine_pipe
        bLoaded = False
    End If
End If
If bInfo Then
    If bLoaded Then
        AboutEngine
    Else
        Engine_szFile = ""
        MsgBox "沒有加載引擎！", vbExclamation
    End If
End If
EngineLoaded bLoaded

End Sub

' 打開副引擎
Public Sub OpenSlaveEngine()

Dim szEngineFile As String, szCopyright As String, szAuthor As String, szUser As String
Dim dfLastTime As Double, dfThisTime As Double
Dim lpStr As Long, szReceived As String

If Engine_bSlaveRed Or Engine_bSlaveBlack Then
    CloseSlaveEngine
End If
szEngineFile = FileDialog("加載副引擎", "引擎文件", "EXE")
If szEngineFile = "" Then
    MsgBox "沒有加載引擎！", vbExclamation
Else
    PipeOpen Engine_pipeSlave, szEngineFile
    SendEngine "ucci", SLAVE_ENGINE
    dfLastTime = Timer
    Engine_szSlaveName = "N/A"
    szCopyright = "N/A"
    szAuthor = "N/A"
    szUser = "N/A"
    Engine_dwTimeRatioSlave = 1
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
            szReceived = MkBStr(lpStr)
            ReceiveEngineLog szReceived, SLAVE_ENGINE
            If Left(szReceived, 8) = "id name " Then
                Engine_szSlaveName = Mid(szReceived, 9)
            ElseIf Left(szReceived, 13) = "id copyright " Then
                szCopyright = Mid(szReceived, 14)
            ElseIf Left(szReceived, 10) = "id author " Then
                szAuthor = Mid(szReceived, 11)
            ElseIf Left(szReceived, 8) = "id user " Then
                szUser = Mid(szReceived, 9)
            ElseIf Left(szReceived, 19) = "option usemillisec " Then
                Engine_dwTimeRatioSlave = 1000
            ElseIf szReceived = "ucciok" Then
                Engine_bSlaveBlack = True
            End If
        End If
    Loop
    If Engine_bSlaveBlack Then
        MsgBoxWithIcon "引擎：" + Engine_szSlaveName + vbCrLf + "版權：" + szCopyright + vbCrLf + _
                "作者：" + szAuthor + vbCrLf + "用戶：" + szUser, "關于UCCI引擎", szEngineFile
        If Engine_dwTimeRatioSlave = 1000 Then
            SendEngine "setoption usemillisec true", SLAVE_ENGINE
        End If
        SetEngine SLAVE_ENGINE
    Else
        SendEngine "quit", SLAVE_ENGINE
        PipeClose Engine_pipeSlave
        MsgBox "沒有加載引擎！", vbExclamation
    End If
End If

End Sub

' 啟動時鐘
Sub StartTimer()

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

' 新局時選擇引擎走哪方
Sub EngineNewGame()

If Engine_nStatus > IDLE_UNLOAD Then
    Select Case Options_nEnginePlay
    Case ENGINE_PLAY_NONE
        Engine_bRed = False
        Engine_bBlack = False
    Case ENGINE_PLAY_RED
        Engine_bRed = True
        Engine_bBlack = False
    Case ENGINE_PLAY_BLACK
        Engine_bRed = False
        Engine_bBlack = True
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
End If

End Sub

' 引擎分析開始
Public Sub StartAnalyze()

Engine_bAnalyze = True
App_frmMain.mnEngineAnalyze.Checked = True
App_frmMain.tlb.Buttons("EngineAnalyze").Value = tbrPressed
App_frmMain.strpRight.Tabs.Item(2).Selected = True
App_frmMain.frmInfo.Visible = False
App_frmMain.frmThink.Visible = True
App_frmMain.frmMove2.Move App_frmMain.frmMove2.Left, App_frmMain.frmMove2.Top + IIf(Options_bLargeGui, 3360, 2040)

End Sub

' 引擎分析結束
Public Sub StopAnalyze()

If Not (Engine_bRed Or Engine_bBlack) Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
End If
Engine_bAnalyze = False
App_frmMain.mnEngineAnalyze.Checked = False
App_frmMain.tlb.Buttons("EngineAnalyze").Value = tbrUnpressed
App_frmMain.strpRight.Tabs.Item(1).Selected = True
App_frmMain.frmInfo.Visible = True
App_frmMain.frmThink.Visible = False
App_frmMain.frmMove2.Move App_frmMain.frmMove2.Left, App_frmMain.frmMove2.Top - IIf(Options_bLargeGui, 3360, 2040)

End Sub

' 以上是引擎控制例程

' 以下是圖片和聲音的處理例程

' 設置棋盤(小)
Public Sub BoardSettingSmall(ByVal nBoardIndex As Integer)

On Error Resume Next
frmMainSmall.imgBoard.Picture = LoadPicture(App_szPath + "IMAGES_S\" + _
        Choose(nBoardIndex + 1, "GREEN", "RED", "WHITE", "WOOD", "SHEET", "CANVAS", "DROPS", _
        "CLOUDS", "STONE", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL", "SIMPLE") + ".GIF")
frmHide.imgBoard.Picture = frmMainSmall.imgBoard.Picture
On Error GoTo 0
frmMainSmall.mnOptionsBoardGreen.Checked = (nBoardIndex = BOARD_S_GREEN)
frmMainSmall.mnOptionsBoardRed.Checked = (nBoardIndex = BOARD_S_RED)
frmMainSmall.mnOptionsBoardWhite.Checked = (nBoardIndex = BOARD_S_WHITE)
frmMainSmall.mnOptionsBoardWood.Checked = (nBoardIndex = BOARD_S_WOOD)
frmMainSmall.mnOptionsBoardSheet.Checked = (nBoardIndex = BOARD_S_SHEET)
frmMainSmall.mnOptionsBoardCanvas.Checked = (nBoardIndex = BOARD_S_CANVAS)
frmMainSmall.mnOptionsBoardDrops.Checked = (nBoardIndex = BOARD_S_DROPS)
frmMainSmall.mnOptionsBoardClouds.Checked = (nBoardIndex = BOARD_S_CLOUDS)
frmMainSmall.mnOptionsBoardStone.Checked = (nBoardIndex = BOARD_S_STONE)
frmMainSmall.mnOptionsBoardXQStudio.Checked = (nBoardIndex = BOARD_S_XQSTUDIO)
frmMainSmall.mnOptionsBoardMoveSky.Checked = (nBoardIndex = BOARD_S_MOVESKY)
frmMainSmall.mnOptionsBoardMRSJ.Checked = (nBoardIndex = BOARD_S_MRSJ)
frmMainSmall.mnOptionsBoardZMBL.Checked = (nBoardIndex = BOARD_S_ZMBL)
frmMainSmall.mnOptionsBoardSimple.Checked = (nBoardIndex = BOARD_S_SIMPLE)
Options_nBoardS = nBoardIndex

End Sub

' 設置棋盤(大)
Public Sub BoardSettingLarge(ByVal nBoardIndex As Integer)

On Error Resume Next
frmMainLarge.imgBoard.Picture = LoadPicture(App_szPath + "IMAGES_L\" + _
        Choose(nBoardIndex + 1, "WHITE", "WOOD", "SHEET", "CANVAS", "DROPS", "SIMPLE") + ".GIF")
On Error GoTo 0
frmMainLarge.mnOptionsBoardWhite.Checked = (nBoardIndex = BOARD_L_WHITE)
frmMainLarge.mnOptionsBoardWood.Checked = (nBoardIndex = BOARD_L_WOOD)
frmMainLarge.mnOptionsBoardSheet.Checked = (nBoardIndex = BOARD_L_SHEET)
frmMainLarge.mnOptionsBoardCanvas.Checked = (nBoardIndex = BOARD_L_CANVAS)
frmMainLarge.mnOptionsBoardDrops.Checked = (nBoardIndex = BOARD_L_DROPS)
frmMainLarge.mnOptionsBoardSimple.Checked = (nBoardIndex = BOARD_L_SIMPLE)
Options_nBoardL = nBoardIndex

End Sub

' 獲得棋子圖片的文件名
Public Function PieceFileName(ByVal nIndex As Integer) As String

If nIndex >= 15 Then
    PieceFileName = PieceFileName(nIndex - 15) + "S"
Else
    If nIndex = 0 Then
        PieceFileName = "OO"
    Else
        If nIndex > 7 Then
            PieceFileName = "B" + PieceByte(nIndex - 8)
        Else
            PieceFileName = "R" + PieceByte(nIndex - 1)
        End If
    End If
End If

End Function

' 設置棋子(小)
Public Sub PiecesSettingSmall(ByVal nPiecesIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath + "IMAGES_S\" + Choose(nPiecesIndex + 1, "NORMAL", "WOOD", "POLISH", "STONE", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL", "SIMPLE") + "\"
On Error Resume Next
For i = 0 To 29
    Set App_picPieces(i) = LoadPicture(sz + PieceFileName(i) + ".GIF")
    frmHide.imgPiecesSmall(i).Picture = App_picPieces(i)
Next
On Error GoTo 0
frmMainSmall.mnOptionsPiecesNormal.Checked = (nPiecesIndex = PIECES_S_NORMAL)
frmMainSmall.mnOptionsPiecesWood.Checked = (nPiecesIndex = PIECES_S_WOOD)
frmMainSmall.mnOptionsPiecesPolish.Checked = (nPiecesIndex = PIECES_S_POLISH)
frmMainSmall.mnOptionsPiecesStone.Checked = (nPiecesIndex = PIECES_S_STONE)
frmMainSmall.mnOptionsPiecesXQStudio.Checked = (nPiecesIndex = PIECES_S_XQSTUDIO)
frmMainSmall.mnOptionsPiecesMoveSky.Checked = (nPiecesIndex = PIECES_S_MOVESKY)
frmMainSmall.mnOptionsPiecesMRSJ.Checked = (nPiecesIndex = PIECES_S_MRSJ)
frmMainSmall.mnOptionsPiecesZMBL.Checked = (nPiecesIndex = PIECES_S_ZMBL)
frmMainSmall.mnOptionsPiecesSimple.Checked = (nPiecesIndex = PIECES_S_SIMPLE)
BoardFlush
LabelFlush
Options_nPiecesS = nPiecesIndex

End Sub

' 設置棋子(大)
Public Sub PiecesSettingLarge(ByVal nPiecesIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath + "IMAGES_L\" + Choose(nPiecesIndex + 1, "WOOD", "POLISH", "coin", "SIMPLE") + "\"
On Error Resume Next
For i = 0 To 29
    Set App_picPieces(i) = LoadPicture(sz + PieceFileName(i) + ".GIF")
Next
On Error GoTo 0
frmMainLarge.mnOptionsPiecesWood.Checked = (nPiecesIndex = PIECES_L_WOOD)
frmMainLarge.mnOptionsPiecesPolish.Checked = (nPiecesIndex = PIECES_L_POLISH)
frmMainLarge.mnOptionsPiecesCoin.Checked = (nPiecesIndex = PIECES_L_COIN)
frmMainLarge.mnOptionsPiecesSimple.Checked = (nPiecesIndex = PIECES_L_SIMPLE)
BoardFlush
LabelFlush
Options_nPiecesL = nPiecesIndex

End Sub

' 設置音樂
Public Sub MusicSetting(ByVal nMusicIndex As Integer)

frmHide.mci.Command = "Close"
If nMusicIndex < MUSIC_NONE Then
    frmHide.mci.FileName = App_szPath + "MUSICS\" + _
            Choose(nMusicIndex + 1, "CLASSIC", "EXPRESS", "FUNNY", "WALTZ", _
            "MOZART1", "MOZART4", "FLIGHT", "ANITRA", "HUMOUR", "JINGLE", "PAL", "CMUSIC") + ".MID"
    frmHide.mci.Command = "Open"
    frmHide.mci.Command = "Play"
End If
App_frmMain.mnOptionsMusicClassic.Checked = (nMusicIndex = MUSIC_CLASSIC)
App_frmMain.mnOptionsMusicExpress.Checked = (nMusicIndex = MUSIC_EXPRESS)
App_frmMain.mnOptionsMusicFunny.Checked = (nMusicIndex = MUSIC_FUNNY)
App_frmMain.mnOptionsMusicWaltz.Checked = (nMusicIndex = MUSIC_WALTZ)
App_frmMain.mnOptionsMusicMozart1.Checked = (nMusicIndex = MUSIC_MOZART1)
App_frmMain.mnOptionsMusicMozart4.Checked = (nMusicIndex = MUSIC_MOZART4)
App_frmMain.mnOptionsMusicFlight.Checked = (nMusicIndex = MUSIC_FLIGHT)
App_frmMain.mnOptionsMusicAnitra.Checked = (nMusicIndex = MUSIC_ANITRA)
App_frmMain.mnOptionsMusicHumour.Checked = (nMusicIndex = MUSIC_HUMOUR)
App_frmMain.mnOptionsMusicJingle.Checked = (nMusicIndex = MUSIC_JINGLE)
App_frmMain.mnOptionsMusicPal.Checked = (nMusicIndex = MUSIC_PAL)
App_frmMain.mnOptionsMusicTcf.Checked = (nMusicIndex = MUSIC_CMUSIC)
App_frmMain.mnOptionsMusicNone.Checked = (nMusicIndex = MUSIC_NONE)
Options_nMusic = nMusicIndex

End Sub

' 以上是圖片和聲音的處理例程

' 以下是參數設置例程

' 加載“日積月累”
Public Sub LoadTips()

Gui_szRegTip1 = "　　為使廣大棋迷更加方便地使用和收藏象棋巫師軟件，象棋巫師光盤版開始正式發售，售价28元(另加郵費10元)。" + vbCrLf + _
        "　　光盤版除了含有象棋巫師安裝包外，還包括趣味象棋、象棋百科全書選萃等精彩內容。" + vbCrLf + _
        "　　光盤版由著名网絡象棋記者北方好漢擔任發行代理，愿意訂購者可采用下列聯系方式：" + vbCrLf + _
        "　　QQ：113844662" + vbCrLf + "　　Email：herojang@126.com" + vbCrLf + "　　電話：0419-3224582"
Gui_szRegTip2 = "　　象棋巫師是款自由軟件，您可以通過以下网站對象棋巫師資助28元，成為該軟件的注冊用戶：" + vbCrLf + _
        "　　(1) 天空軟件站：http://shareware.skycn.com/soft/6752.htm" + vbCrLf + _
        "　　(2) 中國共享軟件注冊中心：http://www.softreg.com.cn/Detail.aspx?id=/B20ED382-82CB-48F5-9334-2D5FF85E482D/" + vbCrLf + _
        "　　以上网站支持网上銀行、手机銀行等多种安全付費方式，非常便捷。" + vbCrLf + _
        "　　注冊後您將獲得一個和您的用戶名對應的注冊碼，該注冊碼在象棋巫師的以後版本中仍然有效。" + vbCrLf + _
        "　　象棋巫師開發團隊將把您的資助款用于該軟件的推廣工作中，讓象棋巫師為更多的棋迷朋友服務。"
Gui_szTips(1) = "　　象棋巫師是一款功能強大的電腦對弈和棋譜編輯軟件，具有方便的人机對戰、棋譜記錄、欣賞、管理棋局的功能，完全可以滿足各層次象棋愛好者、棋手、裁判員及象棋文字工作者的各种需要。"
Gui_szTips(2) = "　　象棋巫師支持多個通用象棋引擎，他們大都具有專業棋手的水平，是象棋愛好者和專業棋手提高棋藝的良師益友。" + vbCrLf + _
        "　　如果您對象棋巫師自帶的引擎 ElephantEye 的表現不滿意，可以登錄 http://www.elephantbase.net/league.htm ，下載到其他各具特色的引擎。"
Gui_szTips(3) = "　　點擊“引擎執紅”或“引擎執黑”按鈕，就可以展開人机大戰，象棋巫師提供了五种不同的難度給用戶體驗。"
Gui_szTips(4) = "　　如果您不希望讓電腦走棋，而僅僅是想知道電腦在想些什么，或者讓電腦給你一些啟發，可以點擊“引擎分析”按鈕，打開思考細節窗口。" + vbCrLf + _
        "　　您可以把思考細節窗口中的思考路線复制下來，粘貼到主窗口中，對思考線路進行推演。"
Gui_szTips(5) = "　　象棋巫師強大的棋譜、棋圖導入和導出功能為您在网絡上和棋友交流提供了极大的方便。"
Gui_szTips(6) = "　　象棋巫師目前主要通過网絡發行，最新的版本可以從《象棋百科全書》网站獲得：" + vbCrLf + "　　http://www.elephantbase.net/"
Gui_szTips(7) = "　　目前网絡上已經有數以万計通用格式的棋譜文件(後綴.PGN)可供下載。您可以到以下頁面下載近15年內全國頂級象棋比賽的棋譜：http://www.elephantbase.net/resource.htm" + vbCrLf + _
        "　　同時也歡迎您將自己制作的文件上傳給我們。"
Gui_szTips(8) = "　　如果您對象棋巫師有什么意見或建議，可以跟象棋巫師開發團隊聯系，郵件地址是：" + vbCrLf + "　　webmaster@elephantbase.net" + vbCrLf + _
        "　　象棋巫師開發團隊非常希望和大家保持聯系。"
Gui_szTips(9) = "　　您可以雙擊桌面上的象棋巫師圖標(由棋子“象”、棋盤和巫師棒組成)直接啟動象棋巫師。"
Gui_szTips(10) = "　　如果您是一個象棋巫師的初學者，請您仔細閱讀本軟件“幫助”選單中的“幫助主題”并多加練習，祝您早日精通象棋巫師的各种功能。"
Gui_szTips(11) = "　　象棋巫師支持文件關聯功能，雙擊PGN文件(圖標是棋子“相”)可以打開棋譜，雙擊FEN文件(圖標是棋盤)可以打開局面。"
Gui_szTips(12) = "　　象棋巫師支持“象棋演播室”的棋譜。只要雙擊XQF文件(圖標是“象”字)，或者點擊“打開”按鈕并選擇一個XQF文件，象棋巫師就會打開這個棋譜。"
Gui_szTips(13) = "　　象棋巫師最适合800x600和1024x768的顯示分辯率，在“選項設置”對話框(“選項”選單中的“設置”一項)，把“界面”設成“大”，就可在1024x768的顯示分辯率下得到最舒适的顯示效果。"
Gui_szTips(14) = "　　為了方便校園网字符BBS的使用者交流棋譜、棋圖和發表文章，象棋巫師提供了文本棋譜和彩色ASCII字符棋圖的輸出功能。通過剪貼板，您可以在BBS上發表精美漂亮的棋譜和棋圖了。"
Gui_szTips(15) = "　　用Telnet在BBS上發ANSI動態棋譜時，點擊“复制ANSI動態棋譜”按鈕，再向Telnet中粘貼內容，保存貼子即可。" + vbCrLf + _
        "　　查看含有ANSI動態棋譜的貼子時，可根据貼子上的提示，按“↓”鍵瀏覽棋譜，當棋譜完全顯示出來後，按一次“↓”鍵棋局就走一步，很方便用戶觀賞棋局。"
Gui_szTips(16) = "　　使用“复制文本棋盤”功能，可以在BBS上貼出靜態的ANSI代碼，各大高校的BBS站都支持ANSI代碼。紅子用紅字表示，黑子用綠字表示，一目了然。" + vbCrLf + _
        "　　如果BBS不支持ANSI代碼，或者只是為了貼到普通文本上，可以在在“選項設置”對話框中把“使用ANSI文本棋盤”的鉤去掉。區別紅子和黑子的方法是：紅子的兩邊帶圓括號，黑子的兩邊帶方括號。"
Gui_szTips(17) = "　　如果該BBS系統是需要按兩次Escape鍵才能鍵入一個Escape字符(也可能取決于Telnet終端的設置)，那么可以在“選項設置”對話框中把“用兩個Esc輸入ANSI”鉤上。"
Gui_szTips(18) = "　　文本棋盤的最後一行諸如 rnbakabnr/... 的字符串是棋盤編碼(稱為FEN串)，如果您在网絡論壇上看到了這樣的FEN串，可以使用“局面”選單的“導入FEN串”功能，把棋盤導入到象棋巫師中，免去了擺放棋子位置的煩惱。"
Gui_szTips(19) = "　　點擊“查看PGN文件”按鈕，就可以看到棋譜文本，為粘貼到BBS上或者Word文檔中提供了方便。"
Gui_szTips(20) = "　　象棋巫師可讀入聯眾、弈天、中國游戲中心等中國象棋的存盤文件和大部分的文本棋譜文件，把這些含有著法的文本复制到剪貼板，點擊“從剪貼板導入”按鈕，這些著法就會錄制到象棋巫師中。"
Gui_szTips(21) = "　　象棋巫師可將棋譜導出為支持Java動態棋盤的HTML文本，特別适合將棋譜在网上發表。"
Gui_szTips(22) = "　　象棋巫師提供的棋譜鍵盤輸入法為喜歡鍵盤錄入棋譜的棋友提供了一种高效的棋譜輸入方法，棋友可根据自己的習慣在數字小鍵盤或WXF字母格式中任意選擇。"
Gui_szTips(23) = "　　在欣賞棋譜的過程中，點擊“播放棋局”按鈕就可從該步自動演示，演示的時間間隔可以自由調整。再次點擊“播放棋局”按鈕可停止自動演示。"
Gui_szTips(24) = "　　點擊“查看圖片棋盤”按鈕，把圖片棋盤复制并粘貼到Word等文字處理軟件中，可以生成漂亮的象棋稿件。"
Gui_szTips(25) = "　　在欣賞棋譜的過程中，可以使用棋盤倒置和左右調換功能來從不同的角度欣賞棋局。其中左右調換功能還可以一次將類似于“炮八平五”開局這樣的棋譜自動轉換成大家習慣的“炮二平五”。反之亦然。"
Gui_szTips(26) = "　　如果在欣賞棋譜時遇到复雜的局面，可以點擊“分析局面”按鈕，將當前棋局新開設一個象棋巫師的窗口，自由推演後續的變化。"
Gui_szTips(27) = "　　在兩個象棋巫師窗口中，靈活運用“查看PGN文件”和“從剪貼板導入”功能，可將推演棋盤中的棋譜記錄導入到當前棋局中。"
Gui_szTips(28) = "　　象棋巫師是個自由軟件，如果您覺得好用，可以自由地將本軟件上載到任一個共享軟件下載站點。" + vbCrLf + _
        "　　象棋巫師的源程序發布在 http://sourceforge.net/projects/xqwizard/ 這個頁面上，您可以根据自己的需要對源程序進行修改，并依照GPL協議發布您修改過的源程序。"
Gui_szTips(29) = "　　象棋巫師在開發過程中得到了廣大棋迷朋友的熱情支持，作者在此表示衷心的感謝，同時也希望您繼續支持象棋巫師，關注 http://www.elephantbase.net/ 。" + vbCrLf + _
        "　　您也可以將本軟件的主頁鏈接到自己的站點上。請您使用 http://www.elephantbase.net/ 作為鏈接的路徑。"

End Sub

' 從注冊表加載參數
Public Sub LoadRegs()

Options_bLargeGui = (Str2Int(GetSetting("XQWizard", "Options", "LargeGui", "1")) <> 0)
Options_bSounds = (Str2Int(GetSetting("XQWizard", "Options", "Sounds", "1")) <> 0)
Options_bAutoPlay = (Str2Int(GetSetting("XQWizard", "Options", "AutoPlay", "0")) <> 0)
Options_nPlayIntv = Str2Int(GetSetting("XQWizard", "Options", "PlayIntv", "1"), 1, 10)
Options_szJavaPath = GetSetting("XQWizard", "Options", "JavaPath", "http://www.elephantbase.net/java/")
Options_bEscapeDouble = (Str2Int(GetSetting("XQWizard", "Options", "EscapeDouble", "0")) <> 0)
Options_bAnsiText = (Str2Int(GetSetting("XQWizard", "Options", "AnsiText", "0")) <> 0)
Options_bMonoBitmap = (Str2Int(GetSetting("XQWizard", "Options", "MonoBitmap", "0")) <> 0)
Options_bAutoFlip = (Str2Int(GetSetting("XQWizard", "Options", "AutoFlip", "1")) <> 0)
Options_bEngineName = (Str2Int(GetSetting("XQWizard", "Options", "EngineName", "1")) <> 0)
Options_bAlwaysPonder = (Str2Int(GetSetting("XQWizard", "Options", "AlwaysPonder", "0")) <> 0)
Options_bAllowResign = (Str2Int(GetSetting("XQWizard", "Options", "AllowResign", "1")) <> 0)
Options_bEngineTime = (Str2Int(GetSetting("XQWizard", "Options", "EngineTime", "1")) <> 0)
Options_bStatusBar = (Str2Int(GetSetting("XQWizard", "Options", "StatusBar", "1")) <> 0)
Options_nEnginePlay = Str2Int(GetSetting("XQWizard", "Options", "EnginePlay", "2"), 0, ENGINE_PLAY_MAX - 1)
Options_bShowCoord = (Str2Int(GetSetting("XQWizard", "Options", "ShowCoord", "0")) <> 0)
Options_nBoardS = Str2Int(GetSetting("XQWizard", "Options", "BoardSmall", "3"), 0, BOARD_S_MAX - 1)
Options_nPiecesS = Str2Int(GetSetting("XQWizard", "Options", "PiecesSmall", "1"), 0, PIECES_S_MAX - 1)
Options_nBoardL = Str2Int(GetSetting("XQWizard", "Options", "BoardLarge", "1"), 0, BOARD_L_MAX - 1)
Options_nPiecesL = Str2Int(GetSetting("XQWizard", "Options", "PiecesLarge", "0"), 0, PIECES_L_MAX - 1)
Options_nMusic = Str2Int(GetSetting("XQWizard", "Options", "Music", "0"), 0, MUSIC_MAX - 1)
Options_bCheckUpdate = (Str2Int(GetSetting("XQWizard", "Options", "CheckUpdate", "1")) <> 0)
Options_bEngineUser = (Str2Int(GetSetting("XQWizard", "Options", "EngineUser", "0")) <> 0)
Gui_szUser = GetSetting("XQWizard", "Register", "User", "象棋巫師測試團隊")
Gui_szRegCode = GetSetting("XQWizard", "Register", "Code", "")
Gui_bShowHowTo = (Str2Int(GetSetting("XQWizard", "Gui", "ShowHowTo", "1")) <> 0)
Gui_nTipIndex = Str2Int(GetSetting("XQWizard", "Gui", "TipIndex", "1"), 1, TIP_NUM)
Gui_szUpgrade = GetSetting("XQWizard", "Gui", "Upgrade", STRING_VERSION)
Timer_nDepth = Str2Int(GetSetting("XQWizard", "Timer", "Depth", "-1"), LEVEL_GRANDMASTER, LEVEL_INFINITE)
Timer_bIncMode = Str2Int(GetSetting("XQWizard", "Timer", "IncMode", "0")) <> 0
Timer_nInitTime = Str2Int(GetSetting("XQWizard", "Timer", "InitTime", "2"), 1, 480)
Timer_nIncMove = Str2Int(GetSetting("XQWizard", "Timer", "IncMove", "120"), 1, 120)
Timer_nIncTime = Str2Int(GetSetting("XQWizard", "Timer", "IncTime", "1"), -60, 600)
Engine_bEngineLog = (Str2Int(GetSetting("XQWizard", "Engine", "EngineLog", "0")) <> 0)
Engine_szLogFile = GetSetting("XQWizard", "Engine", "LogFile", "")
Engine_bUseBook = (Str2Int(GetSetting("XQWizard", "Engine", "UseBook", "1")) <> 0)
Engine_bUseEgtb = (Str2Int(GetSetting("XQWizard", "Engine", "UseEgtb", "1")) <> 0)
Engine_szBookFiles = GetSetting("XQWizard", "Engine", "BookFiles", "")
Engine_szEgtbPaths = GetSetting("XQWizard", "Engine", "EgtbPaths", "")
Engine_nHash = Str2Int(GetSetting("XQWizard", "Engine", "Hash", "0"), 0, 7)
Engine_nThreads = Str2Int(GetSetting("XQWizard", "Engine", "Threads", "0"), 0, 6)
Engine_nDrawMoves = Str2Int(GetSetting("XQWizard", "Engine", "DrawMoves", "0"), 0, 5)
Engine_nRepetition = Str2Int(GetSetting("XQWizard", "Engine", "Repetition", "3"), 0, 3)
Engine_nPruning = Str2Int(GetSetting("XQWizard", "Engine", "Pruning", "3"), 0, 3)
Engine_nKnowledge = Str2Int(GetSetting("XQWizard", "Engine", "Knowledge", "3"), 0, 3)
Engine_nSelectivity = Str2Int(GetSetting("XQWizard", "Engine", "Selectivity", "0"), 0, 3)
Engine_nStyle = Str2Int(GetSetting("XQWizard", "Engine", "Style", "1"), 0, 2)
Engine_szFile = GetSetting("XQWizard", "Engine", "FileName", "")

End Sub

' 保存參數到注冊表
Public Sub SaveRegs()

SaveSetting "XQWizard", "Options", "LargeGui", IIf(Options_bLargeGui, "1", "0")
SaveSetting "XQWizard", "Options", "Sounds", IIf(Options_bSounds, "1", "0")
SaveSetting "XQWizard", "Options", "AutoPlay", IIf(Options_bAutoPlay, "1", "0")
SaveSetting "XQWizard", "Options", "PlayIntv", LTrim(Str(Options_nPlayIntv))
SaveSetting "XQWizard", "Options", "JavaPath", Options_szJavaPath
SaveSetting "XQWizard", "Options", "EscapeDouble", IIf(Options_bEscapeDouble, "1", "0")
SaveSetting "XQWizard", "Options", "AnsiText", IIf(Options_bAnsiText, "1", "0")
SaveSetting "XQWizard", "Options", "MonoBitmap", IIf(Options_bMonoBitmap, "1", "0")
SaveSetting "XQWizard", "Options", "AutoFlip", IIf(Options_bAutoFlip, "1", "0")
SaveSetting "XQWizard", "Options", "EngineName", IIf(Options_bEngineName, "1", "0")
SaveSetting "XQWizard", "Options", "AlwaysPonder", IIf(Options_bAlwaysPonder, "1", "0")
SaveSetting "XQWizard", "Options", "AllowResign", IIf(Options_bAllowResign, "1", "0")
SaveSetting "XQWizard", "Options", "EngineTime", IIf(Options_bEngineTime, "1", "0")
SaveSetting "XQWizard", "Options", "StatusBar", IIf(Options_bStatusBar, "1", "0")
SaveSetting "XQWizard", "Options", "EnginePlay", LTrim(Str(Options_nEnginePlay))
SaveSetting "XQWizard", "Options", "ShowCoord", IIf(Options_bShowCoord, "1", "0")
SaveSetting "XQWizard", "Options", "BoardSmall", LTrim(Str(Options_nBoardS))
SaveSetting "XQWizard", "Options", "PiecesSmall", LTrim(Str(Options_nPiecesS))
SaveSetting "XQWizard", "Options", "BoardLarge", LTrim(Str(Options_nBoardL))
SaveSetting "XQWizard", "Options", "PiecesLarge", LTrim(Str(Options_nPiecesL))
SaveSetting "XQWizard", "Options", "Music", LTrim(Str(Options_nMusic))
SaveSetting "XQWizard", "Options", "CheckUpdate", IIf(Options_bCheckUpdate, "1", "0")
SaveSetting "XQWizard", "Options", "EngineUser", IIf(Options_bEngineUser, "1", "0")
SaveSetting "XQWizard", "Register", "User", Gui_szUser
SaveSetting "XQWizard", "Register", "Code", Gui_szRegCode
SaveSetting "XQWizard", "Gui", "ShowHowTo", IIf(Gui_bShowHowTo, "1", "0")
SaveSetting "XQWizard", "Gui", "TipIndex", LTrim(Str(Gui_nTipIndex))
SaveSetting "XQWizard", "Gui", "Upgrade", Gui_szUpgrade
SaveSetting "XQWizard", "Timer", "Depth", LTrim(Str(Timer_nDepth))
SaveSetting "XQWizard", "Timer", "IncMode", IIf(Timer_bIncMode, "1", "0")
SaveSetting "XQWizard", "Timer", "InitTime", LTrim(Str(Timer_nInitTime))
SaveSetting "XQWizard", "Timer", "IncMove", LTrim(Str(Timer_nIncMove))
SaveSetting "XQWizard", "Timer", "IncTime", LTrim(Str(Timer_nIncTime))
SaveSetting "XQWizard", "Engine", "EngineLog", IIf(Engine_bEngineLog, "1", "0")
SaveSetting "XQWizard", "Engine", "LogFile", Engine_szLogFile
SaveSetting "XQWizard", "Engine", "UseBook", IIf(Engine_bUseBook, "1", "0")
SaveSetting "XQWizard", "Engine", "UseEgtb", IIf(Engine_bUseEgtb, "1", "0")
SaveSetting "XQWizard", "Engine", "BookFiles", Engine_szBookFiles
SaveSetting "XQWizard", "Engine", "EgtbPaths", Engine_szEgtbPaths
SaveSetting "XQWizard", "Engine", "Hash", LTrim(Str(Engine_nHash))
SaveSetting "XQWizard", "Engine", "Threads", LTrim(Str(Engine_nThreads))
SaveSetting "XQWizard", "Engine", "DrawMoves", LTrim(Str(Engine_nDrawMoves))
SaveSetting "XQWizard", "Engine", "Repetition", LTrim(Str(Engine_nRepetition))
SaveSetting "XQWizard", "Engine", "Pruning", LTrim(Str(Engine_nPruning))
SaveSetting "XQWizard", "Engine", "Knowledge", LTrim(Str(Engine_nKnowledge))
SaveSetting "XQWizard", "Engine", "Selectivity", LTrim(Str(Engine_nSelectivity))
SaveSetting "XQWizard", "Engine", "Style", LTrim(Str(Engine_nStyle))
SaveSetting "XQWizard", "Engine", "FileName", Engine_szFile

End Sub

' 以上是參數設置例程

' 以下是主函數例程

Public Sub Main()

Dim dfThisTime As Double, nEventIndex As Integer, nLogFileNo As Integer
Dim i As Integer, sz As String, szWhatsNew As String

Randomize Timer
App_szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")
CchessInit True
EccoInitOpenVar True
LoadRegs
LoadTips
If Options_bLargeGui Then
    Set App_frmMain = frmMainLarge
    For i = 0 To 29
        Set App_picPieces(i) = frmHide.imgPiecesLarge(i)
    Next
    Set App_picEngineRed = frmHide.imgEngineRedLarge.Picture
    Set App_picEngineBlack = frmHide.imgEngineBlackLarge.Picture
    On Error Resume Next
    frmHide.imgBoard.Picture = LoadPicture(App_szPath + "IMAGES_S\" + _
            Choose(Options_nBoardS + 1, "GREEN", "RED", "WHITE", "WOOD", "SHEET", "CANVAS", "DROPS", _
            "CLOUDS", "STONE", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL", "SIMPLE") + ".GIF")
    sz = App_szPath + "IMAGES_S\" + Choose(Options_nPiecesS + 1, "NORMAL", "WOOD", "POLISH", "STONE", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL", "SIMPLE") + "\"
    For i = 0 To 29
        frmHide.imgPiecesSmall(i).Picture = LoadPicture(sz + PieceFileName(i) + ".GIF")
    Next
    For i = 0 To 5
        Set App_picCoord(i) = LoadPicture(App_szPath + "\IMAGES_L\" + _
                Choose(i + 1, "COORD", "FLIP", "WXF", "WXF", "ICCS", "ICCSFLIP") + ".GIF")
    Next
    On Error GoTo 0
    BoardSettingLarge Options_nBoardL
    PiecesSettingLarge Options_nPiecesL
Else
    Set App_frmMain = frmMainSmall
    For i = 0 To 29
        Set App_picPieces(i) = frmHide.imgPiecesSmall(i)
    Next
    Set App_picEngineRed = frmHide.imgEngineRed.Picture
    Set App_picEngineBlack = frmHide.imgEngineBlack.Picture
    On Error Resume Next
    For i = 0 To 5
        Set App_picCoord(i) = LoadPicture(App_szPath + "\IMAGES_S\" + _
                Choose(i + 1, "COORD", "FLIP", "WXF", "WXF", "ICCS", "ICCSFLIP") + ".GIF")
    Next
    On Error GoTo 0
    BoardSettingSmall Options_nBoardS
    PiecesSettingSmall Options_nPiecesS
End If
App_frmMain.Show
App_frmMain.txtMove.SetFocus
MusicSetting Options_nMusic
Timer_bEnabled = False

App_bRegistered = (UCase(Gui_szRegCode) = Crc32Hex(Gui_szUser))
If Gui_bShowHowTo Or Not App_bRegistered Then
    frmHowTo.Show vbModal, App_frmMain
End If
If Options_bCheckUpdate Then
    sz = STRING_VERSION
    On Error Resume Next
    sz = frmHide.Inet.OpenURL("http://www.elephantbase.net/xqwizard/version_trid.php")
    On Error GoTo 0
    If Val(sz) > Val(STRING_VERSION) + 0.005 And Val(sz) > Val(Gui_szUpgrade) + 0.005 Then
        szWhatsNew = ""
        On Error Resume Next
        szWhatsNew = frmHide.Inet.OpenURL("http://www.elephantbase.net/xqwizard/whatsnew_trid.txt")
        On Error GoTo 0
        If MsgBox(IIf(szWhatsNew = "", "象棋巫師 " + sz + " 已經發布，需要下載最新版本嗎？", szWhatsNew), vbQuestion + vbYesNo) = vbYes Then
            If Rnd < 0.5 Then
                ShellExecuteA 0, vbNullString, "http://www.skycn.net/soft/35392.html", vbNullString, vbNullString, SW_SHOWNORMAL
            Else
                ShellExecuteA 0, vbNullString, "http://www.onlinedown.net/soft/47666.htm", vbNullString, vbNullString, SW_SHOWNORMAL
            End If
        Else
            Gui_szUpgrade = sz
        End If
    End If
End If

Engine_nStatus = IDLE_UNLOAD
If Engine_bEngineLog And Engine_szLogFile <> "" Then
    nLogFileNo = FreeFile
    On Error Resume Next
    Open Engine_szLogFile For Output As #nLogFileNo
    Close #nLogFileNo
    On Error GoTo 0
End If
OpenEngine
App_bRunning = True
If Command = "" Then
    App_szFileName = ""
    RestartGame
    BoardFlush
    CoordFlush
    LabelFlush
    MoveFlush
    EngineNewGame
Else
    If UCase(Left(Command, 3)) = "/S " Or UCase(Left(Command, 3)) = "-S " Then
        sz = Mid(Command, 4)
        If Left(sz, 1) = Chr(34) And Right(sz, 1) = Chr(34) Then
            sz = Mid(sz, 2, Len(sz) - 2)
        End If
        LoadFenStr sz
    ElseIf UCase(Left(Command, 3)) = "/F " Or UCase(Left(Command, 3)) = "-F " Then
        sz = Mid(Command, 4)
        If Left(sz, 1) = Chr(34) And Right(sz, 1) = Chr(34) Then
            sz = Mid(sz, 2, Len(sz) - 2)
        End If
        LoadFenFile sz
    Else
        App_szFileName = Command
        If Left(App_szFileName, 1) = Chr(34) And Right(App_szFileName, 1) = Chr(34) Then
            App_szFileName = Mid(App_szFileName, 2, Len(App_szFileName) - 2)
        End If
        ReadFile
        LabelFlush
    End If
End If
nEventIndex = EVENT_TIMER
Do While App_bRunning
    ' 始終把接收引擎的事件放在第一位(高优先級)
    If Not ReceiveEngine Then
        ' 輪轉循環，依次檢測以下几個事件
        Select Case nEventIndex
        Case EVENT_TIMER ' 時間
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
                        MsgBox IIf(Game_sdMax = 0, "紅方超時作負！", "黑方超時作負！"), vbInformation
                        Game_nResult = IIf(Game_sdMax = 0, RESULT_BLACKWIN, RESULT_REDWIN)
                        Timer_bOver(Game_sdMax) = True
                        Timer_nTimeLeft(Game_sdMax) = 0
                        App_frmMain.lblResult = ResultString
                    End If
                    SetTimer
                End If
            End If
            nEventIndex = EVENT_PLAY
        Case EVENT_PLAY ' 播放棋局
            If App_bPlay Then
                dfThisTime = Timer
                dfThisTime = dfThisTime + IIf(dfThisTime < Timer_dfLastTime, 86400#, 0#)
                If dfThisTime > Timer_dfLastTime + Options_nPlayIntv Then
                    Timer_dfLastTime = Timer
                    MoveForward
                    MoveFlush
                End If
            End If
            nEventIndex = EVENT_ENGINE
        Case EVENT_ENGINE ' 引擎(是否應該開始思考了)
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
            nEventIndex = EVENT_MUSIC
        Case EVENT_MUSIC ' 音樂
            If Options_nMusic < MUSIC_NONE Then
                If frmHide.mci.Length = frmHide.mci.Position Then
                    frmHide.mci.To = 0
                    frmHide.mci.Command = "Seek"
                    frmHide.mci.Command = "Play"
                End If
            End If
            nEventIndex = EVENT_GUI
        Case EVENT_GUI ' 界面
            DoEvents
            nEventIndex = EVENT_TIMER
        End Select
        Sleep 1
    End If
Loop
SaveRegs
PlaySoundA vbNullString, 0, 0
frmHide.mci.Command = "Close"
Unload frmHide

End Sub

' 以上是主函數例程
