VERSION 5.00
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
Begin VB.Form frmAutoRun 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "XQWizard CD Version"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "AUTORUN.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnComputerChess 
      Caption         =   "ComputerChess"
      Height          =   375
      Left            =   3240
      TabIndex        =   13
      Top             =   2280
      Width           =   1335
   End
   Begin VB.CommandButton btnScoresCollection 
      Caption         =   "Scores Collection"
      Height          =   375
      Left            =   1680
      TabIndex        =   12
      Top             =   2280
      Width           =   1335
   End
   Begin VB.CommandButton btnFunnyChess 
      Caption         =   "Funny Chess"
      Height          =   375
      Left            =   120
      TabIndex        =   11
      Top             =   2280
      Width           =   1335
   End
   Begin VB.CommandButton btnElephantEyeReadme 
      Caption         =   "ElephantEye Readme"
      Height          =   375
      Left            =   3240
      TabIndex        =   10
      Top             =   1800
      Width           =   1335
   End
   Begin VB.CommandButton btnChineseWinBoard 
      Caption         =   "Chinese WinBoard"
      Height          =   375
      Left            =   1680
      TabIndex        =   9
      Top             =   1800
      Width           =   1335
   End
   Begin VB.CommandButton btnXQStudioPlugin 
      Caption         =   "XQStudio Plugin"
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   1800
      Width           =   1335
   End
   Begin VB.CommandButton btnTridReadme 
      Caption         =   "Trid. Readme"
      Height          =   375
      Left            =   3240
      TabIndex        =   6
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton btnTridFolder 
      Caption         =   "Trid. Folder"
      Height          =   375
      Left            =   1680
      TabIndex        =   5
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton btnSimpReadme 
      Caption         =   "Simp. Readme"
      Height          =   375
      Left            =   3240
      TabIndex        =   3
      Top             =   840
      Width           =   1335
   End
   Begin VB.CommandButton btnSimpFolder 
      Caption         =   "Simp. Folder"
      Height          =   375
      Left            =   1680
      TabIndex        =   2
      Top             =   840
      Width           =   1335
   End
   Begin VB.CommandButton btnTridSetup 
      Caption         =   "Trid. Setup"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton btnExit 
      Cancel          =   -1  'True
      Caption         =   "Exit"
      Height          =   375
      Left            =   1680
      TabIndex        =   14
      Top             =   2760
      Width           =   1335
   End
   Begin MCI.MMControl mci 
      Height          =   330
      Left            =   600
      TabIndex        =   7
      Top             =   2880
      Visible         =   0   'False
      Width           =   3540
      _ExtentX        =   6244
      _ExtentY        =   582
      _Version        =   393216
      DeviceType      =   ""
      FileName        =   ""
   End
   Begin VB.CommandButton btnSimpSetup 
      Caption         =   "Simp. Setup"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   1335
   End
   Begin VB.Label lblTitle 
      Alignment       =   2  'Center
      Caption         =   "XQWizard CD Version"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   360
      Width           =   3735
   End
   Begin VB.Image Image1 
      Height          =   720
      Left            =   120
      Picture         =   "AUTORUN.frx":0ABA
      Top             =   0
      Width           =   720
   End
End
Attribute VB_Name = "frmAutoRun"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Const SW_SHOWNORMAL As Long = 1
Private Declare Sub ShellExecuteA Lib "SHELL32.DLL" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long)

Const CD_TITLE As String = "歡迎使用象棋巫師光盤版"
Const SIMP_SETUP As String = "簡体版安裝"
Const SIMP_FOLDER As String = "簡体版目錄"
Const SIMP_README As String = "簡体版說明"
Const TRID_SETUP As String = "繁体版安裝"
Const TRID_FOLDER As String = "繁体版目錄"
Const TRID_README As String = "繁体版說明"
Const XQSTUDIO_PLUGIN As String = "XQStudio 插件"
Const CHINESE_WINBOARD As String = "中文 WinBoard"
Const ELEPHANTEYE_README As String = "“象眼”介紹"
Const FUNNY_CHESS As String = "趣味象棋"
Const SCORES_COLLECTION As String = "棋譜收藏"
Const COMPUTER_CHESS As String = "電腦象棋百科"
Const EXIT_CAPTION As String = "离開"

Private App_szPath As String

Private Sub Form_Load()

App_szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")
mci.Command = "Close"
mci.FileName = App_szPath + "AUTORUN.MID"
mci.Command = "Open"
mci.Command = "Play"
Caption = CD_TITLE
lblTitle.Caption = CD_TITLE
btnSimpSetup.Caption = SIMP_SETUP
btnSimpFolder.Caption = SIMP_FOLDER
btnSimpReadme.Caption = SIMP_README
btnTridSetup.Caption = TRID_SETUP
btnTridFolder.Caption = TRID_FOLDER
btnTridReadme.Caption = TRID_README
btnXQStudioPlugin.Caption = XQSTUDIO_PLUGIN
btnChineseWinBoard.Caption = CHINESE_WINBOARD
btnElephantEyeReadme.Caption = ELEPHANTEYE_README
btnFunnyChess.Caption = FUNNY_CHESS
btnScoresCollection.Caption = SCORES_COLLECTION
btnComputerChess.Caption = COMPUTER_CHESS
btnExit.Caption = EXIT_CAPTION

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

mci.Command = "Close"

End Sub

Private Sub btnSimpSetup_Click()

Shell App_szPath + "xqwizard_simp.exe", vbNormalFocus

End Sub

Private Sub btnSimpFolder_Click()

ShellExecuteA 0, vbNullString, App_szPath + "XQWSIMP", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnSimpReadme_Click()

ShellExecuteA 0, vbNullString, App_szPath + "README_S.TXT", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnTridSetup_Click()

Shell App_szPath + "xqwizard_trid.exe", vbNormalFocus

End Sub

Private Sub btnTridFolder_Click()

ShellExecuteA 0, vbNullString, App_szPath + "XQWTRID", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnTridReadme_Click()

ShellExecuteA 0, vbNullString, App_szPath + "README_T.TXT", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnXQStudioPlugin_Click()

Shell App_szPath + "xqftools.exe", vbNormalFocus

End Sub

Private Sub btnChineseWinBoard_Click()

ShellExecuteA 0, vbNullString, App_szPath + "WINBOARD", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnElephantEyeReadme_Click()

ShellExecuteA 0, vbNullString, App_szPath + "ELEEYE.TXT", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnFunnyChess_Click()

ShellExecuteA 0, vbNullString, App_szPath + "funnychess\question1.htm", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnScoresCollection_Click()

ShellExecuteA 0, vbNullString, App_szPath + "resource.htm", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnComputerChess_Click()

ShellExecuteA 0, vbNullString, App_szPath + "elephantbase.chm", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub btnExit_Click()

Unload Me

End Sub
