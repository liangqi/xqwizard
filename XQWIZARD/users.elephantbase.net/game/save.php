<?php
  require_once "../mysql_conf.php";
  require_once "../common.php";

  $header = getallheaders();
  $username = $header["Login-UserName"];
  $password = $header["Login-Password"];
  $scores = intval($_POST["scores"]);

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $result = login($username, $password);
  if ($result == "error") {
    header("Login-Result: error");
  } else if ($result == "noretry") {
    header("Login-Result: noretry");
  } else if ($scores > $result["scores"]) {
    $sql = sprintf("UPDATE {$mysql_tablepre}user SET scores = %d WHERE username = '%s'",
        $scores, mysql_real_escape_string($username));
    mysql_query($sql);
    insertLog($username, EVENT_SAVE, $scores);
    header("Login-Result: ok");
  } else {
    header("Login-Result: nosave");
  }
  mysql_close();
?>