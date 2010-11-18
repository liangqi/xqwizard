VERSION 5.00
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
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
   Begin InetCtlsObjects.Inet Inet 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   5
   End
   Begin MCI.MMControl mci 
      Height          =   330
      Left            =   840
      TabIndex        =   0
      Top             =   240
      Width           =   3540
      _ExtentX        =   6244
      _ExtentY        =   582
      _Version        =   393216
      DeviceType      =   ""
      FileName        =   ""
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
      Picture         =   "HIDE.frx":0B7B
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   31
      Left            =   5400
      Picture         =   "HIDE.frx":16A5
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   30
      Left            =   4800
      Picture         =   "HIDE.frx":1E4D
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   3960
      Picture         =   "HIDE.frx":25A7
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   3720
      Picture         =   "HIDE.frx":2925
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   3480
      Picture         =   "HIDE.frx":2CAB
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   3240
      Picture         =   "HIDE.frx":3028
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   3000
      Picture         =   "HIDE.frx":33AA
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   2760
      Picture         =   "HIDE.frx":372F
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   2520
      Picture         =   "HIDE.frx":3AA5
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   2280
      Picture         =   "HIDE.frx":3E29
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   2040
      Picture         =   "HIDE.frx":41A7
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1800
      Picture         =   "HIDE.frx":452D
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   1560
      Picture         =   "HIDE.frx":48AA
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   1320
      Picture         =   "HIDE.frx":4C2C
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   1080
      Picture         =   "HIDE.frx":4FAF
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":532D
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   600
      Picture         =   "HIDE.frx":56B3
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   5880
      Picture         =   "HIDE.frx":59FF
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5040
      Picture         =   "HIDE.frx":657D
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4200
      Picture         =   "HIDE.frx":713F
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3360
      Picture         =   "HIDE.frx":7CA7
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2520
      Picture         =   "HIDE.frx":8836
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1680
      Picture         =   "HIDE.frx":93FC
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   840
      Picture         =   "HIDE.frx":9F0F
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   5880
      Picture         =   "HIDE.frx":AAF2
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5040
      Picture         =   "HIDE.frx":B647
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4200
      Picture         =   "HIDE.frx":C1CD
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3360
      Picture         =   "HIDE.frx":CD2D
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2520
      Picture         =   "HIDE.frx":D8B5
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1680
      Picture         =   "HIDE.frx":E41C
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   840
      Picture         =   "HIDE.frx":EF83
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":FB19
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   5880
      Picture         =   "HIDE.frx":FEEA
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5040
      Picture         =   "HIDE.frx":10A1D
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4200
      Picture         =   "HIDE.frx":11590
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3360
      Picture         =   "HIDE.frx":120AC
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2520
      Picture         =   "HIDE.frx":12BEE
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1680
      Picture         =   "HIDE.frx":13765
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   840
      Picture         =   "HIDE.frx":1422E
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   5880
      Picture         =   "HIDE.frx":14DC2
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5040
      Picture         =   "HIDE.frx":158CA
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4200
      Picture         =   "HIDE.frx":16405
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3360
      Picture         =   "HIDE.frx":16F11
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2520
      Picture         =   "HIDE.frx":17A4A
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1680
      Picture         =   "HIDE.frx":18568
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":1907D
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":19BC4
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":19F51
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   600
      Picture         =   "HIDE.frx":1A2C4
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1200
      Picture         =   "HIDE.frx":1AA2C
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1800
      Picture         =   "HIDE.frx":1B16C
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2400
      Picture         =   "HIDE.frx":1B8CE
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3000
      Picture         =   "HIDE.frx":1C02C
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3600
      Picture         =   "HIDE.frx":1C783
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4200
      Picture         =   "HIDE.frx":1CF23
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   600
      Picture         =   "HIDE.frx":1D675
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1200
      Picture         =   "HIDE.frx":1DE20
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1800
      Picture         =   "HIDE.frx":1E539
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2400
      Picture         =   "HIDE.frx":1ECEA
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3000
      Picture         =   "HIDE.frx":1F46F
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3600
      Picture         =   "HIDE.frx":1FBEA
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4200
      Picture         =   "HIDE.frx":20378
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":20ACB
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   600
      Picture         =   "HIDE.frx":20E80
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1200
      Picture         =   "HIDE.frx":2162A
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1800
      Picture         =   "HIDE.frx":21DB0
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2400
      Picture         =   "HIDE.frx":22550
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3000
      Picture         =   "HIDE.frx":22CF4
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3600
      Picture         =   "HIDE.frx":2348D
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4200
      Picture         =   "HIDE.frx":23C71
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   600
      Picture         =   "HIDE.frx":24406
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1200
      Picture         =   "HIDE.frx":24BF5
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1800
      Picture         =   "HIDE.frx":25352
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2400
      Picture         =   "HIDE.frx":25B48
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3000
      Picture         =   "HIDE.frx":26310
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3600
      Picture         =   "HIDE.frx":26ACF
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4200
      Picture         =   "HIDE.frx":272A2
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgBoardSmall 
      Height          =   6255
      Left            =   0
      Picture         =   "HIDE.frx":27A36
      Top             =   0
      Width           =   5655
   End
   Begin VB.Image imgBoardLarge 
      Height          =   8655
      Left            =   0
      Picture         =   "HIDE.frx":3ADE3
      Top             =   0
      Width           =   7815
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
