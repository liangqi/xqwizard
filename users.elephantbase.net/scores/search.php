<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=gb_2312-80">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>棋谱列表 - 手机棋谱交流平台</title>
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
                                face="黑体">手机棋谱交流平台</font></td>
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
                <td background="../images/headerbg.gif"><table
                border="0" cellpadding="0" cellspacing="0"
                width="100%">
                    <tr>
                        <td><font size="3"><strong>棋谱列表</strong></font></td>
                        <td><p align="right"><font size="2">排序：<select
                        name="order" size="1" id="order"
                        onchange="changeOrder()">
                            <option selected value="1">最热门</option>
                            <option value="2">最受好评</option>
                            <option value="3">最近上传</option>
                        </select>　</font><a href="index.php"><font
                        size="2">【首页】</font></a></p>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td align="center"><table border="0"
                cellpadding="4" cellspacing="1" bgcolor="#000000">
                    <tr>
                        <td bgcolor="#FFFFFF"><!--webbot
                        bot="HTMLMarkup" startspan --><?php
  require_once "../common.php";

  $title = $_GET["title"];
  $catagory = $_GET["catagory"];
  $order = $_GET["order"];

  $mysql_link = new MysqlLink;

  $th0 = "<td align=\"center\" background=\"../images/headerbg.gif\" nowrap><font size=\"2\">";
  $th1 = "</font></td>";
  $th10 = $th1 . $th0;

  $cond = "";
  if ($title) {
    $cond .= sprintf("title LIKE '%%%s%%' AND ", $mysql_link->escape($title));
  }
  if ($catagory) {
    $cond .= sprintf("catagory = %d AND ", $catagory);
  }
  $orderColumn = ($order == 1 ? "download" : $order == 2 ? "positive" : "eventtime");

  $sql = "SELECT fid, u.uid, username, title, catagory, size, price, eventtime, download, positive, negative " .
      "FROM " . MYSQL_TABLEPRE . "upload u LEFT JOIN " . UC_DBTABLEPRE . "members USING (uid) " .
      "WHERE " . $cond . "state = 0 ORDER BY " . $orderColumn . " DESC LIMIT 10";
  $result = $mysql_link->query($sql);
  $gray = false;
  $line = mysql_fetch_assoc($result);
  if ($line) {
    echo "<table border=\"0\">";
    echo "<tr>{$th0}上传时间{$th10}类型{$th10}标题{$th10}提供者{$th10}" .
        "大小{$th10}点数{$th10}下载{$th10}顶{$th10}踩{$th1}</tr>";
    while ($line) {
      $gray = !$gray;
      $td0 = sprintf("<td align=\"center\" bgcolor=\"%s\" nowrap><font size=\"2\">",
          $gray ? "#F0F0F0" : "#E0E0E0");
      $td1 = "</font></td>";
      $td10 = $td1 . $td0;

      $uid = $line[MYSQL_TABLEPRE . "upload.uid"];
      $cat = $line["catagory"];
      echo sprintf("<tr>{$td0}%s{$td10}" .
          "<a href=\"catagory.php?catagory=%d\" target=\"_blank\">%s</a>{$td10}" .
          "<a href=\"download.php?fid=%d\" target=\"_blank\"><b>%s</b></a>{$td10}" .
          "<a href=\"uploaduser.php?uid=%d\" target=\"_blank\">%s</a>{$td10}" .
          "%d{$td10}%d{$td10}%d{$td10}%d{$td10}%d{$td1}</tr>",
          lapseTime($line["eventtime"]), $cat, $score_catagory[$cat],
          $line["fid"], htmlentities($line["title"], ENT_COMPAT, "GB2312"),
          $uid, htmlentities($line["username"], ENT_COMPAT, "GB2312"),
          $line["size"], $line["price"], $line["download"], $line["positive"], $line["negative"]);
      $line = mysql_fetch_assoc($result);
    }
    echo "</table>";
  } else {
    echo warn("没有找到棋谱");
  }
?><!--webbot
                        bot="HTMLMarkup" endspan --></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td background="../images/headerbg.gif"><font
                size="3"><strong>查询</strong></font></td>
            </tr>
            <tr>
                <td align="center"><form action="search.php"
                method="GET">
                    <table border="0">
                        <tr>
                            <td><font size="2">标题：</font></td>
                            <td>　</td>
                            <td><font size="2"><input type="text"
                            size="20" name="title"></font></td>
                        </tr>
                        <tr>
                            <td><font size="2">类型：</font></td>
                            <td>　</td>
                            <td><font size="2"><select
                            name="catagory" size="1">
                                <option selected value="0">全部</option>
                                <option value="1">全局</option>
                                <option value="2">开局</option>
                                <option value="3">中局</option>
                                <option value="4">残局</option>
                                <option value="5">排局</option>
                                <option value="6">比赛</option>
                                <option value="7">古谱</option>
                                <option value="8">教材</option>
                            </select></font></td>
                        </tr>
                        <tr>
                            <td><font size="2">排序：</font></td>
                            <td>　</td>
                            <td><font size="2"><select
                            name="order" size="1">
                                <option selected value="1">最热门</option>
                                <option value="2">最受好评</option>
                                <option value="3">最近上传</option>
                            </select></font></td>
                        </tr>
                    </table>
                    <p><input type="submit" value="提交"></p>
                </form>
                </td>
            </tr>
            <tr>
                <td bgcolor="#E0E0E0"><p align="right"><script
                language="JavaScript"><!--
var title = "<?php echo urlencode($title); ?>";
var catagory = <?php echo $catagory ? $catagory : 0; ?>;
order.value = <?php echo $order ? $order : 0; ?>;

function changeOrder() {
  location.href = "search.php?title=" + title + "&catagory=" + catagory + "&order=" + order.value;
}
// --></script><a
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
