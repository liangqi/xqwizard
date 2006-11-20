Attribute VB_Name = "mdlURL"
Option Explicit

Public Type UrlType
    szProto As String
    szHost  As String
    nPort   As Long
    szFile  As String
    szLabel As String
End Type


Public Function UrlEncode(ByVal sz As String) As String

Dim szReturn As String, szChar As String
Dim i As Integer, nAscii As Integer

szReturn = ""
For i = 1 To Len(sz)
    szChar = Mid(sz, i, 1)
    Select Case szChar
    Case " "
        szReturn = szReturn + "+"
    Case "*", ".", "-", "0" To "9", "@", "A" To "Z", "_", "a" To "z"
        szReturn = szReturn + szChar
    Case Else
        nAscii = Asc(szChar)
        If nAscii < 0 Then
            szReturn = szReturn + "%" + Left(Hex(nAscii), 2) + "%" + Right(Hex(nAscii), 2)
        Else
            szReturn = szReturn + "%" + Mid(Hex(&H100 + nAscii), 2, 2)
        End If
    End Select
Next
UrlEncode = szReturn

End Function

Public Function UrlDecode(ByVal sz As String) As String

Dim szReturn As String, szChar As String
Dim i As Integer

szReturn = ""
For i = 1 To Len(sz)
    szChar = Mid(sz, i, 1)
    Select Case szChar
    Case "+"
        szReturn = szReturn + " "
    Case "%"
        szChar = Mid(sz, i + 1, 2)
        If szChar < "80" Then
            szReturn = szReturn + Chr(Val("&H" + szChar))
            i = i + 2
        Else
            szChar = szChar + Mid(sz, i + 4, 2)
            szReturn = szReturn + Chr(Val("&H" + szChar))
            i = i + 5
        End If
    Case Else
        szReturn = szReturn + szChar
    End Select
Next
UrlDecode = szReturn

End Function

Public Sub ParseUrl(ByRef url As UrlType, ByVal szUrl As String)

Dim n As Integer, sz As String, df As Double

n = InStr(szUrl, ":")
If n = 0 Then
    url.szProto = "http"
Else
    url.szProto = LCase(Left(szUrl, n - 1))
End If
Do While Mid(szUrl, n + 1, 1) = "/"
    n = n + 1
Loop
sz = Mid(szUrl, n + 1)

n = InStr(sz, "#")
If n = 0 Then
    url.szLabel = ""
Else
    url.szLabel = Mid(sz, n + 1)
    sz = Left(sz, n - 1)
End If

n = InStr(sz, "/")
If n = 0 Then
    url.szFile = ""
Else
    url.szFile = Mid(sz, n + 1)
    If Right(url.szFile, 1) = "/" Then
        url.szFile = Left(url.szFile, Len(url.szFile) - 1)
    End If
    sz = Left(sz, n - 1)
End If

n = InStr(sz, ":")
If n = 0 Then
    url.nPort = 80
    url.szHost = LCase(sz)
Else
    df = Val(Mid(sz, n + 1))
    url.nPort = IIf(df < 0.5 Or df >= 65535.5, 80, sz)
    url.szHost = LCase(Left(sz, n - 1))
End If

End Sub

Public Function UrlString(ByRef url As UrlType) As String

UrlString = url.szProto + "://" + url.szHost + IIf(url.szProto = "http" And url.nPort = 80, "", ":" + LTrim(Str(url.nPort))) + "/" + url.szFile + "#" + url.szLabel

End Function
