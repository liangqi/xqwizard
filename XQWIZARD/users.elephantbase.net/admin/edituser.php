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
                <td colspan="3" background="../images/topbg.gif"><table
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
                <td colspan="3">　</td>
            </tr>
        </table>
        <table border="0" cellpadding="4" cellspacing="0"
        width="100%" bgcolor="#F0F0F0">
            <tr>
                <td background="../images/headerbg.gif"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  require_once "../mysql_conf.php";
  require_once "../common.php";
  require_once "./admin.php";

  $username = $_GET["username"];

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $sql = sprintf("SELECT * FROM {$mysql_tablepre}user WHERE username = '%s'",
      mysql_real_escape_string($username));
  $result = mysql_query($sql);
  $line = mysql_fetch_assoc($result);
  if (!$line) {
    header("Location: close.htm#" . "用户[" . $username . "]不存在");
    mysql_close();
    exit;
  }

  $act = $_GET["act"];
  if (false) {
    //
  } else if ($act == "charge") {
    // 补充点数
    $charge = intval($_POST["charge"]);
    if ($charge > 0) {
      $sql = sprintf("UPDATE {$mysql_tablepre}user SET points = points + %d WHERE username = '%s'",
          $charge, mysql_real_escape_string($username));
      mysql_query($sql);
      insertLog($username, EVENT_ADMIN_CHARGE, $charge);
      $info = info(sprintf("用户 %s 已充值 %d 点", $username, $charge));
      $line["points"] += $charge;
    } else {
      $info = warn("充值点数必须大于0");
    }
  } else if ($act == "reset") {
    // 重置密码
    $password = $_POST["password"];
    if (strlen($password) <6) {
      $info = warn("密码不能少于6个字符");
    } else {
      $sql = sprintf("UPDATE {$mysql_tablepre}user SET password = '%s' WHERE username = '%s'",
          md5($username . $_POST["password"]), mysql_real_escape_string($username));
      mysql_query($sql);
      insertLog($username, EVENT_ADMIN_PASSWORD);
      $info = info("密码已更新");
    }
  } else if ($act == "delete") {
    // 删除帐号
    $sql = sprintf("SELECT password FROM {$mysql_tablepre}user WHERE username = '%s'",
        mysql_real_escape_string($username));
    $result = mysql_query($sql);
    $line2 = mysql_fetch_assoc($result);
    if ($line2 && $line2["password"] == md5($username . $_POST["password2"])) {
      $sql = sprintf("DELETE FROM {$mysql_tablepre}user WHERE username = '%s'",
          mysql_real_escape_string($username));
      mysql_query($sql);
      insertLog($username, EVENT_ADMIN_DELETE);
      header("Location: close.htm#" . "用户[" . $username . "]已被删除");
      mysql_close();
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
                        bot="HTMLMarkup" startspan --><?php echo htmlentities($line["email"], ENT_COMPAT, "GB2312"); ?><!--webbot
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
                        bot="HTMLMarkup" startspan --><?php echo date("Y-m-d H:i:s", $line["regtime"]); ?><!--webbot
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
                </table>
                </td>
            </tr>
            <tr>
                <td><p align="center"><!--webbot
                bot="HTMLMarkup" startspan --><?php
  echo $info;
  mysql_close();
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
                align="left"><strong>重置密码<script
                language="JavaScript"><!--
function sendmail() {
  var username = "<?php echo $username; ?>";
  var email = "<?php echo $email; ?>";
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
  location.href = "mailto:webmaster@elephantbase.net?subject=重置密码 - 来自象棋巫师用户中心&body=" + arrBody.join("%0D%0A");
}
// --></script></strong></p>
                </td>
            </tr>
            <tr>
                <td align="center"><form method="POST"
                id="frmReset">
                    <table border="0">
                        <tr>
                            <td><font size="2">重置密码：</font></td>
                            <td><font size="2"><input type="text"
                            size="20" name="password"
                            id="password"></font></td>
                        </tr>
                        <tr>
                            <td>　</td>
                            <td><a href="#" onclick="sendmail()"><font
                            size="2">给用户发送Email</font></a></td>
                        </tr>
                    </table>
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
