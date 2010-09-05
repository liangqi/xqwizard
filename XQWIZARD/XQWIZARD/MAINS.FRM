VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
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
   Icon            =   "MAINS.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   7560
   ScaleWidth      =   9960
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser web 
      Height          =   975
      Left            =   6000
      TabIndex        =   47
      TabStop         =   0   'False
      Top             =   6120
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
      Location        =   ""
   End
   Begin MSComctlLib.Toolbar tlb 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9960
      _ExtentX        =   17568
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
            Object.ToolTipText     =   "新的对局"
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
            Object.ToolTipText     =   "在新窗口中推演"
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
            Object.ToolTipText     =   "播放"
            Style           =   1
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SearchPosition"
            Object.ToolTipText     =   "搜索局面"
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardPublish"
            Object.ToolTipText     =   "发布棋谱"
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "WizardBitmap"
            Object.ToolTipText     =   "生成图片棋盘"
         EndProperty
         BeginProperty Button23 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button24 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EndgamesStart"
            Object.ToolTipText     =   "挑战 - 当前题库"
         EndProperty
         BeginProperty Button25 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
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
            Key             =   "EngineAnalyze"
            Object.ToolTipText     =   "电脑分析"
            Style           =   1
         EndProperty
         BeginProperty Button30 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EngineStop"
            Object.ToolTipText     =   "停止思考/立即走棋"
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   17
      Left            =   5040
      TabIndex        =   45
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   16
      Left            =   4440
      TabIndex        =   44
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   15
      Left            =   3840
      TabIndex        =   43
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   14
      Left            =   3240
      TabIndex        =   42
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   13
      Left            =   2640
      TabIndex        =   41
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   12
      Left            =   2040
      TabIndex        =   40
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   11
      Left            =   1440
      TabIndex        =   39
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   10
      Left            =   840
      TabIndex        =   38
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   9
      Left            =   240
      TabIndex        =   37
      TabStop         =   0   'False
      Top             =   7080
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   8
      Left            =   5040
      TabIndex        =   36
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   7
      Left            =   4440
      TabIndex        =   35
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   6
      Left            =   3840
      TabIndex        =   34
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   5
      Left            =   3240
      TabIndex        =   33
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   4
      Left            =   2640
      TabIndex        =   32
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   3
      Left            =   2040
      TabIndex        =   31
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   2
      Left            =   1440
      TabIndex        =   30
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   1
      Left            =   840
      TabIndex        =   29
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.CommandButton btnCoord 
      Height          =   225
      Index           =   0
      Left            =   240
      TabIndex        =   28
      TabStop         =   0   'False
      Top             =   480
      Width           =   615
   End
   Begin VB.Frame frmMove2 
      BorderStyle     =   0  'None
      Height          =   2535
      Left            =   6000
      TabIndex        =   8
      Top             =   2040
      Width           =   3735
      Begin VB.Frame frmMove 
         Caption         =   "着法列表"
         Height          =   2535
         Left            =   2040
         TabIndex        =   19
         Top             =   0
         Width           =   1695
         Begin VB.ListBox lstMoveText 
            Height          =   1500
            ItemData        =   "MAINS.frx":0ABA
            Left            =   120
            List            =   "MAINS.frx":0ABC
            TabIndex        =   23
            Top             =   600
            Width           =   1455
         End
         Begin VB.TextBox txtMove 
            Height          =   285
            Left            =   840
            TabIndex        =   21
            Top             =   240
            Width           =   495
         End
         Begin VB.ComboBox cmbFormat 
            Height          =   300
            ItemData        =   "MAINS.frx":0ABE
            Left            =   600
            List            =   "MAINS.frx":0AC0
            Style           =   2  'Dropdown List
            TabIndex        =   25
            Top             =   2160
            Width           =   975
         End
         Begin VB.Label lblInput 
            Caption         =   "输入"
            Height          =   255
            Left            =   120
            TabIndex        =   20
            Top             =   240
            Width           =   375
         End
         Begin VB.Label lblInputHelp 
            Alignment       =   1  'Right Justify
            Caption         =   "？"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   9
               Charset         =   134
               Weight          =   400
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   255
            Left            =   1320
            MouseIcon       =   "MAINS.frx":0AC2
            MousePointer    =   99  'Custom
            TabIndex        =   22
            Top             =   240
            Width           =   255
         End
         Begin VB.Label lblFormat 
            Caption         =   "格式"
            Height          =   255
            Left            =   120
            TabIndex        =   24
            Top             =   2160
            Width           =   375
         End
      End
      Begin VB.Label lblTimeElapsedDown1 
         Caption         =   "用时"
         Height          =   255
         Left            =   720
         TabIndex        =   17
         Top             =   2160
         Width           =   375
      End
      Begin VB.Label lblTimeRuleDown 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   720
         TabIndex        =   16
         Top             =   1920
         Width           =   1215
      End
      Begin VB.Label lblTimeElapsedUp1 
         Caption         =   "用时"
         Height          =   255
         Left            =   720
         TabIndex        =   12
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lblTimeElapsedUp 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1200
         TabIndex        =   13
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblTimeRuleUp 
         Alignment       =   2  'Center
         Height          =   255
         Left            =   720
         TabIndex        =   11
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
         TabIndex        =   9
         Top             =   120
         Width           =   375
      End
      Begin VB.Label lblTimeLeftUp 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1200
         TabIndex        =   10
         Top             =   120
         Width           =   735
      End
      Begin VB.Label lblTimeLeftDown 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1200
         TabIndex        =   15
         Top             =   1680
         Width           =   735
      End
      Begin VB.Label lblTimeLeftDown1 
         Caption         =   "时限"
         Height          =   255
         Left            =   720
         TabIndex        =   14
         Top             =   1680
         Width           =   375
      End
      Begin VB.Label lblTimeElapsedDown 
         Alignment       =   2  'Center
         Caption         =   "00:00:00"
         Height          =   255
         Left            =   1200
         TabIndex        =   18
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
         TabIndex        =   27
         Top             =   3960
         Width           =   3735
      End
      Begin VB.Label lblOpen 
         Alignment       =   2  'Center
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Left            =   0
         MouseIcon       =   "MAINS.frx":0C14
         MousePointer    =   99  'Custom
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
         TabIndex        =   26
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
   Begin MSComctlLib.TabStrip strpRight 
      Height          =   6735
      Left            =   5880
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   480
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   11880
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "棋局信息"
            ImageVarType    =   2
         EndProperty
      EndProperty
      Enabled         =   0   'False
   End
   Begin MSComctlLib.StatusBar stb 
      Align           =   2  'Align Bottom
      Height          =   240
      Left            =   0
      TabIndex        =   7
      Top             =   7320
      Width           =   9960
      _ExtentX        =   17568
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
            Object.Width           =   7620
            MinWidth        =   7620
            Key             =   "Pv"
            Object.ToolTipText     =   "思考路线"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5080
            MinWidth        =   5080
            Key             =   "Msg"
            Object.ToolTipText     =   "提示信息"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tlbHide 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   46
      Top             =   360
      Width           =   9960
      _ExtentX        =   17568
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      Style           =   1
      _Version        =   393216
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
         Caption         =   "新的对局(&N)..."
         Shortcut        =   ^N
      End
      Begin VB.Menu mnFileOpen 
         Caption         =   "打开(&O)..."
         Shortcut        =   ^O
      End
      Begin VB.Menu mnFileSave 
         Caption         =   "保存(&S)"
         Shortcut        =   ^S
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
         Shortcut        =   ^P
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
         Shortcut        =   {DEL}
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
   Begin VB.Menu mnPos 
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
         Caption         =   "在新窗口中推演(&A)"
         Shortcut        =   ^K
      End
      Begin VB.Menu mnPosEdit 
         Caption         =   "编辑局面(&E)..."
         Shortcut        =   ^E
      End
      Begin VB.Menu mnPosSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnPosCopy 
         Caption         =   "复制局面代码(&C)"
         Shortcut        =   ^{INSERT}
      End
      Begin VB.Menu mnPosPaste 
         Caption         =   "粘贴局面代码(&P)"
         Shortcut        =   +{INSERT}
      End
      Begin VB.Menu mnPosLoad 
         Caption         =   "从局面文件导入(&L)..."
      End
      Begin VB.Menu mnPosStore 
         Caption         =   "导出到局面文件(&S)..."
      End
   End
   Begin VB.Menu mnWizard 
      Caption         =   "魔法(&W)"
      Begin VB.Menu mnWizardPlay 
         Caption         =   "播放(&P)"
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
      Begin VB.Menu mnSearchOpening 
         Caption         =   "搜索开局(&O)"
      End
      Begin VB.Menu mnSearchPosition 
         Caption         =   "搜索局面(&F)"
         Shortcut        =   {F3}
      End
      Begin VB.Menu mnSearchEndgame 
         Caption         =   "搜索残局(&E)"
      End
      Begin VB.Menu mnWizardSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardPublish 
         Caption         =   "发布棋谱(&U)..."
      End
      Begin VB.Menu mnWizardBitmap 
         Caption         =   "生成图片棋盘(&B)"
      End
      Begin VB.Menu mnWizardSep4 
         Caption         =   "-"
      End
      Begin VB.Menu mnWizardPgns2Jar 
         Caption         =   "制作手机棋谱(&J)"
      End
      Begin VB.Menu mnWizardConvert 
         Caption         =   "批量转换棋谱(&C)"
      End
      Begin VB.Menu mnWizardBook 
         Caption         =   "管理开局库(&K)"
      End
   End
   Begin VB.Menu mnEndgames_ 
      Caption         =   "挑战(&C)"
      Begin VB.Menu mnEndgamesStart 
         Caption         =   "当前题库(&S)"
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnEndgamesSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "趣味象棋(&Y)"
         Index           =   0
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "基本杀法(&A)"
         Index           =   2
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "基本战术(&B)"
         Index           =   3
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "中局杀法(&C)"
         Index           =   4
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "象棋杀着大全(&D)"
         Index           =   5
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "残局攻杀谱(&E)"
         Index           =   6
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "象棋实用残局(第一集)(&F)"
         Index           =   7
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "象棋实用残局(第二集)(&G)"
         Index           =   8
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "-"
         Index           =   9
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "橘中秘(残局篇)(&H)"
         Index           =   10
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "适情雅趣(&I)"
         Index           =   11
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "烂柯神机(&J)"
         Index           =   12
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "象局汇存(&K)"
         Index           =   13
      End
      Begin VB.Menu mnEndgames 
         Caption         =   "江湖百局秘谱(&L)"
         Index           =   14
      End
      Begin VB.Menu mnEndgamesSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnEndgamesHelp 
         Caption         =   "求助(&P)"
         Begin VB.Menu mnEndgamesEndgames 
            Caption         =   "残局库(&E)"
         End
         Begin VB.Menu mnEndgamesSep3 
            Caption         =   "-"
         End
         Begin VB.Menu mnEndgamesShare 
            Caption         =   "QQ空间(&Q)"
            Index           =   0
         End
         Begin VB.Menu mnEndgamesShare 
            Caption         =   "新浪微博(&S)"
            Index           =   1
         End
         Begin VB.Menu mnEndgamesShare 
            Caption         =   "开心网(&K)"
            Index           =   2
         End
         Begin VB.Menu mnEndgamesShare 
            Caption         =   "人人网(&R)"
            Index           =   3
         End
         Begin VB.Menu mnEndgamesSep4 
            Caption         =   "-"
         End
         Begin VB.Menu mnEndgamesPublish 
            Caption         =   "百度知道(&Z)"
            Index           =   0
         End
         Begin VB.Menu mnEndgamesPublish 
            Caption         =   "百度贴吧象棋吧(&T)"
            Index           =   1
         End
         Begin VB.Menu mnEndgamesPublish 
            Caption         =   "其他网站(&O)"
            Index           =   2
         End
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
         Shortcut        =   +{DEL}
      End
      Begin VB.Menu mnEngineBan 
         Caption         =   "设为禁着(&N)"
      End
      Begin VB.Menu mnEngineDraw 
         Caption         =   "提和/接受提和(&D)"
      End
      Begin VB.Menu mnEngineResign 
         Caption         =   "认输(&G)"
      End
      Begin VB.Menu mnEngineSep4 
         Caption         =   "-"
      End
      Begin VB.Menu mnEngineStop 
         Caption         =   "停止思考/立即走棋(&O)"
         Shortcut        =   ^T
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
      Begin VB.Menu mnOptionsGui 
         Caption         =   "界面(&G)"
         Begin VB.Menu mnOptionsGuiSmall 
            Caption         =   "小(&S)"
         End
         Begin VB.Menu mnOptionsGuiLarge 
            Caption         =   "大(&L)"
         End
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
            Caption         =   "蓝天白云(&G)"
            Index           =   6
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "象棋演播室(&H)"
            Index           =   7
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "弈天棋缘(&I)"
            Index           =   8
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "梦入神机(&J)"
            Index           =   9
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "纵马奔流(&K)"
            Index           =   10
         End
         Begin VB.Menu mnOptionsBoard 
            Caption         =   "浅红象棋(&L)"
            Index           =   11
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
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "象棋演播室(&D)"
            Index           =   3
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "弈天棋缘(&E)"
            Index           =   4
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "梦入神机(&F)"
            Index           =   5
         End
         Begin VB.Menu mnOptionsPieces 
            Caption         =   "纵马奔流(&G)"
            Index           =   6
         End
      End
      Begin VB.Menu mnOptionsSounds 
         Caption         =   "音效(&S)"
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
            Caption         =   "马里奥一(&J)"
            Index           =   9
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "马里奥二(&K)"
            Index           =   10
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "仙剑奇侠传(&L)"
            Index           =   11
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "望江南(&M)"
            Index           =   12
         End
         Begin VB.Menu mnOptionsMusic 
            Caption         =   "无声(&N)"
            Index           =   13
         End
      End
      Begin VB.Menu mnOptionsTopMost 
         Caption         =   "总在最前面(&T)"
      End
      Begin VB.Menu mnOptionsSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnOptionsLanguage_ 
         Caption         =   "语言/&Language"
         Begin VB.Menu mnOptionsLanguage 
            Caption         =   "简体中文/&Simplified Chinese"
            Index           =   0
         End
         Begin VB.Menu mnOptionsLanguage 
            Caption         =   "繁体中文/&Traditional Chinese"
            Index           =   1
         End
      End
   End
   Begin VB.Menu mnHelp 
      Caption         =   "帮助(&H)"
      Begin VB.Menu mnHelpContents 
         Caption         =   "帮助主题(&C)"
         Shortcut        =   {F1}
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
      Begin VB.Menu mnHelpShare_ 
         Caption         =   "推荐给好友(&F)"
         Begin VB.Menu mnHelpShare 
            Caption         =   "QQ空间(&Q)"
            Index           =   0
         End
         Begin VB.Menu mnHelpShare 
            Caption         =   "新浪微博(&S)"
            Index           =   1
         End
         Begin VB.Menu mnHelpShare 
            Caption         =   "开心网(&K)"
            Index           =   2
         End
         Begin VB.Menu mnHelpShare 
            Caption         =   "人人网(&R)"
            Index           =   3
         End
         Begin VB.Menu mnHelpShare 
            Caption         =   "-"
            Index           =   4
         End
         Begin VB.Menu mnHelpShare 
            Caption         =   "其他网站(&O)"
            Index           =   5
         End
      End
      Begin VB.Menu mnHelpSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnHelpUpdate 
         Caption         =   "检查最新版本(&P)"
      End
      Begin VB.Menu mnHelpHome 
         Caption         =   "象棋百科全书(&H)"
      End
      Begin VB.Menu mnHelpLeague 
         Caption         =   "获取UCCI引擎(&G)"
      End
      Begin VB.Menu mnHelpXQWLight 
         Caption         =   "手机象棋(&L)"
      End
      Begin VB.Menu mnHelpBase 
         Caption         =   "棋谱仓库(&B)"
      End
      Begin VB.Menu mnHelpSuggest 
         Caption         =   "意见反馈(&S)"
      End
      Begin VB.Menu mnHelpSep3 
         Caption         =   "-"
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
' MAINS.FRM - Source Code for XiangQi Wizard, Part II
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 4.75, Last Modified: Sep. 2010
' Copyright (C) 2004-2010 www.xqbase.com
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
lstMoveText.AddItem L("===开始===", "===開始==="), 0
cmbFormat.AddItem L("炮二平五", "炮二平五"), 0
cmbFormat.AddItem "C2.5", 1
cmbFormat.AddItem "H2-E2", 2

