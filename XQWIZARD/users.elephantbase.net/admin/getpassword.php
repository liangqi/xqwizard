<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=gb_2312-80">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>用户列表 - 重置密码申请</title>
</head>

<body bgcolor="#3869B6" topmargin="0" leftmargin="0"
bottommargin="0" rightmargin="0">

<table border="0" cellpadding="8" cellspacing="0" width="100%">
    <tr>
        <td>　</td>
        <td width="750" bgcolor="#FFFFFF"><table border="0"
        cellspacing="0" width="100%">
            <tr>
                <td background="../images/topbg.gif"><table
                border="0" width="100%">
                    <tr>
                        <td valign="bottom" nowrap><table
                        border="0">
                            <tr>
                                <td nowrap><img
                                src="../images/wizard.jpg"
                                width="64" height="64"><!--webbot
                                bot="HTMLMarkup" startspan -->&nbsp;<!--webbot
                                bot="HTMLMarkup" endspan --><font
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
                                <td><p align="right"><img
                                src="../images/elephantbase.gif"
                                width="88" height="31"></p>
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
                <td>　</td>
            </tr>
        </table>
        <table border="0" cellpadding="4" cellspacing="0"
        width="100%" bgcolor="#F0F0F0">
            <tr>
                <td background="../images/headerbg.gif"><font
                size="3"><strong>重置密码申请<script
                language="JavaScript"><!--
function sendmail(username, email) {
  var arrBody = [];
  arrBody.push(username + "，您好！");
  arrBody.push("");
  arrBody.push("　　您的密码已被重置为：" + frmReset.password.value);
  arrBody.push("　　请用此密码登录到象棋巫师用户中心：");
  arrBody.push("　　　　http://users.elephantbase.net/login.htm");
  arrBody.push("　　登录成功后请马上把密码改掉。");
  arrBody.push("");
  arrBody.push("　　感谢您使用象棋巫师。");
  arrBody.push("");
  arrBody.push("象棋巫师用户中心");
  location.href = "mailto:" + email + "?subject=重置密码 - 来自象棋巫师用户中心&body=" + arrBody.join("%0D%0A");
}
// --></script></strong></font></td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  require_once "./admin.php";

  $mysql_link = new MysqlLink;

  $username = $_GET["username"];
  if ($username) {
    $sql = sprintf("DELETE FROM {$mysql_tablepre}password WHERE username = '%s'",
        $mysql_link->escape($username));
    $mysql_link->query($sql);
    echo "<font size=\"2\" color=\"blue\">用户 " .
        htmlentities($username, ENT_COMPAT, "GB2312") . " 的重置密码申请已删除</font><br>";
  }

  $result = $mysql_link->query("SELECT username, password FROM {$mysql_tablepre}password");
  $line = mysql_fetch_assoc($result);
  if ($line) {
    echo "<table border=\"1\">";
    $th0 = "<th><font size=\"2\">";
    $th1 = "</font></th>";
    $th10 = $th1 . $th0;
    echo "<tr>{$th0}用户名{$th10}密码{$th10}&nbsp;{$th10}&nbsp;{$th1}</tr>";
    $td0 = "<td align=\"center\"><font size=\"2\">&nbsp;";
    $td1 = "&nbsp;</font></td>";
    $td10 = $td1 . $td0;
    while ($line) {
      echo sprintf("<tr>{$td0}%s{$td10}%s{$td10}" .
          "<a href=\"#\" onclick=\"sendmail('%s', '%s')\">发送邮件</a>{$td1}</tr>",
          "<a href=\"getpassword.php?username=%s\" target=\"_blank\">删除申请</a>{$td1}</tr>",
          $mysql_link->escape($line["username"]), $line["password"],
          htmlentities($line["username"], ENT_COMPAT, "GB2312"),
          $line["password"], urlencode($line["username"]));
      $line = mysql_fetch_assoc($result);
    }
    echo "</table>";
  } else {
    echo "<font size=\"2\" color=\"red\">没有重置密码申请</font>";
  }
  $mysql_link->close();
?><!--webbot
                bot="HTMLMarkup" endspan --></p>
                </td>
            </tr>
            <tr>
                <td bgcolor="#E0E0E0"><p align="right"><a
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
