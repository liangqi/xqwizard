VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMainLarge 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   ClientHeight    =   9960
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   12360
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "XQWMAINL.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   9960
   ScaleWidth      =   12360
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser web 
      Height          =   975
      Left            =   8280
      TabIndex        =   51
      Top             =   8520
      Width           =   3735
      ExtentX         =   6588
      ExtentY         =   1720
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
      Location        =   "http:///"
   End
   Begin MSComctlLib.Toolbar tlb 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12360
      _ExtentX        =   21802
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      Style           =   1
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   31
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileNew"
            Object.ToolTipText     =   "新建"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileOpen"
            Object.ToolTipText     =   "打开"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileSave"
            Object.ToolTipText     =   "保存"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileViewPgn"
            Object.ToolTipText     =   "查看文本棋谱"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileEditTags"
            Object.ToolTipText     =   "编辑标签"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MovePromote"
            Object.ToolTipText     =   "升变"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveStart"
            Object.ToolTipText     =   "起始局面"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveBack"
            Object.ToolTipText     =   "上一着"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveForward"
            Object.ToolTipText     =   "下一着"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveEnd"
            Object.ToolTipText     =   "最后局面"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveDel"
            Object.ToolTipText     =   "删除"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MovePaste"
            Object.ToolTipText     =   "从剪贴板导入"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PosFlip"
            Object.ToolTipText     =   "翻转棋盘"
            Style           =   1
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PosAnalyze"
            Object.ToolTipText     =   "分析局面"
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PosEdit"
            Object.ToolTipText     =   "编辑局面"
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardPlay"
            Object.ToolTipText     =   "播放棋局"
            Style           =   1
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardFlash"
            Object.ToolTipText     =   "复制Flash棋盘代码"
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardText"
            Object.ToolTipText     =   "复制文本棋盘"
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardBitmap"
            Object.ToolTipText     =   "查看图片棋盘"
         EndProperty
         BeginProperty Button23 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button24 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EndgamesStart"
            Object.ToolTipText     =   "立即开始"
         EndProperty
         BeginProperty Button25 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button26 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineLevel"
            Object.ToolTipText     =   "设置级别"
            Style           =   1
         EndProperty
         BeginProperty Button27 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineRed"
            Object.ToolTipText     =   "电脑执红"
            Style           =   1
         EndProperty
         BeginProperty Button28 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineBlack"
            Object.ToolTipText     =   "电脑执黑"
            Style           =   1
         EndProperty
         BeginProperty Button29 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EnginePonder"
            Object.ToolTipText     =   "后台思考"
            Style           =   1
         EndProperty
         BeginProperty Button30 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineAnalyze"
            Object.ToolTipText     =   "电脑分析"
            Style           =   1
         EndProperty
         BeginProperty Button31 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineStop"
            Object.ToolTipText     =   "停止思考/立即走棋"
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   17
      Left            =   6960
      TabIndex        =   49
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   16
      Left            =   6120
      TabIndex        =   48
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   15
      Left            =   5280
      TabIndex        =   47
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   14
      Left            =   4440
      TabIndex        =   46
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   13
      Left            =   3600
      TabIndex        =   45
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   12
      Left            =   2760
      TabIndex        =   44
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   11
      Left            =   1920
      TabIndex        =   43
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   10
      Left            =   1080
      TabIndex        =   42
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   9
      Left            =   240
      TabIndex        =   41
      TabStop         =   0   'False
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   8
      Left            =   6960
      TabIndex        =   40
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   7
      Left            =   6120
      TabIndex        =   39
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   6
      Left            =   5280
      TabIndex        =   38
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   5
      Left            =   4440
      TabIndex        =   37
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   4
      Left            =   3600
      TabIndex        =   36
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   3
      Left            =   2760
      TabIndex        =   35
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   2
      Left            =   1920
      TabIndex        =   34
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   1
      Left            =   1080
      TabIndex        =   33
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   0
      Left            =   240
      TabIndex        =   32
      TabStop         =   0   'False
      Top             =   480
      Width           =   855
   End
   Begin VB.Frame frmMove2 
      BorderStyle     =   0  'None
      Height          =   3615
      Left            =   8160
      TabIndex        =   15
      Top             =   2040
      Width           =   3975
      Begin VB.Frame frmMove 
         Caption         =   "着法列表"
         Height          =   3615
         Left            =   2400
         TabIndex        =   26
         Top             =   0
         Width           =   1575
         Begin VB.ListBox lstMoveText 
            Height          =   2580
            ItemData        =   "XQWMAINL.frx":0ABA
            Left            =   120
            List            =   "XQWMAINL.frx":0ABC
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
            ItemData        =   "XQWMAINL.frx":0ABE
            Left            =   600
            List            =   "XQWMAINL.frx":0AC0
            Style           =   2  'Dropdown List
            TabIndex        =   31
            Top             =   3240
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
            Top             =   3240
            Width           =   375
         End
      End
      Begin VB.Label lblTimeElapsedDown 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1440
         TabIndex        =   25
         Top             =   3240
         Width           =   735
      End
      Begin VB.Label lblTimeElapsedUp 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1440
         TabIndex        =   20
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblTimeElapsedUp1 
         Caption         =   "用时"
         Height          =   255
         Left            =   960
         TabIndex        =   19
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblTimeElapsedDown1 
         Caption         =   "用时"
         Height          =   255
         Left            =   960
         TabIndex        =   24
         Top             =   3240
         Width           =   375
      End
      Begin VB.Label lblTimeRuleDown 
         Alignment       =   2  'Center
         Caption         =   "时限规则"
         Height          =   255
         Left            =   960
         TabIndex        =   23
         Top             =   3000
         Width           =   1215
      End
      Begin VB.Label lblTimeRuleUp 
         Alignment       =   2  'Center
         Caption         =   "时限规则"
         Height          =   255
         Left            =   960
         TabIndex        =   18
         Top             =   360
         Width           =   1215
      End
      Begin VB.Image imgDown 
         Height          =   855
         Left            =   0
         Stretch         =   -1  'True
         Top             =   2520
         Width           =   855
      End
      Begin VB.Image imgUp 
         Height          =   855
         Left            =   0
         Stretch         =   -1  'True
         Top             =   120
         Width           =   855
      End
      Begin VB.Label lblTimeLeftUp1 
         Caption         =   "时限"
         Height          =   255
         Left            =   960
         TabIndex        =   16
         Top             =   120
         Width           =   375
      End
      Begin VB.Label lblTimeLeftUp 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1440
         TabIndex        =   17
         Top             =   120
         Width           =   735
      End
      Begin VB.Label lblTimeLeftDown 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1440
         TabIndex        =   22
         Top             =   2760
         Width           =   735
      End
      Begin VB.Label lblTimeLeftDown1 
         Caption         =   "时限"
         Height          =   255
         Left            =   960
         TabIndex        =   21
         Top             =   2760
         Width           =   375
      End
   End
   Begin VB.Frame frmInfo 
      BorderStyle     =   0  'None
      Height          =   7575
      Left            =   8160
      TabIndex        =   2
      Top             =   840
      Width           =   3975
      Begin VB.TextBox txtComment 
         Height          =   2415
         Left            =   0
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         Top             =   5160
         Width           =   3975
      End
      Begin VB.Label lblComment 
         Caption         =   "注释"
         Height          =   255
         Left            =   0
         TabIndex        =   7
         Top             =   4920
         Width           =   375
      End
      Begin VB.Label lblOpen 
         Alignment       =   2  'Center
         Height          =   375
         Left            =   0
         TabIndex        =   6
         Top             =   840
         Width           =   3975
      End
      Begin VB.Label lblDateSite 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   0
         TabIndex        =   5
         Top             =   600
         Width           =   3975
      End
      Begin VB.Label lblResult 
         Alignment       =   2  'Center
         Height          =   375
         Left            =   0
         TabIndex        =   4
         Top             =   240
         Width           =   3975
      End
      Begin VB.Label lblEvent 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   0
         TabIndex        =   3
         Top             =   0
         Width           =   3975
      End
   End
   Begin VB.Frame frmThink 
      BorderStyle     =   0  'None
      Height          =   7575
      Left            =   8160
      TabIndex        =   10
      Top             =   840
      Visible         =   0   'False
      Width           =   3975
      Begin VB.TextBox txtThink 
         Height          =   3615
         Left            =   0
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   14
         Top             =   240
         Width           =   3975
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
      Begin VB.Label lblScore 
         Alignment       =   2  'Center
         Caption         =   "评价"
         Height          =   255
         Left            =   480
         TabIndex        =   12
         Top             =   0
         Width           =   495
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
   End
   Begin MSComctlLib.TabStrip strpRight 
      Height          =   9135
      Left            =   8040
      TabIndex        =   1
      Top             =   480
      Width           =   4215
      _ExtentX        =   7435
      _ExtentY        =   16113
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "棋局信息"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "电脑分析"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar stb 
      Align           =   2  'Align Bottom
      Height          =   240
      Left            =   0
      TabIndex        =   9
      Top             =   9720
      Width           =   12360
      _ExtentX        =   21802
      _ExtentY        =   423
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3387
            MinWidth        =   3387
            Key             =   "Curr"
            Object.ToolTipText     =   "思考着法"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   1693
            MinWidth        =   1693
            Key             =   "Nps"
            Object.ToolTipText     =   "每秒钟分析的节点数"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   10160
            MinWidth        =   10160
            Key             =   "Pv"
            Object.ToolTipText     =   "思考路线"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   7620
            MinWidth        =   7620
            Key             =   "Msg"
            Object.ToolTipText     =   "提示信息"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tlbHide 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   50
      Top             =   360
      Width           =   12360
      _ExtentX        =   21802
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      Style           =   1
      _Version        =   393216
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   0
      Left            =   240
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   1
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   2
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   3
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   4
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   5
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   6
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   7
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   8
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   840
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   9
      Left            =   240
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   10
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   11
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   12
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   13
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   14
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   15
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   16
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   17
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   1680
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   18
      Left            =   240
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   19
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   20
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   21
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   22
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   23
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   24
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   25
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   26
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   2520
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   27
      Left            =   240
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   28
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   29
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   30
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   31
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   32
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   33
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   34
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   35
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   3360
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   36
      Left            =   240
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   37
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   38
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   39
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   40
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   41
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   42
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   43
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   44
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   45
      Left            =   240
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   46
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   47
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   48
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   49
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   50
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   51
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   52
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   53
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   5040
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   54
      Left            =   240
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   55
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   56
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   57
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   58
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   59
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   60
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   61
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   62
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   5880
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   63
      Left            =   240
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   64
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   65
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   66
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   67
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   68
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   69
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   70
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   71
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   6720
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   72
      Left            =   240
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   73
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   74
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   75
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   76
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   77
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   78
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   79
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   80
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   7560
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   81
      Left            =   240
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   82
      Left            =   1080
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   83
      Left            =   1920
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   84
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   85
      Left            =   3600
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   86
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   87
      Left            =   5280
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   88
      Left            =   6120
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgSquares 
      Height          =   855
      Index           =   89
      Left            =   6960
      Stretch         =   -1  'True
      Top             =   8400
      Width           =   855
   End
   Begin VB.Image imgBoard 
      Height          =   8655
      Left            =   120
      Stretch         =   -1  'True
      Top             =   720
      Width           =   7815
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
      Begin VB.Menu mnFileExportXqf 
         Caption         =   "输出为&XQF格式..."
      End
      Begin VB.Menu mnFileSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnFilePgn 
         Caption         =   "查看文本棋谱(&V)"
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
      Begin VB.Menu mnMovePromote 
         Caption         =   "升变(&P)"
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
         Caption         =   "最后局面(&E)"
      End
      Begin VB.Menu mnMoveSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnMoveDel 
         Caption         =   "删除(&D)"
      End
      Begin VB.Menu mnMoveSep3 
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
      Begin VB.Menu mnWizardHandicap_ 
         Caption         =   "让子(&H)"
         Begin VB.Menu mnWizardHandicap 
            Caption         =   "被让单马(&A)"
            Index           =   0
         End
         Begin VB.Menu mnWizardHandicap 
            Caption         =   "被让双马(&B)"
            Index           =   1
         End
         Begin VB.Menu mnWizardHandicap 
            Caption         =   "被让九子(&C)"
            Index           =   2
         End
         Begin VB.Menu mnWizardHandicap 
            Caption         =   "-"
            Index           =   3
         End
         Begin VB.Menu mnWizardHandicap 
            Caption         =   "让单马(&D)"
            Index           =   4
         End
         Begin VB.Menu mnWizardHandicap 
            Caption         =   "让双马(&E)"
            Index           =   5
         End
         Begin VB.Menu mnWizardHandicap 
            Caption         =   "让九子(&F)"
            Index           =   6
         End
      End
      Begin VB.Menu mnWizardSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardFlash 
         Caption         =   "复制F&lash棋盘代码"
      End
      Begin VB.Menu mnWizardSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardText 
         Caption         =   "复制文本棋盘(&T)"
      End
      Begin VB.Menu mnWizardBitmap 
         Caption         =   "生成图片棋盘(&B)"
      End
      Begin VB.Menu mnWizardPrint 
         Caption         =   "生成印刷棋盘(&R)"
      End
   End
   Begin VB.Menu mnEndgames_ 
      Caption         =   "挑战(&C)"
      Begin VB.Menu mnEndgamesStart 
         Caption         =   "立即开始(&S)"
      End
      Begin VB.Menu mnEndgamesSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnEndgamesFunny 
         Caption         =   "趣味象棋(&Y)"
      End
      Begin VB.Menu mnEndgamesSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "基本杀法(&A)"
         Index           =   0
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "基本战术(&B)"
         Index           =   1
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "中局杀法(&C)"
         Index           =   2
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "象棋杀着大全(&D)"
         Index           =   3
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "残局攻杀谱(&E)"
         Index           =   4
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "象棋实用残局(第一集)(&F)"
         Index           =   5
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "象棋实用残局(第二集)(&G)"
         Index           =   6
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "-"
         Index           =   7
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "橘中秘(残局篇)(&H)"
         Index           =   8
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "适情雅趣(&I)"
         Index           =   9
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "烂柯神机(&J)"
         Index           =   10
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "象局汇存(&K)"
         Index           =   11
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "江湖百局秘谱(&L)"
         Index           =   12
      End
   End
   Begin VB.Menu mnEngine 
      Caption         =   "电脑(&E)"
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
         Caption         =   "电脑执红(&R)"
      End
      Begin VB.Menu mnEngineBlack 
         Caption         =   "电脑执黑(&B)"
      End
      Begin VB.Menu mnEnginePonder 
         Caption         =   "后台思考(&P)"
      End
      Begin VB.Menu mnEngineAnalyze 
         Caption         =   "电脑分析(&A)"
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
         Caption         =   "停止思考/立即走棋(&O)"
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
      Begin VB.Menu mnOptionsBoard_ 
         Caption         =   "棋盘(&B)"
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "栎木(&A)"
            Index           =   0
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "绿色大理石(&B)"
            Index           =   1
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "白色大理石(&C)"
            Index           =   2
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "再生纸(&D)"
            Index           =   3
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "画布(&E)"
            Index           =   4
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "水滴(&F)"
            Index           =   5
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "浅红象棋(&G)"
            Index           =   6
         End
      End
      Begin VB.Menu mnOptionsPieces_ 
         Caption         =   "棋子(&P)"
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "木刻(&A)"
            Index           =   0
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "精致(&B)"
            Index           =   1
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "光泽(&C)"
            Index           =   2
         End
      End
      Begin VB.Menu mnOptionsMusic_ 
         Caption         =   "音乐(&M)"
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "紧张(&A)"
            Index           =   0
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "风趣(&B)"
            Index           =   1
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "巴赫(&C)"
            Index           =   2
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "莫扎特一(&D)"
            Index           =   3
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "莫扎特四(&E)"
            Index           =   4
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "贝多芬(&F)"
            Index           =   5
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "李斯特(&G)"
            Index           =   6
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "柴可夫斯基(&H)"
            Index           =   7
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "德沃夏克(&I)"
            Index           =   8
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "仙剑奇侠传(&J)"
            Index           =   9
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "望江南(&K)"
            Index           =   10
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "无声(&L)"
            Index           =   11
         End
      End
      Begin VB.Menu mnOptionsTopMost 
         Caption         =   "总在最前面(&T)"
      End
   End
   Begin VB.Menu mnTools 
      Caption         =   "工具(&T)"
      Begin VB.Menu mnToolBook 
         Caption         =   "开局库管理(&B)"
      End
      Begin VB.Menu mnToolConvert 
         Caption         =   "棋谱批量转换(&C)"
      End
      Begin VB.Menu mnToolSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnToolBooth 
         Caption         =   "象棋路边摊(&T)"
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
      Begin VB.Menu mnHelpQuote 
         Caption         =   "名言(&Q)..."
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
         Caption         =   "关于规则(&R)..."
      End
      Begin VB.Menu mnHelpEngine 
         Caption         =   "关于&UCCI引擎..."
      End
      Begin VB.Menu mnHelpAbout 
         Caption         =   "关于象棋巫师(&A)..."
      End
   End
