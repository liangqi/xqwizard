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
      Name            =   "細明體"
      Size            =   9
      Charset         =   136
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
         NumButtons      =   30
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileNew"
            Object.ToolTipText     =   "新建"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileOpen"
            Object.ToolTipText     =   "打開"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileSave"
            Object.ToolTipText     =   "保存"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileViewPgn"
            Object.ToolTipText     =   "查看PGN文件"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "FileEditTags"
            Object.ToolTipText     =   "編輯標簽"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MovePromote"
            Object.ToolTipText     =   "升變"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveDel"
            Object.ToolTipText     =   "刪除"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveStart"
            Object.ToolTipText     =   "起始局面"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveBack"
            Object.ToolTipText     =   "上一著"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveForward"
            Object.ToolTipText     =   "下一著"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MoveEnd"
            Object.ToolTipText     =   "最後局面"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "MovePaste"
            Object.ToolTipText     =   "從剪貼板導入"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PosFlip"
            Object.ToolTipText     =   "翻轉棋盤"
            Style           =   1
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PosAnalyze"
            Object.ToolTipText     =   "分析局面"
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "PosEdit"
            Object.ToolTipText     =   "編輯局面"
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
            Key             =   "WizardFunny"
            Object.ToolTipText     =   "趣味象棋"
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardJava"
            Object.ToolTipText     =   "复制Java棋盤代碼"
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardText"
            Object.ToolTipText     =   "复制文本棋盤"
         EndProperty
         BeginProperty Button23 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardBitmap"
            Object.ToolTipText     =   "查看圖片棋盤"
         EndProperty
         BeginProperty Button24 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button25 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineLevel"
            Object.ToolTipText     =   "設置級別"
            Style           =   1
         EndProperty
         BeginProperty Button26 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineRed"
            Object.ToolTipText     =   "引擎執紅"
            Style           =   1
         EndProperty
         BeginProperty Button27 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineBlack"
            Object.ToolTipText     =   "引擎執黑"
            Style           =   1
         EndProperty
         BeginProperty Button28 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EnginePonder"
            Object.ToolTipText     =   "後台思考"
            Style           =   1
         EndProperty
         BeginProperty Button29 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineAnalyze"
            Object.ToolTipText     =   "引擎分析"
            Style           =   1
         EndProperty
         BeginProperty Button30 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineStop"
            Object.ToolTipText     =   "停止思考"
         EndProperty
      EndProperty
   End
   Begin VB.Frame frmWeb 
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   8280
      TabIndex        =   50
      Top             =   8520
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
      Height          =   225
      Index           =   17
      Left            =   6960
      Style           =   1  'Graphical
      TabIndex        =   49
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   16
      Left            =   6120
      Style           =   1  'Graphical
      TabIndex        =   48
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   15
      Left            =   5280
      Style           =   1  'Graphical
      TabIndex        =   47
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   14
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   46
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   13
      Left            =   3600
      Style           =   1  'Graphical
      TabIndex        =   45
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   12
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   44
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   11
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   43
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   10
      Left            =   1080
      Style           =   1  'Graphical
      TabIndex        =   42
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   9
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   41
      Top             =   9480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   8
      Left            =   6960
      Style           =   1  'Graphical
      TabIndex        =   40
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   7
      Left            =   6120
      Style           =   1  'Graphical
      TabIndex        =   39
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   6
      Left            =   5280
      Style           =   1  'Graphical
      TabIndex        =   38
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   5
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   37
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   4
      Left            =   3600
      Style           =   1  'Graphical
      TabIndex        =   36
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   3
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   35
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   2
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   34
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   1
      Left            =   1080
      Style           =   1  'Graphical
      TabIndex        =   33
      Top             =   480
      Width           =   855
   End
   Begin VB.CommandButton btnCoord 
      Enabled         =   0   'False
      Height          =   225
      Index           =   0
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   32
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
         Caption         =   "帝猭"
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
            Caption         =   "块"
            Height          =   255
            Left            =   120
            TabIndex        =   27
            Top             =   240
            Width           =   375
         End
         Begin VB.Label lblFormat 
            Caption         =   "Α"
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
         Caption         =   "ノ"
         Height          =   255
         Left            =   960
         TabIndex        =   19
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblTimeElapsedDown1 
         Caption         =   "ノ"
         Height          =   255
         Left            =   960
         TabIndex        =   24
         Top             =   3240
         Width           =   375
      End
      Begin VB.Label lblTimeRuleDown 
         Alignment       =   2  'Center
         Caption         =   "砏玥"
         Height          =   255
         Left            =   960
         TabIndex        =   23
         Top             =   3000
         Width           =   1215
      End
      Begin VB.Label lblTimeRuleUp 
         Alignment       =   2  'Center
         Caption         =   "砏玥"
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
         Caption         =   ""
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
         Caption         =   ""
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
         Caption         =   "猔睦"
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
         Caption         =   "瞏"
         Height          =   255
         Left            =   0
         TabIndex        =   11
         Top             =   0
         Width           =   495
      End
      Begin VB.Label lblScore 
         Alignment       =   2  'Center
         Caption         =   "蝶刹"
         Height          =   255
         Left            =   480
         TabIndex        =   12
         Top             =   0
         Width           =   495
      End
      Begin VB.Label lblPv 
         Alignment       =   2  'Center
         Caption         =   "σ隔絬"
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
            Caption         =   "引擎分析"
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
            Key             =   "Curr"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Key             =   "Nps"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   10160
            MinWidth        =   10160
            Key             =   "Pv"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   7620
            MinWidth        =   7620
            Key             =   "Msg"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tlbHide 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   52
      Top             =   360
      Width           =   12360
      _ExtentX        =   21802
      _ExtentY        =   635
      ButtonWidth     =   609
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
      Caption         =   "ゅン(&F)"
      Begin VB.Menu mnFileNew 
         Caption         =   "穝(&N)"
      End
      Begin VB.Menu mnFileOpen 
         Caption         =   "ゴ秨(&O)..."
      End
      Begin VB.Menu mnFileSave 
         Caption         =   "玂(&S)"
      End
      Begin VB.Menu mnFileSaveAs 
         Caption         =   "(&A)..."
      End
      Begin VB.Menu mnFileSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnFilePgn 
         Caption         =   "琩&PGNゅン"
      End
      Begin VB.Menu mnFileTags 
         Caption         =   "絪胯夹帽(&T)..."
      End
      Begin VB.Menu mnFileSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnFileExit 
         Caption         =   "癶(&X)"
      End
   End
   Begin VB.Menu mnMove 
      Caption         =   "帝猭(&M)"
      Begin VB.Menu mnMovePromote 
         Caption         =   "ど跑(&P)"
      End
      Begin VB.Menu mnMoveSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnMoveDel 
         Caption         =   "埃(&D)"
      End
      Begin VB.Menu mnMoveSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnMoveStart 
         Caption         =   "癬﹍Ы(&S)"
      End
      Begin VB.Menu mnMoveBack 
         Caption         =   "帝(&B)"
      End
      Begin VB.Menu mnMoveForward 
         Caption         =   "帝(&F)"
      End
      Begin VB.Menu mnMoveEnd 
         Caption         =   "程Ы(&E)"
      End
      Begin VB.Menu mnMoveSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnMoveImport 
         Caption         =   "眖ゅセゅン旧(&I)..."
      End
      Begin VB.Menu mnMovePaste 
         Caption         =   "眖芭禟狾旧(&C)"
      End
   End
   Begin VB.Menu mnMenuPos 
      Caption         =   "Ы(&P)"
      Begin VB.Menu mnPosFlip 
         Caption         =   "陆锣囱絃(&F)"
      End
      Begin VB.Menu mnPosMirror 
         Caption         =   "オ癸嘿(&M)"
      End
      Begin VB.Menu mnPosSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnPosAnalyze 
         Caption         =   "だ猂Ы(&A)"
      End
      Begin VB.Menu mnPosEdit 
         Caption         =   "絪胯Ы(&E)..."
      End
      Begin VB.Menu mnPosSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnPosCopy 
         Caption         =   "蝋FEN﹃(&C)"
      End
      Begin VB.Menu mnPosPaste 
         Caption         =   "诌禟FEN﹃(&P)"
      End
      Begin VB.Menu mnPosLoad 
         Caption         =   "眖FENゅン旧(&L)..."
      End
      Begin VB.Menu mnPosStore 
         Caption         =   "旧FENゅン(&S)..."
      End
   End
   Begin VB.Menu mnWizard 
      Caption         =   "臸猭(&W)"
      Begin VB.Menu mnWizardPlay 
         Caption         =   "冀囱Ы(&P)"
      End
      Begin VB.Menu mnWizardSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardHandicap 
         Caption         =   "琵(&H)"
         Begin VB.Menu mnWizardHandicapA 
            Caption         =   "砆琵虫皑(&A)"
         End
         Begin VB.Menu mnWizardHandicapB 
            Caption         =   "砆琵蛮皑(&B)"
         End
         Begin VB.Menu mnWizardHandicapC 
            Caption         =   "砆琵(&C)"
         End
         Begin VB.Menu mnWizardHandicapSep1 
            Caption         =   "-"
         End
         Begin VB.Menu mnWizardHandicapD 
            Caption         =   "琵虫皑(&D)"
         End
         Begin VB.Menu mnWizardHandicapE 
            Caption         =   "琵蛮皑(&E)"
         End
         Begin VB.Menu mnWizardHandicapF 
            Caption         =   "琵(&F)"
         End
      End
      Begin VB.Menu mnWizardFunny 
         Caption         =   "届禜囱(&F)"
      End
      Begin VB.Menu mnWizardSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardJava 
         Caption         =   "蝋&Java囱絃絏"
      End
      Begin VB.Menu mnWizardWeb 
         Caption         =   "ネΘ&Web囱絃"
      End
      Begin VB.Menu mnWizardAnsi 
         Caption         =   "蝋&ANSI笆篈囱絃"
      End
      Begin VB.Menu mnWizardSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardText 
         Caption         =   "蝋ゅセ囱絃(&T)"
      End
      Begin VB.Menu mnWizardBitmap 
         Caption         =   "ネΘ瓜囱絃(&V)"
      End
      Begin VB.Menu mnWizardPrint 
         Caption         =   "ネΘ囱絃(&R)"
      End
   End
   Begin VB.Menu mnEngine 
      Caption         =   "ま篮(&E)"
      Begin VB.Menu mnEngineLevel 
         Caption         =   "砞竚(&L)..."
      End
      Begin VB.Menu mnEngineSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineLoad 
         Caption         =   "更ま篮(&E)..."
      End
      Begin VB.Menu mnEngineSet 
         Caption         =   "砞竚把计(&S)..."
      End
      Begin VB.Menu mnEngineUnLoad 
         Caption         =   "更ま篮(&U)"
      End
      Begin VB.Menu mnEngineSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineRed 
         Caption         =   "ま篮磅(&R)"
      End
      Begin VB.Menu mnEngineBlack 
         Caption         =   "ま篮磅堵(&B)"
      End
      Begin VB.Menu mnEnginePonder 
         Caption         =   "σ(&P)"
      End
      Begin VB.Menu mnEngineAnalyze 
         Caption         =   "ま篮だ猂(&A)"
      End
      Begin VB.Menu mnEngineSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineRetract 
         Caption         =   "囱(&T)"
      End
      Begin VB.Menu mnEngineBan 
         Caption         =   "砞窽帝(&N)"
      End
      Begin VB.Menu mnEngineDraw 
         Caption         =   "矗㎝/钡矗㎝(&D)"
      End
      Begin VB.Menu mnEngineSep4 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineStop 
         Caption         =   "氨ゎσ(&O)"
      End
   End
   Begin VB.Menu mnOptions 
      Caption         =   "匡兜(&O)"
      Begin VB.Menu mnOptionsSettings 
         Caption         =   "砞竚(&O)..."
      End
      Begin VB.Menu mnOptionsSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnOptionsBoard 
         Caption         =   "囱絃(&B)"
         Begin VB.Menu mnOptionsBoardWhite 
            Caption         =   "フ︹瞶ホ(&W)"
         End
         Begin VB.Menu mnOptionsBoardWood 
            Caption         =   "騌れ(&O)"
         End
         Begin VB.Menu mnOptionsBoardSheet 
            Caption         =   "ネ(&H)"
         End
         Begin VB.Menu mnOptionsBoardCanvas 
            Caption         =   "礶ガ(&C)"
         End
         Begin VB.Menu mnOptionsBoardDrops 
            Caption         =   "簑(&D)"
         End
         Begin VB.Menu mnOptionsBoardQianHong 
            Caption         =   "睱禜囱(&Q)"
         End
         Begin VB.Menu mnOptionsBoardSimple 
            Caption         =   "虏虫(&S)"
         End
      End
      Begin VB.Menu mnOptionsPieces 
         Caption         =   "囱(&P)"
         Begin VB.Menu mnOptionsPiecesWood 
            Caption         =   "れㄨ(&W)"
         End
         Begin VB.Menu mnOptionsPiecesPolish 
            Caption         =   "緼(&P)"
         End
         Begin VB.Menu mnOptionsPiecesCoin 
            Caption         =   "刽(&C)"
         End
         Begin VB.Menu mnOptionsPiecesSimple 
            Caption         =   "虏虫(&S)"
         End
      End
      Begin VB.Menu mnOptionsMusic 
         Caption         =   "贾(&M)"
         Begin VB.Menu mnOptionsMusicClassic 
            Caption         =   "ㄥ(&C)"
         End
         Begin VB.Menu mnOptionsMusicExpress 
            Caption         =   "候眎(&E)"
         End
         Begin VB.Menu mnOptionsMusicFunny 
            Caption         =   "届(&F)"
         End
         Begin VB.Menu mnOptionsMusicWaltz 
            Caption         =   "蛾籖Ρ(&W)"
         End
         Begin VB.Menu mnOptionsMusicMozart1 
            Caption         =   "馋ゃ疭(&M)"
         End
         Begin VB.Menu mnOptionsMusicMozart4 
            Caption         =   "馋ゃ疭(&Z)"
         End
         Begin VB.Menu mnOptionsMusicFlight 
            Caption         =   "偿噶籖(&L)"
         End
         Begin VB.Menu mnOptionsMusicAnitra 
            Caption         =   "ブ焊疭(&A)"
         End
         Begin VB.Menu mnOptionsMusicHumour 
            Caption         =   "纐Ρ(&H)"
         End
         Begin VB.Menu mnOptionsMusicJingle 
            Caption         =   "筧臫讽(&J)"
         End
         Begin VB.Menu mnOptionsMusicPal 
            Caption         =   "糃獿肚(&P)"
         End
         Begin VB.Menu mnOptionsMusicTcf 
            Caption         =   "ぱ郸┎(&T)"
         End
         Begin VB.Menu mnOptionsMusicNone 
            Caption         =   "礚羘(&N)"
         End
      End
      Begin VB.Menu mnOptionsTopMost 
         Caption         =   "羆程玡(&T)"
      End
   End
   Begin VB.Menu mnHelp 
      Caption         =   "腊(&H)"
      Begin VB.Menu mnHelpContents 
         Caption         =   "腊肈(&C)"
      End
      Begin VB.Menu mnHelpSupport 
         Caption         =   "м砃や(&T)"
      End
      Begin VB.Menu mnHelpHowTo 
         Caption         =   "ら縩る仓(&W)..."
      End
      Begin VB.Menu mnHelpSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpHome 
         Caption         =   "禜囱畍蔍(&H)"
      End
      Begin VB.Menu mnHelpLeague 
         Caption         =   "莉UCCIま篮(&G)"
      End
      Begin VB.Menu mnHelpMantis 
         Caption         =   "炒厨(&B)"
      End
      Begin VB.Menu mnHelpUpdate 
         Caption         =   "浪琩程穝セ(&P)"
      End
      Begin VB.Menu mnHelpSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpEcco 
         Caption         =   "闽&ECCO..."
      End
      Begin VB.Menu mnHelpRule 
         Caption         =   "闽砏玥(&R)..."
      End
      Begin VB.Menu mnHelpEngine 
         Caption         =   "闽&UCCIま篮..."
      End
      Begin VB.Menu mnHelpAbout 
         Caption         =   "闽禜囱畍(&A)..."
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
' Designed by Morning Yellow, Version: 3.34, Last Modified: Sep. 2007
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
lstMoveText.AddItem "===開始===", 0
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
ShellExecuteA 0, vbNullString, App_szPath + "查看PGN文件(只讀).TXT", vbNullString, vbNullString, SW_SHOWNORMAL

