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
                <td width="50%" background="headerbg.gif"><strong>[<!--webbot
                bot="HTMLMarkup" startspan --><?php
  session_start();
  session_register("userdata");
  $userdata = $_SESSION["userdata"];
  if (!isset($userdata["username"])) {
    header("Location: login.htm#error");
    exit();
  }
  echo $userdata["username"];
?><!--webbot
                bot="HTMLMarkup" endspan --></strong><font
                size="3"><strong>]，</strong></font><strong>您好！</strong></td>
            </tr>
            <tr>
                <td><p align="center">您已经闯到第<!--webbot
                bot="HTMLMarkup" startspan --><?php
  echo $userdata["scores"];
?><!--webbot
                bot="HTMLMarkup" endspan -->关</p>
                </td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  echo "<font color=\"red\">……</font>";
?><!--webbot
                bot="HTMLMarkup" endspan --></p>
                </td>
            </tr>
            <tr>
                <td width="50%" background="headerbg.gif"><font
                size="3"><strong>更改用户信息</strong></font></td>
            </tr>
            <tr>
                <td align="center"><form method="POST" id="frm">
                    <table border="0">
                        <tr>
                            <td align="right"><font size="2">新密码：</font></td>
                            <td align="right">　</td>
                            <td><input type="password" size="21"
                            name="password"></td>
                        </tr>
                        <tr>
                            <td>　</td>
                            <td>　</td>
                            <td><font size="2">如不需要更改密码，则此处置空</font></td>
                        </tr>
                        <tr>
                            <td align="right"><font size="2">确认新密码：</font></td>
                            <td align="right">　</td>
                            <td><input type="password" size="21"
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
// --></script></p>
                </form>
                </td>
            </tr>
        </table>
        </td>
        <td>　</td>
    </tr>
</table>
</body>
</html>
