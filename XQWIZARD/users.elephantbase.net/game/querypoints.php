<?php
  require_once "../common.php";

  $header = getallheaders();
  $username = $header["Login-UserName"];
  $password = $header["Login-Password"];

  $mysql_link = new MysqlLink;
  $result = login($username, $password);
  if ($result == "error") {
    header("Login-Result: error");
  } else if ($result == "noretry") {
    header("Login-Result: noretry");
  } else {
    header("Login-Result: ok " . $result["points"] . "|" . $result["charged"]);
  }
  $mysql_link->close();
?>