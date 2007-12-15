VERSION 5.00
Object = "{FE0065C0-1B7B-11CF-9D53-00AA003C9CB6}#1.1#0"; "COMCT232.OCX"
Begin VB.Form frmPosEdit 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "编辑局面"
   ClientHeight    =   6840
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8640
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "POSEDIT.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6840
   ScaleWidth      =   8640
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   7320
      TabIndex        =   11
      Top             =   6360
      Width           =   1095
   End
   Begin VB.Frame frmCapture 
      Height          =   5175
      Left            =   5880
      TabIndex        =   1
      Top             =   0
      Width           =   2655
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   0
         Left            =   120
         Stretch         =   -1  'True
         Top             =   4440
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   1
         Left            =   720
         Stretch         =   -1  'True
         Top             =   4440
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   2
         Left            =   1320
         Stretch         =   -1  'True
         Top             =   4440
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   3
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   4440
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   4
         Left            =   120
         Stretch         =   -1  'True
         Top             =   3840
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   5
         Left            =   720
         Stretch         =   -1  'True
         Top             =   3840
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   6
         Left            =   1320
         Stretch         =   -1  'True
         Top             =   3840
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   7
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   3840
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   8
         Left            =   120
         Stretch         =   -1  'True
         Top             =   3240
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   9
         Left            =   720
         Stretch         =   -1  'True
         Top             =   3240
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   10
         Left            =   1320
         Stretch         =   -1  'True
         Top             =   3240
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   11
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   3240
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   12
         Left            =   120
         Stretch         =   -1  'True
         Top             =   2640
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   13
         Left            =   720
         Stretch         =   -1  'True
         Top             =   2640
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   14
         Left            =   1320
         Stretch         =   -1  'True
         Top             =   2640
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   15
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   2640
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   16
         Left            =   120
         Stretch         =   -1  'True
         Top             =   240
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   17
         Left            =   720
         Stretch         =   -1  'True
         Top             =   240
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   18
         Left            =   1320
         Stretch         =   -1  'True
         Top             =   240
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   19
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   240
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   20
         Left            =   120
         Stretch         =   -1  'True
         Top             =   840
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   21
         Left            =   720
         Stretch         =   -1  'True
         Top             =   840
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   22
         Left            =   1320
         Stretch         =   -1  'True
         Top             =   840
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   23
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   840
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   24
         Left            =   120
         Stretch         =   -1  'True
         Top             =   1440
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   25
         Left            =   720
         Stretch         =   -1  'True
         Top             =   1440
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   26
         Left            =   1320
         Stretch         =   -1  'True
         Top             =   1440
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   27
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   1440
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   28
         Left            =   120
         Stretch         =   -1  'True
         Top             =   2040
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   29
         Left            =   720
         Stretch         =   -1  'True
         Top             =   2040
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   30
         Left            =   1320
         Stretch         =   -1  'True
         Top             =   2040
         Width           =   615
      End
      Begin VB.Image imgCaptured 
         Height          =   615
         Index           =   31
         Left            =   1920
         Stretch         =   -1  'True
         Top             =   2040
         Width           =   615
      End
   End
   Begin ComCtl2.UpDown updnCounter 
      Height          =   270
      Left            =   8280
      TabIndex        =   7
      Top             =   5400
      Width           =   195
      _ExtentX        =   344
      _ExtentY        =   476
      _Version        =   327681
      Value           =   1
      BuddyControl    =   "txtCounter"
      BuddyDispid     =   196612
      OrigLeft        =   8280
      OrigTop         =   5400
      OrigRight       =   8475
      OrigBottom      =   5670
      Max             =   999
      Min             =   1
      SyncBuddy       =   -1  'True
      BuddyProperty   =   0
      Enabled         =   -1  'True
   End
   Begin VB.TextBox txtCounter 
      Alignment       =   1  'Right Justify
      Height          =   270
      Left            =   7800
      TabIndex        =   6
      Top             =   5400
      Width           =   465
   End
   Begin VB.OptionButton optBlackMove 
      Caption         =   "黑"
      Height          =   180
      Left            =   6840
      TabIndex        =   4
      Top             =   5400
      Width           =   495
   End
   Begin VB.OptionButton optRedMove 
      Caption         =   "红"
      Height          =   180
      Left            =   6360
      TabIndex        =   3
      Top             =   5400
      Width           =   495
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Height          =   375
      Left            =   7320
      TabIndex        =   10
      Top             =   5880
      Width           =   1095
   End
   Begin VB.CommandButton btnClear 
      Caption         =   "清空棋盘"
      Height          =   375
      Left            =   6000
      TabIndex        =   8
      Top             =   5880
      Width           =   1095
   End
   Begin VB.CommandButton btnExchange 
      Caption         =   "红黑互换"
      Height          =   375
      Left            =   6000
      TabIndex        =   9
      Top             =   6360
      Width           =   1095
   End
   Begin VB.TextBox txtFen 
      Height          =   270
      Left            =   120
      TabIndex        =   0
      Top             =   6480
      Width           =   5655
   End
   Begin VB.Label lblPlayer 
      Caption         =   "先行"
      Height          =   255
      Left            =   6000
      TabIndex        =   2
      Top             =   5400
      Width           =   375
   End
   Begin VB.Label lblCounter 
      Caption         =   "回合"
      Height          =   255
      Left            =   7440
      TabIndex        =   5
      Top             =   5400
      Width           =   375
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   0
      Left            =   240
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   1
      Left            =   840
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   2
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   3
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   4
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   5
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   6
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   7
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   8
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   9
      Left            =   240
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   10
      Left            =   840
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   11
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   12
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   13
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   14
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   15
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   16
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   17
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   18
      Left            =   240
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   19
      Left            =   840
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   20
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   21
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   22
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   23
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   24
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   25
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   26
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   27
      Left            =   240
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   28
      Left            =   840
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   29
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   30
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   31
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   32
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   33
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   34
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   35
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   36
      Left            =   240
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   37
      Left            =   840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   38
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   39
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   40
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   41
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   42
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   43
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   44
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   45
      Left            =   240
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   46
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   47
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   48
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   49
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   50
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   51
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   52
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   53
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   54
      Left            =   240
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   55
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   56
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   57
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   58
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   59
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   60
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   61
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   62
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   63
      Left            =   240
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   64
      Left            =   840
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   65
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   66
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   67
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   68
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   69
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   70
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   71
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   72
      Left            =   240
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   73
      Left            =   840
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   74
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   75
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   76
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   77
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   78
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   79
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   80
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   81
      Left            =   240
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   82
      Left            =   840
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   83
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   84
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   85
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   86
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   87
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   88
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   89
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgBoard 
      Height          =   6255
      Left            =   120
      Stretch         =   -1  'True
      Top             =   120
      Width           =   5655
   End
