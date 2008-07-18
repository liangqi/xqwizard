VERSION 5.00
Begin VB.Form frmXQBooth 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   3720
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   3360
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   MaxButton       =   0   'False
   ScaleHeight     =   3720
   ScaleWidth      =   3360
   StartUpPosition =   3  'Windows Default
   Begin VB.Image imgBoard 
      Height          =   3720
      Left            =   0
      Picture         =   "XQBOOTH.frx":0000
      Stretch         =   -1  'True
      Top             =   0
      Width           =   3360
   End
   Begin VB.Menu mnPrev 
      Caption         =   "上一关(&P)"
   End
   Begin VB.Menu mnRestart 
      Caption         =   "再来一次(&R)"
   End
   Begin VB.Menu mnNext 
      Caption         =   "下一关(&N)"
   End
End
Attribute VB_Name = "frmXQBooth"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
