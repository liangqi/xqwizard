VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "登录"
   ClientHeight    =   1680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3240
   BeginProperty Font 
      Name            =   "宋体"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "LOGIN.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   3240
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin InetCtlsObjects.Inet Inet 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      RequestTimeout  =   10
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取消"
      Height          =   375
      Left            =   1800
      TabIndex        =   8
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton btnConfirm 
      Caption         =   "确定"
      Default         =   -1  'True
      Height          =   375
      Left            =   600
      TabIndex        =   7
      Top             =   1200
      Width           =   855
   End
   Begin VB.CheckBox chkRemember 
      Caption         =   "记住密码"
      Height          =   255
      Left            =   840
      TabIndex        =   6
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox txtPassword 
      Height          =   270
      IMEMode         =   3  'DISABLE
      Left            =   840
      PasswordChar    =   "*"
      TabIndex        =   4
      Top             =   480
      Width           =   1335
   End
   Begin VB.TextBox txtUserName 
      Height          =   270
      Left            =   840
      TabIndex        =   1
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label lblRegister 
      Caption         =   "注册帐号"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   2400
      MouseIcon       =   "LOGIN.frx":000C
      MousePointer    =   99  'Custom
      TabIndex        =   2
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lblUserName 
      Caption         =   "用户名:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lblGetPassword 
      Caption         =   "找回密码"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   2400
      MouseIcon       =   "LOGIN.frx":015E
      MousePointer    =   99  'Custom
      TabIndex        =   5
      Top             =   480
      Width           =   735
   End
   Begin VB.Label lblPassword 
      Caption         =   "　密码:"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   480
      Width           =   735
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' LOGIN.FRM - Source Code for XiangQi School of Witchcraft and Wizardry, Part IV
'
' XiangQi School of Witchcraft and Wizardry - a Chinese Chess Endgame Challenge Game
' Designed by Morning Yellow, Version: 4.79, Last Modified: Oct. 2010
' Copyright (C) 2004-2010 www.xqbase.com
'
' This program is free software; you can redistribute it and/or modify
' it under the terms of the GNU General Public License as published by
' the Free Software Foundation; either version 2 of the License, or
' (at your option) any later version.

' This program is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.

' You should have received a copy of the GNU General Public License along
' with this program; if not, write to the Free Software Foundation, Inc.,
' 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

Option Explicit

Private bActive As Boolean, bBusy As Boolean

Private Sub Form_Load()

Dim i As Integer
bActive = False
txtUserName.Text = Login_szUserName
txtPassword.Text = Login_szPassword
If Login_bRemember Then
    chkRemember.Value = 1
End If

If Options_nLanguage = LANGUAGE_ZH_CN Then
    Exit Sub
End If

Caption = "登錄"
Font.Charset = 136
Font.Name = "細明體"
On Error Resume Next
For i = 0 To Controls.Count - 1
    Controls(i).Font = Font
Next
On Error GoTo 0
lblRegister.Font.Underline = True
lblGetPassword.Font.Underline = True
lblUserName.Caption = "用戶名:"
lblPassword.Caption = "　密碼:"
chkRemember.Caption = "記住密碼"
lblRegister.Caption = "註冊帳號"
lblGetPassword.Caption = "找回密碼"
btnConfirm.Caption = "確定"
btnCancel.Caption = "取消"

End Sub

Private Sub Form_Activate()

If bActive Then
    Exit Sub
End If
bActive = True
If Login_nStatus = LOGIN_FIRST Then
    Login_nStatus = LOGIN_CANCELED
Else
    Login_nStatus = LOGIN_CANCELED
    BeginLogin
End If

End Sub

Private Sub Form_Unload(nCancel As Integer)

If bBusy Then
    nCancel = 1
End If

End Sub

Private Sub lblRegister_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=register", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub lblGetPassword_Click()

ShellExecuteA 0, vbNullString, "http://www.xqbase.com/users/?act=getpassword", _
        vbNullString, vbNullString, vbNormalFocus

End Sub

Private Sub Inet_StateChanged(ByVal nState As Integer)

Dim szResult As String, szPassword As String

If nState = icError Then
    EndLogin
    ConnError
    Login_nStatus = LOGIN_ERROR
    Unload Me
    Exit Sub
End If
If nState <> icResponseCompleted Then
    Exit Sub
End If

szPassword = Inet.GetHeader("Login-Cookie")
If Len(szPassword) = 32 Then
    Login_szPassword = szPassword
