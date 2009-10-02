Attribute VB_Name = "mdlConv"
Option Explicit

Public Declare Sub ConvInit Lib "MXQFCONV.DLL" Alias "_Init@0" ()
Public Declare Sub Xqf2Pgn Lib "MXQFCONV.DLL" Alias "_Xqf2Pgn@8" (ByVal szXqfFile As String, ByVal szPgnFile As String)
Public Declare Sub Mxq2Pgn Lib "MXQFCONV.DLL" Alias "_Mxq2Pgn@8" (ByVal szMxqFile As String, ByVal szPgnFile As String)
Public Declare Sub Chn2Pgn Lib "MXQFCONV.DLL" Alias "_Chn2Pgn@8" (ByVal szChnFile As String, ByVal szPgnFile As String)
Public Declare Sub Che2Pgn Lib "MXQFCONV.DLL" Alias "_Che2Pgn@8" (ByVal szCheFile As String, ByVal szPgnFile As String)
Public Declare Sub Ccm2Pgn Lib "MXQFCONV.DLL" Alias "_Ccm2Pgn@8" (ByVal szCcmFile As String, ByVal szPgnFile As String)
Public Declare Sub Pgn2Xqf Lib "MXQFCONV.DLL" Alias "_Pgn2Xqf@8" (ByVal szPgnFile As String, ByVal szXqfFile As String)