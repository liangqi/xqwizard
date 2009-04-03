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
      Location        =   ""
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

Private Declare Function LoadLibraryA Lib "KERNEL32.DLL" (ByVal szLibFileName As String) As Long
Private Declare Sub FreeLibraryA Lib "KERNEL32.DLL" Alias "FreeLibrary" (ByVal hMod As Long)
Private Declare Function GetProcAddressA Lib "KERNEL32.DLL" Alias "GetProcAddress" (ByVal hMod As Long, ByVal szProcName As String) As Long
Private Declare Function CallProcA Lib "CALLPROC.DLL" Alias "_CallProc@12" (ByVal lpProc As Long, ByVal dwParamLen As Long, ByRef lpcParams As Long) As Long

Private Const GWL_STYLE As Long = -16

Private Const WS_MAXIMIZEBOX    As Long = &H10000
Private Const WS_MINIMIZEBOX    As Long = &H20000
Private Const WS_THICKFRAME     As Long = &H40000
Private Const WS_SYSMENU        As Long = &H80000
Private Const WS_CAPTION        As Long = &HC00000
Private Const WS_VISIBLE        As Long = &H10000000

Private Const SWP_FRAMECHANGED  As Long = &H20
Private Const SWP_NOZORDER      As Long = 4

Private oParam As Object, wbc As New WBCustomizer

Private Sub Form_Load()

wbc.EnableAllAccelerators = False
wbc.EnableContextMenus = False
Set wbc.WebBrowser = WebBrowser

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

' === Begin of DLL Function Call ===

Public Function LoadLibrary(ByVal szLibFileName As String) As Long

LoadLibrary = LoadLibraryA(szLibFileName)

End Function

Public Sub FreeLibrary(ByVal hMod As Long)

FreeLibraryA hMod

End Sub

Public Function GetProcAddress(ByVal hMod As Long, ByVal szProcName As String) As Long

GetProcAddress = GetProcAddressA(hMod, szProcName)

End Function

Public Function CallProc(ByVal lpProc As Long, ByVal arrParam As Object) As Long

Dim i As Integer, nParams As Integer, item As Variant
nParams = arrParam.length
ReDim dwParams(0 To nParams - 1) As Long
For i = 0 To nParams - 1
    On Error GoTo lnError
    item = CallByName(WebBrowser.Document.parentWindow.Browser, "__get__", VbMethod, arrParam, i)
    Select Case VarType(item)
    Case vbLong
        dwParams(i) = item
    Case vbBoolean
        dwParams(i) = IIf(item, 1, 0)
    Case vbString
        dwParams(i) = CvBStr(item)
    Case Else
        dwParams(i) = 0
    End Select
Next
CallProc = CallProcA(lpProc, nParams * 4, dwParams(0))
Erase dwParams
Exit Function

lnError:
MsgBox "Cannot call ""Browser.__get__()"" !", vbExclamation, """CallProc()"" Error"
On Error GoTo 0

End Function

' === End of DLL Function Call ===
