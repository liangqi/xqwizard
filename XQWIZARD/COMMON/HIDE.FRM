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
      Picture         =   "HIDE.frx":16EA
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   30
      Left            =   4800
      Picture         =   "HIDE.frx":1E92
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   3960
      Picture         =   "HIDE.frx":25EC
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   3720
      Picture         =   "HIDE.frx":296A
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   3480
      Picture         =   "HIDE.frx":2CF0
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   3240
      Picture         =   "HIDE.frx":306D
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   3000
      Picture         =   "HIDE.frx":33EF
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   2760
      Picture         =   "HIDE.frx":3774
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   2520
      Picture         =   "HIDE.frx":3AEA
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   2280
      Picture         =   "HIDE.frx":3E6E
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   2040
      Picture         =   "HIDE.frx":41EC
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1800
      Picture         =   "HIDE.frx":4572
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   1560
      Picture         =   "HIDE.frx":48EF
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   1320
      Picture         =   "HIDE.frx":4C71
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   1080
      Picture         =   "HIDE.frx":4FF4
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":5372
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   600
      Picture         =   "HIDE.frx":56F8
      Top             =   0
      Width           =   240
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   5880
      Picture         =   "HIDE.frx":5A44
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5040
      Picture         =   "HIDE.frx":65C2
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4200
      Picture         =   "HIDE.frx":7184
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3360
      Picture         =   "HIDE.frx":7CEC
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2520
      Picture         =   "HIDE.frx":887B
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1680
      Picture         =   "HIDE.frx":9441
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   840
      Picture         =   "HIDE.frx":9F54
      Top             =   5520
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   5880
      Picture         =   "HIDE.frx":AB37
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5040
      Picture         =   "HIDE.frx":B68C
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4200
      Picture         =   "HIDE.frx":C212
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3360
      Picture         =   "HIDE.frx":CD72
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2520
      Picture         =   "HIDE.frx":D8FA
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1680
      Picture         =   "HIDE.frx":E461
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   840
      Picture         =   "HIDE.frx":EFC8
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":FB5E
      Top             =   4680
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   5880
      Picture         =   "HIDE.frx":FF2F
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5040
      Picture         =   "HIDE.frx":10A62
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4200
      Picture         =   "HIDE.frx":115D5
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3360
      Picture         =   "HIDE.frx":120F1
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2520
      Picture         =   "HIDE.frx":12C33
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1680
      Picture         =   "HIDE.frx":137AA
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   840
      Picture         =   "HIDE.frx":14273
      Top             =   3840
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   5880
      Picture         =   "HIDE.frx":14E07
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5040
      Picture         =   "HIDE.frx":1590F
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4200
      Picture         =   "HIDE.frx":1644A
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3360
      Picture         =   "HIDE.frx":16F56
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2520
      Picture         =   "HIDE.frx":17A8F
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1680
      Picture         =   "HIDE.frx":185AD
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   840
      Picture         =   "HIDE.frx":190C2
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":19C09
      Top             =   3000
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":19F96
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   600
      Picture         =   "HIDE.frx":1A309
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1200
      Picture         =   "HIDE.frx":1AA71
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1800
      Picture         =   "HIDE.frx":1B1B1
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2400
      Picture         =   "HIDE.frx":1B913
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3000
      Picture         =   "HIDE.frx":1C071
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3600
      Picture         =   "HIDE.frx":1C7C8
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4200
      Picture         =   "HIDE.frx":1CF68
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   600
      Picture         =   "HIDE.frx":1D6BA
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1200
      Picture         =   "HIDE.frx":1DE65
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1800
      Picture         =   "HIDE.frx":1E57E
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2400
      Picture         =   "HIDE.frx":1ED2F
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3000
      Picture         =   "HIDE.frx":1F4B4
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3600
      Picture         =   "HIDE.frx":1FC2F
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4200
      Picture         =   "HIDE.frx":203BD
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":20B10
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   600
      Picture         =   "HIDE.frx":20EC5
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1200
      Picture         =   "HIDE.frx":2166F
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1800
      Picture         =   "HIDE.frx":21DF5
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2400
      Picture         =   "HIDE.frx":22595
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3000
      Picture         =   "HIDE.frx":22D39
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3600
      Picture         =   "HIDE.frx":234D2
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4200
      Picture         =   "HIDE.frx":23CB6
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   600
      Picture         =   "HIDE.frx":2444B
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1200
      Picture         =   "HIDE.frx":24C3A
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1800
      Picture         =   "HIDE.frx":25397
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2400
      Picture         =   "HIDE.frx":25B8D
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3000
      Picture         =   "HIDE.frx":26355
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3600
      Picture         =   "HIDE.frx":26B14
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4200
      Picture         =   "HIDE.frx":272E7
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgBoardSmall 
      Height          =   6255
      Left            =   0
      Picture         =   "HIDE.frx":27A7B
      Top             =   0
      Width           =   5655
   End
   Begin VB.Image imgBoardLarge 
      Height          =   8655
      Left            =   0
      Picture         =   "HIDE.frx":3AE28
      Top             =   0
      Width           =   7815
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
