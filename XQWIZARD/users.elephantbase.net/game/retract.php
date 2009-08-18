<?php
  require_once "../common.php";

  $header = getallheaders();
  $username = $header["Login-UserName"];
  $password = $header["Login-Password"];
  $stage = intval($_POST["stage"]);

  $mysql_link = new MysqlLink;
  $result = login($username, $password);
  if ($result == "error") {
    header("Login-Result: error");
  } else if ($result == "noretry") {
    header("Login-Result: noretry");
  } else if ($stage < 500) {
    header("Login-Result: ok");
  } else if ($result->points < 1 && $result->charged < USER_PLATINUM) {
    header("Login-Result: nopoints");
  } else {
    if ($result->charged < USER_PLATINUM) {
      $sql = sprintf("UPDATE {$mysql_tablepre}user SET points = points - 1 WHERE uid = %d", $result->uid);
      $mysql_link->query($sql);
    }
    insertLog($result->uid, EVENT_RETRACT, $stage);
    header("Login-Result: ok");
  }
  $mysql_link->close();
?>