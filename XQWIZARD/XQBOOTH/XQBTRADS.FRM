VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmXQBoothSmall 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   7200
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   5640
   BeginProperty Font 
      Name            =   "細明體"
      Size            =   9
      Charset         =   136
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "XQBTRADS.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   7200
   ScaleMode       =   0  'User
   ScaleWidth      =   5640
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnRestart 
      Caption         =   "刚Ω"
      Height          =   495
      Left            =   4680
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   6720
      Width           =   975
   End
   Begin VB.CommandButton btnHint 
      Caption         =   "矗ボ"
      Height          =   495
      Left            =   0
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   6720
      Width           =   975
   End
   Begin VB.CommandButton btnRetract 
      Caption         =   "囱"
      Height          =   495
      Left            =   0
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   6240
      Width           =   975
   End
   Begin VB.CommandButton btnNext 
      Caption         =   "闽"
      Height          =   495
      Left            =   4680
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   6720
      Width           =   975
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "矗ユΘ罿"
      Height          =   495
      Left            =   4680
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   6240
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
      Left            =   960
      TabIndex        =   5
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
      TabIndex        =   6
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
      Picture         =   "XQBTRADS.frx":0ABA
      Stretch         =   -1  'True
      Top             =   0
      Width           =   5655
   End
   Begin VB.Menu mnGame 
      Caption         =   "村栏(&G)"
      Begin VB.Menu mnGameSelect 
         Caption         =   "匡闽(&O)"
         Shortcut        =   ^O
      End
      Begin VB.Menu mnGameNext 
         Caption         =   "闽(&N)"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnGameRestart 
         Caption         =   "刚Ω(&R)"
         Shortcut        =   ^R
      End
      Begin VB.Menu mnGameSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnGameHint 
         Caption         =   "矗ボ(&H)"
         Shortcut        =   ^H
      End
      Begin VB.Menu mnGameRetract 
         Caption         =   "囱(&T)"
         Shortcut        =   ^T
      End
      Begin VB.Menu mnGameSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnGameExit 
         Caption         =   "置秨(&X)"
      End
   End
   Begin VB.Menu mnUsers 
      Caption         =   "ノめいみ(&U)"
      Begin VB.Menu mnUsersSave 
         Caption         =   "矗ユΘ罿(&S)"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnUsersLoad 
         Caption         =   "莉Θ罿(&L)"
      End
      Begin VB.Menu mnUsersSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnUsersHint 
         Caption         =   "矗ボ(&H)"
         Visible         =   0   'False
      End
      Begin VB.Menu mnUsersRetract 
         Caption         =   "囱(&T)"
         Visible         =   0   'False
      End
      Begin VB.Menu mnUsersSep2 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnUsersRank_ 
         Caption         =   "逼(&R)"
         Begin VB.Menu mnUsersRank 
            Caption         =   "㏄逼(&W)"
            Index           =   0
         End
         Begin VB.Menu mnUsersRank 
            Caption         =   "る逼(&M)"
            Index           =   1
         End
         Begin VB.Menu mnUsersRank 
            Caption         =   "る逼(&Q)"
            Index           =   2
         End
      End
      Begin VB.Menu mnUsersPoints 
         Caption         =   "琩高翴计(&P)"
      End
      Begin VB.Menu mnUsersHome 
         Caption         =   "ノめいみ(&H)"
      End
   End
   Begin VB.Menu mnOptions 
      Caption         =   "匡兜(&O)"
      Begin VB.Menu mnOptionsGui 
         Caption         =   "(&G)"
         Begin VB.Menu mnOptionsGuiSmall 
            Caption         =   "(&S)"
         End
         Begin VB.Menu mnOptionsGuiLarge 
            Caption         =   "(&L)"
         End
      End
      Begin VB.Menu mnOptionsSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnOptionsBoard_ 
         Caption         =   "囱絃(&B)"
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "騌れ(&A)"
            Index           =   0
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "厚︹瞶ホ(&B)"
            Index           =   1
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "フ︹瞶ホ(&C)"
            Index           =   2
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "ネ(&D)"
            Index           =   3
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "礶ガ(&E)"
            Index           =   4
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "簑(&F)"
            Index           =   5
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "屡ぱフお(&G)"
            Index           =   6
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "禜囱簍冀(&H)"
            Index           =   7
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "ぱ囱絫(&I)"
            Index           =   8
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "冠审(&J)"
            Index           =   9
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "羇皑゜瑈(&K)"
            Index           =   10
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "睱禜囱(&L)"
            Index           =   11
         End
      End
      Begin VB.Menu mnOptionsPieces_ 
         Caption         =   "囱(&P)"
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "れㄨ(&A)"
            Index           =   0
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "弘璓(&B)"
            Index           =   1
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "緼(&C)"
            Index           =   2
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "禜囱簍冀(&D)"
            Index           =   3
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "ぱ囱絫(&E)"
            Index           =   4
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "冠审(&F)"
            Index           =   5
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "羇皑゜瑈(&G)"
            Index           =   6
         End
      End
      Begin VB.Menu mnOptionsSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnOptionsSounds 
         Caption         =   "(&S)"
      End
   End
   Begin VB.Menu mnHelp 
      Caption         =   "腊(&H)"
      Begin VB.Menu mnHelpQuote 
         Caption         =   "ē(&Q)..."
      End
      Begin VB.Menu mnHelpSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpHome 
         Caption         =   "禜囱畍蔍(&H)"
      End
      Begin VB.Menu mnHelpMantis 
         Caption         =   "厨炒(&B)"
      End
      Begin VB.Menu mnHelpUpdate 
         Caption         =   "浪琩程穝セ(&P)"
      End
      Begin VB.Menu mnHelpSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpAbout 
         Caption         =   "闽禜囱畍(&A)..."
      End
   End
