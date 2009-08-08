<?php
  require_once "./user.php";

  if ($userdata->usertype != 128) {
    $userdata->info = "<font size=\"2\" color=\"red\">您不是管理员，无法查询用户信息</font>";
    header("Location: info.php");
    exit;
  }
?>