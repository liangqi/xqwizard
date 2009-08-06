<?php
  require_once "./common.php";
  require_once "./user.php";

  $password0 = $_POST["password0"];
  $password = $_POST["password"];
  $password2 = $_POST["password2"];
  $email = $_POST["email"];

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $timeout = false;
  if (strlen($password0) < 6 || strlen($password) < 6) {
    // 仅更新Email
    $ucresult = uc_user_edit($username, "", "", $email);
    if ($ucresult < 0) {
      $info = warn("更新Email错误，错误码：" . $ucresult);
    } else {
      $info = info("Email更新成功");
      insertLog($uid, EVENT_EMAIL);
      $_SESSION["userdata"]["email"] = $email;
    }
  } else if ($password != $password2) {
    $info = warn("两遍密码不一致");
  } else {
    // 更新Email和密码
    $ucresult = uc_user_edit($username, $password0, $password, $email);
    if ($ucresult >= 0) {
      $info = info("密码和Email更新成功");
      insertLog($uid, EVENT_PASSWORD);
    } else if ($ucresult == -1) {
      $info = warn("原密码错误");
    } else if ($ucresult == -8) {
      $timeout = true;
    } else if {
      $info = warn("更新Email和密码错误，错误码：" . $ucresult);
    }
  }
  if ($timeout) {
    header("Location: login.htm#timeout");
  } else {
    $_SESSION["userdata"]["info"] = $info;
    header("Location: info.php");
  }
  mysql_close();
?>