End
Attribute VB_Name = "frmXQBoothSmall"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' XQBOOTH.FRM - Source Code for XiangQi Witchcraft School, Part II
'
' XiangQi Witchcraft School - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 4.11, Last Modified: Jul. 2009
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
Private Const DRAW_REFRESH As Boolean = True

Private Enum PhaseEnum
    PHASE_READY = 0
    PHASE_BUSY = 1
    PHASE_WIN = 2
    PHASE_LOSS = 3
End Enum

Private Enum HintEnum
    HINT_NONE = 0
    HINT_RESTART = 1
    HINT_RETRY = 2
End Enum

Private Enum EventEnum
    USERS_SAVE = 0
    USERS_LOAD = 1
    USERS_RANK = 2
    USERS_HINT = 3
    USERS_RETRACT = 4
    USERS_POINTS = 5
End Enum

Private pos As PositionStruct
Private sqSelected As Integer, mvLast As Long
Private nPhase As PhaseEnum, nPhaseSaved As PhaseEnum
Private nUsersEvent As EventEnum, nHint As HintEnum, dfHintTime As Double

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

If Options_bSounds Then
    PlaySoundA App_szPath + "SOUNDS\" + szSoundFile + ".WAV", 0, _
            SND_ASYNC + SND_NOWAIT + SND_FILENAME
End If

End Sub

Private Sub DrawSquare(ByVal sq As Integer, Optional ByVal bSelected As Boolean = False, _
        Optional ByVal bMate As Boolean = False, Optional ByVal bRefresh As Boolean = False)

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
img.Picture = frmHide.imgPiecesSmall(nPicId)
If bRefresh Then
    img.Refresh
End If

End Sub

Private Sub BoardFlush()

Dim i As Integer, j As Integer
For i = 3 To 12
    For j = 3 To 11
        DrawSquare i * 16 + j
    Next
Next

End Sub

Private Sub EnableHint(ByVal bEnabled As Boolean)

mnGameHint.Enabled = bEnabled
mnUsersHint.Enabled = bEnabled
btnHint.Enabled = bEnabled

End Sub

Private Sub EnableRetract(ByVal bEnabled As Boolean)

mnGameRetract.Enabled = bEnabled
mnUsersRetract.Enabled = bEnabled
btnRetract.Enabled = bEnabled

End Sub

Private Function GetResult(ByVal nStatus As Long) As Integer

