<?php
  require_once "../mysql_conf.php";
  require_once "../common.php";

  $header = getallheaders();
  $username = $header["Login-UserName"];
  $password = $header["Login-Password"];

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $result = login($username, $password);
  if ($result == "error") {
    echo "error";
  } else if ($result == "noretry") {
    echo "noretry";
  } else {
    echo "ok " . $result["scores"];
  }
  mysql_close();
?>