End
Attribute VB_Name = "frmPosEdit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' POSEDIT.FRM - Source Code for XiangQi Wizard, Part III
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 3.6, Last Modified: Dec. 2007
' Copyright (C) 2004-2007 www.elephantbase.net
'
' This program is free software; you can redistribute it and/or modify
' it under the terms of the GNU General Public License as published by
' the Free Software Foundation; either version 2 of the License, or
' (at your option) any later version.

' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.

' You should have received a copy of the GNU General Public License along
' with this program; if not, write to the Free Software Foundation, Inc.,
' 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

Option Explicit

Private Edit_posBoard As PositionStruct, Edit_cnt As Integer, Edit_sdPlayer As Integer, Edit_szFen As String
Private Edit_sqSelected As Integer, Edit_pcSelected As Integer

' 以下是局面编辑例程

Private Sub DrawPosSquare(ByVal sq As Integer, Optional ByVal bSelected As Boolean = False)

Dim pc As Integer, nPicId As Integer
pc = Edit_posBoard.ucpcSquares(sq)
If pc = 0 Then
    nPicId = 0
Else
    nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
End If
nPicId = nPicId + IIf(bSelected, 15, 0)
imgSquares((sq \ 16 - 3) * 9 + sq Mod 16 - 3).Picture = frmHide.imgPiecesSmall(nPicId).Picture

End Sub