End
Attribute VB_Name = "frmMainLarge"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' XQWMAIN.FRM - Source Code for XiangQi Wizard, Part II
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 3.84, Last Modified: Oct. 2008
' Copyright (C) 2004-2008 www.elephantbase.net
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

lstMoveText.Clear
lstMoveText.AddItem "===开始===", 0
cmbFormat.AddItem "炮二平五", 0
cmbFormat.AddItem "C2.5", 1
cmbFormat.AddItem "H2-E2", 2

End Sub

Private Sub Form_Unload(nCancel As Integer)

If CancelSave Then
    nCancel = 1
    Exit Sub
End If
If Engine_bAnalyze Then
    StopAnalyze
End If
If Engine_nStatus > IDLE_UNLOAD Then
    CloseEngine
End If
App_bRunning = False
If Options_bAutoSave Then
    App_szFileName = App_szPath + "AUTOSAVE.PGN"
    WriteFile
End If
If Not App_bPrevInstance Then
    Gui_nLeft = Left
    Gui_nTop = Top
End If

End Sub

Private Sub Form_Resize()

If Options_bTopMost Then
    SetWindowPos hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE
End If

End Sub

Private Sub mnFileNew_Click()

If CancelSave Then
    Exit Sub
End If
App_szFileName = ""
RestartGame
BoardFlush
LabelFlush
MoveFlush
EngineNewGame

