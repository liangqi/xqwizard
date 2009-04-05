Attribute VB_Name = "mdlBrowser"
Option Explicit

Private Declare Sub Sleep Lib "KERNEL32.DLL" (ByVal dwMilliseconds As Long)
Private Declare Function SetWindowsHookExA Lib "USER32.DLL" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hMod As Long, ByVal dwThreadId As Long) As Long
Private Declare Function CallNextHookEx Lib "USER32.DLL" (ByVal hhk As Long, ByVal iCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Sub UnhookWindowsHookEx Lib "USER32.DLL" (ByVal hhk As Long)
Private Declare Function GetKeyState Lib "USER32.DLL" (ByVal nVirtKey As Long) As Integer

Private Const WH_KEYBOARD As Long = 2
Private Const VK_CONTROL As Long = &H11

Private App_bRunning As Boolean, hhkPrev As Long

Public Sub Main()

Dim szPath As String
szPath = App.Path
szPath = szPath + IIf(Right(szPath, 1) = "\", "", "\")

Dim newForm As New frmBrowser
Set newForm.Param = Nothing
newForm.WebBrowser.Navigate2 szPath + "DEFAULT.HTM"
newForm.Show

hhkPrev = SetWindowsHookExA(WH_KEYBOARD, AddressOf NewKeyboardProc, App.hInstance, 0)

App_bRunning = True
Do While App_bRunning
    Sleep 1
    DoEvents
    If Forms.Count = 0 Then
        App_bRunning = False
    End If
Loop

UnhookWindowsHookEx hhkPrev

End Sub

Public Function NewKeyboardProc(ByVal iCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

If iCode < 0 Then
    NewKeyboardProc = CallNextHookEx(hhkPrev, iCode, wParam, lParam)
    Exit Function
End If
If (lParam And &H80000000) = 0 Then
    If wParam = vbKeyF5 Then
        NewKeyboardProc = 1
        Exit Function
    End If
    If GetKeyState(VK_CONTROL) < 0 Then
        If wParam = vbKeyN Or wParam = vbKeyP Or wParam = vbKeyR Then
            NewKeyboardProc = 1
            Exit Function
        End If
    End If
End If
NewKeyboardProc = CallNextHookEx(hhkPrev, iCode, wParam, lParam)

End Function
