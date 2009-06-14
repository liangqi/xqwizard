VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmXQBooth 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   7200
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   5640
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "XQBSIMP.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   7200
   ScaleMode       =   0  'User
   ScaleWidth      =   5640
   StartUpPosition =   3  'Windows Default
   Begin InetCtlsObjects.Inet inet 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.CommandButton btnNext 
      Caption         =   "下一关"
      Height          =   975
      Left            =   4680
      Picture         =   "XQBSIMP.frx":0ABA
      Style           =   1  'Graphical
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   6240
      Width           =   975
   End
   Begin VB.CommandButton btnPrev 
      Caption         =   "上一关"
      Height          =   975
      Left            =   0
      Picture         =   "XQBSIMP.frx":0EBF
      Style           =   1  'Graphical
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   6240
      Width           =   975
   End
   Begin SHDocVwCtl.WebBrowser web 
      Height          =   975
      Left            =   960
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   6240
      Width           =   3735
      ExtentX         =   6588
      ExtentY         =   1720
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   0
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
   Begin VB.CommandButton btnBlur 
      Default         =   -1  'True
      Height          =   255
      Left            =   1080
      TabIndex        =   3
      Top             =   6360
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   89
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   88
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   87
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   86
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   85
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   84
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   83
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   82
      Left            =   720
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   81
      Left            =   120
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   80
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   79
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   78
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   77
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   76
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   75
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   74
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   73
      Left            =   720
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   72
      Left            =   120
      Stretch         =   -1  'True
      Top             =   4920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   71
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   70
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   69
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   68
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   67
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   66
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   65
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   64
      Left            =   720
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   63
      Left            =   120
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   62
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   61
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   60
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   59
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   58
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   57
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   56
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   55
      Left            =   720
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   54
      Left            =   120
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   53
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   52
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   51
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   50
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   49
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   48
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   47
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   46
      Left            =   720
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   45
      Left            =   120
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   44
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   43
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   42
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   41
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   40
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   39
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   38
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   37
      Left            =   720
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   36
      Left            =   120
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   35
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   34
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   33
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   32
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   31
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   30
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   29
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   28
      Left            =   720
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   27
      Left            =   120
      Stretch         =   -1  'True
      Top             =   1920
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   26
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   25
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   24
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   23
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   22
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   21
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   20
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   19
      Left            =   720
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   18
      Left            =   120
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   17
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   16
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   15
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   14
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   13
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   12
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   11
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   10
      Left            =   720
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   9
      Left            =   120
      Stretch         =   -1  'True
      Top             =   720
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   8
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   7
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   6
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   5
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   4
      Left            =   2520
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   3
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   2
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   1
      Left            =   720
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   0
      Left            =   120
      Stretch         =   -1  'True
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgBoard 
      Height          =   6255
      Left            =   0
      Picture         =   "XQBSIMP.frx":12C4
      Stretch         =   -1  'True
      Top             =   0
      Width           =   5655
   End
   Begin VB.Menu mnGame 
      Caption         =   "游戏(&G)"
      Begin VB.Menu mnGamePrev 
         Caption         =   "上一关(&P)"
         Shortcut        =   ^P
      End
      Begin VB.Menu mnGameSelect 
         Caption         =   "选关(&O)"
         Shortcut        =   ^O
      End
      Begin VB.Menu mnGameNext 
         Caption         =   "下一关(&N)"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnGameSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnGameRestart 
         Caption         =   "再来一次(&R)"
         Shortcut        =   ^R
      End
      Begin VB.Menu mnGameSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnGameExit 
         Caption         =   "离开(&X)"
      End
   End
   Begin VB.Menu mnUsers 
      Caption         =   "用户中心(&U)"
      Begin VB.Menu mnUsersSave 
         Caption         =   "提交成绩(&S)"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnUsersLoad 
         Caption         =   "获取成绩(&L)"
      End
      Begin VB.Menu mnUsersSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnUsersRank_ 
         Caption         =   "排名(&R)"
         Begin VB.Menu mnUsersRank 
            Caption         =   "近一周排名(&W)"
            Index           =   0
         End
         Begin VB.Menu mnUsersRank 
            Caption         =   "近一月排名(&M)"
            Index           =   1
         End
         Begin VB.Menu mnUsersRank 
            Caption         =   "近三月排名(&Q)"
            Index           =   2
         End
      End
      Begin VB.Menu mnUsersHome 
         Caption         =   "用户中心首页(&H)"
      End
   End
   Begin VB.Menu mnOptions 
      Caption         =   "选项(&O)"
      Begin VB.Menu mnOptionsBoard_ 
         Caption         =   "棋盘(&B)"
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "栎木(&A)"
            Index           =   0
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "绿色大理石(&B)"
            Index           =   1
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "白色大理石(&C)"
            Index           =   2
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "再生纸(&D)"
            Index           =   3
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "画布(&E)"
            Index           =   4
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "水滴(&F)"
            Index           =   5
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "蓝天白云(&G)"
            Index           =   6
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "象棋演播室(&H)"
            Index           =   7
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "弈天棋缘(&I)"
            Index           =   8
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "梦入神机(&J)"
            Index           =   9
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "纵马奔流(&K)"
            Index           =   10
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "浅红象棋(&L)"
            Index           =   11
         End
      End
      Begin VB.Menu mnOptionsPieces_ 
         Caption         =   "棋子(&P)"
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "木刻(&A)"
            Index           =   0
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "精致(&B)"
            Index           =   1
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "光泽(&C)"
            Index           =   2
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "象棋演播室(&D)"
            Index           =   3
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "弈天棋缘(&E)"
            Index           =   4
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "梦入神机(&F)"
            Index           =   5
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "纵马奔流(&G)"
            Index           =   6
         End
      End
      Begin VB.Menu mnOptionsSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnOptionsSounds 
         Caption         =   "音效(&S)"
      End
   End
   Begin VB.Menu mnHelp 
      Caption         =   "帮助(&H)"
      Begin VB.Menu mnHelpQuote 
         Caption         =   "名言(&Q)..."
      End
      Begin VB.Menu mnHelpSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpHome 
         Caption         =   "象棋巫师的网站(&H)"
      End
      Begin VB.Menu mnHelpUpdate 
         Caption         =   "检查最新版本(&P)"
      End
      Begin VB.Menu mnHelpSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpAbout 
         Caption         =   "关于象棋巫师(&A)..."
      End
   End
