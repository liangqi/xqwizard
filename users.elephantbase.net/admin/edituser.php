<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=gb_2312-80">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>编辑用户 - 象棋巫师用户中心</title>
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
                <td background="../images/headerbg.gif"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  require_once "./admin.php";

  $username = $_GET["username"];

  $mysql_link = new MysqlLink;
  $sql = sprintf("SELECT u.uid, username, email, regip, regdate, lastip, lasttime, score, points, charged " .
        "FROM " . UC_DBTABLEPRE . "members u LEFT JOIN " . MYSQL_TABLEPRE . "user USING (uid) " .
        "WHERE username = '%s' AND score IS NOT NULL", $mysql_link->escape($username));
  $result = $mysql_link->query($sql);
  $line = mysql_fetch_assoc($result);
  if (!$line) {
    header("Location: close.htm#用户[" . $username . "]不存在");
    $mysql_link->close();
    exit;
  }

  $uid = $line["uid"];
  $email = $line["email"];
  $act = $_GET["act"];
  if (false) {
    //
  } else if ($act == "charge") {
    // 补充点数
    $charge = intval($_POST["charge"]);
    if ($charge > 0) {
      $sql = sprintf("UPDATE " . MYSQL_TABLEPRE . "user SET points = points + %d, charged = charged + %d " .
          "WHERE uid = '%s'", $charge, $charge, $uid);
      $mysql_link->query($sql);
      insertLog($uid, EVENT_ADMIN_CHARGE, $charge);
      $line["points"] += $charge;
      $line["charged"] += $charge;
      $info = info(sprintf("用户 %s 已充值 %d 点，请把以下文本发送给用户：", $username, $charge)) .
          "<font size=\"2\"><p align=\"left\">" . sprintf("我们已为您的象棋巫师帐号[%s]充值%d点",
          htmlentities($username, ENT_COMPAT, "GB2312"), $charge) .
          ($line["charged"] < USER_PLATINUM ? "" : "，并升级为白金会员(提示和悔棋不扣点)") . "。<br>" .
          sprintf("目前您的帐号共有%d点可用，", $line["points"]) .
          "请用象棋巫师魔法学校“用户中心/查询点数”功能查收。<br>" .
          "有任何问题、意见和建议请及时与我们联系，感谢您对象棋巫师的支持。</p></font>";
    } else {
      $info = warn("充值点数必须大于0");
    }
  } else if ($act == "reset") {
    // 重置密码
    $password = $_POST["password"];
    if (strlen($password) <6) {
      $info = warn("密码不能少于6个字符");
    } else {
      uc_user_edit($username , "", $password, $email, true);
      insertLog($uid, EVENT_ADMIN_PASSWORD);
      $info = info("密码已更新");
    }
  } else if ($act == "delete") {
    // 删除帐号
    $password = $_POST["password2"];
    list($uid) = uc_user_login($username, $password);
    if ($uid > 0) {
      uc_user_delete($uid);
      $sql = sprintf("DELETE FROM " . MYSQL_TABLEPRE . "user WHERE uid = %d", $uid);
      $mysql_link->query($sql);
      insertLog($uid, EVENT_ADMIN_DELETE);
      header("Location: close.htm#用户[" . $username . "]已被删除");
      $mysql_link->close();
      exit;
    } else {
      $info = warn("密码错误，删除用户失败");
    }
  } else {
    $info = "";
  }
?><!--webbot
                bot="HTMLMarkup" endspan --><strong>详细信息</strong></td>
            </tr>
            <tr>
                <td align="center"><table border="0">
                    <tr>
                        <td align="right"><font size="2">用户名：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo htmlentities($username, ENT_COMPAT, "GB2312"); ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">Email：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo htmlentities($email, ENT_COMPAT, "GB2312"); ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">注册IP：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["regip"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">注册时间：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo date("Y-m-d H:i:s", $line["regdate"]); ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">上次登录IP：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["lastip"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">上次登录时间：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo date("Y-m-d H:i:s", $line["lasttime"]); ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">成绩：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["score"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">点数：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["points"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                    <tr>
                        <td align="right"><font size="2">充值：</font></td>
                        <td align="right">　</td>
                        <td><font size="2"><!--webbot
                        bot="HTMLMarkup" startspan --><?php echo $line["charged"]; ?><!--webbot
                        bot="HTMLMarkup" endspan --></font></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  echo $info;
  $mysql_link->close();
?><!--webbot
                bot="HTMLMarkup" endspan --></p>
                </td>
            </tr>
            <tr>
                <td background="../images/headerbg.gif"><p
                align="left"><strong>补充点数</strong></p>
                </td>
            </tr>
            <tr>
                <td align="center"><form method="POST"
                id="frmCharge">
                    <p><font size="2">补充点数：<input
                    type="text" size="20" name="charge"></font></p>
                    <p><input type="submit" value="提交"></p>
                </form>
                </td>
            </tr>
            <tr>
                <td background="../images/headerbg.gif"><p
                align="left"><strong>重置密码</strong></p>
                </td>
            </tr>
            <tr>
                <td align="center"><form method="POST"
                id="frmReset">
                    <p><font size="2">重置密码：<input
                    type="text" size="20" name="password"
                    id="password"></font></p>
                    <p><input type="submit" value="提交"></p>
                </form>
                </td>
            </tr>
            <tr>
                <td background="../images/headerbg.gif"><strong>删除帐号</strong></td>
            </tr>
            <tr>
                <td align="center"><form method="POST"
                id="frmDelete">
                    <p><font size="2">确认密码：<input
                    type="password" size="20" name="password2"></font></p>
                    <p><input type="submit" value="提交"></p>
                </form>
                </td>
            </tr>
            <tr>
                <td bgcolor="#E0E0E0"><p align="right"><script
                language="JavaScript"><!--
var action = "edituser.php?username=<?php echo urlencode($username); ?>&act=";
frmCharge.action = action + "charge";
frmReset.action = action + "reset";
frmDelete.action = action + "delete";
// --></script> <a
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
