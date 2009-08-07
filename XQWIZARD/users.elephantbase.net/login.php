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
      insertLog($username, EVENT_LOGIN);
      session_start();
      session_register("userdata");
      $result["username"] = $username;
      $points = $result["points"];
      $charged = $result["charged"];
      $result["info"] = "您已经闯过了 " . $result["score"] . " 关" .
          ($points == 0 ? "" : "<br>您还有 " . $points . " 点可用") .
          ($charged < USER_PLATINUM ? "" :
          ($charged < USER_DIAMOND ? "<br>您现在是：白金会员用户" : "<br>您现在是：钻石会员用户"));
      $_SESSION["userdata"] = $result;
      header("Location: info.php");
    }
    $mysql_link->close();
  }
?>