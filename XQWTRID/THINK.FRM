VERSION 5.00
Begin VB.Form frmThinkList 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "深度 評价 思考路線"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   285
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "細明体"
      Size            =   9
      Charset         =   136
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "THINK.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtThinkList 
      Height          =   2175
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   0
      Width           =   3495
   End
End
Attribute VB_Name = "frmThinkList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' THINK.FRM - Source Code for XiangQi Wizard, Part VII
'
' XiangQi Wizard - a Chinese Chess Program (GUI for UCCI Engines)
' Designed by Morning Yellow, Version: 2.1, Last Modified: Mar. 2006
' Copyright (C) 2004-2006 www.elephantbase.net
'
' This program is free software; you can redistribute it and/or
' modify it under the terms of the GNU General Public License
' as published by the Free Software Foundation; either version 2
' of the License, or (at your option) any later version.
'
' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.
'
' You should have received a copy of the GNU General Public License
' along with this program; if not, write to the Free Software
' Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

Option Explicit

Private Sub Form_Load()

Me.Width = Gui_nThinkWidth
Me.Height = Gui_nThinkHeight
Me.Left = App_frmMain.Left + Gui_nThinkLeft
Me.Top = App_frmMain.Top + Gui_nThinkTop
App_lpMainPrev = SetWindowLongA(App_frmMain.hWnd, GWL_WNDPROC, AddressOf MainWindowProc)
App_lpThinkPrev = SetWindowLongA(Me.hWnd, GWL_WNDPROC, AddressOf ThinkWindowProc)

End Sub

Private Sub Form_Resize()

txtThinkList.Width = Me.Width - 105
txtThinkList.Height = Me.Height - 330

End Sub

Private Sub Form_UnLoad(nCancel As Integer)

SetWindowLongA Me.hWnd, GWL_WNDPROC, App_lpThinkPrev
SetWindowLongA App_frmMain.hWnd, GWL_WNDPROC, App_lpMainPrev
If Not (Engine_bRed Or Engine_bBlack) Then
    If Engine_nStatus > BUSY_WAIT Then
        Engine_nStatus = BUSY_WAIT
        StopEngine
    End If
    Engine_nStatus = IDLE_READY
End If
Gui_nThinkWidth = Me.Width
Gui_nThinkHeight = Me.Height
Engine_bAnalyze = False
App_frmMain.mnEngineAnalyze.Checked = False
App_frmMain.tlb.Buttons("EngineAnalyze").Value = tbrUnpressed

End Sub
