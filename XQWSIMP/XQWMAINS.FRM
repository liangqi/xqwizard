VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmMainSmall 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   ClientHeight    =   7560
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   9960
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "XQWMAINS.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   7560
   ScaleWidth      =   9960
   StartUpPosition =   3  'Windows Default
   Begin ComctlLib.Toolbar tlb 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9960
      _ExtentX        =   17568
      _ExtentY        =   741
      ButtonWidth     =   635
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   29
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "FileNew"
            Object.ToolTipText     =   "新建"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "FileOpen"
            Object.ToolTipText     =   "打开"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "FileSave"
            Object.ToolTipText     =   "保存"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "FileViewPgn"
            Object.ToolTipText     =   "查看PGN文件"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "FileEditTags"
            Object.ToolTipText     =   "编辑标签"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button7 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "MoveDel"
            Object.ToolTipText     =   "删除"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button8 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "MoveStart"
            Object.ToolTipText     =   "起始局面"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button9 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "MoveBack"
            Object.ToolTipText     =   "上一着"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button10 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "MoveForward"
            Object.ToolTipText     =   "下一着"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button11 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "MoveEnd"
            Object.ToolTipText     =   "最後局面"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button12 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "MovePaste"
            Object.ToolTipText     =   "从剪贴板导入"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button13 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button14 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "PosFlip"
            Object.ToolTipText     =   "翻转棋盘"
            Object.Tag             =   ""
            Style           =   1
         EndProperty
         BeginProperty Button15 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "PosAnalyze"
            Object.ToolTipText     =   "分析局面"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button16 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "PosEdit"
            Object.ToolTipText     =   "编辑局面"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button17 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button18 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "WizardPlay"
            Object.ToolTipText     =   "播放棋局"
            Object.Tag             =   ""
            Style           =   1
         EndProperty
         BeginProperty Button19 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Enabled         =   0   'False
            Key             =   "WizardFunny"
            Object.ToolTipText     =   "趣味象棋"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button20 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "WizardJava"
            Object.ToolTipText     =   "复制Java棋盘代码"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button21 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "WizardText"
            Object.ToolTipText     =   "复制文本棋盘"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button22 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "WizardBitmap"
            Object.ToolTipText     =   "查看图片棋盘"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Button23 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button24 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "EngineLevel"
            Object.ToolTipText     =   "设置级别"
            Object.Tag             =   ""
            Style           =   1
         EndProperty
         BeginProperty Button25 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "EngineRed"
            Object.ToolTipText     =   "引擎执红"
            Object.Tag             =   ""
            Style           =   1
         EndProperty
         BeginProperty Button26 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "EngineBlack"
            Object.ToolTipText     =   "引擎执黑"
            Object.Tag             =   ""
            Style           =   1
         EndProperty
         BeginProperty Button27 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "EnginePonder"
            Object.ToolTipText     =   "後台思考"
            Object.Tag             =   ""
            Style           =   1
         EndProperty
         BeginProperty Button28 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "EngineAnalyze"
            Object.ToolTipText     =   "引擎分析"
            Object.Tag             =   ""
            Style           =   1
         EndProperty
         BeginProperty Button29 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "EngineStop"
            Object.ToolTipText     =   "停止思考"
            Object.Tag             =   ""
         EndProperty
      EndProperty
      BorderStyle     =   1
   End
   Begin VB.Frame frmWeb 
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   6000
      TabIndex        =   50
      Top             =   6120
      Width           =   3735
      Begin SHDocVwCtl.WebBrowser web 
         Height          =   1215
         Left            =   -120
         TabIndex        =   51
         Top             =   -120
         Width           =   4335
         ExtentX         =   7646
         ExtentY         =   2143
         ViewMode        =   0
         Offline         =   0
         Silent          =   0
         RegisterAsBrowser=   0
         RegisterAsDropTarget=   1
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
         Location        =   "http:///"
      End
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   17
      Left            =   5040
      Style           =   1  'Graphical
      TabIndex        =   49
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   16
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   48
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   15
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   47
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   14
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   46
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   13
      Left            =   2640
      Style           =   1  'Graphical
      TabIndex        =   45
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   12
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   44
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   11
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   43
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   10
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   42
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   9
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   8
      Left            =   5040
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   7
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   6
      Left            =   3840
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   5
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   37
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   4
      Left            =   2640
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   3
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   2
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   34
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   1
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   33
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Index           =   0
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   32
      Top             =   480
      Width           =   615
   End
   Begin VB.Frame frmMove2 
      BorderStyle     =   0  'None
      Height          =   2535
      Left            =   6000
      TabIndex        =   15
      Top             =   2040
      Width           =   3735
      Begin VB.Frame frmMove 
         Caption         =   "着法列表"
         Height          =   2535
         Left            =   2160
         TabIndex        =   26
         Top             =   0
         Width           =   1575
         Begin VB.ListBox lstMoveText 
            Height          =   1500
            ItemData        =   "XQWMAINS.frx":0ABA
            Left            =   120
            List            =   "XQWMAINS.frx":0ABC
            TabIndex        =   29
            Top             =   600
            Width           =   1335
         End
         Begin VB.TextBox txtMove 
            Height          =   285
            Left            =   960
            TabIndex        =   28
            Top             =   240
            Width           =   495
         End
         Begin VB.ComboBox cmbFormat 
            Height          =   300
            ItemData        =   "XQWMAINS.frx":0ABE
            Left            =   600
            List            =   "XQWMAINS.frx":0AC0
            Style           =   2  'Dropdown List
            TabIndex        =   31
            Top             =   2160
            Width           =   855
         End
         Begin VB.Label lblInput 
            Caption         =   "输入"
            Height          =   255
            Left            =   120
            TabIndex        =   27
            Top             =   240
            Width           =   375
         End
         Begin VB.Label lblFormat 
            Caption         =   "格式"
            Height          =   255
            Left            =   120
            TabIndex        =   30
            Top             =   2160
            Width           =   375
         End
      End
      Begin VB.Label lblTimeElapsedDown1 
         Caption         =   "用时"
         Height          =   255
         Left            =   720
         TabIndex        =   24
         Top             =   2160
         Width           =   375
      End
      Begin VB.Label lblTimeRuleDown 
         Alignment       =   2  'Center
         Caption         =   "时限规则"
         Height          =   255
         Left            =   720
         TabIndex        =   23
         Top             =   1920
         Width           =   1215
      End
      Begin VB.Label lblTimeElapsedUp1 
         Caption         =   "用时"
         Height          =   255
         Left            =   720
         TabIndex        =   19
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblTimeElapsedUp 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1200
         TabIndex        =   20
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblTimeRuleUp 
         Alignment       =   2  'Center
         Caption         =   "时限规则"
         Height          =   255
         Left            =   720
         TabIndex        =   18
         Top             =   360
         Width           =   1215
      End
      Begin VB.Image imgDown 
         Height          =   615
         Left            =   0
         Stretch         =   -1  'True
         Top             =   1680
         Width           =   615
      End
      Begin VB.Image imgUp 
         Height          =   615
         Left            =   0
         Stretch         =   -1  'True
         Top             =   120
         Width           =   615
      End
      Begin VB.Label lblTimeLeftUp1 
         Caption         =   "时限"
         Height          =   255
         Left            =   720
         TabIndex        =   16
         Top             =   120
         Width           =   375
      End
      Begin VB.Label lblTimeLeftUp 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1200
         TabIndex        =   17
         Top             =   120
         Width           =   735
      End
      Begin VB.Label lblTimeLeftDown 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1200
         TabIndex        =   22
         Top             =   1680
         Width           =   735
      End
      Begin VB.Label lblTimeLeftDown1 
         Caption         =   "时限"
         Height          =   255
         Left            =   720
         TabIndex        =   21
         Top             =   1680
         Width           =   375
      End
      Begin VB.Label lblTimeElapsedDown 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1200
         TabIndex        =   25
         Top             =   2160
         Width           =   735
      End
   End
   Begin VB.Frame frmInfo 
      BorderStyle     =   0  'None
      Height          =   5175
      Left            =   6000
      TabIndex        =   2
      Top             =   840
      Width           =   3735
      Begin VB.TextBox txtComment 
         Height          =   1215
         Left            =   0
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         Top             =   3960
         Width           =   3735
      End
      Begin VB.Label lblOpen 
         Alignment       =   2  'Center
         Height          =   375
         Left            =   0
         TabIndex        =   6
         Top             =   840
         Width           =   3735
      End
      Begin VB.Label lblDateSite 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   0
         TabIndex        =   5
         Top             =   600
         Width           =   3735
      End
      Begin VB.Label lblResult 
         Alignment       =   2  'Center
         Height          =   375
         Left            =   0
         TabIndex        =   4
         Top             =   240
         Width           =   3735
      End
      Begin VB.Label lblComment 
         Caption         =   "注释"
         Height          =   255
         Left            =   0
         TabIndex        =   7
         Top             =   3720
         Width           =   375
      End
      Begin VB.Label lblEvent 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   0
         TabIndex        =   3
         Top             =   0
         Width           =   3735
      End
   End
   Begin VB.Frame frmThink 
      BorderStyle     =   0  'None
      Height          =   5175
      Left            =   6000
      TabIndex        =   10
      Top             =   840
      Visible         =   0   'False
      Width           =   3735
      Begin VB.TextBox txtThink 
         Height          =   2295
         Left            =   0
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   14
         Top             =   240
         Width           =   3735
      End
      Begin VB.Label lblPv 
         Alignment       =   2  'Center
         Caption         =   "思考路线"
         Height          =   255
         Left            =   960
         TabIndex        =   13
         Top             =   0
         Width           =   735
      End
      Begin VB.Label lblScore 
         Alignment       =   2  'Center
         Caption         =   "评价"
         Height          =   255
         Left            =   480
         TabIndex        =   12
         Top             =   0
         Width           =   495
      End
      Begin VB.Label lblDepth 
         Alignment       =   2  'Center
         Caption         =   "深度"
         Height          =   255
         Left            =   0
         TabIndex        =   11
         Top             =   0
         Width           =   495
      End
   End
   Begin ComctlLib.TabStrip strpRight 
      Height          =   6735
      Left            =   5880
      TabIndex        =   1
      Top             =   480
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   11880
      _Version        =   327682
      BeginProperty Tabs {0713E432-850A-101B-AFC0-4210102A8DA7} 
         NumTabs         =   2
         BeginProperty Tab1 {0713F341-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "棋局信息"
            Object.Tag             =   ""
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {0713F341-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "引擎分析"
            Object.Tag             =   ""
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin ComctlLib.StatusBar stb 
      Align           =   2  'Align Bottom
      Height          =   240
      Left            =   0
      TabIndex        =   9
      Top             =   7320
      Width           =   9960
      _ExtentX        =   17568
      _ExtentY        =   423
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   4
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Curr"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel2 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   "Nps"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel3 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Width           =   7620
            MinWidth        =   7620
            Key             =   "Pv"
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel4 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Width           =   5080
            MinWidth        =   5080
            Key             =   "Msg"
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   0
      Left            =   240
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   1
      Left            =   840
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   2
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   3
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   4
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   5
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   6
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   7
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   8
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   9
      Left            =   240
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   10
      Left            =   840
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   11
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   12
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   13
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   14
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   15
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   16
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   17
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   18
      Left            =   240
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   19
      Left            =   840
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   20
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   21
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   22
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   23
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   24
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   25
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   26
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   2040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   27
      Left            =   240
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   28
      Left            =   840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   29
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   30
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   31
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   32
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   33
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   34
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   35
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   2640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   36
      Left            =   240
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   37
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   38
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   39
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   40
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   41
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   42
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   43
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   44
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   45
      Left            =   240
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   46
      Left            =   840
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   47
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   48
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   49
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   50
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   51
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   52
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   53
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   3840
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   54
      Left            =   240
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   55
      Left            =   840
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   56
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   57
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   58
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   59
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   60
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   61
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   62
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   63
      Left            =   240
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   64
      Left            =   840
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   65
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   66
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   67
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   68
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   69
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   70
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   71
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   72
      Left            =   240
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   73
      Left            =   840
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   74
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   75
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   76
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   77
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   78
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   79
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   80
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   5640
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   81
      Left            =   240
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   82
      Left            =   840
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   83
      Left            =   1440
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   84
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   85
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   86
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   87
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   88
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgSquares 
      Height          =   615
      Index           =   89
      Left            =   5040
      Stretch         =   -1  'True
      Top             =   6240
      Width           =   615
   End
   Begin VB.Image imgBoard 
      Height          =   6255
      Left            =   120
      Stretch         =   -1  'True
      Top             =   720
      Width           =   5655
   End
   Begin VB.Menu mnFile 
      Caption         =   "文件(&F)"
      Begin VB.Menu mnFileNew 
         Caption         =   "新建(&N)"
      End
      Begin VB.Menu mnFileOpen 
         Caption         =   "打开(&O)..."
      End
      Begin VB.Menu mnFileSave 
         Caption         =   "保存(&S)"
      End
      Begin VB.Menu mnFileSaveAs 
         Caption         =   "另存为(&A)..."
      End
      Begin VB.Menu mnFileSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnFilePgn 
         Caption         =   "查看&PGN文件"
      End
      Begin VB.Menu mnFileTags 
         Caption         =   "编辑标签(&T)..."
      End
      Begin VB.Menu mnFileSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnFileExit 
         Caption         =   "退出(&X)"
      End
   End
   Begin VB.Menu mnMove 
      Caption         =   "着法(&M)"
      Begin VB.Menu mnMoveDel 
         Caption         =   "删除(&D)"
      End
      Begin VB.Menu mnMoveSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnMoveStart 
         Caption         =   "起始局面(&S)"
      End
      Begin VB.Menu mnMoveBack 
         Caption         =   "上一着(&B)"
      End
      Begin VB.Menu mnMoveForward 
         Caption         =   "下一着(&F)"
      End
      Begin VB.Menu mnMoveEnd 
         Caption         =   "最後局面(&E)"
      End
      Begin VB.Menu mnMoveSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnMoveImport 
         Caption         =   "从文本文件导入(&I)..."
      End
      Begin VB.Menu mnMovePaste 
         Caption         =   "从剪贴板导入(&C)"
      End
   End
   Begin VB.Menu mnMenuPos 
      Caption         =   "局面(&P)"
      Begin VB.Menu mnPosFlip 
         Caption         =   "翻转棋盘(&F)"
      End
      Begin VB.Menu mnPosMirror 
         Caption         =   "左右对称(&M)"
      End
      Begin VB.Menu mnPosSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnPosAnalyze 
         Caption         =   "分析局面(&A)"
      End
      Begin VB.Menu mnPosEdit 
         Caption         =   "编辑局面(&E)..."
      End
      Begin VB.Menu mnPosSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnPosCopy 
         Caption         =   "复制FEN串(&C)"
      End
      Begin VB.Menu mnPosPaste 
         Caption         =   "粘贴FEN串(&P)"
      End
      Begin VB.Menu mnPosLoad 
         Caption         =   "从FEN文件导入(&L)..."
      End
      Begin VB.Menu mnPosStore 
         Caption         =   "导出到FEN文件(&S)..."
      End
   End
   Begin VB.Menu mnWizard 
      Caption         =   "魔法(&W)"
      Begin VB.Menu mnWizardPlay 
         Caption         =   "播放棋局(&P)"
      End
      Begin VB.Menu mnWizardSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardHandicap 
         Caption         =   "让子(&H)"
         Begin VB.Menu mnWizardHandicapA 
            Caption         =   "被让单马(&A)"
         End
         Begin VB.Menu mnWizardHandicapB 
            Caption         =   "被让双马(&B)"
         End
         Begin VB.Menu mnWizardHandicapC 
            Caption         =   "被让九子(&C)"
         End
         Begin VB.Menu mnWizardHandicapSep1 
            Caption         =   "-"
         End
         Begin VB.Menu mnWizardHandicapD 
            Caption         =   "让单马(&D)"
         End
         Begin VB.Menu mnWizardHandicapE 
            Caption         =   "让双马(&E)"
         End
         Begin VB.Menu mnWizardHandicapF 
            Caption         =   "让九子(&F)"
         End
      End
      Begin VB.Menu mnWizardFunny 
         Caption         =   "趣味象棋(&F)"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnWizardSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardJava 
         Caption         =   "复制&Java棋盘代码"
      End
      Begin VB.Menu mnWizardWeb 
         Caption         =   "生成&Web棋盘"
      End
      Begin VB.Menu mnWizardAnsi 
         Caption         =   "复制&ANSI动态棋盘"
      End
      Begin VB.Menu mnWizardSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardText 
         Caption         =   "复制文本棋盘(&T)"
      End
      Begin VB.Menu mnWizardBitmap 
         Caption         =   "生成图片棋盘(&V)"
      End
      Begin VB.Menu mnWizardPrint 
         Caption         =   "生成印刷棋盘(&R)"
      End
   End
   Begin VB.Menu mnEngine 
      Caption         =   "引擎(&E)"
      Begin VB.Menu mnEngineLevel 
         Caption         =   "级别设置(&L)..."
      End
      Begin VB.Menu mnEngineSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineLoad 
         Caption         =   "加载引擎(&E)..."
      End
      Begin VB.Menu mnEngineSet 
         Caption         =   "设置参数(&S)..."
      End
      Begin VB.Menu mnEngineUnLoad 
         Caption         =   "卸载引擎(&U)"
      End
      Begin VB.Menu mnEngineSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineRed 
         Caption         =   "引擎执红(&R)"
      End
      Begin VB.Menu mnEngineBlack 
         Caption         =   "引擎执黑(&B)"
      End
      Begin VB.Menu mnEnginePonder 
         Caption         =   "後台思考(&P)"
      End
      Begin VB.Menu mnEngineAnalyze 
         Caption         =   "引擎分析(&A)"
      End
      Begin VB.Menu mnEngineSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineRetract 
         Caption         =   "悔棋(&T)"
      End
      Begin VB.Menu mnEngineBan 
         Caption         =   "设为禁着(&N)"
      End
      Begin VB.Menu mnEngineDraw 
         Caption         =   "提和/接受提和(&D)"
      End
      Begin VB.Menu mnEngineSep4 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineStop 
         Caption         =   "停止思考(&O)"
      End
   End
   Begin VB.Menu mnOptions 
      Caption         =   "选项(&O)"
      Begin VB.Menu mnOptionsSettings 
         Caption         =   "设置(&O)..."
      End
      Begin VB.Menu mnOptionsSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnOptionsBoard 
         Caption         =   "棋盘(&B)"
         Begin VB.Menu mnOptionsBoardGreen 
            Caption         =   "绿色大理石(&G)"
         End
         Begin VB.Menu mnOptionsBoardRed 
            Caption         =   "红色大理石(&R)"
         End
         Begin VB.Menu mnOptionsBoardWhite 
            Caption         =   "白色大理石(&W)"
         End
         Begin VB.Menu mnOptionsBoardWood 
            Caption         =   "栎木(&O)"
         End
         Begin VB.Menu mnOptionsBoardSheet 
            Caption         =   "再生纸(&H)"
         End
         Begin VB.Menu mnOptionsBoardCanvas 
            Caption         =   "画布(&C)"
         End
         Begin VB.Menu mnOptionsBoardDrops 
            Caption         =   "水滴(&D)"
         End
         Begin VB.Menu mnOptionsBoardClouds 
            Caption         =   "蓝天白云(&L)"
         End
         Begin VB.Menu mnOptionsBoardStone 
            Caption         =   "石刻(&T)"
         End
         Begin VB.Menu mnOptionsBoardXQStudio 
            Caption         =   "象棋演播室(&X)"
         End
         Begin VB.Menu mnOptionsBoardMoveSky 
            Caption         =   "弈天棋缘(&M)"
         End
         Begin VB.Menu mnOptionsBoardMRSJ 
            Caption         =   "梦入神机(&J)"
         End
         Begin VB.Menu mnOptionsBoardZMBL 
            Caption         =   "纵马奔流(&Z)"
         End
         Begin VB.Menu mnOptionsBoardNeuChess 
            Caption         =   "棋天大圣(&N)"
         End
         Begin VB.Menu mnOptionsBoardQianHong 
            Caption         =   "浅红象棋(&Q)"
         End
         Begin VB.Menu mnOptionsBoardSimple 
            Caption         =   "简单(&S)"
         End
      End
      Begin VB.Menu mnOptionsPieces 
         Caption         =   "棋子(&P)"
         Begin VB.Menu mnOptionsPiecesNormal 
            Caption         =   "普通(&N)"
         End
         Begin VB.Menu mnOptionsPiecesWood 
            Caption         =   "木刻(&W)"
         End
         Begin VB.Menu mnOptionsPiecesPolish 
            Caption         =   "光泽(&P)"
         End
         Begin VB.Menu mnOptionsPiecesStone 
            Caption         =   "石刻(&T)"
         End
         Begin VB.Menu mnOptionsPiecesXQStudio 
            Caption         =   "象棋演播室(&X)"
         End
         Begin VB.Menu mnOptionsPiecesMoveSky 
            Caption         =   "弈天棋缘(&M)"
         End
         Begin VB.Menu mnOptionsPiecesMRSJ 
            Caption         =   "梦入神机(&J)"
         End
         Begin VB.Menu mnOptionsPiecesZMBL 
            Caption         =   "纵马奔流(&Z)"
         End
         Begin VB.Menu mnOptionsPiecesSimple 
            Caption         =   "简单(&S)"
         End
      End
      Begin VB.Menu mnOptionsMusic 
         Caption         =   "音乐(&M)"
         Begin VB.Menu mnOptionsMusicClassic 
            Caption         =   "古典(&C)"
         End
         Begin VB.Menu mnOptionsMusicExpress 
            Caption         =   "紧张(&E)"
         End
         Begin VB.Menu mnOptionsMusicFunny 
            Caption         =   "风趣(&F)"
         End
         Begin VB.Menu mnOptionsMusicWaltz 
            Caption         =   "圆舞曲(&W)"
         End
         Begin VB.Menu mnOptionsMusicMozart1 
            Caption         =   "莫扎特一(&M)"
         End
         Begin VB.Menu mnOptionsMusicMozart4 
            Caption         =   "莫扎特四(&Z)"
         End
         Begin VB.Menu mnOptionsMusicFlight 
            Caption         =   "野蜂飞舞(&L)"
         End
         Begin VB.Menu mnOptionsMusicAnitra 
            Caption         =   "皮尔·金特(&A)"
         End
         Begin VB.Menu mnOptionsMusicHumour 
            Caption         =   "幽默曲(&H)"
         End
         Begin VB.Menu mnOptionsMusicJingle 
            Caption         =   "铃儿响叮当(&J)"
         End
         Begin VB.Menu mnOptionsMusicPal 
            Caption         =   "仙剑奇侠传(&P)"
         End
         Begin VB.Menu mnOptionsMusicTcf 
            Caption         =   "天策府(&T)"
         End
         Begin VB.Menu mnOptionsMusicNone 
            Caption         =   "无声(&N)"
         End
      End
   End
   Begin VB.Menu mnHelp 
      Caption         =   "帮助(&H)"
      Begin VB.Menu mnHelpContents 
         Caption         =   "帮助主题(&C)"
      End
      Begin VB.Menu mnHelpSupport 
         Caption         =   "技术支持(&T)"
      End
      Begin VB.Menu mnHelpHowTo 
         Caption         =   "日积月累(&W)..."
      End
      Begin VB.Menu mnHelpSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpHome 
         Caption         =   "象棋巫师的网站(&H)"
      End
      Begin VB.Menu mnHelpLeague 
         Caption         =   "获取UCCI引擎(&G)"
      End
      Begin VB.Menu mnHelpMantis 
         Caption         =   "缺陷报告(&B)"
      End
      Begin VB.Menu mnHelpUpdate 
         Caption         =   "检查最新版本(&P)"
      End
      Begin VB.Menu mnHelpSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpEcco 
         Caption         =   "关于&ECCO..."
      End
      Begin VB.Menu mnHelpRule 
         Caption         =   "关于规则(&L)..."
      End
      Begin VB.Menu mnHelpEngine 
         Caption         =   "关于&UCCI引擎..."
      End
      Begin VB.Menu mnHelpAbout 
         Caption         =   "关于象棋巫师(&A)..."
      End
   End
End
Attribute VB_Name = "frmMainSmall"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' XQWMAIN.FRM - Source Code for XiangQi Wizard, Part II
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 3.3, Last Modified: Jul. 2007
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

Private Sub Form_Load()

Dim i As Integer
lstMoveText.Clear
lstMoveText.AddItem "===开始===", 0
cmbFormat.AddItem "炮二平五", 0
cmbFormat.AddItem "C2.5", 1
cmbFormat.AddItem "H2-E2", 2
tlb.ImageList = frmHide.imglst
For i = 1 To 29
    tlb.Buttons(i).Image = i
Next

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

If App_bUpdated Then
    If Not SaveFile Then
        nCancel = 1
        Exit Sub
    End If
End If
If Engine_bAnalyze Then
    StopAnalyze
End If
If Engine_nStatus > IDLE_UNLOAD Then
    CloseEngine
End If
App_bRunning = False
App_szFileName = App_szPath + "AUTOSAVE.PGN"
WriteFile

End Sub

Private Sub mnFileNew_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
App_szFileName = ""
RestartGame
BoardFlush
LabelFlush
MoveFlush
EngineNewGame

End Sub

Private Sub mnFileOpen_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
OpenFile

End Sub

Private Sub mnFileSave_Click()

If App_szFileName = "" Then
    mnFileSaveAs_Click
Else
    WriteFile
End If

End Sub

Private Sub mnFileSaveAs_Click()

SaveFileAs

End Sub

Private Sub mnFilePgn_Click()

WriteFile WRITE_TEMP_FILE
ShellExecuteA 0, vbNullString, App_szPath + "查看PGN文件(只读).TXT", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnFileTags_Click()

frmEditTags.Show vbModal, Me

End Sub

Private Sub mnFileExit_Click()

Unload Me

End Sub

Private Sub mnMoveDel_Click()

If Game_nCurrMove < Game_nMaxMove Then
    If MsgBox("必须清除以後所有的着法。" + vbCrLf + "是否继续？", vbYesNo + vbQuestion) <> vbYes Then
        Exit Sub
    End If
End If
If Engine_nStatus > IDLE_UNLOAD Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
End If
MoveBack
MoveCut
MoveFlush
FileUpdated
AnalyzeEcco

End Sub

Private Sub mnMoveStart_Click()

Do While Game_nCurrMove > 0
    MoveBack
Loop
MoveFlush

End Sub
    
Private Sub mnMoveBack_Click()

MoveBack
MoveFlush

End Sub

Private Sub mnMoveForward_Click()

MoveForward
MoveFlush

End Sub

Private Sub mnMoveEnd_Click()

Do While Game_nCurrMove < Game_nMaxMove
    MoveForward
Loop
MoveFlush

End Sub

Private Sub mnMoveImport_Click()

Dim nFileNo As Integer, szFileName As String
Dim szLineStr As String, szRemStr As String, nRemLevel As Integer
szFileName = FileDialog("从文本文件导入", "文本文件", "TXT")
If szFileName <> "" Then
    nFileNo = FreeFile
    On Error GoTo lnErrorOpen
    Open szFileName For Input As #nFileNo
    On Error GoTo 0
    Do While Game_nCurrMove < Game_nMaxMove
        MoveForward
    Loop
    szLineStr = ""
    szRemStr = ""
    nRemLevel = 0
    Do While Not (EOF(nFileNo) And szRemStr = "")
        If szLineStr = "" Then
            Line Input #nFileNo, szLineStr
        End If
        ImportLine szLineStr, szRemStr, nRemLevel
    Loop
    Close #nFileNo
    MoveFlush
    FileUpdated
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "无法打开文件 " + szFileName, vbExclamation

End Sub

Private Sub mnMovePaste_Click()

Dim i As Integer, szClipStr As String
Dim szLineStr As String, szRemStr As String, nRemLevel As Integer
Do While Game_nCurrMove < Game_nMaxMove
    MoveForward
Loop
szClipStr = Clipboard.GetText
szLineStr = ""
szRemStr = ""
nRemLevel = 0
Do While Not (szClipStr = "" And szLineStr = "")
    If szLineStr = "" Then
        i = InStr(szClipStr, vbCrLf)
        If i = 0 Then
            szLineStr = szClipStr
            szClipStr = ""
        Else
            szLineStr = Left(szClipStr, i - 1)
            szClipStr = Mid(szClipStr, i + 2)
        End If
    End If
    ImportLine szLineStr, szRemStr, nRemLevel
Loop
MoveFlush
FileUpdated

End Sub

Private Sub mnPosFlip_Click()

App_bFlipped = Not App_bFlipped
CoordFlush
mnPosFlip.Checked = App_bFlipped
tlb.Buttons("PosFlip").Value = IIf(App_bFlipped, tbrPressed, tbrUnpressed)
BoardFlush
LabelFlush

End Sub

Private Sub mnPosMirror_Click()

Dim i As Integer, cnt As Integer, sd As Integer
cnt = Game_cntStart
sd = Game_sdStart
For i = 1 To Game_nMaxMove
    Game_mvMove(i) = MoveMirror(Game_mvMove(i))
    Game_szMoveText(2, i) = Move2Iccs(Game_mvMove(i))
    Game_szMoveText(1, i) = MkL(CchessFileMirror(CvL(Game_szMoveText(1, i))))
    Game_szMoveText(0, i) = MkC(CchessFile2Chin(CvL(Game_szMoveText(1, i)), sd))
    lstMoveText.List(i) = NumberText(cnt, sd) + Game_szMoveText(Game_nFormat, i)
    sd = 1 - sd
    cnt = cnt + 1 - sd
Next
For i = 0 To Game_nMaxIrrev
    Game_szIrrevFen(i) = MkBStr(CchessFenMirror(Game_szIrrevFen(i)))
    CchessBoardMirror Game_posIrrev(i)
Next
BoardFlush
FileUpdated

End Sub

Private Sub mnPosAnalyze_Click()

Shell App_szPath + App.EXEName + " /S " + Chr(34) + _
        MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr) + Chr(34), vbNormalFocus

End Sub

Private Sub mnPosEdit_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
frmPosEdit.Show vbModal, Me

End Sub

Private Sub mnPosCopy_Click()

Clipboard.Clear
Clipboard.SetText MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr)
MsgBox "FEN串已复制到剪贴板。", vbInformation