If Options_nLanguage = LANGUAGE_ZH_CN Then
    Exit Sub
End If
mnOptionsBoard(0).Caption = "櫟木(&A)"
mnOptionsBoard(1).Caption = "綠色大理石(&B)"
mnOptionsBoard(2).Caption = "白色大理石(&C)"
mnOptionsBoard(3).Caption = "再生紙(&D)"
mnOptionsBoard(4).Caption = "畫布(&E)"
mnOptionsBoard(5).Caption = "水滴(&F)"
mnOptionsBoard(6).Caption = "藍天白雲(&G)"
mnOptionsBoard(7).Caption = "象棋演播室(&H)"
mnOptionsBoard(8).Caption = "弈天棋緣(&I)"
mnOptionsBoard(9).Caption = "夢入神機(&J)"
mnOptionsBoard(10).Caption = "縱馬奔流(&K)"
mnOptionsBoard(11).Caption = "淺紅象棋(&L)"
mnOptionsPieces(0).Caption = "木刻(&A)"
mnOptionsPieces(1).Caption = "精緻(&B)"
mnOptionsPieces(2).Caption = "光澤(&C)"
mnOptionsPieces(3).Caption = "象棋演播室(&D)"
mnOptionsPieces(4).Caption = "弈天棋緣(&E)"
mnOptionsPieces(5).Caption = "夢入神機(&F)"
mnOptionsPieces(6).Caption = "縱馬奔流(&G)"

