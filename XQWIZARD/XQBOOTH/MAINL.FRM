VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmMainLarge 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   9600
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   7800
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "MAINL.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   9600
   ScaleMode       =   0  'User
   ScaleWidth      =   7800
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnRetract 
      Caption         =   "悔棋"
      Height          =   975
      Left            =   1080
      Picture         =   "MAINL.frx":0ABA
      Style           =   1  'Graphical
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   8640
      Width           =   975
   End
   Begin VB.CommandButton btnRestart 
      Caption         =   "再试一次"
      Height          =   975
      Left            =   6720
      Picture         =   "MAINL.frx":0F06
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   8640
      Width           =   1095
   End
   Begin VB.CommandButton btnHint 
      Caption         =   "提示"
      Height          =   975
      Left            =   0
      Picture         =   "MAINL.frx":13D0
      Style           =   1  'Graphical
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   8640
      Width           =   1095
   End
   Begin VB.CommandButton btnNext 
      Caption         =   "下一关"
      Height          =   975
      Left            =   6720
      Picture         =   "MAINL.frx":1812
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   8640
      Width           =   1095
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "提交存档"
      Height          =   975
      Left            =   5760
      Picture         =   "MAINL.frx":1CDF
      Style           =   1  'Graphical
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   8640
      Width           =   975
   End
   Begin InetCtlsObjects.Inet inet 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   10
   End
   Begin SHDocVwCtl.WebBrowser web 
      Height          =   975
      Left            =   2040
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   8640
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
      Location        =   "http:///"
   End
   Begin VB.CommandButton btnBlur 
      Default         =   -1  'True
      Height          =   255
      Left            =   2160
      TabIndex        =   6
      Top             =   8760
      Width           =   255
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   89
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   88
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   87
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   86
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   85
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   84
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   83
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   82
      Left            =   960
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   81
      Left            =   120
      Stretch         =   -1  'True
      Top             =   7680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   80
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   79
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   78
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   77
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   76
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   75
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   74
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   73
      Left            =   960
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   72
      Left            =   120
      Stretch         =   -1  'True
      Top             =   6840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   71
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   70
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   69
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   68
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   67
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   66
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   65
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   64
      Left            =   960
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   63
      Left            =   120
      Stretch         =   -1  'True
      Top             =   6000
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   62
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   61
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   60
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   59
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   58
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   57
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   56
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   55
      Left            =   960
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   54
      Left            =   120
      Stretch         =   -1  'True
      Top             =   5160
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   53
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   52
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   51
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   50
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   49
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   48
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   47
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   46
      Left            =   960
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   45
      Left            =   120
      Stretch         =   -1  'True
      Top             =   4320
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   44
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   43
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   42
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   41
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   40
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   39
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   38
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   37
      Left            =   960
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   36
      Left            =   120
      Stretch         =   -1  'True
      Top             =   3480
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   35
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   34
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   33
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   32
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   31
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   30
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   29
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   28
      Left            =   960
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   27
      Left            =   120
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   26
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   25
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   24
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   23
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   22
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   21
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   20
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   19
      Left            =   960
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   18
      Left            =   120
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   17
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   16
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   15
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   14
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   13
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   12
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   11
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   10
      Left            =   960
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   9
      Left            =   120
      Stretch         =   -1  'True
      Top             =   960
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   8
      Left            =   6840
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   7
      Left            =   6000
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   6
      Left            =   5160
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   5
      Left            =   4320
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   4
      Left            =   3480
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   3
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   2
      Left            =   1800
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   1
      Left            =   960
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   0
      Left            =   120
      Stretch         =   -1  'True
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgBoard 
      Height          =   8655
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   7815
   End
   Begin VB.Menu mnGame 
      Caption         =   "游戏(&G)"
      Begin VB.Menu mnGameSelect 
         Caption         =   "选关(&O)"
         Shortcut        =   ^O
      End
      Begin VB.Menu mnGameNext 
         Caption         =   "下一关(&N)"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnGameRestart 
         Caption         =   "再试一次(&R)"
         Shortcut        =   ^R
      End
      Begin VB.Menu mnGameSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnGameXQWizard 
         Caption         =   "用象棋巫师打开(&X)"
      End
      Begin VB.Menu mnGameSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnGameHint 
         Caption         =   "提示(&H)"
         Shortcut        =   ^H
      End
      Begin VB.Menu mnGameRetract 
         Caption         =   "悔棋(&T)"
         Shortcut        =   ^T
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
         Caption         =   "提交存档(&S)"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnUsersLoad 
         Caption         =   "获取存档(&L)"
      End
      Begin VB.Menu mnUsersSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnUsersRank 
         Caption         =   "排名(&R)"
      End
      Begin VB.Menu mnUsersPoints 
         Caption         =   "查询点数(&P)"
      End
      Begin VB.Menu mnUsersCenter 
         Caption         =   "用户中心首页(&C)"
      End
      Begin VB.Menu mnUsersSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnUsersHelp 
         Caption         =   "求助(&E)"
      End
   End
   Begin VB.Menu mnMobile 
      Caption         =   "手机版(&M)"
      Begin VB.Menu mnMobileSave 
         Caption         =   "提交存档到手机(&S)"
      End
      Begin VB.Menu mnMobileLoad 
         Caption         =   "从手机获取存档(&L)"
      End
      Begin VB.Menu mnMobileSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnMobileDownload 
         Caption         =   "下载手机版(&D)"
      End
      Begin VB.Menu mnMobileRegister 
         Caption         =   "获得许可证(&R)"
      End
   End
   Begin VB.Menu mnOptions 
      Caption         =   "选项(&O)"
      Begin VB.Menu mnOptionsGui 
         Caption         =   "界面(&G)"
         Begin VB.Menu mnOptionsGuiSmall 
            Caption         =   "小(&S)"
         End
         Begin VB.Menu mnOptionsGuiLarge 
            Caption         =   "大(&L)"
         End
      End
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
            Caption         =   "浅红象棋(&L)"
            Index           =   6
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
      End
      Begin VB.Menu mnOptionsSounds 
         Caption         =   "音效(&S)"
      End
      Begin VB.Menu mnOptionsSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnOptionsLanguage_ 
         Caption         =   "语言/&Language"
         Begin VB.Menu mnOptionsLanguage 
            Caption         =   "简体中文/&Simplified Chinese"
            Index           =   0
         End
         Begin VB.Menu mnOptionsLanguage 
            Caption         =   "繁体中文/&Traditional Chinese"
            Index           =   1
         End
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
      Begin VB.Menu mnHelpUpdate 
         Caption         =   "检查最新版本(&P)"
      End
      Begin VB.Menu mnHelpHome 
         Caption         =   "象棋百科全书(&H)"
      End
      Begin VB.Menu mnHelpSuggest 
         Caption         =   "意见反馈(&S)"
      End
      Begin VB.Menu mnHelpSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpAbout 
         Caption         =   "关于象棋巫师(&A)..."
      End
   End