End Sub

Private Sub mnPosPaste_Click()

Dim szFenStr As String
If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
LoadFenStr Clipboard.GetText

End Sub

Private Sub mnPosLoad_Click()

Dim szFileName As String
If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
szFileName = FileDialog("从FEN文件导入", "象棋局面文件", "FEN")
If szFileName <> "" Then
    LoadFenFile szFileName
End If

End Sub

Private Sub mnPosStore_Click()

Dim szFileName As String, nFileNo As Integer
szFileName = FileDialog("导出到FEN文件", "象棋局面文件", "FEN", SHOW_SAVE)
If szFileName <> "" Then
    nFileNo = FreeFile
    On Error GoTo lnErrorOpen
    Open szFileName For Output As #nFileNo
    On Error GoTo 0
    Print #nFileNo, MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr)
    Close #nFileNo
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0
MsgBox "无法打开文件 " + szFileName, vbExclamation

End Sub

Private Sub mnWizardPlay_Click()

If Game_nCurrMove < Game_nMaxMove Then
    App_bPlay = Not App_bPlay
    mnWizardPlay.Checked = App_bPlay
    tlb.Buttons("WizardPlay").Value = IIf(App_bPlay, tbrPressed, tbrUnpressed)
Else
    App_bPlay = False
    mnWizardPlay.Checked = False
    tlb.Buttons("WizardPlay").Value = tbrUnpressed
