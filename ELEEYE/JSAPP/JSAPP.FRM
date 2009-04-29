VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Begin VB.Form frmJsApp 
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
Attribute VB_Name = "frmJsApp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub Sleep Lib "KERNEL32.DLL" (ByVal dwMilliseconds As Long)
Private Declare Function HeapAlloc Lib "KERNEL32.DLL" (ByVal hHeap As Long, dwFlags As Long, dwBytes As Long) As Long
Private Declare Sub HeapFree Lib "KERNEL32.DLL" (ByVal hHeap As Long, dwFlags As Long, lpMem As Long)
Private Declare Function LoadLibraryA Lib "KERNEL32.DLL" (ByVal szLibFileName As String) As Long
Private Declare Function GetProcAddressA Lib "KERNEL32.DLL" Alias "GetProcAddress" _
        (ByVal hMod As Long, ByVal szProcName As String) As Long
Private Declare Sub RtlMoveMemory Lib "KERNEL32.DLL" (ByVal lpDst As Long, ByVal lpSrc As Long, ByVal dwCount As Long)
Private Declare Sub RtlMoveMemory2 Lib "KERNEL32.DLL" Alias "RtlMoveMemory" (ByVal lpDst As Long, ByVal szSrc As String, ByVal dwCount As Long)
Private Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal lpcsz As Long) As Long
Private Declare Function lstrlenA2 Lib "KERNEL32.DLL" Alias "lstrlenA" (ByVal sz As String) As Long
Private Declare Function SysAllocStringByteLen Lib "OLEAUT32.DLL" (ByVal lpcsz As Long, ByVal dwLen As Long) As String
Private Declare Function Assign Lib "MSVBVM60.DLL" Alias "VarPtr" (ByVal dw As Long) As Long

Private Declare Function CallProcA Lib "CALLPROC.DLL" Alias "_CallProc@12" _
        (ByVal lpProc As Long, ByVal lpcParams As Long, ByVal dwParamLen As Long) As Long

Public Param As Object

Private Sub Form_Unload(nCancel As Integer)

Dim bAllow As Boolean
bAllow = True
On Error Resume Next
bAllow = WebBrowser.Document.parentWindow.VB_Unload(0)
On Error GoTo 0
nCancel = IIf(bAllow, 0, 1)

End Sub

Private Sub Form_Resize()

If WindowState <> vbMinimized Then
    WebBrowser.Width = ScaleWidth
    WebBrowser.Height = ScaleHeight
End If
On Error Resume Next
WebBrowser.Document.parentWindow.VB_Resize
On Error GoTo 0

End Sub

Private Sub WebBrowser_DocumentComplete(ByVal pDisp As Object, URL As Variant)

pDisp.Document.parentWindow.eval "VB = {}"
Set pDisp.Document.parentWindow.VB = Me
On Error Resume Next
pDisp.Document.parentWindow.JS.initJS
On Error GoTo 0

End Sub

Private Sub MenuItem_Click(nIndex As Integer)

On Error Resume Next
WebBrowser.Document.parentWindow.VB_ClickMenu nIndex
On Error GoTo 0

End Sub

Public Function NewInstance(Optional ByVal oParam As Object = Nothing) As frmJsApp

Set NewInstance = New frmJsApp
Set NewInstance.Param = oParam

End Function

Public Sub Resize(ByVal nClientWidth As Long, ByVal nClientHeight As Long)

If WindowState = vbMinimized Then
    Exit Sub
End If
Width = Width + (nClientWidth - ScaleWidth) * Screen.TwipsPerPixelX
Height = Height + (nClientHeight - ScaleHeight) * Screen.TwipsPerPixelY

End Sub

Public Property Get Global_() As Object

Set Global_ = App_oGlobal

End Property

Public Property Let Global_(ByVal obj As Object)

Set App_oGlobal = obj

End Property

Public Property Get Error(Optional ByVal dummy As Variant) As Variant

Error = dummy

End Property

Public Property Get GenericCallback() As Long

GenericCallback = Assign(AddressOf mdlJsApp.GenericCallback)

End Property

' === Begin Visual Basic Routines ===

Public Function GetObjAddress(ByVal obj As Object) As Long

GetObjAddress = ObjPtr(obj)

End Function

Public Sub Load(ByVal obj As Object)

VB.Load obj

End Sub

Public Sub Unload(ByVal obj As Object)

VB.Unload obj

End Sub

Public Sub Idle()