End Sub

Private Sub Form_Unload(nCancel As Integer)

If CancelSave Then
    nCancel = 1
    Exit Sub
End If
If Engine_bAnalyze Then
    Unload frmThink
End If
If Engine_nStatus > IDLE_UNLOAD Then
    CloseEngine
End If
App_bRunning = False
If Options_bAutoSave Then
    App_szFileName = App_szPath & "AUTOSAVE.PGN"
    WriteFile
End If
If Not App_bPrevInstance Then
    Gui_nLeft = Left
    Gui_nTop = Top
End If

End Sub

Private Sub mnFileNew_Click()

If CancelSave Then
    Exit Sub
End If
NewGame

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
ShellExecuteA 0, vbNullString, App_szPath & L(TEMP_FILE_NAME_S, TEMP_FILE_NAME_T), _
        vbNullString, vbNullString, vbNormalFocus

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
    If MsgBox(L("必须清除以后所有的着法。", "必須清除以後所有的著法") & vbCrLf & vbCrLf & _
            L("是否继续？", "是否繼續？"), vbYesNo + vbQuestion) <> vbYes Then
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

ImportFromTextFile

End Sub

Private Sub mnMovePaste_Click()

ImportFromClipboard

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
    lstMoveText.List(i) = NumberText(cnt, sd) & Game_szMoveText(Game_nFormat, i) & _
                IIf(Game_szComment(i) = "", "", "*")
    sd = 1 - sd
    cnt = cnt + 1 - sd