End If

End Sub

Private Sub mnWizardFunny_Click()

' TODO

End Sub

Private Sub mnWizardJava_Click()

CopyJava

End Sub

Private Sub mnWizardWeb_Click()

ViewWeb

End Sub

Private Sub mnWizardAnsi_Click()

CopyAnsi

End Sub

Private Sub mnWizardText_Click()

Dim sz As String, szFenStr As String
szFenStr = MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr) + vbCrLf + "欢迎访问www.elephantbase.net" + vbCrLf
Clipboard.Clear
If Options_bAnsiText Then
    sz = MkBStr(CchessBoardText(Game_posIrrev(Game_nCurrIrrev), CCHESS_ANSI_TEXT))
    If Options_bEscapeDouble Then
        sz = Replace(sz, Chr(27) + "[", Chr(27) + Chr(27) + "[")
    End If
    Clipboard.SetText sz + szFenStr
Else
    Clipboard.SetText MkBStr(CchessBoardText(Game_posIrrev(Game_nCurrIrrev))) + szFenStr
End If
MsgBox "文本棋盘已复制到剪贴板。", vbInformation

End Sub

Private Sub mnWizardBitmap_Click()

ViewBitmap Options_bMonoBitmap

End Sub

Private Sub mnWizardPrint_Click()

