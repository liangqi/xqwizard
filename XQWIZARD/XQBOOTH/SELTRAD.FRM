VERSION 5.00
Begin VB.Form frmSelect 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "選關"
   ClientHeight    =   7200
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10650
   BeginProperty Font 
      Name            =   "��隴闚"
      Size            =   9
      Charset         =   136
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "SELTRAD.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7200
   ScaleWidth      =   10650
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox frame 
      Height          =   6555
      Left            =   0
      ScaleHeight     =   6495
      ScaleWidth      =   10575
      TabIndex        =   0
      Top             =   0
      Width           =   10635
      Begin VB.HScrollBar hsb 
         Height          =   255
         LargeChange     =   10
         Left            =   0
         TabIndex        =   9
         TabStop         =   0   'False
         Top             =   6240
         Width           =   10575
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   0
         Left            =   240
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   1
         Left            =   480
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   2
         Left            =   720
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   3
         Left            =   960
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   4
         Left            =   1200
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   5
         Left            =   1440
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   6
         Left            =   1680
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   7
         Left            =   1920
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   8
         Left            =   2160
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   9
         Left            =   240
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   10
         Left            =   480
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   11
         Left            =   720
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   12
         Left            =   960
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   13
         Left            =   1200
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   14
         Left            =   1440
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   15
         Left            =   1680
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   16
         Left            =   1920
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   17
         Left            =   2160
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   18
         Left            =   240
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   19
         Left            =   480
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   20
         Left            =   720
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   21
         Left            =   960
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   22
         Left            =   1200
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   23
         Left            =   1440
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   24
         Left            =   1680
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   25
         Left            =   1920
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   26
         Left            =   2160
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   27
         Left            =   240
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   28
         Left            =   480
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   29
         Left            =   720
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   30
         Left            =   960
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   31
         Left            =   1200
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   32
         Left            =   1440
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   33
         Left            =   1680
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   34
         Left            =   1920
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   35
         Left            =   2160
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   36
         Left            =   240
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   37
         Left            =   480
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   38
         Left            =   720
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   39
         Left            =   960
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   40
         Left            =   1200
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   41
         Left            =   1440
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   42
         Left            =   1680
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   43
         Left            =   1920
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   44
         Left            =   2160
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   45
         Left            =   240
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   46
         Left            =   480
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   47
         Left            =   720
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   48
         Left            =   960
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   49
         Left            =   1200
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   50
         Left            =   1440
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   51
         Left            =   1680
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   52
         Left            =   1920
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   53
         Left            =   2160
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   54
         Left            =   240
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   55
         Left            =   480
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   56
         Left            =   720
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   57
         Left            =   960
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   58
         Left            =   1200
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   59
         Left            =   1440
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   60
         Left            =   1680
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   61
         Left            =   1920
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   62
         Left            =   2160
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   63
         Left            =   240
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   64
         Left            =   480
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   65
         Left            =   720
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   66
         Left            =   960
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   67
         Left            =   1200
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   68
         Left            =   1440
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   69
         Left            =   1680
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   70
         Left            =   1920
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   71
         Left            =   2160
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   72
         Left            =   240
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   73
         Left            =   480
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   74
         Left            =   720
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   75
         Left            =   960
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   76
         Left            =   1200
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   77
         Left            =   1440
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   78
         Left            =   1680
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   79
         Left            =   1920
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   80
         Left            =   2160
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   81
         Left            =   240
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   82
         Left            =   480
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   83
         Left            =   720
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   84
         Left            =   960
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   85
         Left            =   1200
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   86
         Left            =   1440
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   87
         Left            =   1680
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   88
         Left            =   1920
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   89
         Left            =   2160
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   90
         Left            =   240
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   91
         Left            =   480
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   92
         Left            =   720
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   93
         Left            =   960
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   94
         Left            =   1200
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   95
         Left            =   1440
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   96
         Left            =   1680
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   97
         Left            =   1920
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   98
         Left            =   2160
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   99
         Left            =   240
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   100
         Left            =   480
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   101
         Left            =   720
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   102
         Left            =   960
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   103
         Left            =   1200
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   104
         Left            =   1440
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   105
         Left            =   1680
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   106
         Left            =   1920
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   107
         Left            =   2160
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   108
         Left            =   240
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   109
         Left            =   480
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   110
         Left            =   720
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   111
         Left            =   960
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   112
         Left            =   1200
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   113
         Left            =   1440
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   114
         Left            =   1680
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   115
         Left            =   1920
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   116
         Left            =   2160
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   117
         Left            =   240
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   118
         Left            =   480
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   119
         Left            =   720
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   120
         Left            =   960
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   121
         Left            =   1200
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   122
         Left            =   1440
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   123
         Left            =   1680
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   124
         Left            =   1920
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   125
         Left            =   2160
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   126
         Left            =   240
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   127
         Left            =   480
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   128
         Left            =   720
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   129
         Left            =   960
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   130
         Left            =   1200
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   131
         Left            =   1440
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   132
         Left            =   1680
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   133
         Left            =   1920
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   134
         Left            =   2160
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   135
         Left            =   240
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   136
         Left            =   480
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   137
         Left            =   720
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   138
         Left            =   960
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   139
         Left            =   1200
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   140
         Left            =   1440
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   141
         Left            =   1680
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   142
         Left            =   1920
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   143
         Left            =   2160
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   144
         Left            =   240
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   145
         Left            =   480
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   146
         Left            =   720
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   147
         Left            =   960
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   148
         Left            =   1200
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   149
         Left            =   1440
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   150
         Left            =   1680
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   151
         Left            =   1920
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   152
         Left            =   2160
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   153
         Left            =   240
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   154
         Left            =   480
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   155
         Left            =   720
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   156
         Left            =   960
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   157
         Left            =   1200
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   158
         Left            =   1440
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   159
         Left            =   1680
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   160
         Left            =   1920
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   161
         Left            =   2160
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   162
         Left            =   240
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   163
         Left            =   480
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   164
         Left            =   720
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   165
         Left            =   960
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   166
         Left            =   1200
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   167
         Left            =   1440
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   168
         Left            =   1680
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   169
         Left            =   1920
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   170
         Left            =   2160
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   171
         Left            =   240
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   172
         Left            =   480
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   173
         Left            =   720
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   174
         Left            =   960
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   175
         Left            =   1200
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   176
         Left            =   1440
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   177
         Left            =   1680
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   178
         Left            =   1920
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   179
         Left            =   2160
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   180
         Left            =   2880
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   181
         Left            =   3120
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   182
         Left            =   3360
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   183
         Left            =   3600
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   184
         Left            =   3840
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   185
         Left            =   4080
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   186
         Left            =   4320
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   187
         Left            =   4560
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   188
         Left            =   4800
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   189
         Left            =   2880
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   190
         Left            =   3120
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   191
         Left            =   3360
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   192
         Left            =   3600
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   193
         Left            =   3840
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   194
         Left            =   4080
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   195
         Left            =   4320
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   196
         Left            =   4560
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   197
         Left            =   4800
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   198
         Left            =   2880
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   199
         Left            =   3120
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   200
         Left            =   3360
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   201
         Left            =   3600
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   202
         Left            =   3840
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   203
         Left            =   4080
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   204
         Left            =   4320
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   205
         Left            =   4560
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   206
         Left            =   4800
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   207
         Left            =   2880
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   208
         Left            =   3120
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   209
         Left            =   3360
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   210
         Left            =   3600
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   211
         Left            =   3840
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   212
         Left            =   4080
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   213
         Left            =   4320
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   214
         Left            =   4560
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   215
         Left            =   4800
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   216
         Left            =   2880
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   217
         Left            =   3120
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   218
         Left            =   3360
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   219
         Left            =   3600
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   220
         Left            =   3840
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   221
         Left            =   4080
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   222
         Left            =   4320
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   223
         Left            =   4560
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   224
         Left            =   4800
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   225
         Left            =   2880
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   226
         Left            =   3120
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   227
         Left            =   3360
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   228
         Left            =   3600
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   229
         Left            =   3840
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   230
         Left            =   4080
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   231
         Left            =   4320
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   232
         Left            =   4560
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   233
         Left            =   4800
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   234
         Left            =   2880
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   235
         Left            =   3120
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   236
         Left            =   3360
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   237
         Left            =   3600
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   238
         Left            =   3840
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   239
         Left            =   4080
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   240
         Left            =   4320
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   241
         Left            =   4560
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   242
         Left            =   4800
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   243
         Left            =   2880
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   244
         Left            =   3120
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   245
         Left            =   3360
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   246
         Left            =   3600
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   247
         Left            =   3840
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   248
         Left            =   4080
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   249
         Left            =   4320
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   250
         Left            =   4560
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   251
         Left            =   4800
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   252
         Left            =   2880
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   253
         Left            =   3120
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   254
         Left            =   3360
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   255
         Left            =   3600
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   256
         Left            =   3840
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   257
         Left            =   4080
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   258
         Left            =   4320
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   259
         Left            =   4560
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   260
         Left            =   4800
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   261
         Left            =   2880
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   262
         Left            =   3120
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   263
         Left            =   3360
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   264
         Left            =   3600
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   265
         Left            =   3840
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   266
         Left            =   4080
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   267
         Left            =   4320
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   268
         Left            =   4560
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   269
         Left            =   4800
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   270
         Left            =   2880
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   271
         Left            =   3120
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   272
         Left            =   3360
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   273
         Left            =   3600
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   274
         Left            =   3840
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   275
         Left            =   4080
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   276
         Left            =   4320
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   277
         Left            =   4560
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   278
         Left            =   4800
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   279
         Left            =   2880
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   280
         Left            =   3120
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   281
         Left            =   3360
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   282
         Left            =   3600
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   283
         Left            =   3840
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   284
         Left            =   4080
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   285
         Left            =   4320
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   286
         Left            =   4560
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   287
         Left            =   4800
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   288
         Left            =   2880
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   289
         Left            =   3120
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   290
         Left            =   3360
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   291
         Left            =   3600
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   292
         Left            =   3840
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   293
         Left            =   4080
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   294
         Left            =   4320
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   295
         Left            =   4560
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   296
         Left            =   4800
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   297
         Left            =   2880
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   298
         Left            =   3120
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   299
         Left            =   3360
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   300
         Left            =   3600
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   301
         Left            =   3840
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   302
         Left            =   4080
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   303
         Left            =   4320
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   304
         Left            =   4560
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   305
         Left            =   4800
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   306
         Left            =   2880
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   307
         Left            =   3120
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   308
         Left            =   3360
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   309
         Left            =   3600
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   310
         Left            =   3840
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   311
         Left            =   4080
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   312
         Left            =   4320
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   313
         Left            =   4560
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   314
         Left            =   4800
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   315
         Left            =   2880
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   316
         Left            =   3120
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   317
         Left            =   3360
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   318
         Left            =   3600
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   319
         Left            =   3840
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   320
         Left            =   4080
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   321
         Left            =   4320
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   322
         Left            =   4560
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   323
         Left            =   4800
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   324
         Left            =   2880
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   325
         Left            =   3120
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   326
         Left            =   3360
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   327
         Left            =   3600
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   328
         Left            =   3840
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   329
         Left            =   4080
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   330
         Left            =   4320
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   331
         Left            =   4560
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   332
         Left            =   4800
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   333
         Left            =   2880
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   334
         Left            =   3120
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   335
         Left            =   3360
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   336
         Left            =   3600
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   337
         Left            =   3840
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   338
         Left            =   4080
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   339
         Left            =   4320
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   340
         Left            =   4560
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   341
         Left            =   4800
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   342
         Left            =   2880
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   343
         Left            =   3120
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   344
         Left            =   3360
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   345
         Left            =   3600
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   346
         Left            =   3840
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   347
         Left            =   4080
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   348
         Left            =   4320
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   349
         Left            =   4560
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   350
         Left            =   4800
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   351
         Left            =   2880
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   352
         Left            =   3120
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   353
         Left            =   3360
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   354
         Left            =   3600
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   355
         Left            =   3840
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   356
         Left            =   4080
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   357
         Left            =   4320
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   358
         Left            =   4560
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   359
         Left            =   4800
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   360
         Left            =   5520
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   361
         Left            =   5760
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   362
         Left            =   6000
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   363
         Left            =   6240
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   364
         Left            =   6480
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   365
         Left            =   6720
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   366
         Left            =   6960
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   367
         Left            =   7200
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   368
         Left            =   7440
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   369
         Left            =   5520
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   370
         Left            =   5760
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   371
         Left            =   6000
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   372
         Left            =   6240
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   373
         Left            =   6480
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   374
         Left            =   6720
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   375
         Left            =   6960
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   376
         Left            =   7200
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   377
         Left            =   7440
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   378
         Left            =   5520
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   379
         Left            =   5760
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   380
         Left            =   6000
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   381
         Left            =   6240
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   382
         Left            =   6480
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   383
         Left            =   6720
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   384
         Left            =   6960
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   385
         Left            =   7200
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   386
         Left            =   7440
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   387
         Left            =   5520
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   388
         Left            =   5760
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   389
         Left            =   6000
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   390
         Left            =   6240
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   391
         Left            =   6480
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   392
         Left            =   6720
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   393
         Left            =   6960
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   394
         Left            =   7200
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   395
         Left            =   7440
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   396
         Left            =   5520
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   397
         Left            =   5760
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   398
         Left            =   6000
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   399
         Left            =   6240
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   400
         Left            =   6480
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   401
         Left            =   6720
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   402
         Left            =   6960
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   403
         Left            =   7200
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   404
         Left            =   7440
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   405
         Left            =   5520
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   406
         Left            =   5760
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   407
         Left            =   6000
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   408
         Left            =   6240
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   409
         Left            =   6480
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   410
         Left            =   6720
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   411
         Left            =   6960
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   412
         Left            =   7200
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   413
         Left            =   7440
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   414
         Left            =   5520
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   415
         Left            =   5760
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   416
         Left            =   6000
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   417
         Left            =   6240
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   418
         Left            =   6480
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   419
         Left            =   6720
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   420
         Left            =   6960
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   421
         Left            =   7200
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   422
         Left            =   7440
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   423
         Left            =   5520
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   424
         Left            =   5760
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   425
         Left            =   6000
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   426
         Left            =   6240
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   427
         Left            =   6480
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   428
         Left            =   6720
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   429
         Left            =   6960
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   430
         Left            =   7200
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   431
         Left            =   7440
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   432
         Left            =   5520
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   433
         Left            =   5760
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   434
         Left            =   6000
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   435
         Left            =   6240
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   436
         Left            =   6480
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   437
         Left            =   6720
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   438
         Left            =   6960
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   439
         Left            =   7200
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   440
         Left            =   7440
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   441
         Left            =   5520
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   442
         Left            =   5760
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   443
         Left            =   6000
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   444
         Left            =   6240
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   445
         Left            =   6480
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   446
         Left            =   6720
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   447
         Left            =   6960
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   448
         Left            =   7200
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   449
         Left            =   7440
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   450
         Left            =   5520
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   451
         Left            =   5760
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   452
         Left            =   6000
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   453
         Left            =   6240
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   454
         Left            =   6480
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   455
         Left            =   6720
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   456
         Left            =   6960
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   457
         Left            =   7200
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   458
         Left            =   7440
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   459
         Left            =   5520
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   460
         Left            =   5760
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   461
         Left            =   6000
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   462
         Left            =   6240
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   463
         Left            =   6480
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   464
         Left            =   6720
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   465
         Left            =   6960
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   466
         Left            =   7200
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   467
         Left            =   7440
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   468
         Left            =   5520
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   469
         Left            =   5760
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   470
         Left            =   6000
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   471
         Left            =   6240
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   472
         Left            =   6480
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   473
         Left            =   6720
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   474
         Left            =   6960
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   475
         Left            =   7200
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   476
         Left            =   7440
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   477
         Left            =   5520
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   478
         Left            =   5760
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   479
         Left            =   6000
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   480
         Left            =   6240
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   481
         Left            =   6480
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   482
         Left            =   6720
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   483
         Left            =   6960
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   484
         Left            =   7200
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   485
         Left            =   7440
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   486
         Left            =   5520
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   487
         Left            =   5760
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   488
         Left            =   6000
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   489
         Left            =   6240
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   490
         Left            =   6480
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   491
         Left            =   6720
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   492
         Left            =   6960
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   493
         Left            =   7200
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   494
         Left            =   7440
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   495
         Left            =   5520
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   496
         Left            =   5760
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   497
         Left            =   6000
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   498
         Left            =   6240
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   499
         Left            =   6480
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   500
         Left            =   6720
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   501
         Left            =   6960
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   502
         Left            =   7200
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   503
         Left            =   7440
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   504
         Left            =   5520
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   505
         Left            =   5760
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   506
         Left            =   6000
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   507
         Left            =   6240
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   508
         Left            =   6480
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   509
         Left            =   6720
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   510
         Left            =   6960
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   511
         Left            =   7200
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   512
         Left            =   7440
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   513
         Left            =   5520
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   514
         Left            =   5760
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   515
         Left            =   6000
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   516
         Left            =   6240
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   517
         Left            =   6480
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   518
         Left            =   6720
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   519
         Left            =   6960
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   520
         Left            =   7200
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   521
         Left            =   7440
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   522
         Left            =   5520
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   523
         Left            =   5760
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   524
         Left            =   6000
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   525
         Left            =   6240
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   526
         Left            =   6480
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   527
         Left            =   6720
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   528
         Left            =   6960
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   529
         Left            =   7200
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   530
         Left            =   7440
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   531
         Left            =   5520
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   532
         Left            =   5760
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   533
         Left            =   6000
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   534
         Left            =   6240
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   535
         Left            =   6480
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   536
         Left            =   6720
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   537
         Left            =   6960
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   538
         Left            =   7200
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   539
         Left            =   7440
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   540
         Left            =   8160
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   541
         Left            =   8400
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   542
         Left            =   8640
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   543
         Left            =   8880
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   544
         Left            =   9120
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   545
         Left            =   9360
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   546
         Left            =   9600
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   547
         Left            =   9840
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   548
         Left            =   10080
         Top             =   240
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   549
         Left            =   8160
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   550
         Left            =   8400
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   551
         Left            =   8640
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   552
         Left            =   8880
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   553
         Left            =   9120
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   554
         Left            =   9360
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   555
         Left            =   9600
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   556
         Left            =   9840
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   557
         Left            =   10080
         Top             =   480
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   558
         Left            =   8160
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   559
         Left            =   8400
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   560
         Left            =   8640
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   561
         Left            =   8880
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   562
         Left            =   9120
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   563
         Left            =   9360
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   564
         Left            =   9600
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   565
         Left            =   9840
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   566
         Left            =   10080
         Top             =   720
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   567
         Left            =   8160
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   568
         Left            =   8400
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   569
         Left            =   8640
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   570
         Left            =   8880
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   571
         Left            =   9120
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   572
         Left            =   9360
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   573
         Left            =   9600
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   574
         Left            =   9840
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   575
         Left            =   10080
         Top             =   960
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   576
         Left            =   8160
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   577
         Left            =   8400
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   578
         Left            =   8640
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   579
         Left            =   8880
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   580
         Left            =   9120
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   581
         Left            =   9360
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   582
         Left            =   9600
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   583
         Left            =   9840
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   584
         Left            =   10080
         Top             =   1200
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   585
         Left            =   8160
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   586
         Left            =   8400
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   587
         Left            =   8640
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   588
         Left            =   8880
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   589
         Left            =   9120
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   590
         Left            =   9360
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   591
         Left            =   9600
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   592
         Left            =   9840
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   593
         Left            =   10080
         Top             =   1440
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   594
         Left            =   8160
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   595
         Left            =   8400
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   596
         Left            =   8640
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   597
         Left            =   8880
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   598
         Left            =   9120
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   599
         Left            =   9360
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   600
         Left            =   9600
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   601
         Left            =   9840
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   602
         Left            =   10080
         Top             =   1680
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   603
         Left            =   8160
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   604
         Left            =   8400
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   605
         Left            =   8640
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   606
         Left            =   8880
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   607
         Left            =   9120
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   608
         Left            =   9360
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   609
         Left            =   9600
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   610
         Left            =   9840
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   611
         Left            =   10080
         Top             =   1920
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   612
         Left            =   8160
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   613
         Left            =   8400
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   614
         Left            =   8640
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   615
         Left            =   8880
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   616
         Left            =   9120
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   617
         Left            =   9360
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   618
         Left            =   9600
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   619
         Left            =   9840
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   620
         Left            =   10080
         Top             =   2160
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   621
         Left            =   8160
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   622
         Left            =   8400
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   623
         Left            =   8640
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   624
         Left            =   8880
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   625
         Left            =   9120
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   626
         Left            =   9360
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   627
         Left            =   9600
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   628
         Left            =   9840
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   629
         Left            =   10080
         Top             =   2400
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   630
         Left            =   8160
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   631
         Left            =   8400
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   632
         Left            =   8640
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   633
         Left            =   8880
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   634
         Left            =   9120
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   635
         Left            =   9360
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   636
         Left            =   9600
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   637
         Left            =   9840
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   638
         Left            =   10080
         Top             =   3360
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   639
         Left            =   8160
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   640
         Left            =   8400
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   641
         Left            =   8640
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   642
         Left            =   8880
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   643
         Left            =   9120
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   644
         Left            =   9360
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   645
         Left            =   9600
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   646
         Left            =   9840
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   647
         Left            =   10080
         Top             =   3600
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   648
         Left            =   8160
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   649
         Left            =   8400
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   650
         Left            =   8640
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   651
         Left            =   8880
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   652
         Left            =   9120
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   653
         Left            =   9360
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   654
         Left            =   9600
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   655
         Left            =   9840
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   656
         Left            =   10080
         Top             =   3840
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   657
         Left            =   8160
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   658
         Left            =   8400
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   659
         Left            =   8640
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   660
         Left            =   8880
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   661
         Left            =   9120
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   662
         Left            =   9360
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   663
         Left            =   9600
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   664
         Left            =   9840
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   665
         Left            =   10080
         Top             =   4080
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   666
         Left            =   8160
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   667
         Left            =   8400
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   668
         Left            =   8640
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   669
         Left            =   8880
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   670
         Left            =   9120
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   671
         Left            =   9360
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   672
         Left            =   9600
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   673
         Left            =   9840
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   674
         Left            =   10080
         Top             =   4320
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   675
         Left            =   8160
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   676
         Left            =   8400
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   677
         Left            =   8640
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   678
         Left            =   8880
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   679
         Left            =   9120
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   680
         Left            =   9360
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   681
         Left            =   9600
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   682
         Left            =   9840
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   683
         Left            =   10080
         Top             =   4560
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   684
         Left            =   8160
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   685
         Left            =   8400
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   686
         Left            =   8640
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   687
         Left            =   8880
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   688
         Left            =   9120
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   689
         Left            =   9360
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   690
         Left            =   9600
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   691
         Left            =   9840
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   692
         Left            =   10080
         Top             =   4800
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   693
         Left            =   8160
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   694
         Left            =   8400
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   695
         Left            =   8640
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   696
         Left            =   8880
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   697
         Left            =   9120
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   698
         Left            =   9360
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   699
         Left            =   9600
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   700
         Left            =   9840
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   701
         Left            =   10080
         Top             =   5040
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   702
         Left            =   8160
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   703
         Left            =   8400
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   704
         Left            =   8640
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   705
         Left            =   8880
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   706
         Left            =   9120
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   707
         Left            =   9360
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   708
         Left            =   9600
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   709
         Left            =   9840
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   710
         Left            =   10080
         Top             =   5280
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   711
         Left            =   8160
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   712
         Left            =   8400
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   713
         Left            =   8640
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   714
         Left            =   8880
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   715
         Left            =   9120
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   716
         Left            =   9360
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   717
         Left            =   9600
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   718
         Left            =   9840
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgSquares 
         Height          =   255
         Index           =   719
         Left            =   10080
         Top             =   5520
         Width           =   255
      End
      Begin VB.Image imgBoard 
         Height          =   2655
         Index           =   1
         Left            =   120
         Stretch         =   -1  'True
         Top             =   3240
         Width           =   2415
      End
      Begin VB.Image imgBoard 
         Height          =   2655
         Index           =   0
         Left            =   120
         Stretch         =   -1  'True
         Top             =   120
         Width           =   2415
      End
      Begin VB.Image imgBoard 
         Height          =   2655
         Index           =   2
         Left            =   2760
         Stretch         =   -1  'True
         Top             =   120
         Width           =   2415
      End
      Begin VB.Image imgBoard 
         Height          =   2655
         Index           =   3
         Left            =   2760
         Stretch         =   -1  'True
         Top             =   3240
         Width           =   2415
      End
      Begin VB.Image imgBoard 
         Height          =   2655
         Index           =   4
         Left            =   5400
         Stretch         =   -1  'True
         Top             =   120
         Width           =   2415
      End
      Begin VB.Image imgBoard 
         Height          =   2655
         Index           =   5
         Left            =   5400
         Stretch         =   -1  'True
         Top             =   3240
         Width           =   2415
      End
      Begin VB.Image imgBoard 
         Height          =   2655
         Index           =   6
         Left            =   8040
         Stretch         =   -1  'True
         Top             =   120
         Width           =   2415
      End
      Begin VB.Image imgBoard 
         Height          =   2655
         Index           =   7
         Left            =   8040
         Stretch         =   -1  'True
         Top             =   3240
         Width           =   2415
      End
      Begin VB.Shape shpSelected 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   2
         Height          =   2895
         Index           =   1
         Left            =   0
         Top             =   3120
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.Shape shpSelected 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   2
         Height          =   2895
         Index           =   0
         Left            =   0
         Top             =   0
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.Shape shpSelected 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   2
         Height          =   2895
         Index           =   2
         Left            =   2640
         Top             =   0
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.Shape shpSelected 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   2
         Height          =   2895
         Index           =   3
         Left            =   2640
         Top             =   3120
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.Shape shpSelected 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   2
         Height          =   2895
         Index           =   4
         Left            =   5280
         Top             =   0
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.Shape shpSelected 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   2
         Height          =   2895
         Index           =   5
         Left            =   5280
         Top             =   3120
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.Shape shpSelected 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   2
         Height          =   2895
         Index           =   6
         Left            =   7920
         Top             =   0
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.Shape shpSelected 
         BorderColor     =   &H00FF0000&
         BorderWidth     =   2
         Height          =   2895
         Index           =   7
         Left            =   7920
         Top             =   3120
         Visible         =   0   'False
         Width           =   2655
      End
      Begin VB.Label lblTag 
         Alignment       =   2  'Center
         Caption         =   "第 ???? 關"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   7
         Left            =   8520
         TabIndex        =   8
         Top             =   6000
         Width           =   1455
      End
      Begin VB.Label lblTag 
         Alignment       =   2  'Center
         Caption         =   "第 ???? 關"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   6
         Left            =   8520
         TabIndex        =   7
         Top             =   2880
         Width           =   1455
      End
      Begin VB.Label lblTag 
         Alignment       =   2  'Center
         Caption         =   "第 ???? 關"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   5
         Left            =   5880
         TabIndex        =   6
         Top             =   6000
         Width           =   1455
      End
      Begin VB.Label lblTag 
         Alignment       =   2  'Center
         Caption         =   "第 ???? 關"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   5880
         TabIndex        =   5
         Top             =   2880
         Width           =   1455
      End
      Begin VB.Label lblTag 
         Alignment       =   2  'Center
         Caption         =   "第 ???? 關"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   3
         Left            =   3240
         TabIndex        =   4
         Top             =   6000
         Width           =   1455
      End
      Begin VB.Label lblTag 
         Alignment       =   2  'Center
         Caption         =   "第 ???? 關"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   3240
         TabIndex        =   3
         Top             =   2880
         Width           =   1455
      End
      Begin VB.Label lblTag 
         Alignment       =   2  'Center
         Caption         =   "第 ???? 關"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   600
         TabIndex        =   2
         Top             =   6000
         Width           =   1455
      End
      Begin VB.Label lblTag 
         Alignment       =   2  'Center
         Caption         =   "第 ???? 關"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   600
         TabIndex        =   1
         Top             =   2880
         Width           =   1455
      End
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   5520
      TabIndex        =   11
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Height          =   375
      Left            =   3840
      TabIndex        =   10
      Top             =   6720
      Width           =   1215
   End
