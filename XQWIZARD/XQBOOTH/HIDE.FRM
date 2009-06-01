VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmHide 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3225
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4710
   Icon            =   "HIDE.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3225
   ScaleWidth      =   4710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin InetCtlsObjects.Inet inet 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   5
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   3360
      Picture         =   "HIDE.frx":000C
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   3120
      Picture         =   "HIDE.frx":038A
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   2880
      Picture         =   "HIDE.frx":0710
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   2640
      Picture         =   "HIDE.frx":0A8D
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   2400
      Picture         =   "HIDE.frx":0E0F
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   2160
      Picture         =   "HIDE.frx":1194
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   1920
      Picture         =   "HIDE.frx":150A
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   1680
      Picture         =   "HIDE.frx":188E
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   1440
      Picture         =   "HIDE.frx":1C0C
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1200
      Picture         =   "HIDE.frx":1F92
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   960
      Picture         =   "HIDE.frx":230F
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   720
      Picture         =   "HIDE.frx":2691
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   480
      Picture         =   "HIDE.frx":2A14
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   240
      Picture         =   "HIDE.frx":2D92
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":3118
      Top             =   3000
      Width           =   240
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   31
      Left            =   600
      Picture         =   "HIDE.frx":3464
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   30
      Left            =   0
      Picture         =   "HIDE.frx":3BFF
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   23
      Left            =   600
      Picture         =   "HIDE.frx":4347
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   24
      Left            =   1200
      Picture         =   "HIDE.frx":4B36
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   25
      Left            =   1800
      Picture         =   "HIDE.frx":5293
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   26
      Left            =   2400
      Picture         =   "HIDE.frx":5A89
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   27
      Left            =   3000
      Picture         =   "HIDE.frx":6251
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   28
      Left            =   3600
      Picture         =   "HIDE.frx":6A10
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   29
      Left            =   4200
      Picture         =   "HIDE.frx":71E3
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":7977
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   16
      Left            =   600
      Picture         =   "HIDE.frx":7D2C
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   17
      Left            =   1200
      Picture         =   "HIDE.frx":84D6
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   18
      Left            =   1800
      Picture         =   "HIDE.frx":8C5C
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   19
      Left            =   2400
      Picture         =   "HIDE.frx":93FC
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   20
      Left            =   3000
      Picture         =   "HIDE.frx":9BA0
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   21
      Left            =   3600
      Picture         =   "HIDE.frx":A339
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   22
      Left            =   4200
      Picture         =   "HIDE.frx":AB1D
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   8
      Left            =   600
      Picture         =   "HIDE.frx":B2B2
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   9
      Left            =   1200
      Picture         =   "HIDE.frx":BA5D
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   10
      Left            =   1800
      Picture         =   "HIDE.frx":C176
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   11
      Left            =   2400
      Picture         =   "HIDE.frx":C927
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   12
      Left            =   3000
      Picture         =   "HIDE.frx":D0AC
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   13
      Left            =   3600
      Picture         =   "HIDE.frx":D827
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   14
      Left            =   4200
      Picture         =   "HIDE.frx":DFB5
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":E708
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   1
      Left            =   600
      Picture         =   "HIDE.frx":EA7B
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   2
      Left            =   1200
      Picture         =   "HIDE.frx":F1E3
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   3
      Left            =   1800
      Picture         =   "HIDE.frx":F923
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   4
      Left            =   2400
      Picture         =   "HIDE.frx":10085
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   5
      Left            =   3000
      Picture         =   "HIDE.frx":107E3
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   6
      Left            =   3600
      Picture         =   "HIDE.frx":10F3A
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   7
      Left            =   4200
      Picture         =   "HIDE.frx":116DA
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgBoardMini 
      Height          =   2655
      Left            =   0
      Picture         =   "HIDE.frx":11E2C
      Stretch         =   -1  'True
      Top             =   0
      Width           =   2415
   End
   Begin VB.Image imgUnavailable 
      Height          =   2655
      Left            =   2520
      Picture         =   "HIDE.frx":16185
      Stretch         =   -1  'True
      Top             =   0
      Width           =   2415
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