ViewPrintBitmap

End Sub

Private Sub mnEngineLevel_Click()

If mnEngineLevel.Checked Then
    Timer_bEnabled = False
    mnEngineLevel.Checked = False
    tlb.Buttons("EngineLevel").Value = tbrUnpressed
Else
    frmLevelSet.Show vbModal, Me
End If

End Sub

Private Sub mnEngineLoad_Click()

Dim szFileName As String
szFileName = FileDialog("加载引擎", "引擎文件", "EXE")
If szFileName <> "" Then
    Engine_szFile = szFileName
    OpenEngine LOAD_WITH_INFO
End If

End Sub

Private Sub mnEngineSet_Click()

frmEngineSet.Show vbModal, Me

End Sub

Private Sub mnEngineUnLoad_Click()

EngineLoaded False
Engine_szFile = ""
CloseEngine

End Sub

Private Sub mnEngineRed_Click()

If Not (Engine_bBlack And Game_sdMax = 1) Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
End If
Engine_bRed = Not Engine_bRed
mnEngineRed.Checked = Engine_bRed
tlb.Buttons("EngineRed").Value = IIf(Engine_bRed, tbrPressed, tbrUnpressed)
EnginePlayer

End Sub

Private Sub mnEngineBlack_Click()

If Not (Engine_bRed And Game_sdMax = 0) Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
End If
Engine_bBlack = Not Engine_bBlack
mnEngineBlack.Checked = Engine_bBlack
tlb.Buttons("EngineBlack").Value = IIf(Engine_bBlack, tbrPressed, tbrUnpressed)
EnginePlayer