End Sub

Private Sub mnFileOpen_Click()

If CancelSave Then
    Exit Sub
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

Private Sub mnFileExportXqf_Click()

ExportXqf

End Sub

Private Sub mnFilePgn_Click()

WriteFile WRITE_TEMP_FILE
ShellExecuteA 0, vbNullString, App_szPath + "查看文本棋谱(只读).TXT", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnFileTags_Click()

frmEditTags.Show vbModal, Me

End Sub

Private Sub mnFileExit_Click()

Unload Me

End Sub

Private Sub mnMovePromote_Click()

AddMove mdlCChess.Move(App_sqSelected, App_sqSelected), MOVE_WITH_ECHO

End Sub

Private Sub mnMoveDel_Click()

If Game_nCurrMove < Game_nMaxMove Then
    If MsgBox("必须清除以后所有的着法。" + vbCrLf + "是否继续？", vbYesNo + vbQuestion) <> vbYes Then
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

Shell App_szPath + App.EXEName + IIf(App_bPromotion, " /P /S ", " /S ") + """" + _
        MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr) + """", vbNormalFocus

End Sub

Private Sub mnPosEdit_Click()

If CancelSave Then
    Exit Sub
End If
frmPosEdit.Show vbModal, Me

End Sub

Private Sub mnPosCopy_Click()