Private Sub DrawCapSquare(ByVal pc As Integer, Optional ByVal bSelected As Boolean = False)

Dim nPicId As Integer
If Edit_posBoard.ucsqPieces(pc) = 0 Then
    nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
Else
    nPicId = 0
End If
nPicId = nPicId + IIf(bSelected, 15, 0)
imgCaptured(pc - 16).Picture = frmHide.imgPiecesSmall(nPicId).Picture

End Sub

Private Sub PosBoardFlush()

Dim i As Integer, j As Integer
For i = 3 To 12
    For j = 3 To 11
        DrawPosSquare i * 16 + j
    Next
Next
For i = 16 To 47
    DrawCapSquare i
Next

End Sub

' 以上是局面编辑例程

Private Sub Form_Load()

Dim i As Integer, j As Integer
Edit_cnt = Game_cntCurr
Edit_sqSelected = 0
Edit_pcSelected = 0
Edit_posBoard = Game_posIrrev(Game_nCurrIrrev)
imgBoard.Picture = frmHide.imgBoardSmall.Picture
PosBoardFlush
Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
txtFen.Text = Edit_szFen
optRedMove.Value = (Edit_posBoard.sdPlayer = 0)
optBlackMove.Value = (Edit_posBoard.sdPlayer = 1)
txtCounter.Text = Edit_cnt
SetWindowPos hWnd, IIf(Options_bTopMost, HWND_TOPMOST, HWND_NOTOPMOST), 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE

End Sub

Private Sub txtFen_Change()

Dim i As Integer
If Edit_szFen <> txtFen.Text Then
    Edit_szFen = txtFen.Text
    i = InStr(Edit_szFen, vbCrLf)
    If i > 0 Then
        Edit_szFen = Left(Edit_szFen, i - 1)
        txtFen.Text = Edit_szFen
    End If
    If Edit_szFen = vbNullString Then
        Edit_szFen = ""
    End If
    CchessFen2Board Edit_posBoard, Edit_szFen
    Edit_cnt = Str2Int(Mid(Edit_szFen, InStr(Edit_szFen, " - - 0 ") + 7), 1, 999)
    Edit_sqSelected = 0
    PosBoardFlush
    optRedMove.Value = (Edit_posBoard.sdPlayer = 0)
    optBlackMove.Value = (Edit_posBoard.sdPlayer = 1)
    txtCounter.Text = Edit_cnt
End If

End Sub

Private Sub optRedMove_Click()

If Edit_posBoard.sdPlayer = 1 Then
    Edit_posBoard.sdPlayer = 0
    Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
    txtFen.Text = Edit_szFen
End If

End Sub

Private Sub optBlackMove_Click()

If Edit_posBoard.sdPlayer = 0 Then
    Edit_posBoard.sdPlayer = 1
    Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
    txtFen.Text = Edit_szFen
End If

End Sub

Private Sub txtCounter_Change()

If Edit_cnt <> Str2Int(txtCounter.Text) Then
    Edit_cnt = Str2Int(txtCounter.Text, 1, 999)
    txtCounter.Text = Edit_cnt
    Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
    txtFen.Text = Edit_szFen
End If

End Sub

Private Sub imgSquares_MouseUp(nIndex As Integer, nButton As Integer, nShift As Integer, x As Single, y As Single)

Dim sq As Integer, pcSrc As Integer, pcDst As Integer
If x < 0 Or x > imgSquares(nIndex).Width Or y < 0 Or y > imgSquares(nIndex).Height Then
    Exit Sub
End If
sq = (nIndex \ 9 + 3) * 16 + nIndex Mod 9 + 3
If nButton = vbLeftButton Then
    If Edit_sqSelected > 0 Or Edit_pcSelected > 0 Then
        pcDst = Edit_posBoard.ucpcSquares(sq)
        If Edit_pcSelected > 0 Then
            pcSrc = Edit_pcSelected
        Else
            pcSrc = Edit_posBoard.ucpcSquares(Edit_sqSelected)
            CchessAddPiece Edit_posBoard, Edit_sqSelected, pcSrc, CCHESS_DELETE_PIECE
        End If
        If pcDst > 0 Then
            CchessAddPiece Edit_posBoard, sq, pcDst, CCHESS_DELETE_PIECE
            DrawCapSquare pcDst
        End If
        CchessAddPiece Edit_posBoard, sq, pcSrc
        DrawCapSquare pcSrc
        If Edit_sqSelected > 0 Then
            DrawPosSquare Edit_sqSelected
        End If
        DrawPosSquare sq
        Edit_sqSelected = 0
        Edit_pcSelected = 0
        Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
        txtFen.Text = Edit_szFen
    Else
        If Edit_posBoard.ucpcSquares(sq) > 0 Then
            Edit_sqSelected = sq
            DrawPosSquare sq, DRAW_SELECTED
        End If
    End If