Dim sqMate As Integer
btnNext.Visible = False
btnRestart.Visible = True
EnableRetract True
If (nStatus And MOVE_MATE) <> 0 Then
    EnableHint False
    If pos.sdPlayer = 0 Then
        PlayWavSound "PROMOTE2"
        If pos.ucsqPieces(16) > 0 Then
            DrawSquare pos.ucsqPieces(16), , DRAW_MATE
        End If
        MsgBoxMute "請再接再厲！", vbInformation
        GetResult = PHASE_LOSS
    Else
        btnRestart.Visible = False
        btnNext.Visible = True
        If Gui_nCurr < App_nEndgames - 1 Then
            mnGameNext.Enabled = True
            btnNext.Enabled = True
        End If
        PlayWavSound "PROMOTE"
        If pos.ucsqPieces(32) > 0 Then
            DrawSquare pos.ucsqPieces(32), , DRAW_MATE
        End If
        If Gui_nCurr = App_nEndgames - 1 Then
            MsgBoxMute "恭喜你闖過所有關卡！", vbInformation
        Else
            MsgBoxMute "恭喜你過關！", vbInformation
        End If
        If Gui_nCurr = Gui_nLast Then
            Gui_nLast = Gui_nLast + 1
        End If
        GetResult = PHASE_WIN
    End If
    Exit Function
End If
If (nStatus And MOVE_PERPETUAL) <> 0 Then
    EnableHint False
    PlayWavSound "PROMOTE2"
    MsgBoxMute "請不要气餒！", vbInformation
    GetResult = PHASE_LOSS
    Exit Function
End If
' 由于"position fen ..."使用EPD文件中的初始局面，所以即便吃子也不能置pos為不可逆
If (nStatus And MOVE_CHECK) <> 0 Then
    PlayWavSound "CHECK" + IIf(pos.sdPlayer = 0, "2", "")
ElseIf (nStatus And MOVE_CAPTURE) <> 0 Then
    PlayWavSound "CAPTURE" + IIf(pos.sdPlayer = 0, "2", "")
Else
    PlayWavSound "MOVE" + IIf(pos.sdPlayer = 0, "2", "")
End If
GetResult = PHASE_READY

End Function

Private Function GetBestMove() As Long

Dim lpStr As Long, mv As Long, nStatus As Long
Dim i As Integer, sz As String
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
GetBestMove = mv

End Function

Public Sub ClearHint()

nHint = HINT_NONE
dfHintTime = Timer

End Sub

Public Sub LoadGame()

Dim bNext As Boolean
btnNext.Visible = True
btnRestart.Visible = False
bNext = Gui_nCurr < Gui_nLast And Gui_nCurr < App_nEndgames - 1
mnGameNext.Enabled = bNext
btnNext.Enabled = bNext
EnableHint True
EnableRetract False
Caption = "第" + Str(Gui_nCurr + 1) + " 關 - 象棋魔法學校"
CchessFen2Board pos, App_szEndgames(Gui_nCurr)
BoardFlush
sqSelected = 0
mvLast = 0
nPhase = PHASE_READY
If nHint = HINT_RETRY Then
    nHint = HINT_RESTART
End If

End Sub

Private Sub Form_Load()

mnOptionsGuiSmall.Checked = Not Options_bLargeGui
mnOptionsGuiLarge.Checked = Options_bLargeGui
mnOptionsBoard_Click Options_nBoardS
mnOptionsPieces_Click Options_nPiecesS
ClearHint
LoadGame

End Sub

Private Sub Form_Unload(nCancel As Integer)

If nPhase = PHASE_BUSY Then
    nCancel = 1
Else
    App_bRunning = False
End If

End Sub

Private Sub mnGameSelect_Click()

If nPhase <> PHASE_BUSY Then
    frmSelect.Show vbModal, Me
End If

End Sub

Private Sub mnGameNext_Click()

If nPhase <> PHASE_BUSY Then
    ClearHint
    Gui_nCurr = Gui_nCurr + 1
    LoadGame
End If

End Sub

Private Sub mnGameRestart_Click()

If nPhase <> PHASE_BUSY Then
    LoadGame
End If

End Sub

Private Sub mnGameHint_Click()

mnUsersHint_Click

End Sub

Private Sub mnGameRetract_Click()

mnUsersRetract_Click

End Sub

Private Sub mnGameExit_Click()

If nPhase <> PHASE_BUSY Then
    Unload Me
End If

End Sub

Private Sub DoHint()

Dim mv As Long, i As Integer

nHint = HINT_RETRY
mv = GetBestMove
MousePointer = vbNormal
If sqSelected > 0 Then
    DrawSquare sqSelected
ElseIf mvLast > 0 Then
    DrawSquare Src(mvLast)
    DrawSquare Dst(mvLast)
