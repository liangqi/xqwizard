Attribute VB_Name = "mdlMain"
' XQWMAIN.BAS - Source Code for XiangQi Wizard, Part I
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 4.41, Last Modified: Nov. 2009
' Copyright (C) 2004-2009 www.elephantbase.net
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

' 沒有聲音的MsgBox
Private Type MsgBoxParams
    cbSize As Long
    hwndOwner As Long
    hInstance As Long
    lpszText As String
    lpszCaption As String
    dwStyle As Long
    lpszIcon As Long
    dwContextHelpId As Long
    lpfnMsgBoxCallback As Long
    dwLanguageId As Long
End Type

Private Const MB_USERICON       As Long = 128
Private Const MB_YESNO          As Long = 4
Private Const IDI_QUESTION      As Long = 32514

Private Declare Function MessageBoxIndirectA Lib "USER32.DLL" (ByRef lpMsgBoxParams As MsgBoxParams) As Long

' 全局常量——象棋巫師信息
Public Const STRING_VERSION     As String = "4.41"
Public Const STRING_COPYRIGHT   As String = "(C) 2004-2009 www.elephantbase.net"
Public Const TIP_NUM            As Integer = 21   ' 日積月累條目數
Public Const QUOTE_NUM          As Integer = 12   ' 名言條目數
Public Const ICON_QUOTE         As Integer = 8    ' 名言圖標
Public Const MAX_ENDGAMES       As Integer = 1024 ' 殘局的最大條目數
Public Const TEMP_FILE_NAME     As String = "查看文本棋譜(只讀).TXT"
' 全局常量——可選參數
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
Public Const MANUAL_UPDATE      As Boolean = True ' CheckUpdate
' 全局常量——引擎狀態
Public Const IDLE_UNLOAD        As Integer = 0 ' 沒有加載引擎
Public Const IDLE_READY         As Integer = 1 ' 引擎待命(如果輪到電腦走棋，那么引擎立即工作)
Public Const IDLE_REST          As Integer = 2 ' 引擎休息(即使輪到電腦走棋，引擎也不工作，除非狀態改變)
Public Const IDLE_PONDER        As Integer = 3 ' 後臺思考結束(等待對手走完一步，再作相應處理)
Public Const BUSY_WAIT          As Integer = 4 ' 等待引擎停止思考
Public Const BUSY_ANALYZE       As Integer = 5 ' 引擎以分析方式思考(引擎不執任何一方，打開“引擎分析”功能)
Public Const BUSY_THINK         As Integer = 6 ' 引擎正常思考
Public Const BUSY_PONDER        As Integer = 7 ' 引擎後臺思考
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
Public Const ENGINE_PLAY_TURN   As Integer = 3
Public Const ENGINE_PLAY_RANDOM As Integer = 4
Public Const ENGINE_PLAY_MAX    As Integer = 5
' 全局常量——Flash棋盤大小
Public Const FLASHXQ_SMALL      As Integer = 0
Public Const FLASHXQ_MEDIUM     As Integer = 1
Public Const FLASHXQ_LARGE      As Integer = 2
' 全局常量——棋盤(小)設置選項
Public Const BOARD_S_WOOD       As Integer = 0
Public Const BOARD_S_GREEN      As Integer = 1
Public Const BOARD_S_WHITE      As Integer = 2
Public Const BOARD_S_SHEET      As Integer = 3
Public Const BOARD_S_CANVAS     As Integer = 4
Public Const BOARD_S_DROPS      As Integer = 5
Public Const BOARD_S_CLOUDS     As Integer = 6
Public Const BOARD_S_XQSTUDIO   As Integer = 7
Public Const BOARD_S_MOVESKY    As Integer = 8
Public Const BOARD_S_MRSJ       As Integer = 9
Public Const BOARD_S_ZMBL       As Integer = 10
Public Const BOARD_S_QIANHONG   As Integer = 11
Public Const BOARD_S_MAX        As Integer = 12
' 全局常量——棋子(小)設置選項
Public Const PIECES_S_WOOD      As Integer = 0
Public Const PIECES_S_DELICATE  As Integer = 1
Public Const PIECES_S_POLISH    As Integer = 2
Public Const PIECES_S_XQSTUDIO  As Integer = 3
Public Const PIECES_S_MOVESKY   As Integer = 4
Public Const PIECES_S_MRSJ      As Integer = 5
Public Const PIECES_S_ZMBL      As Integer = 6
Public Const PIECES_S_MAX       As Integer = 7
' 全局常量——棋盤(大)設置選項
Public Const BOARD_L_WOOD       As Integer = 0
Public Const BOARD_L_GREEN      As Integer = 1
Public Const BOARD_L_WHITE      As Integer = 2
Public Const BOARD_L_SHEET      As Integer = 3
Public Const BOARD_L_CANVAS     As Integer = 4
Public Const BOARD_L_DROPS      As Integer = 5
Public Const BOARD_L_QIANHONG   As Integer = 6
Public Const BOARD_L_MAX        As Integer = 7
' 全局常量——棋子(大)設置選項
Public Const PIECES_L_WOOD      As Integer = 0
Public Const PIECES_L_DELICATE  As Integer = 1
Public Const PIECES_L_POLISH    As Integer = 2
Public Const PIECES_L_MAX       As Integer = 3
' 全局常量——音樂設置選項
Public Const MUSIC_EXPRESS      As Integer = 0
Public Const MUSIC_FUNNY        As Integer = 1
Public Const MUSIC_CLASSIC      As Integer = 2
Public Const MUSIC_MOZART1      As Integer = 3
Public Const MUSIC_MOZART4      As Integer = 4
Public Const MUSIC_FULELISE     As Integer = 5
Public Const MUSIC_LOVDREAM     As Integer = 6
Public Const MUSIC_WALTZ        As Integer = 7
Public Const MUSIC_HUMOUR       As Integer = 8
Public Const MUSIC_PAL          As Integer = 9
Public Const MUSIC_CMUSIC       As Integer = 10
Public Const MUSIC_NONE         As Integer = 11
Public Const MUSIC_MAX          As Integer = 12
' 全局常量——循環事件
Public Const EVENT_TIMER        As Integer = 0
Public Const EVENT_PLAY         As Integer = 1
Public Const EVENT_ENGINE       As Integer = 2
Public Const EVENT_MUSIC        As Integer = 3
Public Const EVENT_ADVERT       As Integer = 4
Public Const EVENT_GUI          As Integer = 5
' 全局常量——棋盤坐標
Public Const COORD_CHAR         As String = "１２３４５６７８９九八七六五四三二一"
' 全局常量——讓子
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
Public Const PUB_LOCATION_ZGXQDS As Integer = 0
Public Const PUB_LOCATION_TIEBA As Integer = 1
Public Const PUB_LOCATION_ZHIDAO As Integer = 2
Public Const PUB_LOCATION_SINA  As Integer = 3
Public Const PUB_LOCATION_QZONE As Integer = 4
Public Const PUB_LOCATION_OTHER As Integer = 5
Public Const PUB_LOCATION_MAX   As Integer = 6
' 全局常量——发布格式
Public Const PUB_FORMAT_TEXT    As Integer = 0
Public Const PUB_FORMAT_ANSI    As Integer = 1
Public Const PUB_FORMAT_UBB     As Integer = 2
Public Const PUB_FORMAT_HTML    As Integer = 3
Public Const PUB_FORMAT_WEB     As Integer = 4
Public Const PUB_FORMAT_MAX     As Integer = 5

