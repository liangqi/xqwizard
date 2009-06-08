<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=gb_2312-80">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>用户列表 - 象棋巫师用户中心</title>
</head>

<body bgcolor="#3869B6" topmargin="0" leftmargin="0"
bottommargin="0" rightmargin="0">

<table border="0" cellpadding="8" cellspacing="0" width="100%">
    <tr>
        <td>　</td>
        <td width="750" bgcolor="#FFFFFF"><table border="0"
        width="100%">
            <tr>
                <td colspan="3" background="../images/topbg.gif"><table
                border="0" width="100%">
                    <tr>
                        <td valign="bottom" nowrap><table
                        border="0">
                            <tr>
                                <td nowrap><img src="../images/wizard.jpg"
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
                                <td><p align="right"><img
                                src="../images/elephantbase.gif" width="88"
                                height="31"></p>
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
                <td width="50%" background="../images/headerbg.gif"><font
                size="3"><strong>用户列表</strong></font></td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  require_once "../mysql_conf.php";
  require_once "./admin.php";

  $username = $_POST["username"];

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $sql = sprintf("SELECT * FROM {$mysql_tablepre}user WHERE username like '%%%s%%'",
      mysql_real_escape_string($username));
  $result = mysql_query($sql);
  $line = mysql_fetch_assoc($result);
  if ($line) {
    echo "<table border=\"1\">";
    $th0 = "<th><font size=\"2\">";
    $th1 = "</font></th>";
    $th10 = $th1 . $th0;
    echo "<tr>{$th0}用户名{$th10}Email{$th10}成绩{$th10}点数{$th10}&nbsp;{$th1}</tr>";
    $td0 = "<td align=\"center\"><font size=\"2\">&nbsp;";
    $td1 = "&nbsp;</font></td>";
    $td10 = $td1 . $td0;
    while ($line) {
      echo sprintf("<tr>{$td0}%s{$td10}%s{$td10}%d{$td10}%d{$td10}" .
          "<a href=\"edituser.php?username=%s\" target=\"_blank\">编辑</a>{$td1}</tr>",
          htmlentities($line["username"], ENT_COMPAT, "GB2312"),
          htmlentities($line["email"], ENT_COMPAT, "GB2312"),
          $line["scores"], $line["points"], urlencode($line["username"]));
      $line = mysql_fetch_assoc($result);
    }
    echo "</table>";
  } else {
    echo "<font size=\"2\" color=\"red\">没有找到用户</font>";
  }
  mysql_close();
?><!--webbot
                bot="HTMLMarkup" endspan --></p>
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