End
Attribute VB_Name = "frmMainLarge"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MAINL.FRM - Source Code for XiangQi Witchcraft School, Part II
'
' XiangQi Witchcraft School - a Chinese Chess Endgame Challenge Game
' Designed by Morning Yellow, Version: 4.64, Last Modified: May 2010
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

Private Sub Form_Load()

mnOptionsBoard_Click Options_nBoardL
mnOptionsPieces_Click Options_nPiecesL
ClearHint
LoadGame

If Options_nLanguage = LANGUAGE_ZH_CN Then
    Exit Sub
End If
mnOptionsBoard(0).Caption = "櫟木(&A)"
mnOptionsBoard(1).Caption = "綠色大理石(&B)"
mnOptionsBoard(2).Caption = "白色大理石(&C)"
mnOptionsBoard(3).Caption = "再生紙(&D)"
mnOptionsBoard(4).Caption = "畫布(&E)"
mnOptionsBoard(5).Caption = "水滴(&F)"
mnOptionsBoard(6).Caption = "淺紅象棋(&G)"
mnOptionsPieces(0).Caption = "木刻(&A)"
mnOptionsPieces(1).Caption = "精緻(&B)"
mnOptionsPieces(2).Caption = "光澤(&C)"

End Sub

Private Sub Form_Unload(nCancel As Integer)

If App_nPhase = PHASE_BUSY Then
    nCancel = 1
Else
    App_bRunning = False
End If

End Sub

Private Sub mnGameSelect_Click()

If App_nPhase <> PHASE_BUSY Then
    frmSelect.Show vbModal, Me
End If

End Sub

Private Sub mnGameNext_Click()

If App_nPhase <> PHASE_BUSY Then
    ClearHint
    Gui_nCurr = Gui_nCurr + 1
    LoadGame
End If

End Sub

Private Sub mnGameRestart_Click()

If App_nPhase <> PHASE_BUSY Then
    LoadGame
End If

End Sub

Private Sub mnGameXQWizard_Click()

OpenWithXQWizard

End Sub

Private Sub mnGameHint_Click()

TryHint

End Sub

Private Sub mnGameRetract_Click()

TryRetract

End Sub

Private Sub mnGameExit_Click()

If App_nPhase <> PHASE_BUSY Then
    Unload Me
