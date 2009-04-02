VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmBrowser 
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   4680
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser WebBrowser 
      Height          =   3255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4695
      ExtentX         =   8281
      ExtentY         =   5741
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
      Location        =   "http:///"
   End
   Begin VB.Menu Menu 
      Caption         =   ""
      Visible         =   0   'False
      Begin VB.Menu MenuItem 
         Caption         =   ""
         Index           =   0
      End
   End
End
Attribute VB_Name = "frmBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Const GWL_STYLE As Long = -16

Private Const WS_MAXIMIZEBOX    As Long = &H10000
Private Const WS_MINIMIZEBOX    As Long = &H20000
Private Const WS_THICKFRAME     As Long = &H40000
Private Const WS_SYSMENU        As Long = &H80000
Private Const WS_CAPTION        As Long = &HC00000
Private Const WS_VISIBLE        As Long = &H10000000

Private Const SWP_FRAMECHANGED  As Long = &H20
Private Const SWP_NOZORDER      As Long = 4

Private oParam As Object, dwStyle As Long

Private Sub Form_Load()

WebBrowser.hWnd

End Sub

Private Sub Form_Resize()

If WindowState = vbMinimized Then
    Exit Sub
End If
WebBrowser.Width = ScaleWidth
WebBrowser.Height = ScaleHeight

End Sub

Private Sub WebBrowser_DocumentComplete(ByVal pDisp As Object, URL As Variant)

CallByName WebBrowser.Document.parentWindow, "eval", VbMethod, "Form = {}"
Set WebBrowser.Document.parentWindow.Form = Me
On Error Resume Next
CallByName WebBrowser.Document.parentWindow.Browser, "__init__", VbMethod
CallByName WebBrowser.Document.parentWindow, "main", VbMethod
On Error GoTo 0

End Sub

Private Sub MenuItem_Click(nIndex As Integer)

On Error Resume Next
CallByName WebBrowser.Document.parentWindow.Browser, "__clickMenu__", VbMethod, nIndex
On Error GoTo 0

End Sub

Public Function NewInstance() As frmBrowser

Set NewInstance = New frmBrowser

End Function

Public Sub Load(ByVal obj As Object)

VB.Load obj

End Sub

Public Sub Unload(ByVal obj As Object)

VB.Unload obj

End Sub

Public Sub SetStyle(ByVal dwStyle As Long)

Select Case dwStyle
Case vbBSNone
    SetWindowLongA hWnd, GWL_STYLE, WS_THICKFRAME + WS_VISIBLE
Case vbFixedSingle
    SetWindowLongA hWnd, GWL_STYLE, WS_MINIMIZEBOX + WS_SYSMENU + WS_CAPTION + WS_VISIBLE
Case vbSizable
    SetWindowLongA hWnd, GWL_STYLE, WS_MINIMIZEBOX + WS_MAXIMIZEBOX + WS_SYSMENU + WS_CAPTION + WS_THICKFRAME + WS_VISIBLE
Case vbFixedDialog
    SetWindowLongA hWnd, GWL_STYLE, WS_SYSMENU + WS_CAPTION + WS_VISIBLE
End Select
SetWindowPos hWnd, 0, 0, 0, 0, 0, SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_FRAMECHANGED

End Sub

Public Property Get Param() As Object

Set Param = oParam

End Property

Public Property Let Param(ByVal obj As Object)

Set oParam = obj

End Property

Public Property Get App() As Object

Set App = VB.App

End Property

Public Property Get Screen() As Object

Set Screen = VB.Screen

End Property

' === Begin of Windows API ===

Public Sub Sleep(ByVal dwMillis As Long)

mdlBase.Sleep dwMillis

End Sub

Public Function MessageBox(ByVal hWnd As Long, ByVal szText As String, ByVal szCaption As String, ByVal dwType As Long)

MessageBox = mdlBrowser.MessageBoxA(hWnd, szText, szCaption, dwType)

End Function

' === End of Windows API ===