End
Attribute VB_Name = "frmSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' SELECT.FRM - Source Code for XiangQi Booth, Part III
'
' XiangQi Booth - a Little Chinese Chess Challenge Game
' Designed by Morning Yellow, Version: 3.97, Last Modified: May 2009
' Copyright (C) 2004-2009 www.elephantbase.net
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

Private Const BOARD_NUM As Integer = 8

Private nSelLast, nSelected As Integer

Private Sub DrawBoard(ByVal nIndex As Integer, Optional ByVal szFen As String = "")

Dim i As Integer, j As Integer, pc As Integer, nPicId As Integer
Dim pos As PositionStruct

CchessFen2Board pos, szFen
For i = 3 To 12
    For j = 3 To 11
        pc = pos.ucpcSquares(i * 16 + j)
        If pc = 0 Then
            nPicId = 0
        Else
            nPicId = PieceType(pc) + IIf(pc < 32, 1, 8)
        End If
        imgSquares(nIndex * 90 + (i - 3) * 9 + j - 3).Picture = frmHide.imgPiecesMini(nPicId)
    Next
Next

End Sub

Private Sub ResetSelected()

Dim i As Integer
For i = 0 To 7
    shpSelected(i).Visible = (i = nSelected)
Next

End Sub

Private Sub Reset()

