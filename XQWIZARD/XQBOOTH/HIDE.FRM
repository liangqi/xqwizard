VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmHide 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   6825
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9510
   Icon            =   "HIDE.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6825
   ScaleWidth      =   9510
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser web 
      Height          =   135
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   135
      ExtentX         =   238
      ExtentY         =   238
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
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
   Begin InetCtlsObjects.Inet inet 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   5
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":0ABA
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":0E47
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1680
      Picture         =   "HIDE.frx":198E
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2520
      Picture         =   "HIDE.frx":24A3
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3360
      Picture         =   "HIDE.frx":2FC1
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4200
      Picture         =   "HIDE.frx":3AFA
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5040
      Picture         =   "HIDE.frx":4606
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   5880
      Picture         =   "HIDE.frx":5141
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   840
      Picture         =   "HIDE.frx":5C49
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1680
      Picture         =   "HIDE.frx":67DD
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2520
      Picture         =   "HIDE.frx":72A6
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3360
      Picture         =   "HIDE.frx":7E1D
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4200
      Picture         =   "HIDE.frx":895F
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5040
      Picture         =   "HIDE.frx":947B
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   5880
      Picture         =   "HIDE.frx":9FEE
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":AB21
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   840
      Picture         =   "HIDE.frx":AEF2
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1680
      Picture         =   "HIDE.frx":BA88
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2520
      Picture         =   "HIDE.frx":C5EF
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3360
      Picture         =   "HIDE.frx":D156
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4200
      Picture         =   "HIDE.frx":DCDE
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5040
      Picture         =   "HIDE.frx":E83E
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   5880
      Picture         =   "HIDE.frx":F3C4
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   840
      Picture         =   "HIDE.frx":FF19
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1680
      Picture         =   "HIDE.frx":10AFC
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2520
      Picture         =   "HIDE.frx":1160F
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3360
      Picture         =   "HIDE.frx":121D5
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4200
      Picture         =   "HIDE.frx":12D64
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5040
      Picture         =   "HIDE.frx":138CC
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   5880
      Picture         =   "HIDE.frx":1448E
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   30
      Left            =   6720
      Picture         =   "HIDE.frx":1500C
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   31
      Left            =   7560
      Picture         =   "HIDE.frx":15B16
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   3960
      Picture         =   "HIDE.frx":16688
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   3720
      Picture         =   "HIDE.frx":16A06
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   3480
      Picture         =   "HIDE.frx":16D8C
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   3240
      Picture         =   "HIDE.frx":17109
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   3000
      Picture         =   "HIDE.frx":1748B
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   2760
      Picture         =   "HIDE.frx":17810
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   2520
      Picture         =   "HIDE.frx":17B86
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   2280
      Picture         =   "HIDE.frx":17F0A
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   2040
      Picture         =   "HIDE.frx":18288
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1800
      Picture         =   "HIDE.frx":1860E
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   1560
      Picture         =   "HIDE.frx":1898B
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   1320
      Picture         =   "HIDE.frx":18D0D
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   1080
      Picture         =   "HIDE.frx":19090
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":1940E
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   600
      Picture         =   "HIDE.frx":19794
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   31
      Left            =   5400
      Picture         =   "HIDE.frx":19AE0
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   30
      Left            =   4800
      Picture         =   "HIDE.frx":1A27B
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   600
      Picture         =   "HIDE.frx":1A9C3
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1200
      Picture         =   "HIDE.frx":1B1B2
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1800
      Picture         =   "HIDE.frx":1B90F
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2400
      Picture         =   "HIDE.frx":1C105
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3000
      Picture         =   "HIDE.frx":1C8CD
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3600
      Picture         =   "HIDE.frx":1D08C
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4200
      Picture         =   "HIDE.frx":1D85F
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":1DFF3
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   600
      Picture         =   "HIDE.frx":1E3A8
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1200
      Picture         =   "HIDE.frx":1EB52
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1800
      Picture         =   "HIDE.frx":1F2D8
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2400
      Picture         =   "HIDE.frx":1FA78
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3000
      Picture         =   "HIDE.frx":2021C
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3600
      Picture         =   "HIDE.frx":209B5
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4200
      Picture         =   "HIDE.frx":21199
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   600
      Picture         =   "HIDE.frx":2192E
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1200
      Picture         =   "HIDE.frx":220D9
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1800
      Picture         =   "HIDE.frx":227F2
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2400
      Picture         =   "HIDE.frx":22FA3
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3000
      Picture         =   "HIDE.frx":23728
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3600
      Picture         =   "HIDE.frx":23EA3
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4200
      Picture         =   "HIDE.frx":24631
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":24D84
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   600
      Picture         =   "HIDE.frx":250F7
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1200
      Picture         =   "HIDE.frx":2585F
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1800
      Picture         =   "HIDE.frx":25F9F
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2400
      Picture         =   "HIDE.frx":26701
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3000
      Picture         =   "HIDE.frx":26E5F
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3600
      Picture         =   "HIDE.frx":275B6
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4200
      Picture         =   "HIDE.frx":27D56
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgBoardMini 
      Height          =   2655
      Left            =   7080
      Picture         =   "HIDE.frx":284A8
      Stretch         =   -1  'True
      Top             =   0
      Width           =   2415
   End
   Begin VB.Image imgUnavailable 
      Height          =   2655
      Left            =   7080
      Picture         =   "HIDE.frx":2C801
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   2415
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