Clipboard.Clear
Clipboard.SetText MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr)
MsgBox "FEN串已复制到剪贴板。", vbInformation

End Sub

Private Sub mnPosPaste_Click()

If CancelSave Then
    Exit Sub
End If
LoadFenStr Clipboard.GetText

End Sub

Private Sub mnPosLoad_Click()

Dim szFileName As String
If CancelSave Then
    Exit Sub
End If
szFileName = FileDialog("从FEN文件导入", "象棋局面文件", "FEN")
If szFileName <> "" Then
    LoadFenFile szFileName
End If

End Sub

Private Sub mnPosStore_Click()

Dim szFileName As String, nFileNo As Integer
szFileName = FileDialog("导出到FEN文件", "象棋局面文件", "FEN", DefaultFileName)
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

Private Sub mnWizardHandicap_Click(nIndex As Integer)

If CancelSave Then
    Exit Sub
End If
LoadFenStr Choose(nIndex Mod 4 + 1, HANDICAP_A, HANDICAP_B, HANDICAP_C)
EngineNewGame IIf(nIndex < 4, ENGINE_PLAY_RED, ENGINE_PLAY_BLACK)

End Sub

Private Sub mnWizardFlash_Click()

CopyFlash

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

Private Sub mnEndgamesStart_Click()

