<?php
  require_once "./common.php";
  require_once "./mysql_conf.php";

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
      session_start();
      session_register("userdata");
      $result["username"] = $username;
      $_SESSION["userdata"] = $result;
      if ($result["usertype"] == 128) {
        header("Location: admin.php");
      } else {
        header("Location: info.php");
      }
    }
    mysql_close();
  }
?>