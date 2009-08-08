<?php
  require_once "./common.php";
  require_once "./user.php";

  $password0 = $_POST["password0"];
  $password = $_POST["password"];
  $password2 = $_POST["password2"];
  $email = $_POST["email"];

  $mysql_link = new MysqlLink;
  $timeout = false;
  if (strlen($password0) < 6 || strlen($password) < 6) {
    // 仅更新Email
    $result = uc_user_edit($userdata->username, "", "", $email);
    if ($result >= 0) {
      $info = info("Email更新成功");
      insertLog($userdata->uid, EVENT_EMAIL);
      $userdata->email = $email;
    } else if ($result == -4 || $result == -5) {
      $info = warn("Email不符合规格");
    } else {
      $info = warn("Email更新失败");
    }
  } else if ($password != $password2) {
    $info = warn("两遍密码不一致");
  } else {
    // 更新Email和密码
    $result = uc_user_edit($userdata->username, $password0, $password, $email);
    if ($result >= 0) {
      $info = info("密码和Email更新成功");
      insertLog($userdata->uid, EVENT_PASSWORD);
    } else if ($result == -1) {
      $info = warn("原密码错误");
    } else if ($result == -4 || $result == -5) {
      $info = warn("Email不符合规格");
    } else {
      $info = warn("密码和Email更新失败");
    }
  }
  if ($timeout) {
    header("Location: login.htm#timeout");
  } else {
    $userdata->info = $info;
    header("Location: info.php");
  }
  $mysql_link->close();
?>