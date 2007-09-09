VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
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
      Left            =   4440
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
   Begin MSComDlg.CommonDialog comdlg 
      Left            =   3840
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   29
      Left            =   6000
      Picture         =   "HIDEFORM.frx":000C
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   28
      Left            =   5160
      Picture         =   "HIDEFORM.frx":04E5
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   27
      Left            =   4320
      Picture         =   "HIDEFORM.frx":09F1
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   26
      Left            =   3480
      Picture         =   "HIDEFORM.frx":0EC2
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   25
      Left            =   2640
      Picture         =   "HIDEFORM.frx":13A6
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   24
      Left            =   1800
      Picture         =   "HIDEFORM.frx":187B
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   23
      Left            =   960
      Picture         =   "HIDEFORM.frx":1D36
      Top             =   6480
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   22
      Left            =   6000
      Picture         =   "HIDEFORM.frx":223C
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   21
      Left            =   5160
      Picture         =   "HIDEFORM.frx":2713
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   20
      Left            =   4320
      Picture         =   "HIDEFORM.frx":2C1F
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   19
      Left            =   3480
      Picture         =   "HIDEFORM.frx":30F0
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   18
      Left            =   2640
      Picture         =   "HIDEFORM.frx":35D4
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   17
      Left            =   1800
      Picture         =   "HIDEFORM.frx":3AC2
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   16
      Left            =   960
      Picture         =   "HIDEFORM.frx":3F9B
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   15
      Left            =   120
      Picture         =   "HIDEFORM.frx":449E
      Top             =   5640
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   14
      Left            =   6000
      Picture         =   "HIDEFORM.frx":4875
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   13
      Left            =   5160
      Picture         =   "HIDEFORM.frx":4D09
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   12
      Left            =   4320
      Picture         =   "HIDEFORM.frx":51CC
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   11
      Left            =   3480
      Picture         =   "HIDEFORM.frx":565A
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   10
      Left            =   2640
      Picture         =   "HIDEFORM.frx":5AFF
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   9
      Left            =   1800
      Picture         =   "HIDEFORM.frx":5F93
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   8
      Left            =   960
      Picture         =   "HIDEFORM.frx":640B
      Top             =   4800
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   7
      Left            =   6000
      Picture         =   "HIDEFORM.frx":68CC
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   6
      Left            =   5160
      Picture         =   "HIDEFORM.frx":6D5D
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   5
      Left            =   4320
      Picture         =   "HIDEFORM.frx":7220
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   4
      Left            =   3480
      Picture         =   "HIDEFORM.frx":76AE
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   3
      Left            =   2640
      Picture         =   "HIDEFORM.frx":7B53
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   2
      Left            =   1800
      Picture         =   "HIDEFORM.frx":7FFC
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   1
      Left            =   960
      Picture         =   "HIDEFORM.frx":849A
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesLarge 
      Height          =   855
      Index           =   0
      Left            =   120
      Picture         =   "HIDEFORM.frx":8960
      Top             =   3960
      Width           =   855
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   0
      Left            =   120
      Picture         =   "HIDEFORM.frx":8CED
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   1
      Left            =   720
      Picture         =   "HIDEFORM.frx":9060
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   2
      Left            =   1320
      Picture         =   "HIDEFORM.frx":947D
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   3
      Left            =   1920
      Picture         =   "HIDEFORM.frx":9895
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   4
      Left            =   2520
      Picture         =   "HIDEFORM.frx":9CB2
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   5
      Left            =   3120
      Picture         =   "HIDEFORM.frx":A0C7
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   6
      Left            =   3720
      Picture         =   "HIDEFORM.frx":A4D5
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   7
      Left            =   4320
      Picture         =   "HIDEFORM.frx":A8F3
      Top             =   1560
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   8
      Left            =   720
      Picture         =   "HIDEFORM.frx":ACFE
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   9
      Left            =   1320
      Picture         =   "HIDEFORM.frx":B11D
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   10
      Left            =   1920
      Picture         =   "HIDEFORM.frx":B51B
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   11
      Left            =   2520
      Picture         =   "HIDEFORM.frx":B93C
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   12
      Left            =   3120
      Picture         =   "HIDEFORM.frx":BD53
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   13
      Left            =   3720
      Picture         =   "HIDEFORM.frx":C161
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   14
      Left            =   4320
      Picture         =   "HIDEFORM.frx":C588
      Top             =   2160
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   15
      Left            =   120
      Picture         =   "HIDEFORM.frx":C997
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   16
      Left            =   720
      Picture         =   "HIDEFORM.frx":CD53
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   17
      Left            =   1320
      Picture         =   "HIDEFORM.frx":D1B0
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   18
      Left            =   1920
      Picture         =   "HIDEFORM.frx":D608
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   19
      Left            =   2520
      Picture         =   "HIDEFORM.frx":DA66
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   20
      Left            =   3120
      Picture         =   "HIDEFORM.frx":DEBA
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   21
      Left            =   3720
      Picture         =   "HIDEFORM.frx":E303
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   22
      Left            =   4320
      Picture         =   "HIDEFORM.frx":E761
      Top             =   2760
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   23
      Left            =   720
      Picture         =   "HIDEFORM.frx":EBAB
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   24
      Left            =   1320
      Picture         =   "HIDEFORM.frx":F00C
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   25
      Left            =   1920
      Picture         =   "HIDEFORM.frx":F447
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   26
      Left            =   2520
      Picture         =   "HIDEFORM.frx":F8A8
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   27
      Left            =   3120
      Picture         =   "HIDEFORM.frx":FCFC
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   28
      Left            =   3720
      Picture         =   "HIDEFORM.frx":10149
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgPiecesSmall 
      Height          =   615
      Index           =   29
      Left            =   4320
      Picture         =   "HIDEFORM.frx":105AF
      Top             =   3360
      Width           =   615
   End
   Begin VB.Image imgEngineBlackLarge 
      Height          =   855
      Left            =   960
      Picture         =   "HIDEFORM.frx":109FE
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgEngineRedLarge 
      Height          =   855
      Left            =   120
      Picture         =   "HIDEFORM.frx":10F0E
      Top             =   120
      Width           =   855
   End
   Begin VB.Image imgEngineBlack 
      Height          =   615
      Left            =   2400
      Picture         =   "HIDEFORM.frx":1141E
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgEngineRed 
      Height          =   615
      Left            =   1800
      Picture         =   "HIDEFORM.frx":1187A
      Top             =   120
      Width           =   615
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
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   29
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":11CD6
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":11E30
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":11F8A
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":120E4
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":1223E
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":12398
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":124F2
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":1264C
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":127A6
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":12900
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":12A5A
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":12BB4
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":12D0E
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":12E68
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":12FC2
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":1311C
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":13276
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":133D0
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":1352A
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":13684
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":137DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":13938
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":13A92
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":13BEC
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":13D46
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":13EA0
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":13FFA
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":14154
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "HIDEFORM.frx":142AE
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Image imgFormRed 
      Height          =   480
      Left            =   3840
      Picture         =   "HIDEFORM.frx":14408
      Top             =   960
      Width           =   480
   End
   Begin VB.Image imgFormBlack 
      Height          =   480
      Left            =   4440
      Picture         =   "HIDEFORM.frx":14712
      Top             =   960
      Width           =   480
   End
   Begin VB.Image imgBoardSmall 
      Height          =   6255
      Left            =   120
      Picture         =   "HIDEFORM.frx":14A1C
      Top             =   120
      Width           =   5655
   End
   Begin VB.Image imgBoardLarge 
      Height          =   8655
      Left            =   120
      Picture         =   "HIDEFORM.frx":16AE1
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

Private Sub Form_Load()

End Sub