End If
For i = 1 To 5
    DrawSquare Src(mv), DRAW_SELECTED, , DRAW_REFRESH
    Sleep 250
    DrawSquare Dst(mv), DRAW_SELECTED, , DRAW_REFRESH
    DrawSquare Src(mv), , , DRAW_REFRESH
    Sleep 250
    DrawSquare Dst(mv), , , DRAW_REFRESH
Next
If sqSelected > 0 Then
    DrawSquare sqSelected, DRAW_SELECTED
ElseIf mvLast > 0 Then
    DrawSquare Src(mvLast), DRAW_SELECTED
    DrawSquare Dst(mvLast), DRAW_SELECTED
End If

End Sub

Private Sub DoRetract()

If pos.nDistance = 0 Then
    MsgBox "悔棋失敗。", vbInformation
    Exit Sub
End If
If pos.nDistance Mod 2 = 0 Then
    CchessUndoMove pos
End If
CchessUndoMove pos
BoardFlush
sqSelected = 0
mvLast = 0
' DoRetract 都是在 EnterBusy 后調用的，所以要修改 nPhaseSaved 而不是 nPhase
nPhaseSaved = PHASE_READY
If pos.nDistance = 0 Then
    EnableRetract False
End If
EnableHint True

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

MsgBox "無法登錄到象棋巫師用戶中心，請稍後再試。", vbExclamation

End Sub

Private Sub LoginError()

MsgBox "用戶名或密碼不正确。", vbExclamation

End Sub

Private Sub NoRetryError()

MsgBox "您的密碼已經連續5次輸入錯誤，請過5分鐘再做嘗試。", vbExclamation

End Sub

Private Sub NoPointsError(ByVal nPoints As Integer)

MsgBox "您的點數不足" + Str(nPoints) + " 點，補充點數後才能使用此功能。", vbExclamation
ShellExecuteA 0, vbNullString, "http://users.elephantbase.net/charge.htm", _
        vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub inet_StateChanged(ByVal nState As Integer)

Dim szResult As String, nResult As Integer, bLoad As Boolean, szResults() As String

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
    ' 請求“提交”，處理響應
    Select Case szResult
    Case "ok"
        MsgBox "成績提交成功。", vbInformation
    Case "nosave"
        MsgBox "您以前提交的成績比當前成績好，當前成績不予提交。", vbInformation
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
    ' 請求“獲取”，處理響應
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
            nResult = Str2Int(Mid(szResult, 3), 0, App_nEndgames)
            bLoad = False
            If nResult > Gui_nLast Then
                bLoad = True
            ElseIf MsgBox("您將獲取的成績不如當前成績，是否覆蓋當前成績？", vbQuestion + vbYesNo) = vbYes Then
                bLoad = True
            End If
            If bLoad Then
                Gui_nLast = nResult
                ClearHint
                Gui_nCurr = IIf(Gui_nLast = App_nEndgames, Gui_nLast - 1, Gui_nLast)
                LoadGame
                ' 这里在 LeaveBusy 前，所以要修改 nPhaseSaved 重置状态
                nPhaseSaved = PHASE_READY
                MsgBox "成績獲取成功。", vbInformation
            End If
        Else
            ConnError
        End If
    End Select

Case USERS_RANK
    ' 請求“排名”，獲取響應
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
            szResults = Split(Mid(szResult, 3), "|")
            If UBound(szResults) = 2 Then
                Rank_nScore = Str2Int(szResults(0), 0, App_nEndgames)
                Rank_nToday = Str2Lng(szResults(1))
                Rank_nYesterday = Str2Lng(szResults(2))
                frmRank.Show vbModal, Me
            Else
                ConnError
            End If
        Else
            ConnError
        End If
    End Select

Case USERS_HINT
    ' 請求“提示”，獲取響應
    Select Case szResult
    Case "ok"
        DoHint
    Case "error"
        LoginError
        LeaveBusy
        mnUsersHint_Click
        Exit Sub
    Case "noretry"
        NoRetryError
    Case "nopoints"
        NoPointsError IIf(Gui_nCurr > 1000, Gui_nCurr \ 100, 10)
    Case Else
        ConnError
    End Select

Case USERS_RETRACT
    ' 請求“悔棋”，獲取響應
    Select Case szResult
    Case "ok"
        DoRetract
    Case "error"
        LoginError
        LeaveBusy
        mnUsersRetract_Click
        Exit Sub
    Case "noretry"
        NoRetryError
    Case "nopoints"
        NoPointsError 1
    Case Else
        ConnError
    End Select

