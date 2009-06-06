<?php
  require_once "./mysql_conf.php";
  require_once "./common.php";

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
  } else if ($result["points"] < 1) {
    echo "nopoints";
  } else {
    $sql = sprintf("UPDATE {$mysql_tablepre}user SET points = points - 1 WHERE username = '%s'",
        mysql_real_escape_string($username));
    mysql_query($sql);
    insertLog($username, EVENT_RETRACT, intval($_GET["stage"]));
    echo "ok";
  }
  mysql_close();
?>