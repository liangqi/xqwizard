<?php
  require_once "./common.php";

  $username = $_POST["username"];
  $password = $_POST["password"];

  if (strlen($username) < 6 || strlen($password) < 6) {
    header("Location: login.htm#error");
  } else {
    $mysql_link = new MysqlLink;
    $result = login($username, $password);
    if ($result == "error") {
      header("Location: login.htm#error");
    } else if ($result == "noretry") {
      header("Location: login.htm#noretry");
    } else {
      insertLog($result->uid, EVENT_LOGIN);
      session_start();
      session_register("userdata");
      $result->info = "您已经闯过了 " . $userdata->score . " 关";
      if ($userdata->points > 0) {
          $userdata->info .= "<br>您还有 " . $userdata->points . " 点可用";
      }
      if ($userdata->charged >= USER_DIAMOND) {
          $userdata->info .= "<br>您现在是：钻石会员用户")
      } else if ($userdata->charged >= USER_PLATINUM) {
          $userdata->info .= "<br>您现在是：白金会员用户";
      }
      $_SESSION["userdata"] = $result;
      header("Location: info.php");
    }
    $mysql_link->close();
  }
?>