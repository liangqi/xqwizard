VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
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
   Icon            =   "HIDE.frx":0000
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
         NumListImages   =   29
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":000C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":0166
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":02C0
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":041A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":0574
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":06CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":0828
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":0982
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":0ADC
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":0C36
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":0D90
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":0EEA
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":1044
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":119E
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":12F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":1452
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":15AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":1706
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":1860
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":19BA
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":1B14
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":1C6E
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":1DC8
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":1F22
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":207C
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":21D6
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":2330
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":248A
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "HIDE.frx":25E4
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   31
      Left            =   7680
      Picture         =   "HIDE.frx":273E
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   30
      Left            =   6840
      Picture         =   "HIDE.frx":32B0
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   31
      Left            =   5520
      Picture         =   "HIDE.frx":3DBA
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   30
      Left            =   4920
      Picture         =   "HIDE.frx":4555
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   14
      Left            =   5160
      Picture         =   "HIDE.frx":4C9D
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   13
      Left            =   4800
      Picture         =   "HIDE.frx":501B
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   12
      Left            =   4440
      Picture         =   "HIDE.frx":53A1
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   11
      Left            =   4080
      Picture         =   "HIDE.frx":571E
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   10
      Left            =   3720
      Picture         =   "HIDE.frx":5AA0
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   9
      Left            =   3360
      Picture         =   "HIDE.frx":5E25
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   8
      Left            =   3000
      Picture         =   "HIDE.frx":619B
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   7
      Left            =   2640
      Picture         =   "HIDE.frx":651F
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   6
      Left            =   2280
      Picture         =   "HIDE.frx":689D
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   5
      Left            =   1920
      Picture         =   "HIDE.frx":6C23
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   4
      Left            =   1560
      Picture         =   "HIDE.frx":6FA0
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   3
      Left            =   1200
      Picture         =   "HIDE.frx":7322
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   2
      Left            =   840
      Picture         =   "HIDE.frx":76A5
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   1
      Left            =   480
      Picture         =   "HIDE.frx":7A23
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesMini 
      Height          =   240
      Index           =   0
      Left            =   120
      Picture         =   "HIDE.frx":7DA9
      Top             =   7440
      Width           =   240
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   6000
      Picture         =   "HIDE.frx":80F5
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5160
      Picture         =   "HIDE.frx":8C73
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4320
      Picture         =   "HIDE.frx":9835
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3480
      Picture         =   "HIDE.frx":A39D
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2640
      Picture         =   "HIDE.frx":AF2C
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1800
      Picture         =   "HIDE.frx":BAF2
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   960
      Picture         =   "HIDE.frx":C605
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   6000
      Picture         =   "HIDE.frx":D1E8
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5160
      Picture         =   "HIDE.frx":DD3D
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4320
      Picture         =   "HIDE.frx":E8C3
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3480
      Picture         =   "HIDE.frx":F423
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2640
      Picture         =   "HIDE.frx":FFAB
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1800
      Picture         =   "HIDE.frx":10B12
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   960
      Picture         =   "HIDE.frx":11679
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   120
      Picture         =   "HIDE.frx":1220F
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   6000
      Picture         =   "HIDE.frx":125E0
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5160
      Picture         =   "HIDE.frx":13113
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4320
      Picture         =   "HIDE.frx":13C86
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3480
      Picture         =   "HIDE.frx":147A2
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2640
      Picture         =   "HIDE.frx":152E4
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1800
      Picture         =   "HIDE.frx":15E5B
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   960
      Picture         =   "HIDE.frx":16924
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   6000
      Picture         =   "HIDE.frx":174B8
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5160
      Picture         =   "HIDE.frx":17FC0
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4320
      Picture         =   "HIDE.frx":18AFB
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3480
      Picture         =   "HIDE.frx":19607
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2640
      Picture         =   "HIDE.frx":1A140
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1800
      Picture         =   "HIDE.frx":1AC5E
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   960
      Picture         =   "HIDE.frx":1B773
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   0
      Left            =   120
      Picture         =   "HIDE.frx":1C2BA
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   120
      Picture         =   "HIDE.frx":1C647
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   720
      Picture         =   "HIDE.frx":1C9BA
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1320
      Picture         =   "HIDE.frx":1D122
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1920
      Picture         =   "HIDE.frx":1D862
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2520
      Picture         =   "HIDE.frx":1DFC4
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3120
      Picture         =   "HIDE.frx":1E722
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3720
      Picture         =   "HIDE.frx":1EE79
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4320
      Picture         =   "HIDE.frx":1F619
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   720
      Picture         =   "HIDE.frx":1FD6B
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1320
      Picture         =   "HIDE.frx":20516
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1920
      Picture         =   "HIDE.frx":20C2F
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2520
      Picture         =   "HIDE.frx":213E0
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3120
      Picture         =   "HIDE.frx":21B65
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3720
      Picture         =   "HIDE.frx":222E0
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4320
      Picture         =   "HIDE.frx":22A6E
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   120
      Picture         =   "HIDE.frx":231C1
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   720
      Picture         =   "HIDE.frx":23576
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1320
      Picture         =   "HIDE.frx":23D20
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1920
      Picture         =   "HIDE.frx":244A6
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2520
      Picture         =   "HIDE.frx":24C46
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3120
      Picture         =   "HIDE.frx":253EA
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3720
      Picture         =   "HIDE.frx":25B83
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4320
      Picture         =   "HIDE.frx":26367
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   720
      Picture         =   "HIDE.frx":26AFC
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1320
      Picture         =   "HIDE.frx":272EB
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1920
      Picture         =   "HIDE.frx":27A48
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2520
      Picture         =   "HIDE.frx":2823E
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3120
      Picture         =   "HIDE.frx":28A06
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3720
      Picture         =   "HIDE.frx":291C5
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4320
      Picture         =   "HIDE.frx":29998
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgEngineBlackLarge 
      Height          =   855
      Left            =   960
      Picture         =   "HIDE.frx":2A12C
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgEngineRedLarge 
      Height          =   855
      Left            =   120
      Picture         =   "HIDE.frx":2A63C
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgEngineBlack 
      Height          =   615
      Left            =   2400
      Picture         =   "HIDE.frx":2AB4C
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgEngineRed 
      Height          =   615
      Left            =   1800
      Picture         =   "HIDE.frx":2AFA8
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgFormRed 
      Height          =   480
      Left            =   3840
      Picture         =   "HIDE.frx":2B404
      Top             =   960
      Width           =   480
   End
   Begin VB.Image imgFormBlack 
      Height          =   480
      Left            =   4440
      Picture         =   "HIDE.frx":2B70E
      Top             =   960
      Width           =   480
   End
   Begin VB.Image imgBoardSmall 
      Height          =   6255
      Left            =   120
      Picture         =   "HIDE.frx":2BA18
      Top             =   120
      Width           =   5655
   End
   Begin VB.Image imgBoardLarge 
      Height          =   8655
      Left            =   120
      Picture         =   "HIDE.frx":3F7AD
      Top             =   120
      Width           =   7815
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