End
Attribute VB_Name = "frmXQBooth"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' XQBOOTH.FRM - Source Code for XiangQi Witchcraft School, Part II
'
' XiangQi Witchcraft School - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 4.0, Last Modified: Jun. 2009
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

Private Const BASE_URL As String = "http://users.elephantbase.net/game/"

Private Const DRAW_SELECTED As Boolean = True
Private Const DRAW_MATE As Boolean = True

Private Const PHASE_READY As Integer = 0
Private Const PHASE_BUSY As Integer = 1
Private Const PHASE_END As Integer = 2

Private Const USERS_SAVE As Integer = 0
Private Const USERS_LOAD As Integer = 1
Private Const USERS_RANK As Integer = 2

Private pos As PositionStruct
Private nPhase As Integer, sqSelected As Integer, mvLast As Long
Private nPhaseSaved As Integer, nUsersEvent As Integer

Private Function PieceFileName(ByVal nIndex As Integer) As String

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

Private Sub PlayWavSound(ByVal szSoundFile As String)

If Gui_bSounds Then
    PlaySoundA App_szPath + "SOUNDS\" + szSoundFile + ".WAV", 0, _
            SND_ASYNC + SND_NOWAIT + SND_FILENAME
End If

End Sub

Private Sub DrawSquare(ByVal sq As Integer, Optional ByVal bSelected As Boolean = False, _
        Optional ByVal bMate As Boolean = False)

Dim pc As Integer, nPicId As Integer, img As Image, i As Integer, x As Integer, y As Integer
pc = pos.ucpcSquares(sq)
If pc = 0 Then
    nPicId = 0
Else
    nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
End If
nPicId = nPicId + IIf(bSelected, 15, 0)
Set img = imgSquares((sq \ 16 - 3) * 9 + sq Mod 16 - 3)
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
img.Picture = frmHide.imgPieces(nPicId)

End Sub

Private Sub BoardFlush()

Dim i As Integer, j As Integer
For i = 3 To 12
    For j = 3 To 11
        DrawSquare i * 16 + j
    Next
Next

End Sub

Private Function GetResult(ByVal nStatus As Long) As Boolean

