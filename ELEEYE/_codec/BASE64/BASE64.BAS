Attribute VB_Name = "mdlBase64"
Public Declare Sub Base64Enc Lib "BASE64.DLL" Alias "_Base64Enc@16" (ByVal lpText As Long, ByVal lpData As Long, ByVal nBlockLen As Long, ByVal nLineLen As Long)
Public Declare Function Base64Dec Lib "BASE64.DLL" Alias "_Base64Dec@8" (ByVal lpData As Long, ByVal lpText As Long) As Long
