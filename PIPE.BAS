Attribute VB_Name = "mdlPipe"
Option Explicit

Public Type PipeStruct
    hInput As Long
    hOutput As Long
    bConsole As Long
    nBytesLeft As Long
    nReadEnd As Long
    szBuffer(0 To 1023) As Byte
End Type

Public Declare Sub PipeOpen Lib "PIPE.DLL" Alias "_PipeOpen@8" (ByRef lppipe As PipeStruct, ByVal szProcFile As String)
Public Declare Sub PipeClose Lib "PIPE.DLL" Alias "_PipeClose@4" (ByRef lppipe As PipeStruct)
Public Declare Function PipeLineInput Lib "PIPE.DLL" Alias "_PipeLineInput@4" (ByRef lppipe As PipeStruct) As Long
Public Declare Sub PipeLineOutput Lib "PIPE.DLL" Alias "_PipeLineOutput@8" (ByRef lppipe As PipeStruct, ByVal szLineStr As String)