Dim sqMate As Integer
If (nStatus And MOVE_MATE) <> 0 Then
    If pos.sdPlayer = 0 Then
        PlayWavSound "PROMOTE2"
        If pos.ucsqPieces(16) > 0 Then
            DrawSquare pos.ucsqPieces(16), , DRAW_MATE
        End If
        MsgBoxMute "请再接再厉！", vbInformation
    Else
        PlayWavSound "PROMOTE"
        If pos.ucsqPieces(32) > 0 Then
            DrawSquare pos.ucsqPieces(32), , DRAW_MATE
        End If
        If Gui_nCurr = App_nEndgames - 1 Then
            MsgBoxMute "恭喜你闯过所有关卡！", vbInformation
        Else
            MsgBoxMute "恭喜你过关！", vbInformation
            mnGameNext.Enabled = True
            btnNext.Enabled = True
        End If
        If Gui_nCurr = Gui_nLast Then
            Gui_nLast = Gui_nLast + 1
        End If
    End If
    GetResult = True
    Exit Function
End If
If (nStatus And MOVE_PERPETUAL) <> 0 Then
    PlayWavSound "PROMOTE2"
    MsgBoxMute "请不要气馁！", vbInformation
    GetResult = True
    Exit Function
End If
' 由于"position fen ..."使用EPD文件中的初始局面，所以即便吃子也不能置pos为不可逆
If (nStatus And MOVE_CHECK) <> 0 Then
    PlayWavSound "CHECK" + IIf(pos.sdPlayer = 0, "2", "")
ElseIf (nStatus And MOVE_CAPTURE) <> 0 Then
    PlayWavSound "CAPTURE" + IIf(pos.sdPlayer = 0, "2", "")
Else
    PlayWavSound "MOVE" + IIf(pos.sdPlayer = 0, "2", "")
End If
GetResult = False

End Function

Private Sub Thinking()

Dim lpStr As Long, mv As Long, nStatus As Long
Dim i As Integer, sz As String

nPhase = PHASE_BUSY
MousePointer = vbHourglass
sz = "position fen " + App_szEndgames(Gui_nCurr)
If pos.nMoveNum > 1 Then
    sz = sz + " moves"
    For i = 1 To pos.nMoveNum - 1
        sz = sz + " " + Move2Coord(pos.rbsList(i).mvs And &HFFFF&)
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
If mvLast > 0 Then
    DrawSquare Src(mvLast)
    DrawSquare Dst(mvLast)
End If
CchessTryMove pos, nStatus, mv
DrawSquare Src(mv), DRAW_SELECTED
DrawSquare Dst(mv), DRAW_SELECTED
mvLast = mv
nPhase = IIf(GetResult(nStatus), PHASE_END, PHASE_READY)
MousePointer = vbDefault

End Sub

Public Sub LoadGame()

Dim bPrev As Boolean, bNext As Boolean

bPrev = Gui_nCurr > 0
mnGamePrev.Enabled = bPrev
btnPrev.Enabled = bPrev
bNext = Gui_nCurr < Gui_nLast And Gui_nCurr < App_nEndgames - 1
mnGameNext.Enabled = bNext
btnNext.Enabled = bNext
Caption = "第" + Str(Gui_nCurr + 1) + " 关 - 象棋魔法学校"
CchessFen2Board pos, App_szEndgames(Gui_nCurr)
BoardFlush
sqSelected = 0
mvLast = 0
nPhase = PHASE_READY

End Sub

Private Sub Form_Load()

mnOptionsBoard_Click Gui_nBoard
mnOptionsPieces_Click Gui_nPieces
LoadGame

End Sub

Private Sub Form_Unload(nCancel As Integer)

If nPhase = PHASE_BUSY Then
    nCancel = 1
Else
    App_bRunning = False
End If

End Sub

Private Sub mnGamePrev_Click()

If nPhase <> PHASE_BUSY Then
    Gui_nCurr = Gui_nCurr - 1
    LoadGame
End If

End Sub

Private Sub mnGameSelect_Click()

If nPhase <> PHASE_BUSY Then
    frmSelect.Show vbModal, Me
End If

End Sub

Private Sub mnGameNext_Click()

If nPhase <> PHASE_BUSY Then
    Gui_nCurr = Gui_nCurr + 1
    LoadGame
End If

End Sub

Private Sub mnGameRestart_Click()

If nPhase <> PHASE_BUSY Then
    LoadGame
End If

End Sub

Private Sub mnGameExit_Click()

If nPhase <> PHASE_BUSY Then
    Unload Me
End If

End Sub

Private Sub EnterBusy()

nPhaseSaved = nPhase
nPhase = PHASE_BUSY
MousePointer = vbHourglass

End Sub

Private Sub LeaveBusy()

nPhase = nPhaseSaved
MousePointer = vbDefault

End Sub