Next
For i = 0 To Game_nMaxIrrev
    Game_szIrrevFen(i) = AllocString(CchessFenMirror(Game_szIrrevFen(i)))
    CchessBoardMirror Game_posIrrev(i)
Next
BoardFlush
FileUpdated

End Sub

Private Sub mnPosAnalyze_Click()

Shell App_szPath & App.EXEName & ".EXE" & IIf(App_bPromotion, " /P /S ", " /S ") & """" & _
        AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) & " - - 0 " & Game_cntCurr & """", vbNormalFocus

End Sub

Private Sub mnPosEdit_Click()

If CancelSave Then
    Exit Sub
End If
frmPosEdit.Show vbModal, Me

End Sub

Private Sub mnPosCopy_Click()

Clipboard.Clear
Clipboard.SetText AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) & " - - 0 " & Game_cntCurr
MsgBox L("局面代码已复制到剪贴板。", "局面代碼已復製到剪貼板"), vbInformation

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
szFileName = FileDialog(L("从局面文件导入", "從局面文件導入"), L("象棋局面文件", "象棋局面文件"), "FEN")
If szFileName <> "" Then
    LoadFenFile szFileName
End If

End Sub

Private Sub mnPosStore_Click()

Dim szFileName As String, nFileNo As Integer
szFileName = FileDialog(L("导出到局面文件", "導出到局面文件"), _
        L("象棋局面文件", "象棋局面文件"), "FEN", DefaultFileName)
