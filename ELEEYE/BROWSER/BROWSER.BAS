Attribute VB_Name = "mdlBrowser"
Option Explicit

Public App_oGlobal As Object

Public Sub Main()

Set App_oGlobal = Nothing
Dim szPath As String
szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")

Dim newForm As New frmBrowser
newForm.WebBrowser.Navigate2 szPath + "DEFAULT.HTM"
newForm.Show

End Sub
