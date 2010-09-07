VERSION 5.00
Begin VB.Form frmStartup 
   BorderStyle     =   0  'None
   ClientHeight    =   4320
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7680
   BeginProperty Font 
      Name            =   "ËÎÌו"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "STARTUP.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4320
   ScaleWidth      =   7680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Image imgStartup 
      Height          =   4320
      Left            =   0
      Picture         =   "STARTUP.frx":000C
      Stretch         =   -1  'True
      Top             =   0
      Width           =   7680
   End
End
Attribute VB_Name = "frmStartup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
