VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmHide 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   8640
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7800
   BeginProperty Font 
      Name            =   "ËÎÌו"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "HIDE.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8640
   ScaleWidth      =   7800
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser web 
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   255
      ExtentX         =   450
      ExtentY         =   450
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
      Index           =   31
      Left            =   7560
      Picture         =   "HIDE.frx":000C
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   30
      Left            =   6720
      Picture         =   "HIDE.frx":0B7E
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   31
      Left            =   5400
      Picture         =   "HIDE.frx":1688
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   30
      Left            =   4800
      Picture         =   "HIDE.frx":1E23
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   3960
      Picture         =   "HIDE.frx":256B
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   3720
      Picture         =   "HIDE.frx":28E9
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   3480
      Picture         =   "HIDE.frx":2C6F
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   3240
      Picture         =   "HIDE.frx":2FEC
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   3000
      Picture         =   "HIDE.frx":336E
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   2760
      Picture         =   "HIDE.frx":36F3
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   2520
      Picture         =   "HIDE.frx":3A69
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   2280
      Picture         =   "HIDE.frx":3DED
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   2040
      Picture         =   "HIDE.frx":416B
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1800
      Picture         =   "HIDE.frx":44F1
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   1560
      Picture         =   "HIDE.frx":486E
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   1320
      Picture         =   "HIDE.frx":4BF0
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   1080
      Picture         =   "HIDE.frx":4F73
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":52F1
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   600
      Picture         =   "HIDE.frx":5677
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   5880
      Picture         =   "HIDE.frx":59C3
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5040
      Picture         =   "HIDE.frx":6541
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4200
      Picture         =   "HIDE.frx":7103
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3360
      Picture         =   "HIDE.frx":7C6B
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2520
      Picture         =   "HIDE.frx":87FA
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1680
      Picture         =   "HIDE.frx":93C0
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   840
      Picture         =   "HIDE.frx":9ED3
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   5880
      Picture         =   "HIDE.frx":AAB6
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5040
      Picture         =   "HIDE.frx":B60B
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4200
      Picture         =   "HIDE.frx":C191
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3360
      Picture         =   "HIDE.frx":CCF1
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2520
      Picture         =   "HIDE.frx":D879
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1680
      Picture         =   "HIDE.frx":E3E0
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   840
      Picture         =   "HIDE.frx":EF47
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":FADD
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   5880
      Picture         =   "HIDE.frx":FEAE
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5040
      Picture         =   "HIDE.frx":109E1
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4200
      Picture         =   "HIDE.frx":11554
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3360
      Picture         =   "HIDE.frx":12070
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2520
      Picture         =   "HIDE.frx":12BB2
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1680
      Picture         =   "HIDE.frx":13729
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   840
      Picture         =   "HIDE.frx":141F2
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   5880
      Picture         =   "HIDE.frx":14D86
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5040
      Picture         =   "HIDE.frx":1588E
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4200
      Picture         =   "HIDE.frx":163C9
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3360
      Picture         =   "HIDE.frx":16ED5
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2520
      Picture         =   "HIDE.frx":17A0E
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1680
      Picture         =   "HIDE.frx":1852C
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":19041
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":19B88
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":19F15
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   600
      Picture         =   "HIDE.frx":1A288
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1200
      Picture         =   "HIDE.frx":1A9F0
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1800
      Picture         =   "HIDE.frx":1B130
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2400
      Picture         =   "HIDE.frx":1B892
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3000
      Picture         =   "HIDE.frx":1BFF0
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3600
      Picture         =   "HIDE.frx":1C747
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4200
      Picture         =   "HIDE.frx":1CEE7
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   600
      Picture         =   "HIDE.frx":1D639
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1200
      Picture         =   "HIDE.frx":1DDE4
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1800
      Picture         =   "HIDE.frx":1E4FD
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2400
      Picture         =   "HIDE.frx":1ECAE
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3000
      Picture         =   "HIDE.frx":1F433
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3600
      Picture         =   "HIDE.frx":1FBAE
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4200
      Picture         =   "HIDE.frx":2033C
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":20A8F
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   600
      Picture         =   "HIDE.frx":20E44
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1200
      Picture         =   "HIDE.frx":215EE
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1800
      Picture         =   "HIDE.frx":21D74
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2400
      Picture         =   "HIDE.frx":22514
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3000
      Picture         =   "HIDE.frx":22CB8
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3600
      Picture         =   "HIDE.frx":23451
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4200
      Picture         =   "HIDE.frx":23C35
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   600
      Picture         =   "HIDE.frx":243CA
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1200
      Picture         =   "HIDE.frx":24BB9
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1800
      Picture         =   "HIDE.frx":25316
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2400
      Picture         =   "HIDE.frx":25B0C
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3000
      Picture         =   "HIDE.frx":262D4
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3600
      Picture         =   "HIDE.frx":26A93
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4200
      Picture         =   "HIDE.frx":27266
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgBoardSmall 
      Height          =   6255
      Left            =   0
      Picture         =   "HIDE.frx":279FA
      Top             =   0
      Width           =   5655
   End
   Begin VB.Image imgBoardLarge 
      Height          =   8655
      Left            =   0
      Picture         =   "HIDE.frx":3B78F
      Top             =   0
      Width           =   7815
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
