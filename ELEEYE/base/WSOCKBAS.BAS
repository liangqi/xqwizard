Attribute VB_Name = "mdlWinSockBasic"
Option Explicit

Public Const INVALID_SOCKET As Long = -1

Public Declare Sub WSBStartup Lib "WSOCKBAS.DLL" Alias "_WSBStartup@0" ()
Public Declare Sub WSBCleanup Lib "WSOCKBAS.DLL" Alias "_WSBCleanup@0" ()
Public Declare Function WSBOpenServer Lib "WSOCKBAS.DLL" Alias "_WSBOpenServer@4" (ByVal nPort As Long) As Long
Public Declare Sub WSBCloseServer Lib "WSOCKBAS.DLL" Alias "_WSBCloseServer@4" (ByVal nSocket As Long)
Public Declare Function WSBAccept Lib "WSOCKBAS.DLL" Alias "_WSBAccept@4" (ByVal nSocket As Long) As Long
Public Declare Function WSBConnect Lib "WSOCKBAS.DLL" Alias "_WSBConnect@8" (ByVal lpszHost As String, ByVal nPort As Long) As Long
Public Declare Sub WSBDisconnect Lib "WSOCKBAS.DLL" Alias "_WSBDisconnect@4" (ByVal nSocket As Long)
Public Declare Function WSBRecv Lib "WSOCKBAS.DLL" Alias "_WSBRecv@12" (ByVal nSocket As Long, ByVal lpBuffer As Long, ByVal nLen As Long) As Long
Public Declare Function WSBSend Lib "WSOCKBAS.DLL" Alias "_WSBSend@12" (ByVal nSocket As Long, ByVal lpBuffer As Long, ByVal nLen As Long) As Long
