Attribute VB_Name = "mdlBrowser"
Option Explicit

Public App_szPath As String, App_oGlobal As Object

Public Sub Main()

Dim Browser As New clsBrowser
Set App_oGlobal = Nothing
App_szPath = App.Path + IIf(Right(App.Path, 1) = "\", "", "\")
Browser.Load App_szPath + "DEFAULT.HTM"
Browser.Form.Show

End Sub
