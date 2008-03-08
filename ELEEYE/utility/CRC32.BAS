Attribute VB_Name = "mdlCrc32"
Public Declare Sub Crc32Init Lib "CRC32.DLL" Alias "_Crc32Init@0" ()
Public Declare Sub Crc32Reset Lib "CRC32.DLL" Alias "_Crc32Reset@4" (ByRef dwCrc32 As Long)
Public Declare Sub Crc32Update Lib "CRC32.DLL" Alias "_Crc32Update@12" (ByRef dwCrc32 As Long, ByVal lpsz As String, ByVal nLen As Long)
Public Declare Function Crc32Digest Lib "CRC32.DLL" Alias "_Crc32Digest@4" (ByRef dwCrc32 As Long) As Long

Private Declare Function lstrlenA Lib "KERNEL32.DLL" (ByVal lpsz As String) As Long

Private bInit As Boolean

Public Function Crc32Hex(ByVal sz As String) As String

Dim dwCrc32 As Long, szHex As String
If Not bInit Then
    Crc32Init
End If
Crc32Reset dwCrc32
Crc32Update dwCrc32, sz, lstrlenA(sz)
szHex = Hex(Crc32Digest(dwCrc32))
Crc32Hex = String(8 - Len(szHex), "0") + szHex

End Function