End Sub

Private Sub mnEnginePonder_Click()

If Engine_bPonder And Engine_nStatus <> BUSY_THINK Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
End If
Engine_bPonder = Not Engine_bPonder
mnEnginePonder.Checked = Engine_bPonder
tlb.Buttons("EnginePonder").Value = IIf(Engine_bPonder, tbrPressed, tbrUnpressed)

End Sub

Private Sub mnEngineAnalyze_Click()

If Engine_bAnalyze Then
    StopAnalyze
Else
    StartAnalyze
    mnEngineAnalyze.Checked = True
    tlb.Buttons("EngineAnalyze").Value = tbrPressed
End If
    
End Sub

Private Sub mnEngineRetract_Click()

If Engine_nStatus > IDLE_UNLOAD Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
End If
MoveBack
If Game_nCurrMove > 0 Then
    MoveBack
End If
MoveCut
MoveFlush
FileUpdated
AnalyzeEcco

End Sub

Private Sub mnEngineBan_Click()

Dim mv As Long
mv = Game_mvMove(Game_nCurrMove)
MoveBack
MoveCut
MoveFlush
FileUpdated
AnalyzeEcco
Engine_mvBan = mv

End Sub

Private Sub mnEngineDraw_Click()

If Engine_bDraw Then
    MsgBox IIf(Game_sdMax = 0, "红方接受提和。", "黑方接受提和。"), vbInformation
    Game_nResult = RESULT_DRAW
    lblResult = ResultString
    Engine_nStatus = IDLE_REST
