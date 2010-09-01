VERSION 5.00
Begin VB.Form frmHide2 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   Icon            =   "HIDE2.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Image imgBoardMini 
      Height          =   2655
      Left            =   0
      Picture         =   "HIDE2.frx":0ABA
      Stretch         =   -1  'True
      Top             =   0
      Width           =   2415
   End
   Begin VB.Image imgUnavailable 
      Height          =   2655
      Left            =   2400
      Picture         =   "HIDE2.frx":4E13
      Stretch         =   -1  'True
      Top             =   0
      Width           =   2415
   End
End
Attribute VB_Name = "frmHide2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
