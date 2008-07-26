VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmHide 
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   Icon            =   "HIDE.frx":0000
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin InetCtlsObjects.Inet inet 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   5
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   23
      Left            =   360
      Picture         =   "HIDE.frx":0ABA
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   24
      Left            =   720
      Picture         =   "HIDE.frx":0EC8
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   25
      Left            =   1080
      Picture         =   "HIDE.frx":12CC
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   26
      Left            =   1440
      Picture         =   "HIDE.frx":16D9
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   27
      Left            =   1800
      Picture         =   "HIDE.frx":1AE0
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   28
      Left            =   2160
      Picture         =   "HIDE.frx":1EE2
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   29
      Left            =   2520
      Picture         =   "HIDE.frx":22EF
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":26F5
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   16
      Left            =   360
      Picture         =   "HIDE.frx":2A6C
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   17
      Left            =   720
      Picture         =   "HIDE.frx":2E7B
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   18
      Left            =   1080
      Picture         =   "HIDE.frx":3281
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   19
      Left            =   1440
      Picture         =   "HIDE.frx":368F
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   20
      Left            =   1800
      Picture         =   "HIDE.frx":3A96
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   21
      Left            =   2160
      Picture         =   "HIDE.frx":3E9D
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   22
      Left            =   2520
      Picture         =   "HIDE.frx":42AB
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   8
      Left            =   360
      Picture         =   "HIDE.frx":46B0
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   9
      Left            =   720
      Picture         =   "HIDE.frx":4AA5
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   10
      Left            =   1080
      Picture         =   "HIDE.frx":4E90
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   11
      Left            =   1440
      Picture         =   "HIDE.frx":5284
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   12
      Left            =   1800
      Picture         =   "HIDE.frx":5675
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   13
      Left            =   2160
      Picture         =   "HIDE.frx":5A60
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   14
      Left            =   2520
      Picture         =   "HIDE.frx":5E53
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":6241
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   1
      Left            =   360
      Picture         =   "HIDE.frx":6599
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   2
      Left            =   720
      Picture         =   "HIDE.frx":6990
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   3
      Left            =   1080
      Picture         =   "HIDE.frx":6D7E
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   4
      Left            =   1440
      Picture         =   "HIDE.frx":7171
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   5
      Left            =   1800
      Picture         =   "HIDE.frx":7562
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   6
      Left            =   2160
      Picture         =   "HIDE.frx":794D
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   7
      Left            =   2520
      Picture         =   "HIDE.frx":7D3C
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgAdvert 
      Height          =   975
      Left            =   0
      Top             =   0
      Width           =   3735
   End
End
Attribute VB_Name = "frmHide"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
