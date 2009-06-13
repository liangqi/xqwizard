VERSION 5.00
Begin VB.Form frmRank 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4080
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3090
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "RANKS.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4080
   ScaleWidth      =   3090
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOK 
      Caption         =   "确定"
      Height          =   495
      Left            =   960
      TabIndex        =   26
      Top             =   3480
      Width           =   1215
   End
   Begin VB.PictureBox pic 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2595
      Left            =   0
      ScaleHeight     =   2535
      ScaleWidth      =   3015
      TabIndex        =   0
      Top             =   360
      Width           =   3075
      Begin VB.VScrollBar vs 
         Height          =   2535
         LargeChange     =   9
         Left            =   2760
         TabIndex        =   2
         Top             =   0
         Width           =   255
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   9
         Left            =   2280
         TabIndex        =   37
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   8
         Left            =   2280
         TabIndex        =   36
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   7
         Left            =   2280
         TabIndex        =   35
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   6
         Left            =   2280
         TabIndex        =   34
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   5
         Left            =   2280
         TabIndex        =   33
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   4
         Left            =   2280
         TabIndex        =   32
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   3
         Left            =   2280
         TabIndex        =   31
         Top             =   840
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   2
         Left            =   2280
         TabIndex        =   30
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   1
         Left            =   2280
         TabIndex        =   29
         Top             =   360
         Width           =   375
      End
      Begin VB.Label lblScore 
         Alignment       =   1  'Right Justify
         Caption         =   "9999"
         Height          =   255
         Index           =   0
         Left            =   2280
         TabIndex        =   28
         Top             =   120
         Width           =   375
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   9
         Left            =   480
         TabIndex        =   23
         Top             =   2280
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   8
         Left            =   480
         TabIndex        =   22
         Top             =   2040
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   7
         Left            =   480
         TabIndex        =   21
         Top             =   1800
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   6
         Left            =   480
         TabIndex        =   20
         Top             =   1560
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   5
         Left            =   480
         TabIndex        =   19
         Top             =   1320
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   4
         Left            =   480
         TabIndex        =   18
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   3
         Left            =   480
         TabIndex        =   17
         Top             =   840
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   2
         Left            =   480
         TabIndex        =   16
         Top             =   600
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   1
         Left            =   480
         TabIndex        =   15
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label lblUserName 
         Alignment       =   2  'Center
         Caption         =   "象棋巫师注册用户"
         Height          =   255
         Index           =   0
         Left            =   480
         TabIndex        =   14
         Top             =   120
         Width           =   1695
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "10"
         Height          =   255
         Index           =   9
         Left            =   0
         TabIndex        =   13
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "9"
         Height          =   255
         Index           =   8
         Left            =   0
         TabIndex        =   12
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "8"
         Height          =   255
         Index           =   7
         Left            =   0
         TabIndex        =   11
         Top             =   1800
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "7"
         Height          =   255
         Index           =   6
         Left            =   0
         TabIndex        =   10
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "6"
         Height          =   255
         Index           =   5
         Left            =   0
         TabIndex        =   9
         Top             =   1320
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "5"
         Height          =   255
         Index           =   4
         Left            =   0
         TabIndex        =   8
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "4"
         Height          =   255
         Index           =   3
         Left            =   0
         TabIndex        =   7
         Top             =   840
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "3"
         Height          =   255
         Index           =   2
         Left            =   0
         TabIndex        =   6
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "2"
         Height          =   255
         Index           =   1
         Left            =   0
         TabIndex        =   5
         Top             =   360
         Width           =   375
      End
      Begin VB.Label lblRank 
         Alignment       =   1  'Right Justify
         Caption         =   "1"
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   4
         Top             =   120
         Width           =   375
      End
   End
   Begin VB.Label lblScoreSelf 
      Alignment       =   1  'Right Justify
      Caption         =   "9999"
      Height          =   255
      Left            =   2400
      TabIndex        =   38
      Top             =   3120
      Width           =   375
   End
   Begin VB.Label lblScoreHeader 
      Alignment       =   1  'Right Justify
      Caption         =   "成绩"
      Height          =   255
      Left            =   2160
      TabIndex        =   27
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblRank 
      Alignment       =   1  'Right Justify
      Caption         =   "99999"
      Height          =   255
      Index           =   10
      Left            =   0
      TabIndex        =   25
      Top             =   3120
      Width           =   495
   End
   Begin VB.Label lblUserNameSelf 
      Alignment       =   2  'Center
      Caption         =   "象棋巫师注册用户"
      Height          =   255
      Left            =   600
      TabIndex        =   24
      Top             =   3120
      Width           =   1695
   End
   Begin VB.Label lblUserNameHeader 
      Alignment       =   2  'Center
      Caption         =   "选手"
      Height          =   255
      Left            =   1080
      TabIndex        =   3
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblRankHeader 
      Alignment       =   1  'Right Justify
      Caption         =   "排名"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   375
   End
End
Attribute VB_Name = "frmRank"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
