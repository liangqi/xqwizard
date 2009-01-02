VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmHide 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3225
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4710
   Icon            =   "HIDE.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3225
   ScaleWidth      =   4710
   ShowInTaskbar   =   0   'False
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
      Height          =   615
      Index           =   31
      Left            =   600
      Picture         =   "HIDE.frx":000C
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   30
      Left            =   0
      Picture         =   "HIDE.frx":07A7
      Top             =   2400
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   23
      Left            =   600
      Picture         =   "HIDE.frx":0EEF
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   24
      Left            =   1200
      Picture         =   "HIDE.frx":16DE
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   25
      Left            =   1800
      Picture         =   "HIDE.frx":1E3B
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   26
      Left            =   2400
      Picture         =   "HIDE.frx":2631
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   27
      Left            =   3000
      Picture         =   "HIDE.frx":2DF9
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   28
      Left            =   3600
      Picture         =   "HIDE.frx":35B8
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   29
      Left            =   4200
      Picture         =   "HIDE.frx":3D8B
      Top             =   1800
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":451F
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   16
      Left            =   600
      Picture         =   "HIDE.frx":48D4
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   17
      Left            =   1200
      Picture         =   "HIDE.frx":507E
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   18
      Left            =   1800
      Picture         =   "HIDE.frx":5804
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   19
      Left            =   2400
      Picture         =   "HIDE.frx":5FA4
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   20
      Left            =   3000
      Picture         =   "HIDE.frx":6748
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   21
      Left            =   3600
      Picture         =   "HIDE.frx":6EE1
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   22
      Left            =   4200
      Picture         =   "HIDE.frx":76C5
      Top             =   1200
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   8
      Left            =   600
      Picture         =   "HIDE.frx":7E5A
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   9
      Left            =   1200
      Picture         =   "HIDE.frx":8605
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   10
      Left            =   1800
      Picture         =   "HIDE.frx":8D1E
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   11
      Left            =   2400
      Picture         =   "HIDE.frx":94CF
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   12
      Left            =   3000
      Picture         =   "HIDE.frx":9C54
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   13
      Left            =   3600
      Picture         =   "HIDE.frx":A3CF
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   14
      Left            =   4200
      Picture         =   "HIDE.frx":AB5D
      Top             =   600
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":B2B0
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   1
      Left            =   600
      Picture         =   "HIDE.frx":B623
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   2
      Left            =   1200
      Picture         =   "HIDE.frx":BD8B
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   3
      Left            =   1800
      Picture         =   "HIDE.frx":C4CB
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   4
      Left            =   2400
      Picture         =   "HIDE.frx":CC2D
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   5
      Left            =   3000
      Picture         =   "HIDE.frx":D38B
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   6
      Left            =   3600
      Picture         =   "HIDE.frx":DAE2
      Top             =   0
      Width           =   615
   End
   Begin VB.Image imgPieces 
      Height          =   615
      Index           =   7
      Left            =   4200
      Picture         =   "HIDE.frx":E282
      Top             =   0
      Width           =   615
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
