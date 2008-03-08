VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmHide 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   8880
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8040
   BeginProperty Font 
      Name            =   "ËÎÌו"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "HIDEFORM.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8880
   ScaleWidth      =   8040
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin InetCtlsObjects.Inet inet 
      Left            =   3840
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   5
   End
   Begin MCI.MMControl mci 
      Height          =   330
      Left            =   120
      TabIndex        =   0
      Top             =   1080
      Width           =   3540
      _ExtentX        =   6244
      _ExtentY        =   582
      _Version        =   393216
      DeviceType      =   ""
      FileName        =   ""
   End
   Begin MSComctlLib.ImageList imglst 
      Left            =   3120
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483633
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   -2147483633
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   30
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":000C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":0166
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":02C0
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":041A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":0574
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":06CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":0828
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":0982
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":0ADC
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":0C36
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":0D90
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":0EEA
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":1044
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":119E
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":12F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":1452
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":15AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":1706
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":1860
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":19BA
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":1B14
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":1C6E
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":1DC8
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":1F22
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":207C
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":21D6
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":2330
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":248A
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":25E4
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":273E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   5160
      Picture         =   "HIDEFORM.frx":2898
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   4800
      Picture         =   "HIDEFORM.frx":2C16
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   4440
      Picture         =   "HIDEFORM.frx":2F9C
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   4080
      Picture         =   "HIDEFORM.frx":3319
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   3720
      Picture         =   "HIDEFORM.frx":369B
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   3360
      Picture         =   "HIDEFORM.frx":3A20
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   3000
      Picture         =   "HIDEFORM.frx":3D96
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   2640
      Picture         =   "HIDEFORM.frx":411A
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   2280
      Picture         =   "HIDEFORM.frx":4498
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1920
      Picture         =   "HIDEFORM.frx":481E
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   1560
      Picture         =   "HIDEFORM.frx":4B9B
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   1200
      Picture         =   "HIDEFORM.frx":4F1D
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   840
      Picture         =   "HIDEFORM.frx":52A0
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   480
      Picture         =   "HIDEFORM.frx":561E
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   120
      Picture         =   "HIDEFORM.frx":59A4
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   6000
      Picture         =   "HIDEFORM.frx":5CF0
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5160
      Picture         =   "HIDEFORM.frx":686E
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4320
      Picture         =   "HIDEFORM.frx":7430
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3480
      Picture         =   "HIDEFORM.frx":7F98
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2640
      Picture         =   "HIDEFORM.frx":8B27
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1800
      Picture         =   "HIDEFORM.frx":96ED
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   960
      Picture         =   "HIDEFORM.frx":A200
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   6000
      Picture         =   "HIDEFORM.frx":ADE3
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5160
      Picture         =   "HIDEFORM.frx":B938
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4320
      Picture         =   "HIDEFORM.frx":C4BE
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3480
      Picture         =   "HIDEFORM.frx":D01E
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2640
      Picture         =   "HIDEFORM.frx":DBA6
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1800
      Picture         =   "HIDEFORM.frx":E70D
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   960
      Picture         =   "HIDEFORM.frx":F274
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   120
      Picture         =   "HIDEFORM.frx":FE0A
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   6000
      Picture         =   "HIDEFORM.frx":101DB
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5160
      Picture         =   "HIDEFORM.frx":10D0E
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4320
      Picture         =   "HIDEFORM.frx":11881
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3480
      Picture         =   "HIDEFORM.frx":1239D
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2640
      Picture         =   "HIDEFORM.frx":12EDF
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1800
      Picture         =   "HIDEFORM.frx":13A56
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   960
      Picture         =   "HIDEFORM.frx":1451F
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   6000
      Picture         =   "HIDEFORM.frx":150B3
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5160
      Picture         =   "HIDEFORM.frx":15BBB
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4320
      Picture         =   "HIDEFORM.frx":166F6
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3480
      Picture         =   "HIDEFORM.frx":17202
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2640
      Picture         =   "HIDEFORM.frx":17D3B
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1800
      Picture         =   "HIDEFORM.frx":18859
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   960
      Picture         =   "HIDEFORM.frx":1936E
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   0
      Left            =   120
      Picture         =   "HIDEFORM.frx":19EB5
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   120
      Picture         =   "HIDEFORM.frx":1A242
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   720
      Picture         =   "HIDEFORM.frx":1A5B5
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1320
      Picture         =   "HIDEFORM.frx":1AD1D
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1920
      Picture         =   "HIDEFORM.frx":1B45D
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2520
      Picture         =   "HIDEFORM.frx":1BBBF
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3120
      Picture         =   "HIDEFORM.frx":1C31D
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3720
      Picture         =   "HIDEFORM.frx":1CA74
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4320
      Picture         =   "HIDEFORM.frx":1D214
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   720
      Picture         =   "HIDEFORM.frx":1D966
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1320
      Picture         =   "HIDEFORM.frx":1E111
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1920
      Picture         =   "HIDEFORM.frx":1E82A
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2520
      Picture         =   "HIDEFORM.frx":1EFDB
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3120
      Picture         =   "HIDEFORM.frx":1F760
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3720
      Picture         =   "HIDEFORM.frx":1FEDB
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4320
      Picture         =   "HIDEFORM.frx":20669
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   120
      Picture         =   "HIDEFORM.frx":20DBC
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   720
      Picture         =   "HIDEFORM.frx":21171
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1320
      Picture         =   "HIDEFORM.frx":2191B
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1920
      Picture         =   "HIDEFORM.frx":220A1
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2520
      Picture         =   "HIDEFORM.frx":22841
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3120
      Picture         =   "HIDEFORM.frx":22FE5
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3720
      Picture         =   "HIDEFORM.frx":2377E
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4320
      Picture         =   "HIDEFORM.frx":23F62
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   720
      Picture         =   "HIDEFORM.frx":246F7
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1320
      Picture         =   "HIDEFORM.frx":24EE6
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1920
      Picture         =   "HIDEFORM.frx":25643
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2520
      Picture         =   "HIDEFORM.frx":25E39
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3120
      Picture         =   "HIDEFORM.frx":26601
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3720
      Picture         =   "HIDEFORM.frx":26DC0
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4320
      Picture         =   "HIDEFORM.frx":27593
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgEngineBlackLarge 
      Height          =   855
      Left            =   960
      Picture         =   "HIDEFORM.frx":27D27
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgEngineRedLarge 
      Height          =   855
      Left            =   120
      Picture         =   "HIDEFORM.frx":28237
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgEngineBlack 
      Height          =   615
      Left            =   2400
      Picture         =   "HIDEFORM.frx":28747
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgEngineRed 
      Height          =   615
      Left            =   1800
      Picture         =   "HIDEFORM.frx":28BA3
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgFormRed 
      Height          =   480
      Left            =   3840
      Picture         =   "HIDEFORM.frx":28FFF
      Top             =   960
      Width           =   480
   End
   Begin VB.Image imgFormBlack 
      Height          =   480
      Left            =   4440
      Picture         =   "HIDEFORM.frx":29309
      Top             =   960
      Width           =   480
   End
   Begin VB.Image imgBoardSmall 
      Height          =   6255
      Left            =   120
      Picture         =   "HIDEFORM.frx":29613
      Top             =   120
      Width           =   5655
   End
   Begin VB.Image imgBoardLarge 
      Height          =   8655
      Left            =   120
      Picture         =   "HIDEFORM.frx":3A83C
      Top             =   120
      Width           =   7815
   End
   Begin VB.Image imgAdvert 
      Height          =   975
      Left            =   120
      Top             =   120
      Width           =   3735
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