If szFileName <> "" Then
    nFileNo = FreeFile
    On Error GoTo lnErrorOpen
    Open szFileName For Output As #nFileNo
    On Error GoTo 0
    Print #nFileNo, AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev))) & " - - 0 " & Game_cntCurr
    Close #nFileNo
End If

Exit Sub
lnErrorOpen:
On Error GoTo 0
ErrorOpen szFileName

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

Private Sub mnSearchOpening_Click()

If Game_szEcco <> "" Then
    ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqbase/?ecco=" & Game_szEcco, _
            vbNullString, vbNullString, vbNormalFocus
End If

End Sub

Private Sub mnSearchPosition_Click()

Dim szFen As String
szFen = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev)))
ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqbase/?position=" & UrlEncode(szFen), _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnSearchEndgame_Click()

Dim szFen As String
szFen = AllocString(CchessBoard2Fen(Game_posIrrev(Game_nCurrIrrev)))
ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqbase/?endgame=" & UrlEncode(szFen), _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnWizardPublish_Click()

frmPublish.Show vbModal, Me

End Sub

Private Sub mnWizardBitmap_Click()

WizardBitmap

End Sub

Private Sub mnEndgamesStart_Click()

If CancelSave Then
    Exit Sub
End If
LoadEndgames Gui_szEpdName, Gui_szEpdTitle