If CancelSave Then
    Exit Sub
End If
LoadEndgames Gui_szEpdName, Gui_szEpdTitle

End Sub

Private Sub mnEndgamesFunny_Click()

If CancelSave Then
    Exit Sub
End If
LoadEndgames "FUNNY", "趣味象棋"

End Sub

Private Sub mnEndgames_Click(nIndex As Integer)

Dim szEpdName As String, szTitle As String
If CancelSave Then
    Exit Sub
End If
szEpdName = "_" + Choose(nIndex + 1, "A", "B", "C", "D", "E", "F", "G", "", "H", "I", "J", "K", "L")
szTitle = Choose(nIndex + 1, "基本杀法", "基本战术", "中局杀法", "象棋杀着大全", "残局攻杀谱", "象棋实用残局(第一集)", "象棋实用残局(第二集)", _
        "", "橘中秘(残局篇)", "适情雅趣", "烂柯神机", "象局汇存", "江湖百局秘谱")
LoadEndgames szEpdName, szTitle

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
Engine_szName = ""
SetTitle

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
    PlayWavSound "DRAW"
    MsgBoxMute IIf(Game_sdMax = 0, "红方接受提和。", "黑方接受提和。"), vbInformation
    Game_nResult = RESULT_DRAW
    lblResult = ResultString
    Engine_nStatus = IDLE_REST
