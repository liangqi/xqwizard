VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmBrowser 
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   4680
   ScaleHeight     =   213
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   312
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
      RegisterAsDropTarget=   1
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
Private Declare Sub RtlMoveMemory Lib "KERNEL32.DLL" (ByVal lpDst As Long, ByVal lpSrc As Long, ByVal dwCount As Long)
Private Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal lpsz As Long) As Long
Private Declare Function SysAllocStringByteLen Lib "OLEAUT32.DLL" (ByVal lpsz As Long, ByVal dwLen As Long) As String

Private Declare Function StrDupA Lib "BASE.DLL" Alias "_StrDup@4" (ByVal lpcsz As String) As Long
Private Declare Function AllocA Lib "BASE.DLL" Alias "_Alloc@4" (ByVal dwSize As Long) As Long
Private Declare Sub FreeA Lib "BASE.DLL" Alias "_Free@4" (ByVal lp As Long)
Private Declare Function CallProcA Lib "BASE.DLL" Alias "_CallProc@12" (ByVal lpProc As Long, ByVal lpcParams As Long, ByVal dwParamLen As Long) As Long

Public Param As Object

Private Sub Form_Resize()

If WindowState = vbMinimized Then
    Exit Sub
End If
WebBrowser.Width = ScaleWidth
WebBrowser.Height = ScaleHeight

End Sub

Private Sub WebBrowser_DocumentComplete(ByVal pDisp As Object, URL As Variant)

WebBrowser.Document.parentWindow.eval "Form = {}"
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

Public Function NewInstance(Optional ByVal oParam As Object = Nothing) As frmBrowser

Set NewInstance = New frmBrowser
Set NewInstance.Param = oParam

End Function

' === Begin Visual Basic Routines ===

Public Sub Load(ByVal obj As Object)

VB.Load obj

End Sub

Public Sub Unload(ByVal obj As Object)

VB.Unload obj

End Sub

Public Function GetSetting(ByVal szAppName As String, ByVal szSection As String, _
        ByVal szKey As String, Optional ByVal szDefault As String) As String

Interaction.GetSetting szAppName, szSection, szKey, szDefault

End Function

Public Sub SaveSetting(ByVal szAppName As String, ByVal szSection As String, _
        ByVal szKey As String, ByVal szSetting As String)

Interaction.SaveSetting szAppName, szSection, szKey, szSetting

End Sub

Public Sub DeleteSetting(ByVal szAppName As String, _
        Optional ByVal szSection As String, Optional ByVal szKey As String)

Interaction.DeleteSetting szAppName, szSection, szKey

End Sub

' === End Visual Basic Routines ===

' === Begin Buffer Manipulation Routines ===

Public Sub MemCpy(ByVal lpDst As Long, ByVal lpSrc As Long, ByVal dwCount As Long)

RtlMoveMemory lpDst, lpSrc, dwCount

End Sub

Public Function GetMem4(ByVal lpdw As Long) As Long

Dim dw As Long
RtlMoveMemory VarPtr(dw), lpdw, 4
GetMem4 = dw

End Function

Public Sub PutMem4(ByVal lpdw As Long, ByVal dw As Long)

RtlMoveMemory lpdw, VarPtr(dw), 4

End Sub

Public Function GetStr(ByVal lpsz As Long) As String

GetStr = SysAllocStringByteLen(lpsz, lstrlenA(lpsz))

End Function

Public Function StrDup(ByVal sz As String) As Long

StrDup = StrDupA(sz)

End Function

Public Function Alloc(ByVal dwSize As Long) As Long

Alloc = AllocA(dwSize)

End Function

Public Sub Free(ByVal lp As Long)

FreeA lp

End Sub

' === End Buffer Manipulation Routines ===

' === Begin Win32 API Call Routines ===

Public Function LoadLibrary(ByVal szLibFileName As String) As Long

LoadLibrary = LoadLibraryA(szLibFileName)

End Function

Public Sub FreeLibrary(ByVal hMod As Long)

FreeLibraryA hMod

End Sub

Public Function GetProcAddress(ByVal hMod As Long, ByVal szProcName As String) As Long

GetProcAddress = GetProcAddressA(hMod, szProcName)

End Function

Public Function CallProc(ByVal lpProc As Long, ByVal lpcParams As Long, ByVal dwParamLen As Long) As Long

CallProc = CallProcA(lpProc, lpcParams, dwParamLen)

End Function

' === End Win32 API Call Routines ===
