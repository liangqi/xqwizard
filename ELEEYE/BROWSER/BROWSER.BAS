Attribute VB_Name = "mdlBrowser"
Option Explicit

Public Declare Function MessageBoxA Lib "USER32.DLL" (ByVal hWnd As Long, ByVal szText As String, ByVal szCaption As String, ByVal dwType As Long) As Long

Private App_bRunning As Boolean

Public Sub Main()

Dim szPath As String
szPath = App.Path
szPath = szPath + IIf(Right(szPath, 1) = "\", "", "\")

Dim newForm As New frmBrowser
newForm.WebBrowser.Navigate2 szPath + "DEFAULT.HTM"
newForm.Show

App_bRunning = True
Do While App_bRunning
    Sleep 1
    DoEvents
    If Forms.Count = 0 Then
        App_bRunning = False
    End If
Loop

End Sub
