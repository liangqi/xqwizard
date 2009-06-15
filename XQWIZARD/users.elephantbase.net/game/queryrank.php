<?php
  require_once "../mysql_conf.php";
  require_once "../common.php";

  $header = getallheaders();
  $username = $header["Login-UserName"];
  $password = $header["Login-Password"];
  $type = $_GET["type"];

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $result = login($username, $password);
  if ($result == "error") {
    header("Login-Result: error");
  } else if ($result == "noretry") {
    header("Login-Result: noretry");
  } else {
    if ($type == "w" || $type == "m" || $type == "q") {
      $rankYesterday = $rank > 0 ? getRank($type . "0", $username) : 0;
      $sql = sprintf("SELECT rank, score FROM {$mysql_tablepre}rank{$type} " .
          "WHERE username = '%s'", mysql_real_escape_string($username));
      $result = mysql_query($sql);
      $line = mysql_fetch_assoc($result);
      $rank = $line["rank"];
      $score = $line["score"];
      $rankYesterday = 0;
      if ($rank > 0) {
        $sql = sprintf("SELECT rank FROM {$mysql_tablepre}rank{$type}0 " .
            "WHERE username = '%s'", mysql_real_escape_string($username));
        $result = mysql_query($sql);
        $line = mysql_fetch_assoc($result);
        $rankYesterday = $line["rank"];
      }
      header("Login-Result: ok " . $score . "|" . $rank . "|" . $rankYesterday);
    }
  }
  mysql_close();
?>