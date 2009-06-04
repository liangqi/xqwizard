<?php
  session_start();
  session_register("userdata");
  if (!isset($_SESSION["userdata"])) {
    header("Location: login.htm#timeout");
    exit();
  }
  if ($_SESSION["userdata"]["usertype"] != 128) {
    $_SESSION["userdata"]["info"] = "<font size=\"2\" color=\"red\">您不是管理员，无法查询用户信息</font>";
    header("Location: info.php");
    exit();
  }
?>