End If
EndLogin
Login_nStatus = LOGIN_ERROR
szResult = Inet.GetHeader("Login-Result")
Select Case szResult
Case "error"
    MsgBox L("用户名或密码不正确。", "用戶名或密碼不正確。"), vbExclamation
    Login_nStatus = LOGIN_CANCELED
    Exit Sub ' 不关闭登录窗口，让用户继续输入
Case "noretry"
    MsgBox L("您的密码已经连续5次输入错误，请过5分钟再做尝试。", _
            "您的密碼已經連續5次輸入錯誤，請過5分鐘再做嘗試。"), vbExclamation
Case "nosave"
    MsgBox L("您以前提交的成绩比当前成绩好，当前成绩不予提交。", _
            "您以前提交的成績比當前成績好，當前成績不予提交。"), vbInformation
Case "nopoints"
    MsgBox L("您的点数不足，补充点数后才能使用此功能。", "您的點數不足，補充點數後才能使用此功能。"), vbExclamation
    ShellExecuteA 0, vbNullString, "http://www.xqbase.com/xqwizard/charge.htm", _
            vbNullString, vbNullString, vbNormalFocus
Case "incorrrect"
    MsgBox L("存档码错误，请仔细核对手机上显示的8位存档码。", _
            "存檔碼錯誤，請仔細核對手機上顯示的8位存檔碼。"), vbExclamation
Case "trial"
    NoRegError L("您尚未获得手机版许可证，无法使用同步存档功能。" & vbCrLf & vbCrLf & "是否现在就去获得许可证？", _
            "您尚未獲得手機版許可證，無法使用同步存檔功能。" & vbCrLf & vbCrLf & "是否現在就去獲得許可證？")
Case "basic"
    NoRegError L("只有高级版许可证才能使用同步存档功能。" & vbCrLf & vbCrLf & "是否现在就把许可证升级到高级版？", _
            "只有高級版許可證才能使用同步存檔功能。" & vbCrLf & vbCrLf & "是否現在就把許可證升級到高級版？")
Case "noreg"
    NoRegError L("您的许可证尚未在手机上生效。" & vbCrLf & vbCrLf & "是否现在就去生效许可证？", _
            "您的許可證尚未在手機上生效。" & vbCrLf & vbCrLf & "是否現在就去生效許可證？")
Case "ok"
    Login_szResult = ""
    Login_nStatus = LOGIN_OK
Case Else
    If Left(szResult, 3) = "ok " Then
        Login_szResult = Mid(szResult, 4)
        Login_nStatus = LOGIN_OK
    Else
        ConnError
    End If
End Select
Unload Me

End Sub

Private Sub btnConfirm_Click()

If bBusy Then
    Exit Sub
End If
If txtUserName.Text = "" Or txtPassword.Text = "" Then
    MsgBox L("用户名和密码不能为空", "用戶名和密碼不能為空"), vbExclamation
Else
    Login_szUserName = txtUserName.Text
    Login_szPassword = txtPassword.Text
    Login_bRemember = chkRemember.Value = 1
    BeginLogin
End If

End Sub

Private Sub btnCancel_Click()

Unload Me

End Sub

' 登录开始(禁止输入)
Private Sub BeginLogin()

If Login_szUserName = "" Or Login_szPassword = "" Then
    Exit Sub
End If

bBusy = True
Caption = L("正在获取数据，请稍等……", "正在獲取數據，請稍等……")
txtUserName.Enabled = False
txtPassword.Enabled = False
chkRemember.Enabled = False
btnConfirm.Enabled = False
btnCancel.Enabled = False
On Error GoTo lnError
Inet.Execute XQAPP_URL & Login_szAct, "POST", "stage=" & Gui_nCurr, _
        "Content-Type: application/x-www-form-urlencoded" & vbCrLf & _
        "Login-UserName: " & Login_szUserName & vbCrLf & _
        "Login-Password: " & Login_szPassword & vbCrLf & _
        "Login-Charset: " & L("GBK", "BIG5") & vbCrLf
On Error GoTo 0

Exit Sub
lnError:
On Error GoTo 0
EndLogin
ConnError
Login_nStatus = LOGIN_ERROR
Unload Me

End Sub

' 登录结束(允许输入)
Private Sub EndLogin()

bBusy = False
Caption = L("登录", "登錄")
txtUserName.Enabled = True
txtPassword.Enabled = True
chkRemember.Enabled = True
btnConfirm.Enabled = True
btnCancel.Enabled = True

End Sub