End Sub

Private Sub mnEndgames_Click(nIndex As Integer)

Dim i As Integer, szEpdName As String, szTitle As String
If CancelSave Then
    Exit Sub
End If

For i = 0 To MAX_EPD_MENU - 1
    mnEndgames(i).Checked = False
Next
mnEndgames(nIndex).Checked = True
Gui_nEpdMenu = nIndex
szEpdName = Choose(nIndex + 1, "FUNNY", "", "_A", "_B", "_C", "_D", "_E", "_F", "_G", "", _
        "_H", "_I", "_J", "_K", "_L")
If Options_nLanguage = LANGUAGE_ZH_CN Then
    szTitle = Choose(nIndex + 1, "趣味象棋", "", "基本杀法", "基本战术", "中局杀法", _
            "象棋杀着大全", "残局攻杀谱", "象棋实用残局(第一集)", "象棋实用残局(第二集)", _
            "", "橘中秘(残局篇)", "适情雅趣", "烂柯神机", "象局汇存", "江湖百局秘谱")
Else
    szTitle = Choose(nIndex + 1, "趣味象棋", "", "基本殺法", "基本戰術", "中局殺法", _
            "象棋殺著大全", "殘局攻殺譜", "象棋實用殘局(第一集)", "象棋實用殘局(第二集)", _
            "", "橘中秘(殘局篇)", "適情雅趣", "爛柯神機", "象局匯存", "江湖百局秘譜")
End If
LoadEndgames szEpdName, szTitle

End Sub

Private Sub mnEndgamesEndgames_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqbase/?endgame=" & _
        UrlEncode(Game_szIrrevFen(0)), vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnEndgamesShare_Click(nIndex As Integer)

HelpShare nIndex, L("象棋巫师的这道题怎么解？", "象棋巫師的這道題怎麼解？"), _
        "http://www.xqbase.com/xqwizard/help_puzzle.htm?fen=" & Game_szIrrevFen(0)

