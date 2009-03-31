VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private frm As New frmBrowser

Public Sub Load(ByVal szFile As String)

Set frm.Browser = Me
frm.wb.Navigate2 szFile

End Sub

Public Sub SendMessage(ByVal o As Object)

CallByName frm.wb.Document.parentWindow, "onRecvMessage", VbMethod, o

End Sub

Public Sub CloseWindow()

MsgBox "CloseWindow"
Unload frm

End Sub

Public Property Get Path() As String

Path = App_szPath

End Property

Public Property Get Form() As frmBrowser

Set Form = frm

End Property

Public Property Get GlobalMap() As Object

Set GlobalMap = App_oGlobal

End Property

Public Property Let GlobalMap(ByVal oGlobal As Object)

Set App_oGlobal = oGlobal

End Property

Public Property Get Window()

Set Window = frm.wb.Document.parentWindow

End Property

Public Property Get Document()

Set Document = frm.wb.Document

End Property

Public Function NewInstance() As clsBrowser

Set NewInstance = New clsBrowser

End Function
