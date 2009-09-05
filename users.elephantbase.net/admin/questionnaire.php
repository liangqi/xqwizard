<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=gb_2312-80">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>问卷调查报告 - 重置密码申请</title>
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
                size="3"><strong>问卷调查报告</strong></font></td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  require_once "./admin.php";

  $th0 = "<th><font size=\"2\">";
  $th1 = "</font></th>";
  $th10 = $th1 . $th0;
  $td0 = "<td align=\"center\"><font size=\"2\">";
  $td1 = "</font></td>";
  $td10 = $td1 . $td0;

  $mysql_link = new MysqlLink;

  echo "<table border=\"1\">";
  echo "<tr>{$th0}问题{$th10}选项{$th10}计数{$th1}</tr>";
  $sql = "SELECT qid, answer, COUNT(*) FROM {$mysql_tablepre}qn_answer " .
      "WHERE answer > 0 GROUP BY qid, answer ORDER BY qid, answer";
  $result = $mysql_link->query($sql);
  $line = mysql_fetch_assoc($result);
  while ($line) {
    echo sprintf("<tr>{$td0}%d{$td10}%d{$td10}%d{$td1}</tr>",
        $line["qid"], $line["answer"], $line["COUNT(*)"]);
    $line = mysql_fetch_assoc($result);
  }
  echo "</table>";
?><!--webbot
                bot="HTMLMarkup" endspan --></p>
                </td>
            </tr>
            <tr>
                <td background="../images/headerbg.gif"><font
                size="3"><strong>评论</strong></font></td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  echo "<table border=\"1\">";
  echo "<tr>{$th0}IP地址{$th10}时间{$th10}评论{$th1}</tr>";
  $sql = "SELECT eventip, eventtime, comments FROM {$mysql_tablepre}qn_comments " .
      "LEFT JOIN {$mysql_tablepre}qn_user USING (uid)";
  $result = $mysql_link->query($sql);
  $line = mysql_fetch_assoc($result);
  while ($line) {
    echo sprintf("<tr>{$td0}%s{$td10}%s{$td10}%s{$td1}</tr>",
        $line["eventip"], date("Y-m-d H:i:s", $line["eventtime"]),
        htmlentities($line["comments"], ENT_COMPAT, "GB2312"));
    $line = mysql_fetch_assoc($result);
  }
  echo "</table>";

  $mysql_link->close();
?><!--webbot
                bot="HTMLMarkup" endspan --></p>
                </td>
            </tr>
            <tr>
                <td background="../images/headerbg.gif"><font
                size="3"><strong>清空问卷调查</strong></font></td>
            </tr>
            <tr>
                <td align="center"><form
                action="questionnaire_clear.php" method="POST">
                    <p><font size="2">确认密码：<input
                    type="password" size="20" name="password"></font></p>
                    <p><input type="submit" value="提交"></p>
                </form>
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