Private Sub ConnError()

MsgBox "无法登录到象棋巫师用户中心，请稍后再试。", vbExclamation

End Sub

Private Sub NoRetryError()

MsgBox "您的密码已经连续5次输入错误，请过5分钟再做尝试。", vbExclamation

End Sub

Private Sub LoginError()

MsgBox "用户名或密码不正确。", vbExclamation

End Sub

Private Sub inet_StateChanged(ByVal nState As Integer)

Dim szResult As String, nLast As Integer, szRanks() As String

If nState = icError Then
    ConnError
    LeaveBusy
    Exit Sub
End If
If nState <> icResponseCompleted Then
    Exit Sub
End If

szResult = inet.GetHeader("Login-Result")
Select Case nUsersEvent

Case USERS_SAVE
    ' 请求“提交”，处理响应
    Select Case szResult
    Case "ok"
        MsgBox "成绩提交成功。", vbInformation
    Case "nosave"
        MsgBox "您以前提交的成绩比当前成绩好，当前成绩不予提交。", vbInformation
    Case "error"
        LoginError
        LeaveBusy
        mnUsersSave_Click
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
        mnUsersLoad_Click
        Exit Sub
    Case "noretry"
        NoRetryError
    Case Else
        If (Left(szResult, 3) = "ok ") Then
            nLast = Str2Int(Mid(szResult, 3), 0, App_nEndgames)
            If nLast > Gui_nLast Then
                Gui_nLast = nLast
                Gui_nCurr = IIf(Gui_nLast = App_nEndgames, Gui_nLast - 1, Gui_nLast)
                LoadGame
                MsgBox "成绩获取成功。", vbInformation
            Else
                MsgBox "您原先提交的成绩不如当前成绩，原先成绩不予获取。", vbInformation
            End If
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
        mnUsersRank_Click Rank_nType
        Exit Sub
    Case "noretry"
        NoRetryError
    Case Else
        If (Left(szResult, 3) = "ok ") Then
            szRanks = Split(Mid(szResult, 3), "|")
            If UBound(szRanks) = 2 Then
                Rank_nScore = Str2Int(szRanks(0), 0, App_nEndgames)
                Rank_nToday = Str2Lng(szRanks(1))
                Rank_nYesterday = Str2Lng(szRanks(2))
                frmRank.Show vbModal, Me
            Else
                ConnError
            End If
        Else
            ConnError
        End If
    End Select
End Select
LeaveBusy

End Sub

Private Sub mnUsersSave_Click()

If nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szTitle = "提交成绩"
Login_szPrompt = ""
frmLogin.Show vbModal, Me
If Login_bCancel Then
    Exit Sub
End If

EnterBusy
nUsersEvent = USERS_SAVE
On Error GoTo lnError
inet.Execute BASE_URL + "save.php", _
        "POST", "score=" + LTrim(Str(Gui_nLast)), _
        "Content-Type: application/x-www-form-urlencoded" + vbCrLf + _
        "Login-UserName: " + Login_szUserName + vbCrLf + _
        "Login-Password: " + Login_szPassword + vbCrLf
On Error GoTo 0

Exit Sub
lnError:
ConnError
LeaveBusy

End Sub

Private Sub mnUsersLoad_Click()

If nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szTitle = "获取成绩"
Login_szPrompt = ""
frmLogin.Show vbModal, Me
If Login_bCancel Then
    Exit Sub
End If

EnterBusy
nUsersEvent = USERS_LOAD
On Error GoTo lnError
inet.Execute BASE_URL + "queryscore.php", "GET", "", _
        "Login-UserName: " + Login_szUserName + vbCrLf + _
        "Login-Password: " + Login_szPassword + vbCrLf
On Error GoTo 0

Exit Sub
lnError:
MsgBox Err
ConnError
LeaveBusy

End Sub

Private Sub mnUsersRank_Click(nIndex As Integer)

Dim szRankType As String
Rank_nType = nIndex
szRankType = Choose(Rank_nType + 1, "w", "m", "q")

Login_szTitle = "查询近" + Choose(Rank_nType + 1, "一周", "一个月", "三个月") + "排名"
Login_szPrompt = ""
frmLogin.Show vbModal, Me
If Login_bCancel Then
    Exit Sub
End If

EnterBusy
Rank_szList = ""
On Error Resume Next
Rank_szList = inet.OpenURL(BASE_URL + "ranklist.php?type=" + szRankType)
On Error GoTo 0
If Rank_szList = "" Then
    ConnError
    LeaveBusy
    Exit Sub
