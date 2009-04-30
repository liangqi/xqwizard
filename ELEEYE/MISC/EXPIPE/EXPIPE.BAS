Attribute VB_Name = "mdlExPipe"
Option Explicit

Sub Main()

Dim lpsz As Long, sz As String, pipe As PipeStruct
StdioOpen
PipeOpen pipe
Do
    lpsz = PipeLineInput(pipe)
    If lpsz = 0 Then
        Sleep 1
    Else
        sz = SysAllocString(lpsz)
        If sz = "" Then
            Exit Do
        Else
            PipeLineOutput pipe, sz
        End If
    End If
Loop
StdioClose

End Sub