Else
    If mnEngineDraw.Checked Then
        MsgBox "放弃提和。", vbInformation
        mnEngineDraw.Checked = False
    Else
        MsgBox "请走一着棋，然後等待引擎接受或拒绝提和。" + vbCrLf + "如果引擎拒绝提和，则不会理睬，而是继续走棋。", vbInformation
        mnEngineDraw.Checked = True
    End If
End If

End Sub

Private Sub mnEngineStop_Click()

StopEngine

End Sub

Private Sub mnOptionsSettings_Click()

frmOptions.Show vbModal, Me

End Sub

Private Sub mnOptionsBoardGreen_Click()

BoardSettingSmall BOARD_S_GREEN

End Sub

Private Sub mnOptionsBoardRed_Click()

BoardSettingSmall BOARD_S_RED

End Sub

Private Sub mnOptionsBoardWhite_Click()

BoardSettingSmall BOARD_S_WHITE

End Sub

Private Sub mnOptionsBoardWood_Click()

BoardSettingSmall BOARD_S_WOOD

End Sub

Private Sub mnOptionsBoardSheet_Click()

BoardSettingSmall BOARD_S_SHEET

End Sub

Private Sub mnOptionsBoardCanvas_Click()

BoardSettingSmall BOARD_S_CANVAS