Case USERS_POINTS
    ' 請求“查詢點數”，處理響應
    Select Case szResult
    Case "error"
        LoginError
        LeaveBusy
        mnUsersPoints_Click
        Exit Sub
    Case "noretry"
        NoRetryError
    Case Else
        If (Left(szResult, 3) = "ok ") Then
            szResults = Split(Mid(szResult, 3), "|")
            If UBound(szResults) = 1 Then
                nResult = Str2Int(szResults(1))
                MsgBox "您還有" + szResults(0) + "點可用。" + IIf(nResult < 2800, "", _
                        vbCrLf + vbCrLf + "您是白金會員用戶，可以無限次使用提示和悔棋功能。"), vbInformation
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

Login_szTitle = "提交成績"
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
On Error GoTo 0
ConnError
LeaveBusy

End Sub

Private Sub mnUsersLoad_Click()

If nPhase = PHASE_BUSY Then
    Exit Sub
End If

Login_szTitle = "獲取成績"
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
On Error GoTo 0
MsgBox Err
ConnError
LeaveBusy

End Sub

Private Sub mnUsersHint_Click()

Dim dfThinkTime As Double
If nPhase = PHASE_BUSY Then
    Exit Sub
End If

dfThinkTime = Timer
dfThinkTime = dfThinkTime + IIf(dfThinkTime < dfHintTime, 86400#, 0#) - dfHintTime
If dfThinkTime < 30 + Gui_nCurr \ 100 Then
    MsgBox "您只思考了" + Str(Int(dfThinkTime)) + " 秒，請再多想想吧。", vbExclamation
    Exit Sub
End If

If nHint <> HINT_NONE Or Gui_nCurr < 200 Then
    EnterBusy
    DoHint
    LeaveBusy
    Exit Sub
End If

Login_szTitle = "提示"
If Gui_nCurr < 500 Then
    Login_szPrompt = "200關以後需要登錄用戶中心"
Else
    Login_szPrompt = "提示需要消耗點數10點"
End If
frmLogin.Show vbModal, Me
If Login_bCancel Then
    Exit Sub
End If

EnterBusy
nUsersEvent = USERS_HINT
On Error GoTo lnError
inet.Execute BASE_URL + "hint.php", _
        "POST", "stage=" + LTrim(Str(Gui_nCurr)), _
        "Content-Type: application/x-www-form-urlencoded" + vbCrLf + _
        "Login-UserName: " + Login_szUserName + vbCrLf + _
        "Login-Password: " + Login_szPassword + vbCrLf
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
ConnError
LeaveBusy

End Sub

Private Sub mnUsersRetract_Click()

If nPhase = PHASE_BUSY Then
    Exit Sub
End If

If Gui_nCurr < 200 Then
    EnterBusy
    DoRetract
    LeaveBusy
    Exit Sub
End If

Login_szTitle = "悔棋"
If Gui_nCurr < 500 Then
    Login_szPrompt = "200關以後需要登錄用戶中心"
Else
    Login_szPrompt = "悔棋需要消耗點數1點"
End If
frmLogin.Show vbModal, Me
If Login_bCancel Then
    Exit Sub
End If

EnterBusy
nUsersEvent = USERS_RETRACT
On Error GoTo lnError
inet.Execute BASE_URL + "retract.php", _
        "POST", "stage=" + LTrim(Str(Gui_nCurr)), _
        "Content-Type: application/x-www-form-urlencoded" + vbCrLf + _
        "Login-UserName: " + Login_szUserName + vbCrLf + _
        "Login-Password: " + Login_szPassword + vbCrLf
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
ConnError
LeaveBusy
End Sub

Private Sub mnUsersRank_Click(nIndex As Integer)

Dim szRankType As String
If nPhase = PHASE_BUSY Then
    Exit Sub
End If
Rank_nType = nIndex
szRankType = Choose(Rank_nType + 1, "w", "m", "q")

Login_szTitle = "查詢近" + Choose(Rank_nType + 1, "一周", "一個月", "三個月") + "排名"
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
On Error GoTo 0
ConnError
LeaveBusy

End Sub

Private Sub mnUsersPoints_Click()

If nPhase = PHASE_BUSY Then
    Exit Sub
End If
Login_szTitle = "查詢點數"
Login_szPrompt = ""
frmLogin.Show vbModal, Me
If Login_bCancel Then
    Exit Sub
End If

EnterBusy
nUsersEvent = USERS_POINTS
On Error GoTo lnError
inet.Execute BASE_URL + "querypoints.php", "GET", "", _
        "Login-UserName: " + Login_szUserName + vbCrLf + _
        "Login-Password: " + Login_szPassword + vbCrLf
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
MsgBox Err
ConnError
LeaveBusy

End Sub

Private Sub mnUsersHome_Click()

ShellExecuteA 0, vbNullString, "http://users.elephantbase.net/login.htm", _
        vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub SwapGui()

mnOptionsGuiSmall.Checked = Options_bLargeGui
Options_bLargeGui = Not Options_bLargeGui
mnOptionsGuiLarge.Checked = Options_bLargeGui
MsgBox "顯示模式已經更改，重新啟動程序後才能生效。", vbInformation

End Sub

Private Sub mnOptionsGuiSmall_Click()

If Options_bLargeGui Then
    SwapGui
End If

End Sub

Private Sub mnOptionsGuiLarge_Click()

If Not Options_bLargeGui Then
    SwapGui
End If

End Sub

Private Sub mnOptionsBoard_Click(nIndex As Integer)

Dim i As Integer
On Error Resume Next
imgBoard.Picture = LoadPicture(App_szPath + "IMAGES_S\" + _
        Choose(nIndex + 1, "WOOD", "GREEN", "WHITE", "SHEET", "CANVAS", "DROPS", _
        "CLOUDS", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL", "QIANHONG") + ".GIF")
On Error GoTo 0
For i = 0 To BOARD_S_MAX - 1
    mnOptionsBoard(i).Checked = (nIndex = i)
Next
Options_nBoardS = nIndex

End Sub

Private Sub mnOptionsPieces_Click(nIndex As Integer)

Dim i As Integer, sz As String
sz = App_szPath + "IMAGES_S\" + Choose(nIndex + 1, _
        "WOOD", "DELICATE", "POLISH", "XQSTUDIO", "MOVESKY", "MRSJ", "ZMBL") + "\"
On Error Resume Next
For i = 0 To 31
    frmHide.imgPiecesSmall(i).Picture = LoadPicture(sz + PieceFileName(i) + ".GIF")
Next
On Error GoTo 0
For i = 0 To PIECES_S_MAX - 1
    mnOptionsPieces(i).Checked = (nIndex = i)
Next
BoardFlush
Options_nPiecesS = nIndex

End Sub

Private Sub mnOptionsSounds_Click()

Options_bSounds = Not Options_bSounds
mnOptionsSounds.Checked = Options_bSounds

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

MsgBoxWithIcon "象棋巫師 " + STRING_VERSION + vbCrLf + "象棋百科全書 榮譽出品" + vbCrLf + vbCrLf + _
        STRING_COPYRIGHT + vbCrLf + "本產品符合GNU通用公共許可協議", "關于象棋巫師"

End Sub

Private Sub btnHint_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnHint.Enabled = False
btnHint.Enabled = True
mnUsersHint_Click

End Sub

Private Sub btnRetract_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnRetract.Enabled = False
btnRetract.Enabled = True
mnUsersRetract_Click

End Sub

Private Sub btnSave_MouseDown(nButton As Integer, nShift As Integer, x As Single, y As Single)

btnSave.Enabled = False
btnSave.Enabled = True
mnUsersSave_Click

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
        sqSelected = 0
        nPhase = GetResult(nStatus)
        If nPhase = PHASE_READY Then
            nPhase = PHASE_BUSY
            MousePointer = vbHourglass
            mv = GetBestMove
            If mvLast > 0 Then
                DrawSquare Src(mvLast)
                DrawSquare Dst(mvLast)
            End If
            CchessTryMove pos, nStatus, mv
            DrawSquare Src(mv), DRAW_SELECTED
            DrawSquare Dst(mv), DRAW_SELECTED
            mvLast = mv
            nPhase = GetResult(nStatus)
            MousePointer = vbDefault
        End If
        If nPhase = PHASE_WIN And nHint = HINT_RETRY Then
            If MsgBox("您是使用提示功能通過本關的，是否不用提示再試一次？", _
                    vbQuestion + vbYesNo) = vbYes Then
                LoadGame
            End If
        End If
    ElseIf (nStatus And MOVE_INCHECK) <> 0 Then
        PlayWavSound "ILLEGAL"
    End If
End If

End Sub
