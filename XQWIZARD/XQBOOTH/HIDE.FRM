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
      Height          =   360
      Index           =   23
      Left            =   360
      Picture         =   "HIDE.frx":000C
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   24
      Left            =   720
      Picture         =   "HIDE.frx":041A
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   25
      Left            =   1080
      Picture         =   "HIDE.frx":081E
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   26
      Left            =   1440
      Picture         =   "HIDE.frx":0C2B
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   27
      Left            =   1800
      Picture         =   "HIDE.frx":1032
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   28
      Left            =   2160
      Picture         =   "HIDE.frx":1434
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   29
      Left            =   2520
      Picture         =   "HIDE.frx":1841
      Top             =   1080
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   15
      Left            =   0
      Picture         =   "HIDE.frx":1C47
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   16
      Left            =   360
      Picture         =   "HIDE.frx":1FBE
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   17
      Left            =   720
      Picture         =   "HIDE.frx":23CD
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   18
      Left            =   1080
      Picture         =   "HIDE.frx":27D3
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   19
      Left            =   1440
      Picture         =   "HIDE.frx":2BE1
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   20
      Left            =   1800
      Picture         =   "HIDE.frx":2FE8
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   21
      Left            =   2160
      Picture         =   "HIDE.frx":33EF
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   22
      Left            =   2520
      Picture         =   "HIDE.frx":37FD
      Top             =   720
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   8
      Left            =   360
      Picture         =   "HIDE.frx":3C02
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   9
      Left            =   720
      Picture         =   "HIDE.frx":3FF7
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   10
      Left            =   1080
      Picture         =   "HIDE.frx":43E2
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   11
      Left            =   1440
      Picture         =   "HIDE.frx":47D6
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   12
      Left            =   1800
      Picture         =   "HIDE.frx":4BC7
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   13
      Left            =   2160
      Picture         =   "HIDE.frx":4FB2
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   14
      Left            =   2520
      Picture         =   "HIDE.frx":53A5
      Top             =   360
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   0
      Left            =   0
      Picture         =   "HIDE.frx":5793
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   1
      Left            =   360
      Picture         =   "HIDE.frx":5AEB
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   2
      Left            =   720
      Picture         =   "HIDE.frx":5EE2
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   3
      Left            =   1080
      Picture         =   "HIDE.frx":62D0
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   4
      Left            =   1440
      Picture         =   "HIDE.frx":66C3
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   5
      Left            =   1800
      Picture         =   "HIDE.frx":6AB4
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   6
      Left            =   2160
      Picture         =   "HIDE.frx":6E9F
      Top             =   0
      Width           =   360
   End
   Begin VB.Image imgPieces 
      Height          =   360
      Index           =   7
      Left            =   2520
      Picture         =   "HIDE.frx":728E
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