' 全局變量——程序
Public App_frmMain              As Form     ' 主窗口對象引用
Public App_picPieces(0 To 31)   As Picture  ' 棋子圖片對象引用
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
Public App_sqMate               As Integer  ' 被將死的帥(將)
Public App_bPlay                As Integer  ' 播放棋局
Public App_bRedTurn             As Boolean  ' 紅黑輪流標志
Public App_bPromotion           As Boolean  ' 是否允許升變
Public App_bPrevInstance        As Boolean  ' 是否再一次啟動
Public App_nEndgames            As Integer  ' 讀入的殘局數量
Public App_szEndgames(0 To MAX_ENDGAMES - 1) As String ' 讀入的殘局
' 全局變量——選項
Public Options_bLargeGui        As Boolean  ' 大界面
Public Options_bSounds          As Boolean  ' 聲音
Public Options_bAutoPlay        As Boolean  ' 自動播放
Public Options_nPlayIntv        As Integer  ' 播放間隔(秒)
Public Options_bEscapeDouble    As Boolean  ' 用兩個Esc輸入ANSI
Public Options_bAnsiText        As Boolean  ' 使用ANSI文本棋盤
Public Options_bMonoBitmap      As Boolean  ' 圖片棋盤的紅子用白底紅字表示
Public Options_bPrintDigit      As Boolean  ' 印刷棋盤上下顯示數字
Public Options_nFlashXQ         As Integer  ' Flash棋盤尺寸
Public Options_nMoveDelay       As Integer  ' 走子延時
Public Options_bAutoFlip        As Boolean  ' 自動翻轉棋盤
Public Options_bEngineName      As Boolean  ' 顯示引擎名稱
Public Options_bAllowResign     As Boolean  ' 允許引擎認輸
Public Options_bAlwaysPonder    As Boolean  ' 啟用後臺思考
Public Options_bEngineTime      As Boolean  ' 顯示引擎速度
Public Options_bStatusBar       As Boolean  ' 輸出到狀態欄
Public Options_nEnginePlay      As Integer  ' 新局引擎狀態
Public Options_nBoardS          As Integer  ' 小界面的棋盤
Public Options_nPiecesS         As Integer  ' 小界面的棋子
Public Options_nBoardL          As Integer  ' 大界面的棋盤
Public Options_nPiecesL         As Integer  ' 大界面的棋子
Public Options_nMusic           As Integer  ' 音樂
Public Options_bTopMost         As Integer  ' 總在最前面
Public Options_bPromptSave      As Boolean  ' 提示保存
Public Options_bAutoSave        As Boolean  ' 自動保存
Public Options_szUser           As String   ' 人机對弈用戶
Public Options_bShowNew         As Boolean  ' 啟動時顯示“開始對局”對話框
' 全局變量——界面
Public Gui_nLeft                As Long     ' 窗口坐標
Public Gui_nTop                 As Long     ' 窗口坐標
Public Gui_nEndgamesIndex       As Integer  ' 殘局的條目序號
Public Gui_szEpdName            As String   ' 殘局文件名
Public Gui_szEpdTitle           As String   ' 殘局標題
Public Gui_bShowHowTo           As Boolean  ' 啟動時顯示“日積月累”
Public Gui_nTipIndex            As Integer  ' “日積月累”的條目序號
Public Gui_szTips(1 To TIP_NUM) As String   ' “日積月累”的條目
Public Gui_szQuotes(1 To QUOTE_NUM) As String ' “名言”的條目
Public Gui_szUpgradeVer         As String   ' 檢查升級的版本
Public Gui_szUpgradeDate        As String   ' 檢查升級的日期
Public Gui_szAdvertDate         As String   ' 檢查廣告的日期
Public Gui_nAdvertIndex         As Integer  ' 當前廣告序號
Public Gui_dfLastTime           As Double   ' 當前時間(每天00:00過去的秒數)
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
Public Game_bStartPos           As Boolean  ' 是否開始於初始局面
Public Game_cntStart            As Integer  ' 起始回合數
Public Game_sdStart             As Integer  ' 起始走子方
Public Game_cntCurr             As Integer  ' 當前回合數
Public Game_sdCurr              As Integer  ' 當前走子方
Public Game_sdMax               As Integer  ' 最後走子方
Public Game_nFormat             As Integer  ' 記譜格式
Public Game_mvMove(1 To 1998)   As Long     ' 著法列表
Public Game_szMoveText(0 To 2, 1 To 1998) As String ' 記譜列表
Public Game_szComment(0 To 1998) As String          ' 注釋列表
Public Game_szIrrevFen(0 To 40) As String           ' 不可逆局面FEN串列表
Public Game_posIrrev(0 To 40)   As PositionStruct   ' 不可逆局面列表
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
Public Timer_nIncMove           As Integer  ' 時段製的每時段步數
Public Timer_nIncTime           As Integer  ' 加時製的加時秒數
Public Timer_nTimeLeft(0 To 1)  As Integer  ' 雙方剩余時間
Public Timer_nTimeElapsed(0 To 1) As Integer ' 雙方已經用去的時間
Public Timer_nMoveLeft(0 To 1)  As Integer  ' 加時製的該時段剩余要走的步數
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
Public Engine_nRandomness       As Integer  ' 隨机
Public Engine_nStyle            As Integer  ' 風格
Public Engine_szFile            As String   ' 引擎文件
Public Engine_pipe          As PipeStruct   ' 引擎管道
Public Engine_nStatus           As Integer  ' 引擎狀態
Public Engine_nTimeRatio        As Long     ' 引擎時間比例(秒製是1，毫秒製是1000)
Public Engine_szName            As String   ' 引擎名稱
Public Engine_szVersion         As String   ' 引擎版本
Public Engine_szCopyright       As String   ' 引擎版權
Public Engine_szAuthor          As String   ' 引擎作者
Public Engine_szUser            As String   ' 引擎用戶
Public Engine_posBoard  As PositionStruct   ' 引擎思考的局面
Public Engine_dwTime            As Double   ' 引擎思考的時間
Public Engine_nMoves            As Integer  ' 引擎思考的局面的總走法數
Public Engine_nDepth            As Integer  ' 引擎思考的深度
Public Engine_nCurrMove         As Integer  ' 引擎思考的局面的當前走法數
Public Engine_bRed              As Boolean  ' 引擎執紅
Public Engine_bBlack            As Boolean  ' 引擎執黑
Public Engine_bPonder           As Boolean  ' 後臺思考
Public Engine_bAnalyze          As Boolean  ' 引擎分析
Public Engine_mvPonder          As Long     ' 後臺思考猜測著法
Public Engine_mvPonderFinished  As Long     ' 後臺思考完成的著法
Public Engine_mvPonderFinishedPonder As Long ' 後臺思考完成的猜測著法
Public Engine_bPonderFinishedResign As Long ' 後臺思考完成後認輸
Public Engine_bPonderFinishedDraw As Long   ' 後臺思考完成後提和或接受提和
Public Engine_szPonderStr       As String   ' 後臺思考指令串
Public Engine_bDraw             As Integer  ' 提和
Public Engine_mvBan             As Long     ' 禁著
Public Engine_bSlaveRed         As Boolean  ' 副引擎執紅
Public Engine_bSlaveBlack       As Boolean  ' 副引擎執黑
Public Engine_pipeSlave     As PipeStruct   ' 副引擎管道
Public Engine_nTimeRatioSlave   As Long     ' 副引擎時間比例
Public Engine_szSlaveName       As String   ' 副引擎名稱

' 以下是實用函數例程

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

' 顯示著法前的回合數，紅方格式是“???. 某某某某”，黑方格式是“     某某某某”，著法是對齊的
Public Function NumberText(cnt As Integer, sd As Integer) As String

NumberText = IIf(sd = 0, LTrim(Str(cnt)) + ".", Space(Len(Str(cnt))))

End Function

' 打開文件對話框
Public Function FileDialog(ByVal szTitle As String, ByVal szFileType As String, ByVal szExt As String, Optional ByVal szSave As String = "") As String

Dim szFileName As String, szFilter As String
szFilter = szFileType + " (*." + szExt + ")|*." + szExt + "|所有文件 (*.*)|*.*"
If szSave = "" Then
    szFileName = OpenFileDialog(szTitle, szFilter)
