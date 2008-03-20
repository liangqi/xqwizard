Attribute VB_Name = "mdlDumpHex"
Public Declare Sub DumpHex Lib "DUMPHEX.DLL" Alias "_DumpHexA@16" (ByVal lpText As Long, ByVal lpData As Long, ByVal nOffset As Long, ByVal nBlockLen As Long, ByVal nLength As Long)
