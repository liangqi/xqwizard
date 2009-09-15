<?php
  require_once "./common.php";
  require_once "./ejewimage.php";

  $username = $_POST["username"];
  $email = $_POST["email"];
  $ejew = $_POST["ejew"];

  if ($ejew == $_SESSION["ejew_value"]) {
    $mysql_link = new MysqlLink;
    if ($data = uc_get_user($username)) {
      list($uid, $username, $email2) = $data;
      if ($email == $email2) {
        $password = substr(md5(mt_rand()), 0, 6);
        uc_user_edit($username, "", $password, "", true);
        insertLog($uid, EVENT_GETPASSWORD);
        $succ = sendMail($email, $username . "的密码已被重置",
            $username . "，您好！\r\n\r\n" .
            "　　您的密码已被重置为：" . $password . "\r\n" .
            "　　请用此密码登录到象棋巫师用户中心：\r\n" .
            "　　　　http://users.elephantbase.net/login.htm\r\n" .
            "　　登录成功后请马上把密码改掉。\r\n\r\n" .
            "　　感谢您使用象棋巫师。\r\n\r\n" .
            "象棋巫师用户中心");
        if ($succ) {
          header("Location: getpassword2.htm#info");
        } else {
          header("Location: getpassword2.htm#fail");
        }
      } else {
        header("Location: getpassword2.htm#error");
      }
    } else {
      header("Location: getpassword2.htm#error");
    }
    $mysql_link->close();
  } else {
    header("Location: getpassword2.htm#ejew");
  }
?>