End Sub

Private Sub mnEndgamesPublish_Click(nIndex As Integer)

HelpPublish nIndex, L("象棋巫师的这道题怎么解？", "象棋巫師的這道題怎麼解？"), Game_szIrrevFen(0)

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
szFileName = FileDialog(L("加载引擎", "加載引擎"), L("引擎文件", "引擎文件"), "EXE")
If szFileName = "" Then
    Exit Sub
End If
If GetAppType(szFileName) = IMAGE_SUBSYSTEM_WINDOWS_CUI Then
    Engine_szFile = szFileName
    OpenEngine LOAD_WITH_INFO
Else
    MsgBox szFileName & L(" 不是中国象棋引擎文件！", " 不是中國象棋引擎文件！"), vbExclamation
End If

End Sub

Private Sub mnEngineSet_Click()

frmEngineSet.Show vbModal, Me

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

End Sub

Private Sub mnEngineAnalyze_Click()

If Engine_bAnalyze Then
    Unload frmThink
Else
    Engine_bAnalyze = True
    mnEngineAnalyze.Checked = True
    tlb.Buttons("EngineAnalyze").Value = tbrPressed
    frmThink.Show 0, Me
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
    Game_nResult = RESULT_DRAW
    lblResult = ResultString
    Timer_bEnabled = False
    mnEngineLevel.Checked = False
    tlb.Buttons("EngineLevel").Value = tbrUnpressed
    GameOver IIf(Game_sdMax = 0, L("红方接受提和。", "紅方接受提和。"), _
            L("黑方接受提和。", "黑方接受提和。")), ICON_DRAW
Else
    If mnEngineDraw.Checked Then
        MsgBox L("放弃提和。", "放棄提和。"), vbInformation
        mnEngineDraw.Checked = False
    Else
        MsgBox L("请走一着棋，然后等待电脑接受或拒绝提和。", _
                "請走一著棋，然後等待電腦接受或拒絕提和。") & vbCrLf & vbCrLf & _
                L("如果电脑拒绝提和，则不会理睬，而是继续走棋。", _
                "如果電腦拒絕提和，則不會理睬，而是繼續走棋。"), vbInformation
        mnEngineDraw.Checked = True
    End If
End If

End Sub

Private Sub mnEngineResign_Click()

If MsgBox(L("真的要认输吗？", "真的要認輸嗎？"), vbQuestion + vbYesNo) <> vbYes Then
    Exit Sub
End If
Game_nResult = IIf(Game_sdMax = 0, RESULT_BLACKWIN, RESULT_REDWIN)
lblResult = ResultString
Timer_bEnabled = False
mnEngineLevel.Checked = False
tlb.Buttons("EngineLevel").Value = tbrUnpressed
GameOver IIf(Game_sdMax = 0, L("红方认输。", "紅方認輸。"), L("黑方认输。", "黑方認輸。")), ICON_LOSS

End Sub

Private Sub mnEngineStop_Click()

StopEngine

End Sub

Private Sub mnOptionsSettings_Click()

frmOptions.Show vbModal, Me

End Sub

Private Sub mnOptionsGuiSmall_Click()

If Not mnOptionsGuiSmall.Checked Then
    SwapGui
End If

End Sub

Private Sub mnOptionsGuiLarge_Click()

If Not mnOptionsGuiLarge.Checked Then
    SwapGui
End If

End Sub

Private Sub mnOptionsBoard_Click(nIndex As Integer)

BoardSettingSmall nIndex

End Sub

Private Sub mnOptionsPieces_Click(nIndex As Integer)

PiecesSettingSmall nIndex

End Sub

Private Sub mnOptionsSounds_Click()

Options_bSounds = Not Options_bSounds
mnOptionsSounds.Checked = Options_bSounds

End Sub

Private Sub mnOptionsMusic_Click(nIndex As Integer)

Dim i As Integer
MusicSetting nIndex
For i = 0 To MUSIC_MAX - 1
    mnOptionsMusic(i).Checked = (nIndex = i)
