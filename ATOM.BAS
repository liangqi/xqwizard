Attribute VB_Name = "mdlAtom"
Option Explicit

Public Declare Function VarPtr Lib "ATOM.DLL" Alias "_Lea@4" (ByRef lp As Any) As Long
Public Declare Function CvBStr Lib "ATOM.DLL" Alias "_Lea@4" (ByVal lp As String) As Long
Public Declare Function CvInt Lib "ATOM.DLL" Alias "_WordPtr@4" (ByRef lpw As Any) As Integer
Public Declare Function CvLng Lib "ATOM.DLL" Alias "_DWordPtr@4" (ByRef lpdw As Any) As Long
Public Declare Function CvCur Lib "ATOM.DLL" Alias "_QWordPtr@4" (ByRef lpqw As Any) As Currency
Public Declare Function CvSng Lib "ATOM.DLL" Alias "_Real4Ptr@4" (ByRef lpsf As Any) As Single
Public Declare Function CvDbl Lib "ATOM.DLL" Alias "_Real8Ptr@4" (ByRef lpdf As Any) As Double
Public Declare Function CvI Lib "ATOM.DLL" Alias "_WordPtr@4" (ByVal lpw As String) As Integer
Public Declare Function CvL Lib "ATOM.DLL" Alias "_DWordPtr@4" (ByVal lpdw As String) As Long
Public Declare Function CvC Lib "ATOM.DLL" Alias "_QWordPtr@4" (ByVal lpqw As String) As Currency
Public Declare Function CvS Lib "ATOM.DLL" Alias "_Real4Ptr@4" (ByVal lpsf As String) As Single
Public Declare Function CvD Lib "ATOM.DLL" Alias "_Real8Ptr@4" (ByVal lpdf As String) As Double
Public Declare Sub MkInt Lib "ATOM.DLL" Alias "_MovWordPtr@8" (ByRef lpw As Any, ByVal w As Integer)
Public Declare Sub MkLng Lib "ATOM.DLL" Alias "_MovDWordPtr@8" (ByRef lpdw As Any, ByVal dw As Long)
Public Declare Sub MkCur Lib "ATOM.DLL" Alias "_MovQWordPtr@12" (ByRef lpqw As Any, ByVal qw As Currency)
Public Declare Sub MkSng Lib "ATOM.DLL" Alias "_MovDWordPtr@8" (ByRef lpdw As Any, ByVal dw As Single)
Public Declare Sub MkDbl Lib "ATOM.DLL" Alias "_MovQWordPtr@12" (ByRef lpqw As Any, ByVal qw As Double)
Public Declare Function StrAlloc Lib "ATOM.DLL" Alias "_StrAlloc@4" (ByVal lpsz As String) As Long
Public Declare Sub StrFree Lib "ATOM.DLL" Alias "_StrFree@4" (ByVal lpsz As Long)

Private Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal lpsz As Long) As Long
Private Declare Function SysAllocStringByteLen Lib "OLEAUT32.DLL" (ByVal lpsz As Long, ByVal dwLen As Long) As String

Public Function MkI(ByVal w As Integer) As String

MkI = SysAllocStringByteLen(VarPtr(w), 2)

End Function

Public Function MkL(ByVal dw As Long) As String

MkL = SysAllocStringByteLen(VarPtr(dw), 4)

End Function

Public Function MkC(ByVal qw As Currency) As String

MkC = SysAllocStringByteLen(VarPtr(qw), 8)

End Function

Public Function MkS(ByVal sf As Single) As String

MkS = SysAllocStringByteLen(VarPtr(sf), 4)

End Function

Public Function MkD(ByVal df As Double) As String

MkD = SysAllocStringByteLen(VarPtr(df), 8)

End Function

Public Function MkBStr(ByVal lpsz As Long) As String

MkBStr = SysAllocStringByteLen(lpsz, lstrlenA(lpsz))

End Function