End If

End Sub

Private Sub inet_StateChanged(ByVal nState As Integer)

If nState = icError Then
    ConnError
    LeaveBusy
    Exit Sub
End If
If nState <> icResponseCompleted Then
    Exit Sub
End If
DoUsersEvent

End Sub

Private Sub mnUsersSave_Click()

TrySave

End Sub

Private Sub mnUsersLoad_Click()

TryLoad

End Sub

Private Sub mnUsersRank_Click()

TryRank

End Sub

Private Sub mnUsersPoints_Click()

TryPoints

End Sub

Private Sub mnUsersCenter_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnMobileSave_Click()

TryGetCode

End Sub

Private Sub mnMobileLoad_Click()

TryPutCode

End Sub


Private Sub mnMobileDownload_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/xqblight.htm", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnMobileRegister_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=xqblight", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnUsersHelp_Click()

frmPublish.Show vbModal, Me

End Sub

Private Sub mnOptionsGuiSmall_Click()

If Not mnOptionsGuiSmall.Checked Then
    SwapGui
End If

End Sub

Private Sub mnOptionsGuiLarge_Click()

If Not mnOptionsGuiLarge.Checked Then
    SwapGui
End If

End Sub

Private Sub mnOptionsBoard_Click(nIndex As Integer)

Dim i As Integer
On Error Resume Next
frmHide.imgBoardLarge.Picture = LoadPicture(App_szPath & "IMAGES_L\" & _
        Choose(nIndex + 1, "WOOD", "GREEN", "WHITE", "SHEET", "CANVAS", "DROPS", "QIANHONG") & ".GIF")
On Error GoTo 0
imgBoard.Picture = frmHide.imgBoardLarge
For i = 0 To BOARD_L_MAX - 1
    mnOptionsBoard(i).Checked = (nIndex = i)
Next
Options_nBoardL = nIndex

End Sub

Private Sub mnOptionsPieces_Click(nIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath & "IMAGES_L\" & Choose(nIndex + 1, "WOOD", "DELICATE", "POLISH") & "\"
On Error Resume Next
For i = 0 To 31
    frmHide.imgPiecesLarge(i).Picture = LoadPicture(sz & PieceFileName(i) & ".GIF")
Next
On Error GoTo 0
For i = 0 To PIECES_L_MAX - 1
    mnOptionsPieces(i).Checked = (nIndex = i)
Next
BoardFlush
Options_nPiecesL = nIndex

End Sub

Private Sub mnOptionsSounds_Click()

Options_bSounds = Not Options_bSounds
mnOptionsSounds.Checked = Options_bSounds

End Sub

Private Sub mnOptionsLanguage_Click(nIndex As Integer)

Dim i As Integer
If mnOptionsLanguage(nIndex).Checked Then
    Exit Sub
End If
For i = 0 To LANGUAGE_MAX - 1
    mnOptionsLanguage(i).Checked = False
Next
mnOptionsLanguage(nIndex).Checked = True
SaveSetting "XQWizard", "Options", "Language", nIndex
MsgBox L("语言已经更改，重新启动程序后才能生效。", "語言已經更改，重新啟動程序後才能生效。"), vbInformation

End Sub

Private Sub mnHelpQuote_Click()

MsgBoxWithIcon Gui_szQuotes(Int(Rnd * QUOTE_NUM + 1)), L("名言", "名言"), , ICON_QUOTE

End Sub

Private Sub mnHelpUpdate_Click()

CheckUpdate "xqbooth", MANUAL_UPDATE

End Sub

Private Sub mnHelpHome_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpSuggest_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=suggest", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpAbout_Click()

AboutXQWizard

End Sub

Private Sub btnHint_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnHint.Enabled = False
btnHint.Enabled = True
TryHint

End Sub

Private Sub btnRetract_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnRetract.Enabled = False
btnRetract.Enabled = True
TryRetract

End Sub

Private Sub btnSave_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnSave.Enabled = False
btnSave.Enabled = True
TrySave

End Sub

Private Sub btnNext_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnNext.Enabled = False
btnNext.Enabled = True
mnGameNext_Click

End Sub

Private Sub btnRestart_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnRestart.Enabled = False
btnRestart.Enabled = True
mnGameRestart_Click

End Sub

Private Sub imgSquares_MouseDown(nIndex As Integer, nButton As Integer, nShift As Integer, x As Single, y As Single)

Dim sq As Integer, pc As Integer, mv As Long, nStatus As Long

If App_nPhase <> PHASE_READY Then
    Exit Sub
End If
ClickSquare (nIndex \ 9 + 3) * 16 + nIndex Mod 9 + 3

End Sub