Else
    szFileName = szSave
    szFileName = Replace(szFileName, "\", "﹨")
    szFileName = Replace(szFileName, "/", "∕")
    szFileName = Replace(szFileName, ":", "：")
    szFileName = Replace(szFileName, "*", "＊")
    szFileName = Replace(szFileName, "?", "？")
    ' 全角雙引號用在某些操作系統上不正常，所以用半角單引號代替
    szFileName = Replace(szFileName, """", "'")
    szFileName = Replace(szFileName, "<", "＜")
    szFileName = Replace(szFileName, ">", "＞")
    szFileName = Replace(szFileName, "|", "｜")
    szFileName = SaveFileDialog(szTitle, szFilter, szFileName + "." + szExt, szExt)
End If
FileDialog = szFileName

End Function

' 播放聲音
Public Sub PlayWavSound(ByVal szSoundFile As String)

If Options_bSounds Then
    PlaySoundA App_szPath + "SOUNDS\" + szSoundFile + ".WAV", 0, SND_ASYNC + SND_NOWAIT + SND_FILENAME
End If

End Sub

' 总在最前面
Public Sub SetTopMost(ByVal hWnd As Long)

If Options_bTopMost Then
    SetWindowPos hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
End If

End Sub

' 以上是實用函數例程

' 以下是文件操作例程

' 從"szSrc"中獲得PGN棋譜的標簽，如果有此標簽則返回True，標簽內容保存到"szDst"變量中，反之返回False
Public Function GetLabel(ByRef szDst As String, ByVal szSrc As String, ByVal szLabelName As String) As Boolean

Dim nLen As Integer, i As Integer
nLen = Len(szLabelName)
If UCase(Left(szSrc, nLen + 3)) = "[" + szLabelName + " """ Then
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
                    mv = CchessFile2Move(CchessChin2File(CvC(szMoveStr)), Game_posIrrev(Game_nCurrIrrev))
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
End If
ImportLine = False

End Function

' 讀PGN棋譜，如果是XQF、MXQ、CHE、CHN或CCM棋譜則首先轉換為PGN棋譜
Public Sub ReadFile(Optional ByVal bAutoSave As Boolean = False)

Dim i As Integer, nFileNo As Integer
Dim bNoTitle As Boolean, bCchess As Boolean, bDetail As Boolean
Dim szChineseChess As String, szResult As String, szFormat As String, szFenStr As String
Dim szLineStr As String, szLineStrEx As String, szRemStr As String, nRemLevel As Integer

bNoTitle = False
If UCase(Right(App_szFileName, 4)) = ".XQF" Then
    ConvXqf2Pgn App_szFileName, App_szPath + "AUTOSAVE.PGN"
    bNoTitle = True
ElseIf UCase(Right(App_szFileName, 4)) = ".MXQ" Then
    ConvMxq2Pgn App_szFileName, App_szPath + "AUTOSAVE.PGN"
    bNoTitle = True
ElseIf UCase(Right(App_szFileName, 4)) = ".CHE" Then
    ConvChe2Pgn App_szFileName, App_szPath + "AUTOSAVE.PGN"
    bNoTitle = True
ElseIf UCase(Right(App_szFileName, 4)) = ".CHN" Then
    ConvChn2Pgn App_szFileName, App_szPath + "AUTOSAVE.PGN"
    bNoTitle = True
ElseIf UCase(Right(App_szFileName, 4)) = ".CCM" Then
    ConvCcm2Pgn App_szFileName, App_szPath + "AUTOSAVE.PGN"
    bNoTitle = True
End If
If bAutoSave Or bNoTitle Then
    App_szFileName = ""
    RestartGame
    App_szFileName = App_szPath + "AUTOSAVE.PGN"
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
            MsgBox App_szFileName + " 可能不是中國象棋的PGN文件。", vbExclamation
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
    MsgBox "無法打開文件 " + App_szFileName, vbExclamation
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

' 存儲標簽
Public Function PutLabel(ByVal LabelName As String, ByVal LabelValue As String) As String

LabelValue = Replace(LabelValue, Chr(13), "")
LabelValue = Replace(LabelValue, Chr(10), "")
PutLabel = "[" + LabelName + " """ + LabelValue + """]"

End Function

' 寫PGN棋譜
Public Sub WriteFile(Optional ByVal bTempFile As Boolean = False)

Dim sd As Integer, cnt As Integer
Dim i As Integer, bReturned As Boolean, nFileNo As Integer
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open IIf(bTempFile, App_szPath + TEMP_FILE_NAME, App_szFileName) For Output As #nFileNo
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
Print #nFileNo, " 歡迎訪問《象棋百科全書網》 "
Print #nFileNo, " 推荐用《象棋巫師》觀賞棋譜 "
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
MsgBox "無法打開文件 " + IIf(bTempFile, App_szPath + TEMP_FILE_NAME, App_szFileName), vbExclamation

End Sub

' 如果棋局改動過，就要設置“已更新”狀態，保存功能有效
Public Sub FileUpdated()

App_bUpdated = True
App_frmMain.mnFileSave.Enabled = True
App_frmMain.tlb.Buttons("FileSave").Enabled = True

End Sub

' 打開棋譜
Public Sub OpenFile()

Dim szFileName As String
szFileName = OpenFileDialog("打開棋譜文件", "所有棋譜 (*.PGN;*.XQF;*.MXQ;*.CHE;*.CHN;*.CCM)|*.PGN;*.XQF;*.MXQ;*.CHE;*.CHN;*.CCM|" + _
        "可移植棋譜 (*.PGN)|*.PGN|象棋演播室棋譜 (*.XQF)|*.XQF|弈天棋譜 (*.MXQ)|*.MXQ|QQ象棋棋譜 (*.CHE)|*.CHE|聯眾象棋棋譜 (*.CHN)|*.CHN|中游象棋棋譜 (*.CCM)|*.CCM|所有文件 (*.*)|*.*")
If szFileName <> "" Then
    App_szFileName = szFileName
    ReadFile
End If

End Sub

' 如果是“已更新”狀態，那么提示保存PGN棋譜
Public Function CancelSave() As Boolean

If Not (Options_bPromptSave And App_bUpdated) Then
    CancelSave = False
    Exit Function
End If
Select Case MsgBox(IIf(App_szFileName = "", "文件已更改。", "文件 " + App_szFileName + " 已更改。") + vbCrLf + "是否保存更改？", vbYesNoCancel + vbExclamation)
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

' 實現“另存為”功能
Public Function SaveFileAs()

Dim sz As String
sz = FileDialog("保存棋譜文件", "可移植棋譜", "PGN", DefaultFileName)
If sz <> "" Then
    App_szFileName = sz
    SetTitle
    WriteFile
    SaveFileAs = True
Else
    SaveFileAs = False
End If

End Function

' 實現“輸出為XQF格式”功能
Public Sub ExportXqf()

Dim sz As String
sz = FileDialog("輸出為XQF格式", "象棋演播室棋譜", "XQF", DefaultFileName)
If sz <> "" Then
    WriteFile WRITE_TEMP_FILE
    ConvPgn2Xqf App_szPath + TEMP_FILE_NAME, sz
End If

End Sub

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

' 以下是界面控製例程

' 輸出時間格式："hh:mm:ss"
Public Function TimeText(ByVal nSeconds As Long) As String

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
    If Len(Game_szRound) > 5 Then
        sz = sz + Game_szRound
    Else
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
End If
EventString = sz

End Function

' 比賽結果字符串
Public Function ResultString() As String

If Game_szRedPlayer = "" Or Game_szBlackPlayer = "" Then
    ResultString = "(著法：" + IIf(Game_sdStart = 0, "紅先", "黑先") + Choose(Game_nResult + 1, "", IIf(Game_sdStart = 0, "胜", "負"), "和", IIf(Game_sdStart = 0, "負", "胜")) + ")"
Else
    ResultString = Game_szRedTeam + IIf(Game_szRedTeam = "", "", " ") + Game_szRedPlayer + _
            Choose(Game_nResult + 1, " (對) ", IIf(Game_sdStart = 0, " (先胜) ", " (後胜) "), IIf(Game_sdStart = 0, " (先和) ", " (後和) "), IIf(Game_sdStart = 0, " (先負) ", " (後負) ")) + _
            Game_szBlackTeam + IIf(Game_szBlackTeam = "", "", " ") + Game_szBlackPlayer
End If

End Function

' 日期和地點字符串
Public Function DateSiteString() As String

If Game_szDate = "" Then
    DateSiteString = IIf(Game_szSite = "", "", "(弈於 " + Game_szSite + ")")
Else
    DateSiteString = "(" + Game_szDate + IIf(Game_szSite = "", ")", " 弈於 " + Game_szSite + ")")
End If

End Function

' 開局字符串
Public Function OpenString() As String

OpenString = Game_szOpen + IIf(Game_szOpen = "" Or Game_szVar = "", "", "——") + Game_szVar + _
        Switch(Game_szEcco = "", "", Game_szOpen = "" And Game_szVar = "", "(ECCO開局編號：" + Game_szEcco + ")", True, "(" + Game_szEcco + ")")

End Function

' 缺省文件名
Public Function DefaultFileName() As String

Dim sz As String
sz = EventString
DefaultFileName = IIf(sz = "", "", sz + " - ") + ResultString

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

' 清空棋盤
Public Sub NewGame0()

RestartGame
BoardFlush
LabelFlush
MoveFlush

End Sub

' “新的對局”功能
Public Sub NewGame()

If Options_bShowNew Then
    frmNewGame.Show vbModal, App_frmMain
    Exit Sub
End If
App_szFileName = ""
NewGame0
EngineNewGame

End Sub

' 結束一局對局
Public Sub EndGame(ByVal szSound As String, ByVal szPrompt As String)

Dim mbp As MsgBoxParams, dwResult As Long

PlayWavSound szSound
If App_sqMate > 0 Then
    DrawSquare App_sqMate, , DRAW_MATE
End If
mbp.cbSize = Len(mbp)
mbp.hwndOwner = App_frmMain.hWnd
mbp.hInstance = 0
mbp.lpszText = szPrompt + vbCrLf + vbCrLf + "再來一局嗎？"
mbp.lpszCaption = App.Title
mbp.dwStyle = MB_USERICON + MB_YESNO
mbp.lpszIcon = IDI_QUESTION
mbp.dwContextHelpId = 0
mbp.lpfnMsgBoxCallback = 0
mbp.dwLanguageId = 0
' Unsupported under Windows 98
dwResult = MessageBoxIndirectA(mbp)
If dwResult = 0 Then
    mbp.hInstance = App.hInstance
    mbp.lpszIcon = 1
    dwResult = MessageBoxIndirectA(mbp)
End If

If dwResult = vbYes Then
    If Not CancelSave Then
        NewGame
    End If
End If

End Sub

' 新開一局，在新建文件、編輯棋局等功能中使用，編輯棋局要加參數"RESTART_KEEP_LABEL"，不清除標簽
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
            SendEngine "setoption ponder " + IIf(Options_bAlwaysPonder, "true", "false")
        End If
    End If
    EngineLoaded True
End If
Game_szIrrevFen(0) = CCHESS_START_FEN + " - - 0 1"
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

End Sub

' 在棋盤上顯示棋子，如果指定"DRAW_SELECTED"參數，則再顯示一個標記框，"frmPosEdit"中還有個相應的"DrawPosSquare/DrawCapSquare"過程
Public Sub DrawSquare(ByVal sq As Integer, Optional ByVal bSelected As Boolean = False, Optional ByVal bMate As Boolean = False)

Dim pc As Integer, nPicId As Integer, img As Image, i As Integer, x As Integer, y As Integer
pc = Game_posIrrev(Game_nCurrIrrev).ucpcSquares(sq)
If pc = 0 Then
    nPicId = 0
Else
    nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
End If
nPicId = nPicId + IIf(bSelected, 15, 0)
Set img = App_frmMain.imgSquares(IIf(App_bFlipped, (12 - sq \ 16) * 9 + 11 - sq Mod 16, (sq \ 16 - 3) * 9 + sq Mod 16 - 3))
If bMate Then
    nPicId = IIf(pc = 16, 30, IIf(pc = 32, 31, nPicId))
    ' 以下是新功能 - 抖一下將死的子
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
    ' 以上是新功能 - 抖一下將死的子
End If
img.Picture = App_picPieces(nPicId)

End Sub

' 顯示整個棋盤，"frmPosEdit"中還有一個相應的"PosBoardFlush"過程
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

' 顯示坐標
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

' 顯示當前走過的著法，并且根据哪方走棋更新主窗口的圖標
Public Sub MoveFlush()

Dim bNotBegin As Boolean, bNotEnd As Boolean
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
App_frmMain.mnMovePromote.Enabled = False
App_frmMain.tlb.Buttons("MovePromote").Enabled = False

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

Dim i As Integer, nMoveStatus As Long, szResult As String
Dim szMoveChinText As String, szMoveFileText As String, szMoveIccsText As String

If Game_cntCurr = 1000 Or Game_posIrrev(Game_nCurrIrrev).nMoveNum = 256 Then
    AddMove = False
    If bEcho Then
        MsgBox "超過最大回合數限製！", vbExclamation
    End If
    Exit Function
End If
szMoveIccsText = Move2Iccs(mv)
szMoveFileText = MkL(CchessMove2File(mv, Game_posIrrev(Game_nCurrIrrev)))
szMoveChinText = MkC(CchessFile2Chin(CvL(szMoveFileText), Game_sdCurr))
If CchessTryMove(Game_posIrrev(Game_nCurrIrrev), nMoveStatus, mv) Then
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
        CchessTryMove Game_posIrrev(Game_nMaxIrrev), nMoveStatus, mv
        CchessSetIrrev Game_posIrrev(Game_nMaxIrrev)
        Game_szIrrevFen(Game_nMaxIrrev) = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nMaxIrrev))) + " - - 0" + _
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
        App_sqMate = Game_posIrrev(Game_nCurrIrrev).ucsqPieces(IIf(Game_sdCurr = 1, 32, 16))
        If bEcho Then
            szResult = IIf((Game_sdCurr = 1 And Engine_bRed) Or (Game_sdCurr = 0 And Engine_bBlack), "LOSS", "WIN")
            EndGame szResult, IIf(Game_sdCurr = 1, "紅胜。", "黑胜。")
        End If
        Game_nResult = IIf(Game_sdCurr = 1, RESULT_REDWIN, RESULT_BLACKWIN)
        App_frmMain.lblResult = ResultString
        Timer_bEnabled = False
        App_frmMain.mnEngineLevel.Checked = False
        App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
    Else
        If bEcho Then
            If (nMoveStatus And MOVE_CHECK) <> 0 Then
                PlayWavSound "CHECK" + IIf(bEngine, "2", "")
            ElseIf (nMoveStatus And MOVE_CAPTURE) <> 0 Then
                PlayWavSound IIf(Src(mv) = Dst(mv), "PROMOTE", "CAPTURE") + IIf(bEngine, "2", "")
            Else
                PlayWavSound "MOVE" + IIf(bEngine, "2", "")
            End If
        End If
        If (nMoveStatus And MOVE_CONSECUTIVE) <> 0 Then
            If bEcho Then
                EndGame "DRAW", "自然作和。"
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
                    szResult = "DRAW"
                Else
                    szResult = IIf((Game_nResult = 1 And Engine_bRed) Or (Game_nResult = 3 And Engine_bBlack), "LOSS", "WIN")
                End If
                EndGame szResult, Choose(Game_nResult, "黑方長打作負！", "雙方不變作和。", "紅方長打作負！")
            End If
            App_frmMain.lblResult = ResultString
            Timer_bEnabled = False
            App_frmMain.mnEngineLevel.Checked = False
            App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
            If Engine_bRed Or Engine_bBlack Then
                EngineLoaded True
            End If
        End If
    End If
    If App_frmMain.mnEngineDraw.Checked Then
        App_frmMain.mnEngineDraw.Checked = False
        Engine_bDraw = True
    End If
    If Engine_nStatus = IDLE_PONDER Then
        If mv = Engine_mvPonder Then
            If Options_bAllowResign And Engine_bPonderFinishedResign Then
                Game_nResult = IIf(Game_sdMax = 0, RESULT_BLACKWIN, RESULT_REDWIN)
                App_frmMain.lblResult = ResultString
                Engine_nStatus = IDLE_REST
                EndGame "WIN", IIf(Game_sdMax = 0, "紅方認輸。", "黑方認輸。")
            ElseIf Engine_bDraw And Engine_bPonderFinishedDraw Then
                Game_nResult = RESULT_DRAW
                App_frmMain.lblResult = ResultString
                Engine_nStatus = IDLE_REST
                EndGame "DRAW", IIf(Game_sdMax = 0, "紅方接受提和。", "黑方接受提和。")
            Else
                Engine_nStatus = IDLE_READY
                AddMove Engine_mvPonderFinished, MOVE_WITH_ECHO, MOVE_BY_ENGINE
                If Options_bAllowResign And Engine_bPonderFinishedDraw Then
                    Engine_bDraw = True
                    If Not IIf(Game_sdMax = 1, Engine_bBlack, Engine_bRed) Then
                        MsgBox IIf(Game_sdMax = 1, "紅方提和。", "黑方提和。") + vbCrLf + "如果接受提和，請選擇“電腦”菜單的“提和/接受提和”功能。" + _
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
    If bEcho And (nMoveStatus And MOVE_INCHECK) <> 0 Then
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
    Game_szOpen = AllocString(EccoOpening(dwEcco))
    Game_szVar = AllocString(EccoVariation(dwEcco))
    App_frmMain.lblOpen = OpenString
End If

End Sub

' 以上是界面控製例程

' 以下是引擎控製例程

' 顯示引擎信息的對話框
Public Sub AboutEngine()

MsgBoxWithIcon IIf(Engine_szName = "", "", "引擎：" + Engine_szName + vbCrLf) + _
        IIf(Engine_szVersion = "", "", "版本：" + Engine_szVersion + vbCrLf) + _
        IIf(Engine_szCopyright = "", "", "版權：" + Engine_szCopyright + vbCrLf) + _
        IIf(Engine_szAuthor = "", "", "作者：" + Engine_szAuthor + vbCrLf) + _
        IIf(Engine_szUser = "", "", "用戶：" + Engine_szUser), "關於UCCI引擎", Engine_szFile

End Sub

' 根据引擎走子方翻轉棋盤并顯示對陣雙方
Public Sub EnginePlayer()

Dim szName As String, szSlaveName As String
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
        CoordFlush
        BoardFlush
    End If
End If
App_frmMain.mnPosFlip.Checked = App_bFlipped
App_frmMain.tlb.Buttons("PosFlip").Value = IIf(App_bFlipped, tbrPressed, tbrUnpressed)
If Options_bEngineName Then
    szName = IIf(Engine_szName = "ElephantEye", "象棋巫師", Engine_szName)
    szSlaveName = IIf(Engine_szSlaveName = "ElephantEye", "象棋巫師", Engine_szSlaveName)
    Game_szRedPlayer = IIf(Engine_bRed, IIf(Engine_bSlaveRed, Engine_szSlaveName, Engine_szName), Options_szUser)
    Game_szBlackPlayer = IIf(Engine_bBlack, IIf(Engine_bSlaveBlack, Engine_szSlaveName, Engine_szName), Options_szUser)
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
    Print #nLogFileNo, "<font color=""" + IIf(bSlaveEngine, "#FF00FF", "#FF0000") + """>" + szLineStr + "</font><br>"
    Close #nLogFileNo
End If

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
    Print #nLogFileNo, "<font color=""" + IIf(bSlaveEngine, "#000080", "#0000FF") + """>" + szLineStr + "</font><br>"
    Close #nLogFileNo
End If

lnErrorOpen:
On Error GoTo 0

End Sub

' 讓引擎思考，思考前必須設置思考狀態(BUSY_ANALYZE/BUSY_THINK/BUSY_PONDER)
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
        Engine_szPonderStr = MkC(CchessFile2Chin(CchessMove2File(Engine_mvPonder, Engine_posBoard), Engine_posBoard.sdPlayer))
    Case 1
        Engine_szPonderStr = MkL(CchessMove2File(Engine_mvPonder, Engine_posBoard))
    Case 2
        Engine_szPonderStr = Move2Iccs(Engine_mvPonder)
    End Select
    If CchessTryMove(Engine_posBoard, nMoveStatus, Engine_mvPonder) <> 0 Then
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
nTimeRatio = IIf(bSlaveEngine, Engine_nTimeRatioSlave, Engine_nTimeRatio)
SendEngine "position fen " + szFenStr, bSlaveEngine
If Engine_mvBan <> 0 Then
    SendEngine "banmoves " + Move2Coord(Engine_mvBan), bSlaveEngine
End If
If Engine_nStatus = BUSY_ANALYZE Then
    SendEngine "go infinite", bSlaveEngine
Else
    If Timer_nDepth <= 0 Then
        If Timer_bIncMode Then
            SendEngine szGoPonder + " time" + Str(nTimeRatio * Timer_nTimeLeft(Engine_posBoard.sdPlayer)) + _
                    " increment" + Str(IIf(Timer_nIncTime < 0, 0, nTimeRatio * Timer_nIncTime)) + _
                    " opptime" + Str(nTimeRatio * Timer_nTimeLeft(1 - Engine_posBoard.sdPlayer)) + _
                    " oppincrement" + Str(IIf(Timer_nIncTime < 0, 0, nTimeRatio * Timer_nIncTime)), bSlaveEngine
        Else
            SendEngine szGoPonder + " time" + Str(nTimeRatio * Timer_nTimeLeft(Engine_posBoard.sdPlayer)) + _
                    " movestogo" + Str(Timer_nMoveLeft(Engine_posBoard.sdPlayer)) + _
                    " opptime" + Str(nTimeRatio * Timer_nTimeLeft(1 - Engine_posBoard.sdPlayer)) + _
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

' 在思考細節框中輸出信息，并定位光標
Public Sub AppendThink(ByVal sz As String)

Dim nTextLen As Long
If App_frmMain.txtThink.Text = "" Then
    App_frmMain.txtThink.Text = sz
    App_frmMain.txtThink.SelStart = 0
Else
    App_frmMain.txtThink.Text = App_frmMain.txtThink.Text + vbCrLf
    nTextLen = Len(App_frmMain.txtThink.Text)
    App_frmMain.txtThink.Text = App_frmMain.txtThink.Text + sz
    App_frmMain.txtThink.SelStart = nTextLen
End If

End Sub

' 輸出引擎的信息，顯示到顯示思考窗口和狀態欄
Public Sub PopEngine(ByVal szReceived As String)

Dim i As Integer, nScore As Integer, nOldDepth As Integer
Dim nTime As Long, nNodes As Long
Dim szMoveList As String, nMoveStatus As Long, mv As Long
Dim pos As PositionStruct

' 輸出當前思考著法
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
        App_frmMain.stb.Panels("Curr").Text = LTrim(Str(Engine_nDepth)) + " (" + LTrim(Str(Engine_nCurrMove)) + "/" + LTrim(Str(Engine_nMoves)) + ") " + szMoveList
    End If
End If

' 輸出速度
If Options_bStatusBar Then
    i = InStr(szReceived, " nodes ")
    If i > 0 Then
        nNodes = Str2Lng(Mid(szReceived, i + 7))
        nTime = (Timer - Engine_dwTime) * 1000
        nTime = IIf(nTime < 0, nTime + 86400000, nTime)
        If nTime > 0 Then
            App_frmMain.stb.Panels("Nps").Text = "NPS" + Str(nNodes \ nTime) + "K"
        End If
    End If
End If

' 輸出主要變例
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
            AppendThink TimeText(nTime \ 1000) + "." + Right(Str(nTime \ 100), 1) + " ->"
        End If
    End If
    szMoveList = Space(4 - Len(Str(Engine_nDepth))) + LTrim(Str(Engine_nDepth))
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
                    szMoveList = szMoveList + " " + MkC(CchessFile2Chin(CchessMove2File(mv, pos), pos.sdPlayer))
                Case 1
                    szMoveList = szMoveList + " " + MkL(CchessMove2File(mv, pos))
                Case 2
                    szMoveList = szMoveList + " " + Move2Iccs(mv)
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

' 輸出引擎提示信息
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
                Game_nResult = IIf(Game_sdMax = 0, RESULT_BLACKWIN, RESULT_REDWIN)
                App_frmMain.lblResult = ResultString
                Timer_bEnabled = False
                App_frmMain.mnEngineLevel.Checked = False
                App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
                Engine_nStatus = IDLE_REST
                EndGame "WIN", IIf(Game_sdMax = 0, "紅方認輸。", "黑方認輸。")
            ElseIf Engine_bDraw And Right(szReceived, 5) = " draw" Then
                Game_nResult = RESULT_DRAW
                App_frmMain.lblResult = ResultString
                Timer_bEnabled = False
                App_frmMain.mnEngineLevel.Checked = False
                App_frmMain.tlb.Buttons("EngineLevel").Value = tbrUnpressed
                Engine_nStatus = IDLE_REST
                EndGame "DRAW", IIf(Game_sdMax = 0, "紅方接受提和。", "黑方接受提和。")
            ElseIf AddMove(mv, MOVE_WITH_ECHO, MOVE_BY_ENGINE) Then
                App_frmMain.SetFocus
                If Options_bAllowResign And Right(szReceived, 5) = " draw" Then
                    Engine_bDraw = True
                    If Not IIf(Game_sdMax = 1, Engine_bBlack, Engine_bRed) Then
                        MsgBox IIf(Game_sdMax = 1, "紅方提和。", "黑方提和。") + vbCrLf + "如果接受提和，請選擇“電腦”菜單的“提和/接受提和”功能。" + _
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
            Else
                ' 走棋沒有成功，也停止引擎
                Engine_nStatus = IDLE_REST
            End If
        Case Else
            MsgBox "不該接收到引擎的信息：" + szReceived, vbExclamation
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
            ' MsgBox "不該接收到引擎的信息：" + szReceived, vbExclamation
        End Select
        If Options_bStatusBar Then
            App_frmMain.stb.Panels("Curr").Text = ""
        End If
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

SendEngine "setoption promotion " + IIf(App_bPromotion, "true", "false"), bSlaveEngine
SendEngine "setoption usebook " + IIf(Engine_bUseBook, "true", "false"), bSlaveEngine
SendEngine "setoption useegtb " + IIf(Engine_bUseEgtb, "true", "false"), bSlaveEngine
If Engine_szBookFiles <> "" Then
    SendEngine "setoption bookfiles " + Engine_szBookFiles, bSlaveEngine
End If
If Engine_szEgtbPaths <> "" Then
    SendEngine "setoption egtbpaths " + Engine_szEgtbPaths, bSlaveEngine
End If
SendEngine "setoption hashsize" + IIf(Engine_nHash = 0, " 0", Str(16 * 2 ^ (Engine_nHash - 1))), bSlaveEngine
If Engine_nThreads = 0 Then
    SendEngine "setoption threads 0"
    SendEngine "setoption idle none"
ElseIf Engine_nThreads < 4 Then
    SendEngine "setoption threads 1"
    SendEngine "setoption idle " + Choose(Engine_nThreads, "large", "medium", "small"), bSlaveEngine
Else
    SendEngine "setoption threads" + Str(2 ^ (Engine_nThreads - 4)), bSlaveEngine
    SendEngine "setoption idle none"
End If
SendEngine "setoption randomness " + Choose(Engine_nRandomness + 1, "none", "small", "medium", "large"), bSlaveEngine
SendEngine "setoption style " + Choose(Engine_nStyle + 1, "solid", "normal", "risky"), bSlaveEngine

End Sub

' 根据引擎是否已加載，顯示菜單和工具欄上的可用功能
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
App_frmMain.tlb.Buttons("EnginePonder").Enabled = False
App_frmMain.tlb.Buttons("EnginePonder").Value = tbrUnpressed
If Engine_bAnalyze Then
    StopAnalyze
End If
App_frmMain.mnEngineAnalyze.Enabled = bLoaded
App_frmMain.tlb.Buttons("EngineAnalyze").Enabled = bLoaded
App_frmMain.mnEngineStop.Enabled = False
App_frmMain.mnEngineRetract.Enabled = bLoaded
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
        szReceived = AllocString(lpStr)
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
ElseIf GetAppType(Engine_szFile) <> IMAGE_SUBSYSTEM_WINDOWS_CUI Then
    bLoaded = False
Else
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
        bLoaded = True
        Engine_bSlaveRed = False
        Engine_bSlaveBlack = False
        If Engine_nTimeRatio = 1000 Then
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
        If Engine_szFile = "" Then
            MsgBox "沒有加載引擎！", vbExclamation
        Else
            MsgBox Engine_szFile + " 不是中國象棋引擎文件！", vbExclamation
            Engine_szFile = ""
        End If
    End If
End If
EngineLoaded bLoaded
SetTitle

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
ElseIf GetAppType(szEngineFile) <> IMAGE_SUBSYSTEM_WINDOWS_CUI Then
    MsgBox szEngineFile + " 不是中國象棋引擎文件！", vbExclamation
Else
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
        MsgBoxWithIcon IIf(Engine_szSlaveName = "", "", "引擎：" + Engine_szSlaveName + vbCrLf) + _
                IIf(szCopyright = "", "", "版權：" + szCopyright + vbCrLf) + _
                IIf(szAuthor = "", "", "作者：" + szAuthor + vbCrLf) + _
                IIf(szUser = "", "", "用戶：" + szUser), "關於UCCI引擎", szEngineFile
        If Engine_nTimeRatioSlave = 1000 Then
            SendEngine "setoption usemillisec true", SLAVE_ENGINE
        End If
        SetEngine SLAVE_ENGINE
    Else
        SendEngine "quit", SLAVE_ENGINE
        PipeClose Engine_pipeSlave
        MsgBox szEngineFile + " 不是中國象棋引擎文件！", vbExclamation
    End If
End If

End Sub

' 啟動時鐘
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

' 新局時選擇引擎走哪方
Public Sub EngineNewGame(Optional ByVal nEnginePlay As Integer = -1)

If Engine_nStatus > IDLE_UNLOAD Then
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
App_frmMain.frmMove2.Move App_frmMain.frmMove2.Left, App_frmMain.frmMove2.Top + IIf(Options_bLargeGui, 2760, 1440)

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
App_frmMain.frmMove2.Move App_frmMain.frmMove2.Left, App_frmMain.frmMove2.Top - IIf(Options_bLargeGui, 2760, 1440)

End Sub

' 以上是引擎控製例程

' 以下是圖片和聲音的處理例程

' 設置隱藏棋盤(小)
Public Sub BoardSettingSmallHide(ByVal nBoardIndex As Integer)

On Error Resume Next
frmHide.imgBoardSmall.Picture = LoadPicture(App_szPath + "IMAGES_S\" + _
        Choose(nBoardIndex + 1, "WOOD", "GREEN", "WHITE", "SHEET", "CANVAS", "DROPS", _
        "CLOUDS", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL", "QIANHONG") + ".GIF")
On Error GoTo 0

End Sub

' 設置棋盤(小)
Public Sub BoardSettingSmall(ByVal nBoardIndex As Integer)

Dim i As Integer
BoardSettingSmallHide nBoardIndex
frmMainSmall.imgBoard.Picture = frmHide.imgBoardSmall.Picture
For i = 0 To BOARD_S_MAX - 1
    frmMainSmall.mnOptionsBoard(i).Checked = (nBoardIndex = i)
Next
Options_nBoardS = nBoardIndex

End Sub

' 設置隱藏棋盤(大)
Public Sub BoardSettingLargeHide(ByVal nBoardIndex As Integer)

On Error Resume Next
frmHide.imgBoardLarge.Picture = LoadPicture(App_szPath + "IMAGES_L\" + _
        Choose(nBoardIndex + 1, "WOOD", "GREEN", "WHITE", "SHEET", "CANVAS", "DROPS", "QIANHONG") + ".GIF")
On Error GoTo 0

End Sub

' 設置棋盤(大)
Public Sub BoardSettingLarge(ByVal nBoardIndex As Integer)

Dim i As Integer
BoardSettingLargeHide nBoardIndex
frmMainLarge.imgBoard.Picture = frmHide.imgBoardLarge
For i = 0 To BOARD_L_MAX - 1
    frmMainLarge.mnOptionsBoard(i).Checked = (nBoardIndex = i)
Next
Options_nBoardL = nBoardIndex

End Sub

' 獲得棋子圖片的文件名
Public Function PieceFileName(ByVal nIndex As Integer) As String

If nIndex = 30 Then
    PieceFileName = "RKM"
ElseIf nIndex = 31 Then
    PieceFileName = "BKM"
ElseIf nIndex >= 15 Then
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

' 設置隱藏棋子(小)
Public Sub PiecesSettingSmallHide(ByVal nPiecesIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath + "IMAGES_S\" + Choose(nPiecesIndex + 1, "WOOD", "DELICATE", "POLISH", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL") + "\"
On Error Resume Next
For i = 0 To 31
    frmHide.imgPiecesSmall(i).Picture = LoadPicture(sz + PieceFileName(i) + ".GIF")
Next
On Error GoTo 0

End Sub

' 設置棋子(小)
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

' 設置隱藏棋子(大)
Public Sub PiecesSettingLargeHide(ByVal nPiecesIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath + "IMAGES_L\" + Choose(nPiecesIndex + 1, "WOOD", "DELICATE", "POLISH") + "\"
On Error Resume Next
For i = 0 To 31
    frmHide.imgPiecesLarge(i).Picture = LoadPicture(sz + PieceFileName(i) + ".GIF")
Next
On Error GoTo 0

End Sub

' 設置棋子(大)
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

' 設置音樂
Public Sub MusicSetting(ByVal nMusicIndex As Integer)

Dim i As Integer
frmHide.mci.Command = "Close"
If nMusicIndex < MUSIC_NONE Then
    frmHide.mci.FileName = App_szPath + "MUSICS\" + _
            Choose(nMusicIndex + 1, "EXPRESS", "FUNNY", "CLASSIC", "MOZART1", "MOZART4", _
            "FURELISE", "LOVDREAM", "WALTZ", "HUMOUR", "PAL", "CMUSIC") + ".MID"
    If Not App_bPrevInstance Then
        frmHide.mci.Command = "Open"
        frmHide.mci.Command = "Play"
    End If
End If
For i = 0 To MUSIC_MAX - 1
    App_frmMain.mnOptionsMusic(i).Checked = (nMusicIndex = i)
Next
Options_nMusic = nMusicIndex

End Sub

' 以上是圖片和聲音的處理例程

' 以下是參數設置例程

' 加載“日積月累”
Public Sub LoadTips()

Gui_szTips(1) = "　　象棋巫師是一款功能超強的象棋教學、電腦對弈和棋譜編輯軟件，具有方便的人機對戰、棋譜記錄、欣賞、發布、管理棋局的功能，還內置大量象棋習題，完全可以滿足各層次象棋愛好者、棋手、裁判員及象棋文字工作者的各種需要。"
Gui_szTips(2) = "　　象棋巫師支持多個通用象棋引擎，他們大都具有專業棋手的水平，是象棋愛好者和專業棋手提高棋藝的良師益友。" + vbCrLf + _
        "　　如果您對象棋巫師自帶的引擎 ElephantEye 的表現不滿意，可以登錄 http://www.elephantbase.net/league.htm ，下載到其他各具特色的引擎。"
Gui_szTips(3) = "　　點擊“新的棋局”按鈕，就可以展開人機對弈，象棋巫師提供了五種的難度和四種的讓子模式給用戶體驗。"
Gui_szTips(4) = "　　如果您不希望讓電腦走棋，而僅僅是想知道電腦在想些什么，或者讓電腦給你一些啟發，可以點擊“電腦分析”按鈕，打開思考細節窗口。" + vbCrLf + _
        "　　您可以把思考細節窗口中的思考路線複製下來，粘貼到主窗口中，對思考線路進行推演。"
Gui_szTips(5) = "　　點擊“發布棋譜”按鈕，就可以在網上和棋友交流棋譜，或者向高手求助。" + vbCrLf + _
        "　　象棋巫師推薦了幾個著名的象棋論壇，並給用戶提供快捷的發帖引導，很方便地讓用戶在這些象棋論壇上發布棋譜或發起求助。"
Gui_szTips(6) = "　　象棋巫師目前主要通過網絡發行，最新的版本可以從《象棋百科全書網》獲得：" + vbCrLf + "　　http://www.elephantbase.net/"
Gui_szTips(7) = "　　目前網絡上已經有數以万計通用格式的棋譜文件(後綴.PGN)可供下載。您可以到以下頁面下載近20年內全國頂級象棋比賽的棋譜：http://www.elephantbase.net/resource.htm" + vbCrLf + _
        "　　同時也歡迎您將自己製作的文件上傳給我們。"
Gui_szTips(8) = "　　如果您對象棋巫師有什么意見或建議，可以跟象棋巫師開發團隊聯系，郵件地址是：" + vbCrLf + "　　webmaster@elephantbase.net" + vbCrLf + _
        "　　象棋巫師開發團隊非常希望和大家保持聯系。"
Gui_szTips(9) = "　　您可以雙擊桌面上的象棋巫師圖標(由棋子“象”、棋盤和巫師棒組成)直接啟動象棋巫師。"
Gui_szTips(10) = "　　如果您是一個象棋巫師的初學者，請您仔細閱讀本軟件“幫助”選單中的“幫助主題”并多加練習，祝您早日精通象棋巫師的各种功能。"
Gui_szTips(11) = "　　象棋巫師支持文件關聯功能，雙擊PGN文件(圖標是棋子“相”)可以打開棋譜，雙擊FEN文件(圖標是棋盤)可以打開局面。"
Gui_szTips(12) = "　　象棋巫師支持“象棋演播室”的棋譜。只要雙擊XQF文件(圖標是“象”字)，或者點擊“打開”按鈕并選擇一個XQF文件，象棋巫師就會打開這個棋譜。"
Gui_szTips(13) = "　　象棋巫師最适合800x600和1024x768的顯示分辯率，在“選項設置”對話框(“選項”選單中的“設置”一項)，把“界面”設成“大”，就可在1024x768的顯示分辯率下得到最舒适的顯示效果。"
Gui_szTips(14) = "　　點擊“查看文本棋譜”按鈕，就可以看到棋譜文本，為粘貼到BBS上或者Word文檔中提供了方便。"
Gui_szTips(15) = "　　象棋巫師可讀入聯眾、弈天、中國游戲中心等中國象棋的存盤文件和大部分的文本棋譜文件，把這些含有著法的文本複製到剪貼板，點擊“從剪貼板導入”按鈕，這些著法就會錄製到象棋巫師中。"
Gui_szTips(16) = "　　象棋巫師提供的棋譜鍵盤輸入法為喜歡鍵盤錄入棋譜的棋友提供了一种高效的棋譜輸入方法，棋友可根据自己的習慣在數字小鍵盤或WXF字母格式中任意選擇。"
Gui_szTips(17) = "　　在欣賞棋譜的過程中，點擊“播放棋局”按鈕就可從該步自動演示，演示的時間間隔可以自由調整。再次點擊“播放棋局”按鈕可停止自動演示。"
Gui_szTips(18) = "　　在欣賞棋譜的過程中，可以使用棋盤倒置和左右調換功能來從不同的角度欣賞棋局。其中左右調換功能還可以一次將類似於“炮八平五”開局這樣的棋譜自動轉換成大家習慣的“炮二平五”。反之亦然。"
Gui_szTips(19) = "　　如果在欣賞棋譜時遇到複雜的局面，可以點擊“分析局面”按鈕，將當前棋局新開設一個象棋巫師的窗口，自由推演後續的變化。"
Gui_szTips(20) = "　　在兩個象棋巫師窗口中，靈活運用“查看文本棋譜”和“從剪貼板導入”功能，可將推演棋盤中的棋譜記錄導入到當前棋局中。"
Gui_szTips(21) = "　　象棋巫師是個自由軟件，如果您覺得好用，可以自由地將本軟件上載到任一個共享軟件下載站點。" + vbCrLf + _
        "　　象棋巫師的源程序發布在 http://sourceforge.net/projects/xqwizard/ 這個頁面上，您可以根据自己的需要對源程序進行修改，并依照GPL協議發布您修改過的源程序。"
Gui_szTips(22) = "　　象棋巫師在開發過程中得到了廣大棋迷朋友的熱情支持，作者在此表示衷心的感謝，同時也希望您繼續支持象棋巫師，關注 http://www.elephantbase.net/ 。" + vbCrLf + _
        "　　您也可以將本軟件的主頁鏈接到自己的站點上。請您使用 http://www.elephantbase.net/ 作為鏈接的路徑。"

Gui_szQuotes(1) = "　　子曰：“學而時習之，不亦說乎？有朋自遠方來，不亦樂乎？人不知而不慍，不亦君子乎？”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·學而》"
Gui_szQuotes(2) = "　　子貢問曰：“有一言而可以終身行之者乎？”子曰：“其恕乎！己所不欲，勿施於人。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·衛靈公》"
Gui_szQuotes(3) = "　　或曰：“以德報怨，何如？”子曰：“何以報德？以直報怨，以德報德。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·憲問》"
Gui_szQuotes(4) = "　　子夏曰：“博學而篤志，切問而近思；仁在其中矣。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·子張》"
Gui_szQuotes(5) = "　　子曰：“不患人之不己知，患不知人也。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·學而》"
Gui_szQuotes(6) = "　　子曰：“三人行，必有我師焉：擇其善者而從之，其不善者而改之。”" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《論語·述而》"
Gui_szQuotes(7) = "　　將欲歙之，必固張之；將欲弱之，必固強之；將欲廢之，必固興之；將欲取之，必固与之。是謂微明。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第三十六章》"
Gui_szQuotes(8) = "　　柔弱胜剛強。魚不可脫於淵，國之利器不可以示人。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第三十六章》"
Gui_szQuotes(9) = "　　圖難於其易；為大於其細。天下難事，必作於易；天下大事，必作於細。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第六十三章》"
Gui_szQuotes(10) = "　　合抱之木，生於毫末；九層之臺，起於累土；千里之行，始於足下。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《老子·第六十四章》"
Gui_szQuotes(11) = "　　知彼知己，胜乃不殆；知天知地，胜乃可全。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《孫子兵法·地形》"
Gui_szQuotes(12) = "　　怒可以複喜，慍可以複說，亡國不可以複存，死者不可以複生。" + vbCrLf + vbCrLf + _
        "　　　　　　　　　　　　　　　　　　　　　　——《孫子兵法·火攻》"

End Sub

' 加載殘局
Public Sub LoadEndgames(ByVal szEpdName As String, ByVal szTitle As String)

Dim nFileNo As Integer, i As Integer, sz As String
nFileNo = FreeFile
On Error GoTo lnErrorOpen
Open App_szPath + "ENDGAMES\" + szEpdName + ".EPD" For Input As #nFileNo
On Error GoTo 0
App_nEndgames = 0
Do While App_nEndgames < MAX_ENDGAMES And Not EOF(nFileNo)
    Line Input #nFileNo, sz
    i = InStr(sz, ";")
    If i > 0 Then
        App_szEndgames(App_nEndgames) = RTrim(Left(sz, i - 1))
        frmEndgames.lstGames.AddItem LTrim(Mid(sz, i + 1))
        App_nEndgames = App_nEndgames + 1
    End If
Loop
Close #nFileNo
If App_nEndgames = 0 Then
    MsgBox "無法打開文件 " + App_szPath + "ENDGAMES\" + szEpdName + ".EPD", vbExclamation
    ' Unload frmEndgames ' App_nEndgames = 0 說明 frmEndgames 未被加載過
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
MsgBox "無法打開文件 " + App_szPath + "ENDGAMES\" + szEpdName + ".EPD", vbExclamation

End Sub

' 從注冊表加載參數
Public Sub LoadRegs()

Options_bLargeGui = (Str2Int(GetSetting("XQWizard", "Options", "LargeGui", IIf(Screen.Height > 10000, "1", "0"))) <> 0)
Options_bSounds = (Str2Int(GetSetting("XQWizard", "Options", "Sounds", "1")) <> 0)
Options_bAutoPlay = (Str2Int(GetSetting("XQWizard", "Options", "AutoPlay", "0")) <> 0)
Options_nPlayIntv = Str2Int(GetSetting("XQWizard", "Options", "PlayIntv", "1"), 1, 10)
Options_bEscapeDouble = (Str2Int(GetSetting("XQWizard", "Options", "EscapeDouble", "0")) <> 0)
Options_bAnsiText = (Str2Int(GetSetting("XQWizard", "Options", "AnsiText", "0")) <> 0)
Options_bMonoBitmap = (Str2Int(GetSetting("XQWizard", "Options", "MonoBitmap", "0")) <> 0)
Options_bPrintDigit = (Str2Int(GetSetting("XQWizard", "Options", "PrintDigit", "1")) <> 0)
Options_nFlashXQ = Str2Int(GetSetting("XQWizard", "Options", "FlashXQ", "1"), FLASHXQ_SMALL, FLASHXQ_LARGE)
Options_nMoveDelay = Str2Int(GetSetting("XQWizard", "Options", "MoveDelay", "1"), 0, 5)
Options_bAutoFlip = (Str2Int(GetSetting("XQWizard", "Options", "AutoFlip", "1")) <> 0)
Options_bEngineName = (Str2Int(GetSetting("XQWizard", "Options", "EngineName", "1")) <> 0)
Options_bAlwaysPonder = (Str2Int(GetSetting("XQWizard", "Options", "AlwaysPonder", "0")) <> 0)
Options_bAllowResign = (Str2Int(GetSetting("XQWizard", "Options", "AllowResign", "1")) <> 0)
Options_bEngineTime = (Str2Int(GetSetting("XQWizard", "Options", "EngineTime", "0")) <> 0)
Options_bStatusBar = (Str2Int(GetSetting("XQWizard", "Options", "StatusBar", "1")) <> 0)
Options_nEnginePlay = Str2Int(GetSetting("XQWizard", "Options", "EnginePlay", "3"), 0, ENGINE_PLAY_MAX - 1)
Options_nBoardS = Str2Int(GetSetting("XQWizard", "Options", "BoardSmall", "0"), 0, BOARD_S_MAX - 1)
Options_nPiecesS = Str2Int(GetSetting("XQWizard", "Options", "PiecesSmall", "0"), 0, PIECES_S_MAX - 1)
Options_nBoardL = Str2Int(GetSetting("XQWizard", "Options", "BoardLarge", "0"), 0, BOARD_L_MAX - 1)
Options_nPiecesL = Str2Int(GetSetting("XQWizard", "Options", "PiecesLarge", "0"), 0, PIECES_L_MAX - 1)
Options_nMusic = Str2Int(GetSetting("XQWizard", "Options", "Music", "8"), 0, MUSIC_MAX - 1)
Options_bTopMost = (Str2Int(GetSetting("XQWizard", "Options", "TopMost", "0")) <> 0)
Options_bPromptSave = (Str2Int(GetSetting("XQWizard", "Options", "PromptSave", "1")) <> 0)
Options_bAutoSave = (Str2Int(GetSetting("XQWizard", "Options", "AutoSave", "0")) <> 0)
Options_szUser = GetSetting("XQWizard", "Options", "User", "象棋巫師測試團隊")
Options_bShowNew = (Str2Int(GetSetting("XQWizard", "Options", "ShowNew", "1")) <> 0)
Gui_nLeft = Str2Int(GetSetting("XQWizard", "Gui", "Left", "480"), 0, Int(Screen.Width * 0.75))
Gui_nTop = Str2Int(GetSetting("XQWizard", "Gui", "Top", "480"), 0, Int(Screen.Height * 0.75))
Gui_nEndgamesIndex = Str2Int(GetSetting("XQWizard", "Gui", "EndgamesIndex", "0"), 0, MAX_ENDGAMES - 1)
Gui_szEpdName = GetSetting("XQWizard", "Gui", "EpdName", "FUNNY")
Gui_szEpdTitle = GetSetting("XQWizard", "Gui", "EpdTitle", "趣味象棋")
Gui_bShowHowTo = (Str2Int(GetSetting("XQWizard", "Gui", IIf(App_bPromotion, "ShowHowTo2", "ShowHowTo"), "1")) <> 0)
Gui_nTipIndex = Str2Int(GetSetting("XQWizard", "Gui", "TipIndex", "1"), 1, TIP_NUM)
Gui_szUpgradeVer = GetSetting("XQWizard", "Gui", "UpgradeVer", STRING_VERSION)
Gui_szUpgradeDate = GetSetting("XQWizard", "Gui", "UpgradeDate", "")
Gui_szAdvertDate = GetSetting("XQWizard", "Gui", "AdvertDate", "")
Publish_nSize = Str2Int(GetSetting("XQWizard", "Publish", "Size", "0"), 0, PUB_SIZE_MAX - 1)
Publish_bTrad = (Str2Int(GetSetting("XQWizard", "Publish", "Trad", "1")) <> 0)
Publish_nBoardS = Str2Int(GetSetting("XQWizard", "Publish", "BoardS", "0"), 0, BOARD_S_MAX - 1)
Publish_nPiecesS = Str2Int(GetSetting("XQWizard", "Publish", "PiecesS", "0"), 0, PIECES_S_MAX - 1)
Publish_nBoardL = Str2Int(GetSetting("XQWizard", "Publish", "BoardL", "0"), 0, BOARD_L_MAX - 1)
Publish_nPiecesL = Str2Int(GetSetting("XQWizard", "Publish", "PiecesL", "0"), 0, PIECES_L_MAX - 1)
Publish_bContent = (Str2Int(GetSetting("XQWizard", "Publish", "Content", "0")) <> 0)
Publish_nLocation = Str2Int(GetSetting("XQWizard", "Publish", "Location", "0"), 0, PUB_LOCATION_MAX - 1)
Publish_nFormat = Str2Int(GetSetting("XQWizard", "Publish", "Format", "0"), 0, PUB_FORMAT_MAX - 1)
Timer_nDepth = Str2Int(GetSetting("XQWizard", "Timer", "Depth", "-1"), LEVEL_GRANDMASTER, LEVEL_INFINITE)
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
Engine_szFile = GetSetting("XQWizard", "Engine", "FileName", App_szPath + "ELEEYE.EXE")

End Sub

' 保存參數到注冊表
Public Sub SaveRegs()

SaveSetting "XQWizard", "Options", "LargeGui", IIf(Options_bLargeGui, "1", "0")
SaveSetting "XQWizard", "Options", "Sounds", IIf(Options_bSounds, "1", "0")
SaveSetting "XQWizard", "Options", "AutoPlay", IIf(Options_bAutoPlay, "1", "0")
SaveSetting "XQWizard", "Options", "PlayIntv", LTrim(Str(Options_nPlayIntv))
SaveSetting "XQWizard", "Options", "EscapeDouble", IIf(Options_bEscapeDouble, "1", "0")
SaveSetting "XQWizard", "Options", "AnsiText", IIf(Options_bAnsiText, "1", "0")
SaveSetting "XQWizard", "Options", "MonoBitmap", IIf(Options_bMonoBitmap, "1", "0")
SaveSetting "XQWizard", "Options", "PrintDigit", IIf(Options_bPrintDigit, "1", "0")
SaveSetting "XQWizard", "Options", "FlashXQ", LTrim(Str(Options_nFlashXQ))
SaveSetting "XQWizard", "Options", "MoveDelay", LTrim(Str(Options_nMoveDelay))
SaveSetting "XQWizard", "Options", "AutoFlip", IIf(Options_bAutoFlip, "1", "0")
SaveSetting "XQWizard", "Options", "EngineName", IIf(Options_bEngineName, "1", "0")
SaveSetting "XQWizard", "Options", "AlwaysPonder", IIf(Options_bAlwaysPonder, "1", "0")
SaveSetting "XQWizard", "Options", "AllowResign", IIf(Options_bAllowResign, "1", "0")
SaveSetting "XQWizard", "Options", "EngineTime", IIf(Options_bEngineTime, "1", "0")
SaveSetting "XQWizard", "Options", "StatusBar", IIf(Options_bStatusBar, "1", "0")
SaveSetting "XQWizard", "Options", "EnginePlay", LTrim(Str(Options_nEnginePlay))
SaveSetting "XQWizard", "Options", "BoardSmall", LTrim(Str(Options_nBoardS))
SaveSetting "XQWizard", "Options", "PiecesSmall", LTrim(Str(Options_nPiecesS))
SaveSetting "XQWizard", "Options", "BoardLarge", LTrim(Str(Options_nBoardL))
SaveSetting "XQWizard", "Options", "PiecesLarge", LTrim(Str(Options_nPiecesL))
SaveSetting "XQWizard", "Options", "Music", LTrim(Str(Options_nMusic))
SaveSetting "XQWizard", "Options", "TopMost", IIf(Options_bTopMost, "1", "0")
SaveSetting "XQWizard", "Options", "PromptSave", IIf(Options_bPromptSave, "1", "0")
SaveSetting "XQWizard", "Options", "AutoSave", IIf(Options_bAutoSave, "1", "0")
SaveSetting "XQWizard", "Options", "User", Options_szUser
SaveSetting "XQWizard", "Options", "ShowNew", IIf(Options_bShowNew, "1", "0")
SaveSetting "XQWizard", "Gui", "Left", LTrim(Str(Gui_nLeft))
SaveSetting "XQWizard", "Gui", "Top", LTrim(Str(Gui_nTop))
SaveSetting "XQWizard", "Gui", "EndgamesIndex", LTrim(Str(Gui_nEndgamesIndex))
SaveSetting "XQWizard", "Gui", "EpdName", Gui_szEpdName
SaveSetting "XQWizard", "Gui", "EpdTitle", Gui_szEpdTitle
SaveSetting "XQWizard", "Gui", IIf(App_bPromotion, "ShowHowTo2", "ShowHowTo"), IIf(Gui_bShowHowTo, "1", "0")
SaveSetting "XQWizard", "Gui", "TipIndex", LTrim(Str(Gui_nTipIndex))
SaveSetting "XQWizard", "Gui", "UpgradeVer", Gui_szUpgradeVer
SaveSetting "XQWizard", "Gui", "AdvertDate", Gui_szAdvertDate
SaveSetting "XQWizard", "Publish", "Size", LTrim(Str(Publish_nSize))
SaveSetting "XQWizard", "Publish", "Trad", IIf(Publish_bTrad, "1", "0")
SaveSetting "XQWizard", "Publish", "BoardS", LTrim(Str(Publish_nBoardS))
SaveSetting "XQWizard", "Publish", "PiecesS", LTrim(Str(Publish_nPiecesS))
SaveSetting "XQWizard", "Publish", "BoardL", LTrim(Str(Publish_nBoardL))
SaveSetting "XQWizard", "Publish", "PiecesL", LTrim(Str(Publish_nPiecesL))
SaveSetting "XQWizard", "Publish", "Content", IIf(Publish_bContent, "1", "0")
SaveSetting "XQWizard", "Publish", "Location", LTrim(Str(Publish_nLocation))
SaveSetting "XQWizard", "Publish", "Format", LTrim(Str(Publish_nFormat))
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
SaveSetting "XQWizard", "Engine", "Randomness", LTrim(Str(Engine_nRandomness))
SaveSetting "XQWizard", "Engine", "Style", LTrim(Str(Engine_nStyle))
SaveSetting "XQWizard", "Engine", "FileName", Engine_szFile

End Sub

' 以上是參數設置例程

' 顯示軟件名稱
Public Sub SetTitle()

Dim sz As String
sz = IIf(App_szFileName = "", "", Mid(App_szFileName, InStrRev(App_szFileName, "\") + 1))
If UCase(Right(sz, 4)) = ".PGN" Then
    sz = Left(sz, Len(sz) - 4)
End If
sz = IIf(sz = "", IIf(Engine_szName = "ElephantEye", "", Engine_szName), sz)
App_frmMain.Caption = IIf(sz = "", "", sz + " - ") + IIf(App_bPromotion, "超級象棋巫師", "象棋巫師")

End Sub

' 檢查更新
Public Sub CheckUpdate(Optional ByVal bManual As Boolean = False)

Dim sz As String, szUserID As String, szWhatsNew As String, szUrl As String
Dim dwCounter(0 To 1) As Long

sz = ""
QueryPerformanceCounter VarPtr(dwCounter(0))
szUserID = GetSetting("XQWizard", "Gui", "UserID", Hex(dwCounter(0)) + Hex(dwCounter(1)))
On Error Resume Next
sz = frmHide.inet.OpenURL("http://mirror.elephantbase.net/xqwizard/version_trad.php?referer=xqwizard&version=" + _
        STRING_VERSION + "&userid=" + szUserID)
On Error GoTo 0
If sz = "" Then
    If bManual Then
        MsgBox "無法訪問 www.elephantbase.net，請稍後再試。", vbExclamation
    End If
Else
    Gui_szUpgradeDate = Date ' 如果訪問升級信息成功，那么當天就不再訪問升級信息
    SaveSetting "XQWizard", "Gui", "UpgradeDate", Gui_szUpgradeDate ' 立即寫注冊表，避免重開窗口導致的重複訪問
    SaveSetting "XQWizard", "Gui", "UserID", szUserID               ' 同上
    If Val(sz) > Val(STRING_VERSION) + 0.005 And (bManual Or Val(sz) > Val(Gui_szUpgradeVer) + 0.005) Then
        szWhatsNew = ""
        On Error Resume Next
        szWhatsNew = frmHide.inet.OpenURL("http://mirror.elephantbase.net/xqwizard/whatsnew_trad.txt")
        On Error GoTo 0
        If MsgBox(IIf(szWhatsNew = "", "象棋巫師 " + sz + " 已經發布，需要下載最新版本嗎？", szWhatsNew), vbQuestion + vbYesNo) = vbYes Then
            szUrl = ""
            On Error Resume Next
            szUrl = frmHide.inet.OpenURL("http://mirror.elephantbase.net/xqwizard/download_trad.txt")
            On Error GoTo 0
            If Left(szUrl, 7) <> "http://" Then
                szUrl = "http://www.elephantbase.net/xqwizard/download.htm"
            End If
            ShellExecuteA 0, vbNullString, szUrl, vbNullString, vbNullString, SW_SHOWNORMAL
        Else
            Gui_szUpgradeVer = sz
        End If
    Else
        If bManual Then
            MsgBox "您的“象棋巫師”已經是最新版本了。", vbInformation
        End If
    End If
End If

End Sub

' 退弹
Public Sub ExitPopup()

Dim dfThisTime As Double, dfLastTime As Double
' 用到时才读注册表，避免重开窗口导致的重复访问。这里的做法与Gui_szAdvertDate相反，但达到的目的是一样的。
If GetSetting("XQWizard", "Gui", "PopupDate", "") = Date Then
    Exit Sub
End If
' 如果退弹成功，那么当天就不再退弹了
SaveSetting "XQWizard", "Gui", "PopupDate", Date
frmHide.web.Navigate "http://www.elephantbase.net/advert/popup_trad.htm"
' 退弹调用了frmHide.web，为保证成功，等待1秒钟
dfLastTime = Timer
Do
    DoEvents
    Sleep 1
    dfThisTime = Timer
    dfThisTime = dfThisTime + IIf(dfThisTime < dfLastTime, 86400#, 0#)
Loop Until dfThisTime > dfLastTime + 5#

End Sub

' 以下是主函數例程

Public Sub Main()

Dim dfThisTime As Double, nEventIndex As Integer, nLogFileNo As Integer
Dim hWnd As Long, i As Integer, bNewGame As Boolean, sz As String
Dim imgLoading As Picture

' 彈出啟動畫面，初始化
Randomize Timer
App_bPrevInstance = App.PrevInstance
App_szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")
frmStartup.Show
frmStartup.Refresh
CchessInit CCHESS_TRADITIONAL
' 判斷是否允許升變
If UCase(Left(Command, 2)) = "/P" Or UCase(Left(Command, 2)) = "-P" Then
    CchessPromotion 1
    App_bPromotion = True
    sz = Mid(Command, 4)
Else
    CchessPromotion 0
    App_bPromotion = False
    sz = Command
End If
EccoInitOpenVar CCHESS_TRADITIONAL
ConvInit
LoadRegs
LoadTips
If Options_bLargeGui Then
    Set App_frmMain = frmMainLarge
    For i = 0 To 31
        Set App_picPieces(i) = frmHide.imgPiecesLarge(i)
    Next
    Set App_picEngineRed = frmHide.imgEngineRedLarge.Picture
    Set App_picEngineBlack = frmHide.imgEngineBlackLarge.Picture
    BoardSettingLarge Options_nBoardL
    PiecesSettingLarge Options_nPiecesL
    ' 初始化 frmHide 中的小棋盤和小棋子，這些圖片會被 frmPosEdit 用到
    BoardSettingSmallHide Options_nBoardS
    PiecesSettingSmallHide Options_nPiecesS
Else
    Set App_frmMain = frmMainSmall
    For i = 0 To 31
        Set App_picPieces(i) = frmHide.imgPiecesSmall(i)
    Next
    Set App_picEngineRed = frmHide.imgEngineRed.Picture
    Set App_picEngineBlack = frmHide.imgEngineBlack.Picture
    BoardSettingSmall Options_nBoardS
    PiecesSettingSmall Options_nPiecesS
End If
MusicSetting Options_nMusic
Timer_bEnabled = False
' 加載引擎，可能有等待，啟動畫面保持
Engine_nStatus = IDLE_UNLOAD
If Engine_bEngineLog And Engine_szLogFile <> "" Then
    nLogFileNo = FreeFile
    On Error Resume Next
    Open Engine_szLogFile For Output As #nLogFileNo
    Close #nLogFileNo
    On Error GoTo 0
End If
OpenEngine
App_bRedTurn = False
bNewGame = False
If sz = "" Then
    App_szFileName = ""
    If Options_bAutoSave Then
        ReadFile AUTO_SAVE
    Else
        NewGame0
        ' 日積月累窗口關閉後，才能顯示“開始對局”窗口
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
' 加載廣告，如果加載失敗，則下載廣告列表，再次加載失敗則放棄
Gui_dfLastTime = 0#
Gui_nAdvertIndex = 0
Gui_nAdvertTimes(0) = 10 ' 10秒鐘後開始播放廣告
LoadAdvertList
If Gui_nAdvertNum = 0 Then
    DownloadAdvertList "advert_trad.txt"
    LoadAdvertList
    If Gui_nAdvertNum = 0 Then
        Gui_nAdvertNum = 1
        Gui_szAdvertFiles(1) = "elephantbase"
        Gui_nAdvertTimes(1) = 32767
    Else
        Gui_szAdvertDate = Date
    End If
End If
' 初始化 frmHide.web
frmHide.web.Navigate "about:blank"
' 檢查更新，如果用戶決定更新，會彈出下載頁面，出現在象棋巫師頁面之前
If Gui_szUpgradeDate <> Date Then
    CheckUpdate
End If
' 顯示并調整主窗口
If Not App_bPrevInstance Then
    App_frmMain.Left = Gui_nLeft
    App_frmMain.Top = Gui_nTop
End If
App_frmMain.Show
App_frmMain.web.Navigate2 App_szPath + "ADVERT\elephantbase.htm"
App_frmMain.txtMove.SetFocus
App_frmMain.tlb.ImageList = frmHide.imglst
For i = 1 To 29
    App_frmMain.tlb.Buttons(i).Image = i
Next
If Not App_bPromotion Then
    App_frmMain.mnMovePromote.Visible = False
    App_frmMain.mnMoveSep1.Visible = False
    App_frmMain.tlb.Buttons("MovePromote").Visible = False
End If
App_frmMain.mnOptionsTopMost.Checked = Options_bTopMost
Unload frmStartup
If Gui_bShowHowTo Then
    frmHowTo.Show vbModal, App_frmMain
End If
' 日積月累窗口關閉後，才能顯示“開始對局”窗口
If bNewGame Then
    NewGame
End If

' 進入用戶狀態，接收事件
nEventIndex = EVENT_TIMER
App_bRunning = True
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
            If Options_nMusic < MUSIC_NONE And Not App_bPrevInstance Then
                If frmHide.mci.Length = frmHide.mci.Position Then
                    frmHide.mci.To = 0
                    frmHide.mci.Command = "Seek"
                    frmHide.mci.Command = "Play"
                End If
            End If
            nEventIndex = EVENT_ADVERT
        Case EVENT_ADVERT ' 廣告
            ' 播放廣告可以跟引擎和播放棋局同時進行，所以不能用 Timer_dfLastTime，而是用 Gui_dfLastTime
            dfThisTime = Timer
            dfThisTime = dfThisTime + IIf(dfThisTime < Gui_dfLastTime, 86400#, 0#)
            If dfThisTime > Gui_dfLastTime + Gui_nAdvertTimes(Gui_nAdvertIndex) Then
                Gui_dfLastTime = Timer
                Gui_nAdvertIndex = Gui_nAdvertIndex + 1
                If Gui_nAdvertIndex > Gui_nAdvertNum Then
                    Gui_nAdvertIndex = 1
                End If
                App_frmMain.web.Navigate2 App_szPath + "ADVERT\" + Gui_szAdvertFiles(Gui_nAdvertIndex) + ".htm"
            End If
            nEventIndex = EVENT_GUI
        Case EVENT_GUI ' 界面
            DoEvents
            nEventIndex = EVENT_TIMER
        End Select
        Sleep 1
    End If
Loop
' 退出前下載廣告列表
If Gui_szAdvertDate <> Date Then
    DownloadAdvertList "advert_trad.txt"
    LoadAdvertList
    If Gui_nAdvertNum > 0 Then
        Gui_szAdvertDate = Date
    End If
End If
SaveRegs
PlaySoundA vbNullString, 0, 0
frmHide.mci.Command = "Close"
ExitPopup
Unload frmHide

End Sub

' 以上是主函數例程
