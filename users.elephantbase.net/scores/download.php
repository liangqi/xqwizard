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
                <td background="../images/headerbg.gif"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  require_once "../user.php";

  $fid = $_GET["fid"];
  $uid = $userdata->$uid;

  $mysql_link = new MysqlLink;

  // 先确认棋谱有没有被下载
  $sql = sprintf("SELECT * FROM " . MYSQL_TABLEPRE . "download WHERE fid = %d AND uid = %d", $fid, $uid);
  $result = $mysql_link->query($sql);
  $line = mysql_fetch_assoc($result);
  $payed = false;
  if ($line) {
    $payed = true;
  }

  // 获取棋谱信息
  $sql = sprintf("SELECT u.uid, username, title, catagory, size, price, eventtime, download, positive, negative " .
      "FROM " . MYSQL_TABLEPRE . "upload u LEFT JOIN " . UC_DBTABLEPRE . "members USING (uid) " .
      "WHERE fid = %d AND state = 0", $fid);
  $result = $mysql_link->query($sql);
  $line = mysql_fetch_assoc($result);
  if (!$line) {
    $line = array("username"=>"-", "title"=>"-", "catagory"=>0, "size"=>0, "price"=>0, "eventtime"=>time(),
        "download"=>0, "positive"=>0, "negative"=>0);
  }

  echo "<font size=\"3\"><b>" . . "</b></font>"
?><!--webbot
                bot="HTMLMarkup" endspan --></td>
            </tr>
            <tr>
                <td align="center"><table border="0">
                    <tr>
                        <td align="right"><font size="2">上传时间：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo htmlentities($username, ENT_COMPAT, "GB2312"); ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">类型：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo htmlentities($email, ENT_COMPAT, "GB2312"); ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">标题：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["regip"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">提供者：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo date("Y-m-d H:i:s", $line["regdate"]); ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">大小：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["lastip"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">需要点数：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo date("Y-m-d H:i:s", $line["lasttime"]); ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">下载次数：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["score"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">好评：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["points"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --> <!--webbot
                        bot="HTMLMarkup" startspan --><a id="positive" href="#"><!--webbot
                        bot="HTMLMarkup" endspan --><img
                        src="positive.gif" width="17" height="16">给予好评<!--webbot
                        bot="HTMLMarkup" startspan --></a><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">差评：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["charged"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --> <!--webbot
                        bot="HTMLMarkup" startspan --><a id="negative" href="#"><!--webbot
                        bot="HTMLMarkup" endspan --><img
                        src="negative.gif" width="17" height="16">给予差评<!--webbot
                        bot="HTMLMarkup" startspan --></a><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td>　</td>
                        <td>　</td>
                        <td>　</td>
                    </tr>
                    <tr>
                        <td>　</td>
                        <td>　</td>
                        <td><!--webbot bot="HTMLMarkup"
                        startspan --><a id="downloadJar" href="#"><!--webbot
                        bot="HTMLMarkup" endspan --><font
                        size="2"><img src="download_jar.gif"
                        width="16" height="16">下载Jar文件<!--webbot
                        bot="HTMLMarkup" startspan --></a><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td>　</td>
                        <td>　</td>
                        <td><!--webbot bot="HTMLMarkup"
                        startspan --><a id="downloadJad" href="#"><!--webbot
                        bot="HTMLMarkup" endspan --><font
                        size="2"><img src="download_jad.gif"
                        width="16" height="16">下载Jad文件<!--webbot
                        bot="HTMLMarkup" startspan --></a><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td background="../images/headerbg.gif"><font
                size="3"><strong>评论</strong></font></td>
            </tr>
            <tr>
                <td align="center"><table border="0"
                cellpadding="4" cellspacing="1" bgcolor="#000000">
                    <tr>
                        <td bgcolor="#FFFFFF"><!--webbot
                        bot="HTMLMarkup" startspan --><?php
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
  $orderColumn = ($order == SCORE_ORDER_DOWNLOAD ? "download" :
      $order == SCORE_ORDER_POSITIVE ? "positive" : "eventtime");

  $sql = "SELECT fid, username, comments, eventtime FROM " . MYSQL_TABLEPRE . "download_comments u " .
      "LEFT JOIN " . UC_DBTABLEPRE . "members USING (uid) WHERE fid = %d ORDER BY eventtime DESC";
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
          "<a href=\"search.php?catagory=%d&order=%d&title=\" target=\"_blank\">%s</a>{$td10}" .
          "<a href=\"download.php?fid=%d\" target=\"_blank\"><b>%s</b></a>{$td10}" .
          "<a href=\"uploaduser.php?uid=%d\" target=\"_blank\">%s</a>{$td10}" .
          "%dK{$td10}%d{$td10}%d{$td10}%d{$td10}%d{$td1}</tr>",
          lapseTime($line["eventtime"]), $cat, $order, $score_catagory[$cat],
          $line["fid"], htmlentities($line["title"], ENT_COMPAT, "GB2312"),
          $uid, htmlentities($line["username"], ENT_COMPAT, "GB2312"),
          $line["size"], $line["price"], $line["download"], $line["positive"], $line["negative"]);
      $line = mysql_fetch_assoc($result);
    }
    echo "</table>";
  } else {
    echo warn("没有评论");
  }
?><!--webbot
                        bot="HTMLMarkup" endspan --></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td background="../images/headerbg.gif"><font
                size="3"><strong>我来评论</strong> </font><font
                size="2">(不要超过120字)</font></td>
            </tr>
            <tr>
                <td align="center"><form action="comments.php"
                method="POST">
                    <p><textarea name="comments" rows="5"
                    cols="50"></textarea></p>
                    <p><input type="submit" value="提交"></p>
                </form>
                </td>
            </tr>
            <tr>
                <td bgcolor="#E0E0E0"><p align="right"><script
                language="JavaScript"><!--
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