End Sub

Private Sub mnFileTags_Click()

frmEditTags.Show vbModal, Me

End Sub

Private Sub mnFileExit_Click()

Unload Me

End Sub

Private Sub mnMovePromote_Click()

' TODO

End Sub

Private Sub mnMoveDel_Click()

If Game_nCurrMove < Game_nMaxMove Then
    If MsgBox("必須清除以後所有的著法。" + vbCrLf + "是否繼續？", vbYesNo + vbQuestion) <> vbYes Then
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
szFileName = FileDialog("從文本文件導入", "文本文件", "TXT")
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
MsgBox "無法打開文件 " + szFileName, vbExclamation

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
MsgBox "FEN串已复制到剪貼板。", vbInformation

End Sub

Private Sub mnPosPaste_Click()

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
szFileName = FileDialog("從FEN文件導入", "象棋局面文件", "FEN")
If szFileName <> "" Then
    LoadFenFile szFileName
End If

End Sub

Private Sub mnPosStore_Click()

Dim szFileName As String, nFileNo As Integer
szFileName = FileDialog("導出到FEN文件", "象棋局面文件", "FEN", SHOW_SAVE)
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
MsgBox "無法打開文件 " + szFileName, vbExclamation

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

Private Sub mnWizardHandicapA_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
LoadFenStr HANDICAP_A
EngineNewGame ENGINE_PLAY_RED