End Sub

Private Sub mnOptionsBoardDrops_Click()

BoardSettingSmall BOARD_S_DROPS

End Sub

Private Sub mnOptionsBoardClouds_Click()

BoardSettingSmall BOARD_S_CLOUDS

End Sub

Private Sub mnOptionsBoardStone_Click()

BoardSettingSmall BOARD_S_STONE

End Sub

Private Sub mnOptionsBoardXQStudio_Click()

BoardSettingSmall BOARD_S_XQSTUDIO

End Sub

Private Sub mnOptionsBoardMoveSky_Click()

BoardSettingSmall BOARD_S_MOVESKY

End Sub

Private Sub mnOptionsBoardMRSJ_Click()

BoardSettingSmall BOARD_S_MRSJ

End Sub

Private Sub mnOptionsBoardZMBL_Click()

BoardSettingSmall BOARD_S_ZMBL

End Sub

Private Sub mnOptionsBoardNeuChess_Click()

BoardSettingSmall BOARD_S_NEUCHESS

End Sub

Private Sub mnOptionsBoardQianHong_Click()

BoardSettingSmall BOARD_S_QIANHONG

End Sub

Private Sub mnOptionsBoardSimple_Click()

BoardSettingSmall BOARD_S_SIMPLE

End Sub

Private Sub mnOptionsPiecesNormal_Click()

PiecesSettingSmall PIECES_S_NORMAL

End Sub

Private Sub mnOptionsPiecesWood_Click()

PiecesSettingSmall PIECES_S_WOOD

End Sub

Private Sub mnOptionsPiecesPolish_Click()

PiecesSettingSmall PIECES_S_POLISH

End Sub

Private Sub mnOptionsPiecesStone_Click()

PiecesSettingSmall PIECES_S_STONE

End Sub

Private Sub mnOptionsPiecesXQStudio_Click()

PiecesSettingSmall PIECES_S_XQSTUDIO

End Sub

Private Sub mnOptionsPiecesMoveSky_Click()

PiecesSettingSmall PIECES_S_MOVESKY

End Sub

Private Sub mnOptionsPiecesMRSJ_Click()

PiecesSettingSmall PIECES_S_MRSJ

End Sub

Private Sub mnOptionsPiecesZMBL_Click()

PiecesSettingSmall PIECES_S_ZMBL

End Sub

Private Sub mnOptionsPiecesSimple_Click()

PiecesSettingSmall PIECES_S_SIMPLE

End Sub

Private Sub mnOptionsMusicClassic_Click()

MusicSetting MUSIC_CLASSIC

End Sub

Private Sub mnOptionsMusicExpress_Click()

MusicSetting MUSIC_EXPRESS

End Sub

Private Sub mnOptionsMusicFunny_Click()

MusicSetting MUSIC_FUNNY

End Sub

Private Sub mnOptionsMusicWaltz_Click()

MusicSetting MUSIC_WALTZ

End Sub

Private Sub mnOptionsMusicMozart1_Click()

MusicSetting MUSIC_MOZART1

End Sub

Private Sub mnOptionsMusicMozart4_Click()

MusicSetting MUSIC_MOZART4

End Sub

Private Sub mnOptionsMusicFlight_Click()

MusicSetting MUSIC_FLIGHT

End Sub

Private Sub mnOptionsMusicAnitra_Click()

MusicSetting MUSIC_ANITRA

End Sub

Private Sub mnOptionsMusicHumour_Click()

MusicSetting MUSIC_HUMOUR

End Sub

Private Sub mnOptionsMusicJingle_Click()

MusicSetting MUSIC_JINGLE

End Sub

Private Sub mnOptionsMusicPal_Click()

MusicSetting MUSIC_PAL

End Sub

Private Sub mnOptionsMusicTcf_Click()

MusicSetting MUSIC_CMUSIC

End Sub

Private Sub mnOptionsMusicNone_Click()

MusicSetting MUSIC_NONE

End Sub

Private Sub mnHelpContents_Click()

ShellExecuteA 0, vbNullString, App_szPath + "HELP\CONTENTS.HTM", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnHelpSupport_Click()

ShellExecuteA 0, vbNullString, App_szPath + "HELP\SUPPORT.HTM", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnHelpHowTo_Click()

frmHowTo.Show vbModal, Me

End Sub

