VERSION 5.00
Begin VB.Form frmStartUp 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   ClientHeight    =   6030
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5430
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "ËÎÌו"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ScaleHeight     =   6030
   ScaleWidth      =   5430
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Image imgStartUp 
      Height          =   6030
      Left            =   0
      Picture         =   "STARTUP.frx":0000
      Top             =   0
      Width           =   5430
   End
End
Attribute VB_Name = "frmStartUp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
