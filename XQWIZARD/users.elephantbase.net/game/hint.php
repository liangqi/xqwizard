<?php
  require_once "../mysql_conf.php";
  require_once "../common.php";

  $header = getallheaders();
  $username = $header["Login-UserName"];
  $password = $header["Login-Password"];
  $stage = intval($_POST["stage"]);

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $result = login($username, $password);
  if ($result == "error") {
    header("Login-Result: error");
  } else if ($result == "noretry") {
    header("Login-Result: noretry");
  } else if ($stage < 200) {
    header("Login-Result: ok");
  } else if ($result["points"] < 10 && $result["charged"] < USER_PLATINUM) {
    if ($result["usertype"] == 0) {
      $sql = sprintf("UPDATE {$mysql_tablepre}user SET usertype = 1 WHERE username = '%s'",
          mysql_real_escape_string($username));
      mysql_query($sql);
    }
    header("Login-Result: nopoints");
  } else {
    if ($result["charged"] < USER_PLATINUM) {
      $sql = sprintf("UPDATE {$mysql_tablepre}user SET points = points - 10 WHERE username = '%s'",
          mysql_real_escape_string($username));
      mysql_query($sql);
    }
    insertLog($username, EVENT_HINT, $stage);
    header("Login-Result: ok");
  }
  mysql_close();
?>