Private Sub mnHelpHome_Click()

ShellExecuteA 0, vbNullString, "http://www.elephantbase.net/", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnHelpLeague_Click()

ShellExecuteA 0, vbNullString, "http://www.elephantbase.net/league.htm", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnHelpMantis_Click()

ShellExecuteA 0, vbNullString, "http://mantis.elephantbase.net/", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnHelpUpdate_Click()

CheckUpdate MANUAL_UPDATE

End Sub

Private Sub mnHelpEcco_Click()

MsgBoxWithIcon "ECCO(中国象棋开局百科)编号识别系统" + vbCrLf + "版本号：" + MkBStr(EccoVersion()), "关于ECCO", App_szPath + "ECCO.DLL"

End Sub

Private Sub mnHelpRule_Click()

MsgBoxWithIcon "中国象棋规则判定系统" + vbCrLf + "版本号：" + MkBStr(CchessVersion()), "关于规则", App_szPath + "CCHESS.DLL"

End Sub

Private Sub mnHelpEngine_Click()

AboutEngine

End Sub

Private Sub mnHelpAbout_Click()

MsgBoxWithIcon "象棋巫师 " + STRING_VERSION + vbCrLf + "象棋百科全书 荣誉出品" + vbCrLf + vbCrLf + STRING_COPYRIGHT + vbCrLf + "本产品符合GNU通用公共许可协议", "关于象棋巫师"

End Sub

Private Sub tlb_ButtonClick(ByVal button As ComctlLib.button)

Select Case button.Key
Case "FileNew"
    mnFileNew_Click
Case "FileOpen"
    mnFileOpen_Click
Case "FileSave"
    mnFileSave_Click
Case "FileViewPgn"
    mnFilePgn_Click
Case "FileEditTags"
    mnFileTags_Click
' Separator
Case "MoveDel"
    mnMoveDel_Click
Case "MoveStart"
    mnMoveStart_Click
Case "MoveBack"
    mnMoveBack_Click
Case "MoveForward"
    mnMoveForward_Click
Case "MoveEnd"
    mnMoveEnd_Click
Case "MovePaste"
    mnMovePaste_Click
' Separator
Case "PosFlip"
    mnPosFlip_Click
Case "PosAnalyze"
    mnPosAnalyze_Click
Case "PosEdit"
    mnPosEdit_Click
' Separator
Case "WizardPlay"
    mnWizardPlay_Click
Case "WizardFunny"
    mnWizardFunny_Click
Case "WizardJava"
    mnWizardJava_Click
Case "WizardText"
    mnWizardText_Click
Case "WizardBitmap"
    mnWizardBitmap_Click
' Separator
Case "EngineLevel"
    mnEngineLevel_Click
Case "EngineRed"
    mnEngineRed_Click
Case "EngineBlack"
    mnEngineBlack_Click
Case "EnginePonder"
    mnEnginePonder_Click
Case "EngineAnalyze"
    mnEngineAnalyze_Click
Case "EngineStop"
    mnEngineStop_Click
End Select

End Sub

Private Sub imgSquares_Click(nIndex As Integer)

Dim sq As Integer, pc As Integer, mv As Long
sq = IIf(App_bFlipped, (12 - nIndex \ 9) * 16 + 11 - nIndex Mod 9, (nIndex \ 9 + 3) * 16 + nIndex Mod 9 + 3)
pc = Game_posIrrev(Game_nCurrIrrev).ucpcSquares(sq)
If (pc And (16 + Game_sdCurr * 16)) <> 0 Then
    If App_sqSelected > 0 Then
        DrawSquare App_sqSelected
    End If
    App_sqSelected = sq
    DrawSquare App_sqSelected, DRAW_SELECTED
    If Game_nCurrMove > 0 Then
        DrawSquare Src(Game_mvMove(Game_nCurrMove))
        DrawSquare Dst(Game_mvMove(Game_nCurrMove))
    End If
    If Options_bSounds Then
        PlayWavSound "CLICK"
    End If
Else
    If App_sqSelected > 0 Then
        mv = mdlCChess.Move(App_sqSelected, sq)
        If AddMove(mv, MOVE_WITH_ECHO) Then
            FileUpdated
        End If
    End If
End If

End Sub

Private Sub txtMove_Change()

Dim mv As Long
If Len(txtMove.Text) = 4 Then
    MkLng mv, CchessFile2Move(CvL(txtMove.Text), Game_posIrrev(Game_nCurrIrrev))
    If AddMove(mv, MOVE_WITH_ECHO) Then
        FileUpdated
    End If
    txtMove.Text = ""
End If

End Sub

Private Sub lstMoveText_Click()

Dim i As Integer
i = lstMoveText.ListIndex
If i <> Game_nCurrMove Then
    Do While i < Game_nCurrMove
        MoveBack
    Loop
    Do While i > Game_nCurrMove
        MoveForward
    Loop
    MoveFlush
End If

End Sub

Private Sub cmbFormat_Click()

Dim i As Integer, cnt As Integer, sd As Integer
cnt = Game_cntStart
sd = Game_sdStart
If Game_nFormat <> cmbFormat.ListIndex Then
    Game_nFormat = cmbFormat.ListIndex
    For i = 1 To Game_nMaxMove
        lstMoveText.List(i) = NumberText(cnt, sd) + Game_szMoveText(Game_nFormat, i)
        sd = 1 - sd
        cnt = cnt + 1 - sd
    Next
    FileUpdated
End If

End Sub

Private Sub txtComment_Change()

If Game_szComment(Game_nCurrMove) <> txtComment.Text Then
    Game_szComment(Game_nCurrMove) = txtComment.Text
    FileUpdated
End If

End Sub

Private Sub strpRight_Click()

If Engine_bAnalyze Then
    If strpRight.Tabs.Item(1).Selected Then
        StopAnalyze
    End If
Else
    If strpRight.Tabs.Item(2).Selected Then
        If Engine_nStatus > IDLE_UNLOAD Then
            StartAnalyze
        Else
            strpRight.Tabs.Item(1).Selected = True
        End If
    End If
End If

End Sub