Next

End Sub

Private Sub mnOptionsTopMost_Click()

Options_bTopMost = Not Options_bTopMost
mnOptionsTopMost.Checked = Options_bTopMost
SetWindowPos hWnd, IIf(Options_bTopMost, HWND_TOPMOST, HWND_NOTOPMOST), 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE

End Sub

Private Sub mnOptionsLanguage_Click(nIndex As Integer)

Dim i As Integer
If mnOptionsLanguage(nIndex).Checked Then
    Exit Sub
End If
For i = 0 To LANGUAGE_MAX - 1
    mnOptionsLanguage(i).Checked = False
Next
mnOptionsLanguage(nIndex).Checked = True
SaveSetting "XQWizard", "Options", "Language", nIndex
MsgBox L("语言已经更改，重新启动程序后才能生效。", "語言已經更改，重新啟動程序後才能生效。"), vbInformation

End Sub

Private Sub mnWizardPgns2Jar_Click()

ShellExecuteA 0, vbNullString, App_szPath & "PGNS2JAR.EXE", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnWizardConvert_Click()

ShellExecuteA 0, vbNullString, App_szPath & "MXQFCONV.EXE", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnWizardBook_Click()

ShellExecuteA 0, vbNullString, App_szPath & "MAKEBOOK.EXE", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpContents_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/help.htm", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpHowTo_Click()

frmHowTo.Show vbModal, Me

End Sub

Private Sub mnHelpQuote_Click()

MessageBeep vbInformation
MsgBoxIcon Gui_szQuotes(Int(Rnd * QUOTE_NUM + 1)), , "名言", , ICON_QUOTE

End Sub

Private Sub mnHelpShare_Click(nIndex As Integer)

HelpShare nIndex, ShareWords, "http://www.xqbase.com/xqwizard/xqwizard.htm"

End Sub

Private Sub mnHelpUpdate_Click()

CheckUpdate "xqwizard", MANUAL_UPDATE

End Sub

Private Sub mnHelpHome_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpLeague_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/league.htm", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpXQWLight_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/xqwlight.htm", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpBase_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqbase/", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpSuggest_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=suggest&referer=xqwizard", vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub mnHelpEngine_Click()

AboutEngine

End Sub

Private Sub mnHelpAbout_Click()

AboutXQWizard

End Sub

Private Sub tlb_ButtonClick(ByVal Button As MSComctlLib.Button)

Select Case Button.Key
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
Case "SearchPosition"
    mnSearchPosition_Click
Case "WizardPublish"
    mnWizardPublish_Click
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
Case "EngineAnalyze"
    mnEngineAnalyze_Click
Case "EngineStop"
    mnEngineStop_Click
End Select

End Sub

Private Sub imgSquares_MouseDown(nIndex As Integer, nButton As Integer, nShift As Integer, x As Single, y As Single)

ClickSquare IIf(App_bFlipped, (12 - nIndex \ 9) * 16 + 11 - nIndex Mod 9, (nIndex \ 9 + 3) * 16 + nIndex Mod 9 + 3)

End Sub

Private Sub lblOpen_Click()

mnSearchOpening_Click

End Sub

Private Sub lblInputHelp_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/help_edit.htm#edit_4", _
        vbNullString, vbNullString, vbNormalFocus

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
        lstMoveText.List(i) = NumberText(cnt, sd) & Game_szMoveText(Game_nFormat, i) & _
                IIf(Game_szComment(i) = "", "", "*")
        sd = 1 - sd
        cnt = cnt + 1 - sd
    Next
    FileUpdated
End If

End Sub

Private Sub txtComment_Change()

Dim szMoveText
If Game_szComment(Game_nCurrMove) <> txtComment.Text Then
    Game_szComment(Game_nCurrMove) = txtComment.Text
    CommentMoveText Game_nCurrMove
    FileUpdated
End If

End Sub

Private Sub btnCoord_MouseDown(nIndex As Integer, nButton As Integer, nShift As Integer, x As Single, y As Single)

btnCoord(nIndex).Enabled = False
btnCoord(nIndex).Enabled = True

End Sub
