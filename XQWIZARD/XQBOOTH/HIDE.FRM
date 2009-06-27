VERSION 5.00
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
      Picture         =   "HIDE.frx":000C
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":0399
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1680
      Picture         =   "HIDE.frx":0EE0
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2520
      Picture         =   "HIDE.frx":19F5
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3360
      Picture         =   "HIDE.frx":2513
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4200
      Picture         =   "HIDE.frx":304C
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5040
      Picture         =   "HIDE.frx":3B58
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   5880
      Picture         =   "HIDE.frx":4693
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   840
      Picture         =   "HIDE.frx":519B
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1680
      Picture         =   "HIDE.frx":5D2F
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2520
      Picture         =   "HIDE.frx":67F8
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3360
      Picture         =   "HIDE.frx":736F
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4200
      Picture         =   "HIDE.frx":7EB1
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5040
      Picture         =   "HIDE.frx":89CD
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   5880
      Picture         =   "HIDE.frx":9540
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":A073
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   840
      Picture         =   "HIDE.frx":A444
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1680
      Picture         =   "HIDE.frx":AFDA
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2520
      Picture         =   "HIDE.frx":BB41
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3360
      Picture         =   "HIDE.frx":C6A8
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4200
      Picture         =   "HIDE.frx":D230
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5040
      Picture         =   "HIDE.frx":DD90
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   5880
      Picture         =   "HIDE.frx":E916
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   840
      Picture         =   "HIDE.frx":F46B
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1680
      Picture         =   "HIDE.frx":1004E
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2520
      Picture         =   "HIDE.frx":10B61
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3360
      Picture         =   "HIDE.frx":11727
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4200
      Picture         =   "HIDE.frx":122B6
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5040
      Picture         =   "HIDE.frx":12E1E
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   5880
      Picture         =   "HIDE.frx":139E0
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   30
      Left            =   6720
      Picture         =   "HIDE.frx":1455E
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   31
      Left            =   7560
      Picture         =   "HIDE.frx":15068
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   3960
      Picture         =   "HIDE.frx":15BDA
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   3720
      Picture         =   "HIDE.frx":15F58
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   3480
      Picture         =   "HIDE.frx":162DE
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   3240
      Picture         =   "HIDE.frx":1665B
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   3000
      Picture         =   "HIDE.frx":169DD
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   2760
      Picture         =   "HIDE.frx":16D62
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   2520
      Picture         =   "HIDE.frx":170D8
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   2280
      Picture         =   "HIDE.frx":1745C
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   2040
      Picture         =   "HIDE.frx":177DA
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1800
      Picture         =   "HIDE.frx":17B60
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   1560
      Picture         =   "HIDE.frx":17EDD
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   1320
      Picture         =   "HIDE.frx":1825F
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   1080
      Picture         =   "HIDE.frx":185E2
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":18960
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   600
      Picture         =   "HIDE.frx":18CE6
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   31
      Left            =   5400
      Picture         =   "HIDE.frx":19032
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   30
      Left            =   4800
      Picture         =   "HIDE.frx":197CD
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   600
      Picture         =   "HIDE.frx":19F15
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1200
      Picture         =   "HIDE.frx":1A704
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1800
      Picture         =   "HIDE.frx":1AE61
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2400
      Picture         =   "HIDE.frx":1B657
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3000
      Picture         =   "HIDE.frx":1BE1F
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3600
      Picture         =   "HIDE.frx":1C5DE
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4200
      Picture         =   "HIDE.frx":1CDB1
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":1D545
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   600
      Picture         =   "HIDE.frx":1D8FA
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1200
      Picture         =   "HIDE.frx":1E0A4
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1800
      Picture         =   "HIDE.frx":1E82A
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2400
      Picture         =   "HIDE.frx":1EFCA
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3000
      Picture         =   "HIDE.frx":1F76E
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3600
      Picture         =   "HIDE.frx":1FF07
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4200
      Picture         =   "HIDE.frx":206EB
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   600
      Picture         =   "HIDE.frx":20E80
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1200
      Picture         =   "HIDE.frx":2162B
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1800
      Picture         =   "HIDE.frx":21D44
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2400
      Picture         =   "HIDE.frx":224F5
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3000
      Picture         =   "HIDE.frx":22C7A
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3600
      Picture         =   "HIDE.frx":233F5
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4200
      Picture         =   "HIDE.frx":23B83
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":242D6
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   600
      Picture         =   "HIDE.frx":24649
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1200
      Picture         =   "HIDE.frx":24DB1
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1800
      Picture         =   "HIDE.frx":254F1
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2400
      Picture         =   "HIDE.frx":25C53
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3000
      Picture         =   "HIDE.frx":263B1
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3600
      Picture         =   "HIDE.frx":26B08
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4200
      Picture         =   "HIDE.frx":272A8
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgBoardMini 
      Height          =   2655
      Left            =   7080
      Picture         =   "HIDE.frx":279FA
      Stretch         =   -1  'True
      Top             =   0
      Width           =   2415
   End
   Begin VB.Image imgUnavailable 
      Height          =   2655
      Left            =   7080
      Picture         =   "HIDE.frx":2BD53
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