End If

nUsersEvent = USERS_RANK
On Error GoTo lnError
inet.Execute BASE_URL + "queryrank.php?type=" + szRankType, "GET", "", _
        "Login-UserName: " + Login_szUserName + vbCrLf + _
        "Login-Password: " + Login_szPassword + vbCrLf
On Error GoTo 0

Exit Sub
lnError:
ConnError
LeaveBusy

End Sub

Private Sub mnUsersHome_Click()

ShellExecuteA 0, vbNullString, "http://users.elephantbase.net/login.htm", _
        vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnOptionsBoard_Click(nIndex As Integer)

Dim i As Integer
On Error Resume Next
imgBoard.Picture = LoadPicture(App_szPath + "IMAGES_S\" + _
        Choose(nIndex + 1, "WOOD", "GREEN", "WHITE", "SHEET", "CANVAS", "DROPS", _
        "CLOUDS", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL", "QIANHONG") + ".GIF")
On Error GoTo 0
For i = 0 To BOARD_MAX - 1
    mnOptionsBoard(i).Checked = (nIndex = i)
Next
Gui_nBoard = nIndex

End Sub

Private Sub mnOptionsPieces_Click(nIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath + "IMAGES_S\" + Choose(nIndex + 1, _
        "WOOD", "DELICATE", "POLISH", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL") + "\"
On Error Resume Next
For i = 0 To 31
    frmHide.imgPieces(i).Picture = LoadPicture(sz + PieceFileName(i) + ".GIF")
Next
On Error GoTo 0
For i = 0 To PIECES_MAX - 1
    mnOptionsPieces(i).Checked = (nIndex = i)
Next
BoardFlush
Gui_nPieces = nIndex

End Sub

Private Sub mnOptionsSounds_Click()

Gui_bSounds = Not Gui_bSounds
mnOptionsSounds.Checked = Gui_bSounds

End Sub

Private Sub mnHelpQuote_Click()

MsgBoxWithIcon Gui_szQuotes(Int(Rnd * QUOTE_NUM + 1)), "名言", , ICON_QUOTE

End Sub

Private Sub mnHelpHome_Click()

ShellExecuteA 0, vbNullString, "http://www.elephantbase.net/", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnHelpMantis_Click()

ShellExecuteA 0, vbNullString, "http://mantis.elephantbase.net/", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnHelpUpdate_Click()

CheckUpdate MANUAL_UPDATE

End Sub

Private Sub mnHelpAbout_Click()

MsgBoxWithIcon "象棋巫师 " + STRING_VERSION + vbCrLf + "象棋百科全书 荣誉出品" + vbCrLf + vbCrLf + _
        STRING_COPYRIGHT + vbCrLf + "本产品符合GNU通用公共许可协议", "关于象棋巫师"

End Sub

Private Sub btnPrev_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnPrev.Enabled = False
btnPrev.Enabled = True
mnGamePrev_Click

End Sub

Private Sub btnNext_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnNext.Enabled = False
btnNext.Enabled = True
mnGameNext_Click

End Sub

Private Sub imgSquares_MouseDown(nIndex As Integer, nButton As Integer, nShift As Integer, x As Single, y As Single)

Dim sq As Integer, pc As Integer, mv As Long, nStatus As Long

If nPhase <> PHASE_READY Then
    Exit Sub
End If
sq = (nIndex \ 9 + 3) * 16 + nIndex Mod 9 + 3
pc = pos.ucpcSquares(sq)
If (pc And (16 + pos.sdPlayer * 16)) <> 0 Then
    If sqSelected > 0 Then
        DrawSquare sqSelected
    End If
    sqSelected = sq
    DrawSquare sqSelected, DRAW_SELECTED
    If mvLast > 0 Then
        DrawSquare Src(mvLast)
        DrawSquare Dst(mvLast)
    End If
    PlayWavSound "CLICK"
ElseIf sqSelected > 0 Then
    mv = mdlCChess.Move(sqSelected, sq)
    If CchessTryMove(pos, nStatus, mv) Then
        DrawSquare Src(mv), DRAW_SELECTED
        DrawSquare Dst(mv), DRAW_SELECTED
        mvLast = mv
        If GetResult(nStatus) Then
            nPhase = PHASE_END
        Else
            Thinking
        End If
    ElseIf (nStatus And MOVE_INCHECK) <> 0 Then
        PlayWavSound "ILLEGAL"
    End If
End If

End Sub