Dim i As Integer, nCurr As Integer
For i = 0 To 7
    nCurr = hsb.Value * BOARD_NUM + i
    If nCurr < nSelLast Then
        imgBoard(i).Picture = IIf(nCurr <= Gui_nLast, frmHide.imgBoardMini.Picture, frmHide.imgUnavailable.Picture)
        DrawBoard i, App_szEndgames(nCurr)
        lblTag(i).Caption = "菴" + Str(nCurr + 1) + " 燊"
    Else
        imgBoard(i).Picture = Nothing
        DrawBoard i
        lblTag(i).Caption = ""
    End If
Next
ResetSelected

End Sub

Private Sub Form_Load()

nSelLast = Gui_nLast + 1 + (App_nEndgames \ 1000 - Gui_nLast \ 1000)
nSelected = -1
hsb.Min = 0
hsb.Max = (nSelLast - 1) \ BOARD_NUM
hsb.Value = Gui_nCurr \ BOARD_NUM
nSelected = Gui_nCurr Mod BOARD_NUM
Reset

End Sub

Private Sub imgSquares_Click(nIndex As Integer)

If nSelected <> nIndex \ 90 Then
    nSelected = nIndex \ 90
    ResetSelected
End If

End Sub

Private Sub imgSquares_DblClick(nIndex As Integer)

nSelected = nIndex \ 90
btnConfirm_Click

End Sub

Private Sub imgBoard_Click(nIndex As Integer)

If nSelected <> nIndex Then
    nSelected = nIndex
    ResetSelected
End If

End Sub

Private Sub imgBoard_DblClick(nIndex As Integer)

nSelected = nIndex
btnConfirm_Click

End Sub

Private Sub hsb_Change()

If nSelected >= 0 Then
    Reset
End If

End Sub

Private Sub btnConfirm_Click()

Dim nCurr As Integer
nCurr = hsb.Value * BOARD_NUM + nSelected
If nCurr <= Gui_nLast Then
    Gui_nCurr = nCurr
    frmXQBooth.LoadGame
    Unload Me
Else
    MsgBox "蠟奾帤熸善稛珨燊﹝", vbExclamation
End If

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub
