' STARTUP.VB - Source Code for XiangQi Wizard Light, Part III
'
' XiangQi Wizard Light - a Chinese Chess Program for Windows CE
' Designed by Morning Yellow, Version: 1.0, Last Modified: Nov. 2007
' Copyright (C) 2004-2007 www.elephantbase.net
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

Public Class StartUp
    Inherits System.Windows.Forms.Form
    Friend WithEvents btnStart As System.Windows.Forms.Button
    Friend WithEvents btnExit As System.Windows.Forms.Button

#Region " Windows 窗体设计器生成的代码 "

    Public Sub New()

        MyBase.New()

        '该调用是 Windows 窗体设计器所必需的。
        InitializeComponent()

        '在 InitializeComponent() 调用之后添加任何初始化
        optRed.Checked = True
        optHandicap.SelectedIndex = 0
        optLevel.SelectedIndex = 0

    End Sub

    '窗体重写 dispose 以清理组件列表。
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        MyBase.Dispose(disposing)
    End Sub

    '注意: 以下过程是 Windows 窗体设计器所必需的
    '可以使用 Windows 窗体设计器修改此过程。
    '不要使用代码编辑器修改它。
    Friend WithEvents optHandicap As System.Windows.Forms.ComboBox
    Friend WithEvents lblHandicap As System.Windows.Forms.Label
    Friend WithEvents optRed As System.Windows.Forms.RadioButton
    Friend WithEvents optBlack As System.Windows.Forms.RadioButton
    Friend WithEvents lblPlayer As System.Windows.Forms.Label
    Friend WithEvents optLevel As System.Windows.Forms.ComboBox
    Friend WithEvents lblLevel As System.Windows.Forms.Label
    Friend WithEvents btnAbout As System.Windows.Forms.Button
    Private Sub InitializeComponent()
        Me.btnStart = New System.Windows.Forms.Button
        Me.btnExit = New System.Windows.Forms.Button
        Me.optHandicap = New System.Windows.Forms.ComboBox
        Me.lblHandicap = New System.Windows.Forms.Label
        Me.lblLevel = New System.Windows.Forms.Label
        Me.optRed = New System.Windows.Forms.RadioButton
        Me.optBlack = New System.Windows.Forms.RadioButton
        Me.lblPlayer = New System.Windows.Forms.Label
        Me.optLevel = New System.Windows.Forms.ComboBox
        Me.btnAbout = New System.Windows.Forms.Button
        '
        'btnStart
        '
        Me.btnStart.Location = New System.Drawing.Point(16, 144)
        Me.btnStart.Size = New System.Drawing.Size(56, 24)
        Me.btnStart.Text = "开始"
        '
        'btnExit
        '
        Me.btnExit.Location = New System.Drawing.Point(80, 144)
        Me.btnExit.Size = New System.Drawing.Size(56, 24)
        Me.btnExit.Text = "退出"
        '
        'optHandicap
        '
        Me.optHandicap.Items.Add("不让子")
        Me.optHandicap.Items.Add("让单马")
        Me.optHandicap.Items.Add("让双马")
        Me.optHandicap.Items.Add("让九子")
        Me.optHandicap.Location = New System.Drawing.Point(72, 88)
        Me.optHandicap.Size = New System.Drawing.Size(64, 20)
        '
        'lblHandicap
        '
        Me.lblHandicap.Location = New System.Drawing.Point(16, 88)
        Me.lblHandicap.Size = New System.Drawing.Size(56, 16)
        Me.lblHandicap.Text = "先走让子"
        '
        'lblLevel
        '
        Me.lblLevel.Location = New System.Drawing.Point(16, 112)
        Me.lblLevel.Size = New System.Drawing.Size(56, 16)
        Me.lblLevel.Text = "电脑水平"
        '
        'optRed
        '
        Me.optRed.Location = New System.Drawing.Point(64, 40)
        Me.optRed.Size = New System.Drawing.Size(64, 24)
        Me.optRed.Text = "我先走"
        '
        'optBlack
        '
        Me.optBlack.Location = New System.Drawing.Point(64, 64)
        Me.optBlack.Size = New System.Drawing.Size(72, 24)
        Me.optBlack.Text = "电脑先走"
        '
        'lblPlayer
        '
        Me.lblPlayer.Location = New System.Drawing.Point(16, 48)
        Me.lblPlayer.Size = New System.Drawing.Size(48, 16)
        Me.lblPlayer.Text = "谁先走"
        '
        'optLevel
        '
        Me.optLevel.Items.Add("入门")
        Me.optLevel.Items.Add("业余")
        Me.optLevel.Items.Add("专业")
        Me.optLevel.Location = New System.Drawing.Point(72, 112)
        Me.optLevel.Size = New System.Drawing.Size(64, 20)
        '
        'btnAbout
        '
        Me.btnAbout.Location = New System.Drawing.Point(16, 8)
        Me.btnAbout.Size = New System.Drawing.Size(120, 24)
        Me.btnAbout.Text = "关于""象棋小巫师"""
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        '
        'StartUp
        '
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.ClientSize = New System.Drawing.Size(154, 175)
        Me.Controls.Add(Me.btnAbout)
        Me.Controls.Add(Me.lblPlayer)
        Me.Controls.Add(Me.optRed)
        Me.Controls.Add(Me.optBlack)
        Me.Controls.Add(Me.lblHandicap)
        Me.Controls.Add(Me.optHandicap)
        Me.Controls.Add(Me.lblLevel)
        Me.Controls.Add(Me.optLevel)
        Me.Controls.Add(Me.btnStart)
        Me.Controls.Add(Me.btnExit)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Text = "开始 - 象棋小巫师"

    End Sub
#End Region
    Private Sub btnStart_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnStart.Click
        App_bExit = False
        Me.Close()
    End Sub

    Private Sub btnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExit.Click
        App_bExit = True
        Me.Close()
    End Sub

    Private Sub frmStartUp_Closed(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Closed
        App_bFlipped = optBlack.Checked
        App_nHandicap = optHandicap.SelectedIndex
        App_nLevel = optLevel.SelectedIndex
    End Sub

    Private Sub btnAbout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAbout.Click
        MsgBox("象棋小巫师 1.0" + vbCrLf + "象棋百科全书 荣誉出品" + vbCrLf + vbCrLf + _
                "欢迎登录 www.elephantbase.net" + vbCrLf + "免费下载PC版 象棋巫师" + vbCrLf, MsgBoxStyle.Information, "关于象棋小巫师")
    End Sub
End Class
