<?php
  require_once "./common.php";
  require_once "./mysql_conf.php";
  require_once "./ejewimage.php";

  $username = $_POST["username"];
  $password = $_POST["password"];
  $password2 = $_POST["password2"];
  $email = $_POST["email"];
  $ejew = $_POST["ejew"];

  // 检查用户名、密码、验证码是否符合规格
  if (strlen($username) < 6 || strlen($password) < 6) {
    header("Location: register.htm#short");
  } else if ($password != $password2) {
    header("Location: register.htm#password");
  } else if ($ejew != $_SESSION["ejew_value"]) {
    header("Location: register.htm#ejew");
  } else {
    // 开始注册
    mysql_connect($mysql_host, $mysql_username, $mysql_password);
    mysql_select_db($mysql_database);
    $sql = sprintf("SELECT username FROM tb_user WHERE username = '%s'",
        mysql_real_escape_string($username));
    $result = mysql_query($sql);
    if (mysql_fetch_assoc($result)) {
      header("Location: register.htm#exist");
    } else {
      $sql = sprintf("INSERT INTO tb_user (username, password, email, regip, regtime) " .
          "VALUES ('%s', '%s', '%s', '%s', %d)",
          mysql_real_escape_string($username), md5($username . $password),
          mysql_real_escape_string($email), getRemoteAddr(), time());
      mysql_query($sql);
      header("Location: login.htm#register");
    }
    mysql_close();
  }
?>