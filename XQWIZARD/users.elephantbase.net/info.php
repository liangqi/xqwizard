<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=gb_2312-80">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>用户信息 - 象棋巫师用户中心</title>
</head>

<body bgcolor="#3869B6" topmargin="0" leftmargin="0"
bottommargin="0" rightmargin="0">

<table border="0" cellpadding="8" cellspacing="0" width="100%">
    <tr>
        <td>　</td>
        <td width="750" bgcolor="#FFFFFF"><table border="0"
        width="100%">
            <tr>
                <td colspan="3" background="topbg.gif"><table
                border="0" width="100%">
                    <tr>
                        <td valign="bottom" nowrap><table
                        border="0">
                            <tr>
                                <td nowrap><img src="wizard.jpg"
                                width="64" height="64"><font
                                color="#FFFFFF" size="6"
                                face="黑体">象棋巫师用户中心</font></td>
                            </tr>
                        </table>
                        </td>
                        <td align="right" valign="bottom"><table
                        border="0">
                            <tr>
                                <td><p align="right"><font
                                size="5">　　</font></p>
                                </td>
                            </tr>
                            <tr>
                                <td><p align="right"><a
                                target="_blank"><img
                                src="elephantbase.gif" width="88"
                                height="31"></a></p>
                                </td>
                            </tr>
                            <tr>
                                <td><p align="right"><font
                                color="#FFFFFF" size="2"
                                face="Arial"><strong>www.elephantbase.net</strong></font></p>
                                </td>
                            </tr>
                        </table>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">　</td>
            </tr>
        </table>
        <table border="0" cellpadding="4" width="100%">
            <tr>
                <td width="50%" background="headerbg.gif"><table
                border="0" cellpadding="0" cellspacing="0"
                width="100%">
                    <tr>
                        <td><strong><!--webbot bot="HTMLMarkup"
                        startspan --><?php
  session_start();
  session_register("userdata");
  if (!isset($_SESSION["userdata"])) {
    header("Location: login.htm#timeout");
    exit;
  }
  echo htmlentities($userdata["username"]);
?><!--webbot
                        bot="HTMLMarkup" endspan -->，您好！</strong></td>
                        <td><p align="right"><a href="logout.php"><font
                        size="2">【注销】</font></a></p>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  echo $userdata["info"];
?><!--webbot
                bot="HTMLMarkup" endspan --></p>
                </td>
            </tr>
            <tr>
                <td id="admin"><p align="center"><font size="2">如果您是管理员，请进入</font><a
                href="admin.htm" target="_blank"><font size="2">【管理】</font></a><font
                size="2">页面</font></p>
                </td>
            </tr>
            <tr>
                <td width="50%" background="headerbg.gif"><font
                size="3"><strong>更改用户信息</strong></font></td>
            </tr>
            <tr>
                <td align="center"><form action="updateinfo.php"
                method="POST" id="frm">
                    <table border="0">
                        <tr>
                            <td align="right"><font size="2">原密码：</font></td>
                            <td align="right">　</td>
                            <td><input type="password" size="20"
                            name="password0"></td>
                        </tr>
                        <tr>
                            <td>　</td>
                            <td>　</td>
                            <td><font size="2">如需更改密码，必须先输入原密码</font></td>
                        </tr>
                        <tr>
                            <td align="right"><font size="2">新密码：</font></td>
                            <td align="right">　</td>
                            <td><input type="password" size="20"
                            name="password"></td>
                        </tr>
                        <tr>
                            <td align="right"><font size="2">确认新密码：</font></td>
                            <td align="right">　</td>
                            <td><input type="password" size="20"
                            name="password2"></td>
                        </tr>
                        <tr>
                            <td align="right">　</td>
                            <td align="right">　</td>
                            <td><font size="2">至少6个字符，建议用字母、数字和符号的组合</font></td>
                        </tr>
                        <tr>
                            <td align="right"><font size="2">Email：</font></td>
                            <td align="right">　</td>
                            <td><input type="text" size="20"
                            name="email" id="email"></td>
                        </tr>
                        <tr>
                            <td>　</td>
                            <td align="right">　</td>
                            <td><font size="2">该邮箱是您找回密码的重要途径，建议填写</font></td>
                        </tr>
                    </table>
                    <p><input type="submit" name="B1"
                    value="提交"><script language="JavaScript"><!--
frm.email.value = "<?php echo $userdata['email']; ?>";
admin.style.display = "<?php echo $userdata['usertype'] == 128 ? 'block' : 'none' ; ?>";
// --></script></p>
                </form>
                </td>
            </tr>
            <tr>
                <td><p align="right"><a
                href="http://www.elephantbase.net/"
                target="_blank"><font color="#000060" size="2">版权所有</font><font
                color="#000060">&copy;</font><font
                color="#000060" size="2" face="Times New Roman">2004-2009
                </font><font color="#000060" size="2">象棋百科全书</font></a><font
                color="#000060" size="2"> </font><a
                href="http://www.miibeian.gov.cn/"
                target="_blank"><font color="#000060" size="2">沪</font><font
                color="#000060" size="2" face="Times New Roman">ICP</font><font
                color="#000060" size="2">备</font><font
                color="#000060" size="2" face="Times New Roman">05047724</font></a></p>
                </td>
            </tr>
        </table>
        </td>
        <td>　</td>
    </tr>
</table>
</body>
</html>