ElseIf nButton = vbRightButton Then
    If Edit_sqSelected > 0 Then
        DrawPosSquare Edit_sqSelected
        Edit_sqSelected = 0
    End If
    If Edit_pcSelected > 0 Then
        DrawCapSquare Edit_pcSelected
        Edit_pcSelected = 0
    End If
    pcDst = Edit_posBoard.ucpcSquares(sq)
    If pcDst > 0 Then
        CchessAddPiece Edit_posBoard, sq, pcDst, CCHESS_DELETE_PIECE
        DrawPosSquare sq
        DrawCapSquare pcDst
        Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
        txtFen.Text = Edit_szFen
    End If
End If

End Sub

Private Sub imgCaptured_Click(nIndex As Integer)

Dim pc As Integer
If Edit_sqSelected > 0 Then
    pc = Edit_posBoard.ucpcSquares(Edit_sqSelected)
    CchessAddPiece Edit_posBoard, Edit_sqSelected, pc, CCHESS_DELETE_PIECE
    DrawPosSquare Edit_sqSelected
    DrawCapSquare pc
    Edit_sqSelected = 0
    Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
    txtFen.Text = Edit_szFen
Else
    pc = nIndex + 16
    If Edit_posBoard.ucsqPieces(pc) = 0 Then
        If Edit_pcSelected > 0 Then
            DrawCapSquare Edit_pcSelected
        End If
        Edit_pcSelected = pc
        DrawCapSquare Edit_pcSelected, DRAW_SELECTED
    End If
End If

End Sub

Private Sub btnClear_Click()

CchessClearBoard Edit_posBoard
Edit_sqSelected = 0
PosBoardFlush
Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
txtFen.Text = Edit_szFen

End Sub

Private Sub btnExchange_Click()

CchessExchangeSide Edit_posBoard
Edit_sqSelected = 0
PosBoardFlush
optRedMove.Value = (Edit_posBoard.sdPlayer = 0)
optBlackMove.Value = (Edit_posBoard.sdPlayer = 1)
Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
txtFen.Text = Edit_szFen

End Sub

Private Sub btnConfirm_Click()

Dim sqWhiteKing As Integer, sqBlackKing As Integer
sqWhiteKing = Edit_posBoard.ucsqPieces(16)
sqBlackKing = Edit_posBoard.ucsqPieces(32)
If sqWhiteKing > 0 And sqBlackKing > sqWhiteKing Then
    If MsgBox("你可能没有遵循“红下黑上”的棋子摆放规则。是否需要翻转一下？", vbQuestion + vbYesNo) = vbYes Then
        CchessFlipBoard Edit_posBoard
        ' Edit_sqSelected = 0
        ' PosBoardFlush
        Edit_szFen = MkBStr(CchessBoard2Fen(Edit_posBoard)) + " - - 0" + Str(Edit_cnt)
        ' txtFen.Text = Edit_szFen
    End If
End If
App_szFileName = ""
RestartGame RESTART_KEEP_LABEL
Game_sdStart = Edit_posBoard.sdPlayer
Game_cntStart = Edit_cnt
Game_sdCurr = Game_sdStart
Game_cntCurr = Game_cntStart
Game_sdMax = Game_sdCurr
Game_szIrrevFen(0) = Edit_szFen
Game_posIrrev(0) = Edit_posBoard
CchessSetIrrev Game_posIrrev(0)
Game_bStartPos = False
BoardFlush
LabelFlush
MoveFlush
Unload Me

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
