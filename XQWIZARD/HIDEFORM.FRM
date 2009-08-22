VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
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
   Begin SHDocVwCtl.WebBrowser web 
      Height          =   255
      Left            =   120
      TabIndex        =   1
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
         NumListImages   =   31
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
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDEFORM.frx":2898
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   31
      Left            =   7680
      Picture         =   "HIDEFORM.frx":29F2
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   30
      Left            =   6840
      Picture         =   "HIDEFORM.frx":3564
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   31
      Left            =   5520
      Picture         =   "HIDEFORM.frx":406E
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   30
      Left            =   4920
      Picture         =   "HIDEFORM.frx":4809
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   5160
      Picture         =   "HIDEFORM.frx":4F51
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   4800
      Picture         =   "HIDEFORM.frx":52CF
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   4440
      Picture         =   "HIDEFORM.frx":5655
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   4080
      Picture         =   "HIDEFORM.frx":59D2
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   3720
      Picture         =   "HIDEFORM.frx":5D54
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   3360
      Picture         =   "HIDEFORM.frx":60D9
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   3000
      Picture         =   "HIDEFORM.frx":644F
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   2640
      Picture         =   "HIDEFORM.frx":67D3
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   2280
      Picture         =   "HIDEFORM.frx":6B51
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1920
      Picture         =   "HIDEFORM.frx":6ED7
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   1560
      Picture         =   "HIDEFORM.frx":7254
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   1200
      Picture         =   "HIDEFORM.frx":75D6
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   840
      Picture         =   "HIDEFORM.frx":7959
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   480
      Picture         =   "HIDEFORM.frx":7CD7
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   120
      Picture         =   "HIDEFORM.frx":805D
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   6000
      Picture         =   "HIDEFORM.frx":83A9
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5160
      Picture         =   "HIDEFORM.frx":8F27
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4320
      Picture         =   "HIDEFORM.frx":9AE9
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3480
      Picture         =   "HIDEFORM.frx":A651
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2640
      Picture         =   "HIDEFORM.frx":B1E0
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1800
      Picture         =   "HIDEFORM.frx":BDA6
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   960
      Picture         =   "HIDEFORM.frx":C8B9
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   6000
      Picture         =   "HIDEFORM.frx":D49C
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5160
      Picture         =   "HIDEFORM.frx":DFF1
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4320
      Picture         =   "HIDEFORM.frx":EB77
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3480
      Picture         =   "HIDEFORM.frx":F6D7
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2640
      Picture         =   "HIDEFORM.frx":1025F
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1800
      Picture         =   "HIDEFORM.frx":10DC6
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   960
      Picture         =   "HIDEFORM.frx":1192D
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   120
      Picture         =   "HIDEFORM.frx":124C3
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   6000
      Picture         =   "HIDEFORM.frx":12894
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5160
      Picture         =   "HIDEFORM.frx":133C7
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4320
      Picture         =   "HIDEFORM.frx":13F3A
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3480
      Picture         =   "HIDEFORM.frx":14A56
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2640
      Picture         =   "HIDEFORM.frx":15598
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1800
      Picture         =   "HIDEFORM.frx":1610F
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   960
      Picture         =   "HIDEFORM.frx":16BD8
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   6000
      Picture         =   "HIDEFORM.frx":1776C
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5160
      Picture         =   "HIDEFORM.frx":18274
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4320
      Picture         =   "HIDEFORM.frx":18DAF
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3480
      Picture         =   "HIDEFORM.frx":198BB
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2640
      Picture         =   "HIDEFORM.frx":1A3F4
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1800
      Picture         =   "HIDEFORM.frx":1AF12
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   960
      Picture         =   "HIDEFORM.frx":1BA27
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   0
      Left            =   120
      Picture         =   "HIDEFORM.frx":1C56E
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   120
      Picture         =   "HIDEFORM.frx":1C8FB
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   720
      Picture         =   "HIDEFORM.frx":1CC6E
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1320
      Picture         =   "HIDEFORM.frx":1D3D6
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1920
      Picture         =   "HIDEFORM.frx":1DB16
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2520
      Picture         =   "HIDEFORM.frx":1E278
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3120
      Picture         =   "HIDEFORM.frx":1E9D6
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3720
      Picture         =   "HIDEFORM.frx":1F12D
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4320
      Picture         =   "HIDEFORM.frx":1F8CD
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   720
      Picture         =   "HIDEFORM.frx":2001F
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1320
      Picture         =   "HIDEFORM.frx":207CA
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1920
      Picture         =   "HIDEFORM.frx":20EE3
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2520
      Picture         =   "HIDEFORM.frx":21694
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3120
      Picture         =   "HIDEFORM.frx":21E19
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3720
      Picture         =   "HIDEFORM.frx":22594
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4320
      Picture         =   "HIDEFORM.frx":22D22
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   120
      Picture         =   "HIDEFORM.frx":23475
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   720
      Picture         =   "HIDEFORM.frx":2382A
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1320
      Picture         =   "HIDEFORM.frx":23FD4
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1920
      Picture         =   "HIDEFORM.frx":2475A
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2520
      Picture         =   "HIDEFORM.frx":24EFA
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3120
      Picture         =   "HIDEFORM.frx":2569E
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3720
      Picture         =   "HIDEFORM.frx":25E37
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4320
      Picture         =   "HIDEFORM.frx":2661B
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   720
      Picture         =   "HIDEFORM.frx":26DB0
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1320
      Picture         =   "HIDEFORM.frx":2759F
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1920
      Picture         =   "HIDEFORM.frx":27CFC
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2520
      Picture         =   "HIDEFORM.frx":284F2
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3120
      Picture         =   "HIDEFORM.frx":28CBA
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3720
      Picture         =   "HIDEFORM.frx":29479
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4320
      Picture         =   "HIDEFORM.frx":29C4C
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgEngineBlackLarge 
      Height          =   855
      Left            =   960
      Picture         =   "HIDEFORM.frx":2A3E0
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgEngineRedLarge 
      Height          =   855
      Left            =   120
      Picture         =   "HIDEFORM.frx":2A8F0
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgEngineBlack 
      Height          =   615
      Left            =   2400
      Picture         =   "HIDEFORM.frx":2AE00
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgEngineRed 
      Height          =   615
      Left            =   1800
      Picture         =   "HIDEFORM.frx":2B25C
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgFormRed 
      Height          =   480
      Left            =   3840
      Picture         =   "HIDEFORM.frx":2B6B8
      Top             =   960
      Width           =   480
   End
   Begin VB.Image imgFormBlack 
      Height          =   480
      Left            =   4440
      Picture         =   "HIDEFORM.frx":2B9C2
      Top             =   960
      Width           =   480
   End
   Begin VB.Image imgBoardSmall 
      Height          =   6255
      Left            =   120
      Picture         =   "HIDEFORM.frx":2BCCC
      Top             =   120
      Width           =   5655
   End
   Begin VB.Image imgBoardLarge 
      Height          =   8655
      Left            =   120
      Picture         =   "HIDEFORM.frx":3FA61
      Top             =   120
      Width           =   7815
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