End Sub

Private Sub mnWizardHandicapB_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
LoadFenStr HANDICAP_B
EngineNewGame ENGINE_PLAY_RED

End Sub

Private Sub mnWizardHandicapC_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
LoadFenStr HANDICAP_C
EngineNewGame ENGINE_PLAY_RED

End Sub

Private Sub mnWizardHandicapD_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
LoadFenStr HANDICAP_A
EngineNewGame ENGINE_PLAY_BLACK

End Sub

Private Sub mnWizardHandicapE_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
LoadFenStr HANDICAP_B
EngineNewGame ENGINE_PLAY_BLACK

End Sub

Private Sub mnWizardHandicapF_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
LoadFenStr HANDICAP_C
EngineNewGame ENGINE_PLAY_BLACK

End Sub

Private Sub mnWizardFunny_Click()

If App_bUpdated Then
    If Not SaveFile Then
        Exit Sub
    End If
End If
frmFunny.Show vbModal

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
szFenStr = MkBStr(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) + " - - 0" + Str(Game_cntCurr) + vbCrLf + "歡迎訪問www.elephantbase.net" + vbCrLf
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
MsgBox "文本棋盤已复制到剪貼板。", vbInformation

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
szFileName = FileDialog("加載引擎", "引擎文件", "EXE")
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
    MsgBox IIf(Game_sdMax = 0, "紅方接受提和。", "黑方接受提和。"), vbInformation
    Game_nResult = RESULT_DRAW
    lblResult = ResultString
    Engine_nStatus = IDLE_REST
