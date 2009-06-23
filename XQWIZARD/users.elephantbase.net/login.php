<?php
  require_once "./mysql_conf.php";
  require_once "./common.php";

  $username = $_POST["username"];
  $password = $_POST["password"];

  if (strlen($username) < 6 || strlen($password) < 6) {
    header("Location: login.htm#error");
  } else {
    mysql_connect($mysql_host, $mysql_username, $mysql_password);
    mysql_select_db($mysql_database);
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
      $result["info"] = "您已经闯过了 " . $result["score"] . " 关" .
          ($points == 0 ? "" : "<br>您还有 " . $points . " 点可用");
      $_SESSION["userdata"] = $result;
      header("Location: info.php");
    }
    mysql_close();
  }
?>