Else
    If mnEngineDraw.Checked Then
        MsgBox "放弃提和。", vbInformation
        mnEngineDraw.Checked = False
    Else
        MsgBox "请走一着棋，然后等待电脑接受或拒绝提和。" + vbCrLf + "如果电脑拒绝提和，则不会理睬，而是继续走棋。", vbInformation
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

Private Sub mnOptionsBoard_Click(nIndex As Integer)

BoardSettingLarge nIndex

End Sub

Private Sub mnOptionsPieces_Click(nIndex As Integer)

PiecesSettingLarge nIndex

End Sub

Private Sub mnOptionsMusic_Click(nIndex As Integer)

MusicSetting nIndex

End Sub

Private Sub mnOptionsTopMost_Click()

Options_bTopMost = Not Options_bTopMost
mnOptionsTopMost.Checked = Options_bTopMost
SetWindowPos hWnd, IIf(Options_bTopMost, HWND_TOPMOST, HWND_NOTOPMOST), 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE

End Sub

Private Sub mnToolBook_Click()

ShellExecuteA 0, vbNullString, App_szPath + "MAKEBOOK.EXE", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnToolConvert_Click()

ShellExecuteA 0, vbNullString, App_szPath + "MXQFCONV.EXE", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnToolBooth_Click()

WindowState = vbMinimized
ShellExecuteA 0, vbNullString, App_szPath + "XQBOOTH.EXE", vbNullString, vbNullString, SW_SHOWNORMAL

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

Private Sub mnHelpQuote_Click()

MsgBoxWithIcon Gui_szQuotes(Int(Rnd * QUOTE_NUM + 1)), "名言", , ICON_QUOTE

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

Private Sub tlb_ButtonClick(ByVal button As MSComctlLib.button)

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
Case "MovePromote"
    mnMovePromote_Click
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
Case "WizardFlash"
    mnWizardFlash_Click
Case "WizardText"
    mnWizardText_Click
Case "WizardBitmap"
    mnWizardBitmap_Click
' Separator
Case "EndgamesStart"
    mnEndgamesStart_Click
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

Private Sub imgSquares_MouseDown(nIndex As Integer, nButton As Integer, nShift As Integer, x As Single, y As Single)

Dim sq As Integer, pc As Integer, bCanPromote As Boolean, mv As Long
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
    PlayWavSound "CLICK"
    bCanPromote = (CchessCanPromote(Game_posIrrev(Game_nCurrIrrev), sq) <> 0)
    App_frmMain.mnMovePromote.Enabled = bCanPromote
    App_frmMain.tlb.Buttons("MovePromote").Enabled = bCanPromote
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
    mv = CchessFile2Move(CvL(txtMove.Text), Game_posIrrev(Game_nCurrIrrev))
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

Private Sub btnCoord_MouseDown(nIndex As Integer, nButton As Integer, nShift As Integer, x As Single, y As Single)

btnCoord(nIndex).Enabled = False
btnCoord(nIndex).Enabled = True

End Sub