Else
    If mnEngineDraw.Checked Then
        MsgBox "放棄提和。", vbInformation
        mnEngineDraw.Checked = False
    Else
        MsgBox "請走一著棋，然後等待引擎接受或拒絕提和。" + vbCrLf + "如果引擎拒絕提和，則不會理睬，而是繼續走棋。", vbInformation
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

Private Sub mnOptionsBoardWhite_Click()

BoardSettingLarge BOARD_L_WHITE

End Sub

Private Sub mnOptionsBoardWood_Click()

BoardSettingLarge BOARD_L_WOOD

End Sub

Private Sub mnOptionsBoardSheet_Click()

BoardSettingLarge BOARD_L_SHEET

End Sub

Private Sub mnOptionsBoardCanvas_Click()

BoardSettingLarge BOARD_L_CANVAS

End Sub

Private Sub mnOptionsBoardDrops_Click()

BoardSettingLarge BOARD_L_DROPS

End Sub

Private Sub mnOptionsBoardQianHong_Click()

BoardSettingLarge BOARD_L_QIANHONG

End Sub

Private Sub mnOptionsBoardSimple_Click()

BoardSettingLarge BOARD_L_SIMPLE

End Sub

Private Sub mnOptionsPiecesWood_Click()

PiecesSettingLarge PIECES_L_WOOD

