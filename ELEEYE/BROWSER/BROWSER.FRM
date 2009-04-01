VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmBrowser 
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
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

Public Param As Object

Private Sub Form_Resize()

WebBrowser.Width = Width - 120
WebBrowser.Height = Height - 405

End Sub

Private Sub WebBrowser_DocumentComplete(ByVal pDisp As Object, URL As Variant)

CallByName WebBrowser.Document.parentWindow, "eval", VbMethod, "Form = {}"
Set WebBrowser.Document.parentWindow.Form = Me
On Error Resume Next
CallByName WebBrowser.Document.parentWindow, "main", VbMethod
On Error GoTo 0

End Sub

Private Sub MenuItem_Click(nIndex As Integer)

CallByName WebBrowser.Document.parentWindow, "onClickMenuItem", VbMethod, nIndex

End Sub

Public Function NewInstance(ByVal obj As Object) As frmBrowser

Set NewInstance = New frmBrowser
Set NewInstance.Param = obj

End Function

Public Sub Load(ByVal obj As Object)

VB.Load obj

End Sub

Public Sub Unload(ByVal obj As Object)

VB.Unload obj

End Sub

Public Property Get App() As Object

Set App = VB.App

End Property

Public Property Get GlobalMap() As Object

Set GlobalMap = App_oGlobal

End Property

Public Property Let GlobalMap(ByVal oGlobal As Object)

Set App_oGlobal = oGlobal

End Property