Sleep 1
DoEvents

End Sub

Public Function LoadPicture(ByVal szFileName As String) As StdPicture

Set LoadPicture = VB.LoadPicture(szFileName)

End Function

Public Function GetSetting(ByVal szAppName As String, ByVal szSection As String, _
        ByVal szKey As String, Optional ByVal szDefault As String) As String

Interaction.GetSetting szAppName, szSection, szKey, szDefault

End Function

Public Sub SaveSetting(ByVal szAppName As String, ByVal szSection As String, _
        ByVal szKey As String, ByVal szSetting As String)

Interaction.SaveSetting szAppName, szSection, szKey, szSetting

End Sub

Public Function GetAllSettings(ByVal szAppName As String, ByVal szSection As String) As Object

Dim arrSettings As Variant, i As Integer, sz As String
arrSettings = Interaction.GetAllSettings(szAppName, szSection)
sz = "({"
For i = LBound(arrSettings, 1) To UBound(arrSettings, 1)
    sz = sz + arrSettings(i, 0) + ":""" + arrSettings(i, 1) + """" + ", "
Next
Mid(sz, Len(sz) - 1, 2) = "})"
Set GetAllSettings = WebBrowser.Document.parentWindow.eval(sz)

End Function

Public Sub DeleteSetting(ByVal szAppName As String, _
        Optional ByVal szSection As String, Optional ByVal szKey As String)

Interaction.DeleteSetting szAppName, szSection, szKey

End Sub

' === End Visual Basic Routines ===

' === Begin Buffer Manipulation Routines ===

Public Sub MemCpy(ByVal lpDst As Long, ByVal lpSrc As Long, ByVal dwCount As Long)

RtlMoveMemory lpDst, lpSrc, dwCount

End Sub

Public Function GetMem1(ByVal lpuc As Long) As Byte

Dim uc As Integer
RtlMoveMemory VarPtr(uc), lpuc, 1
GetMem1 = uc

End Function

Public Function GetMem2(ByVal lpw As Long) As Integer

Dim w As Integer
RtlMoveMemory VarPtr(w), lpw, 2
GetMem2 = w

End Function

Public Function GetMem4(ByVal lpdw As Long) As Long

Dim dw As Long
RtlMoveMemory VarPtr(dw), lpdw, 4
GetMem4 = dw

End Function

Public Sub PutMem1(ByVal lpuc As Long, ByVal uc As Byte)

RtlMoveMemory lpuc, VarPtr(uc), 1

End Sub

Public Sub PutMem2(ByVal lpw As Long, ByVal w As Integer)

RtlMoveMemory lpw, VarPtr(w), 2

End Sub

Public Sub PutMem4(ByVal lpdw As Long, ByVal dw As Long)

RtlMoveMemory lpdw, VarPtr(dw), 4

End Sub

Public Function GetStr(ByVal lpcsz As Long) As String

GetStr = SysAllocStringByteLen(lpcsz, lstrlenA(lpcsz))

End Function

Public Function PutStr(ByVal lp As Long, ByVal sz As String) As Long

Dim nLen As Long
nLen = lstrlenA2(sz) + 1
RtlMoveMemory2 lp, sz, nLen
PutStr = nLen

End Function

Public Function Alloc(ByVal dwSize As Long) As Long

Alloc = HeapAlloc(App_hProcessHeap, 0, dwSize)

End Function

Public Function AllocStr(ByVal sz As String) As Long

Dim lp As Long, nLen As Long
nLen = lstrlenA2(sz) + 1
lp = Alloc(nLen)
RtlMoveMemory2 lp, sz, nLen
AllocStr = lp

End Function

Public Sub Free(ByVal lp As Long)

HeapFree App_hProcessHeap, 0, lp

End Sub

' === End Buffer Manipulation Routines ===

' === Begin Win32 API Call Routines ===

Public Function LoadLibrary(ByVal szLibFileName As String) As Long

LoadLibrary = LoadLibraryA(szLibFileName)

End Function

Public Function GetProcAddress(ByVal hMod As Long, ByVal szProcName As String) As Long

GetProcAddress = GetProcAddressA(hMod, szProcName)

End Function

Public Function CallProc(ByVal lpProc As Long, ByVal lpcParams As Long, ByVal dwParamLen As Long) As Long

CallProc = CallProcA(lpProc, lpcParams, dwParamLen)

End Function

' === End Win32 API Call Routines ===