End Sub

Private Sub mnOptionsPiecesCoin_Click()

PiecesSettingLarge PIECES_L_COIN

End Sub

Private Sub mnOptionsPiecesPolish_Click()

PiecesSettingLarge PIECES_L_POLISH

End Sub

Private Sub mnOptionsPiecesSimple_Click()

PiecesSettingLarge PIECES_L_SIMPLE

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

Private Sub mnOptionsTopMost_Click()

Options_bTopMost = Not Options_bTopMost
mnOptionsTopMost.Checked = Options_bTopMost
SetWindowPos hwnd, IIf(Options_bTopMost, HWND_TOPMOST, HWND_NOTOPMOST), 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE

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

MsgBoxWithIcon "ECCO(中國象棋開局百科)編號識別系統" + vbCrLf + "版本號：" + MkBStr(EccoVersion()), "關于ECCO", App_szPath + "ECCO.DLL"

End Sub

Private Sub mnHelpRule_Click()

MsgBoxWithIcon "中國象棋規則判定系統" + vbCrLf + "版本號：" + MkBStr(CchessVersion()), "關于規則", App_szPath + "CCHESS.DLL"

End Sub

Private Sub mnHelpEngine_Click()

AboutEngine

End Sub

Private Sub mnHelpAbout_Click()

MsgBoxWithIcon "象棋巫師 " + STRING_VERSION + vbCrLf + "象棋百科全書 榮譽出品" + vbCrLf + vbCrLf + STRING_COPYRIGHT + vbCrLf + "本產品符合GNU通用公共許可協議", "關于象棋巫師"

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
