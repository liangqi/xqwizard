<?php
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
  } else if ($type == "w" || $type == "m" || $type == "q") {
    $uid = $result["uid"];

    $sql = sprintf("SELECT rank, score FROM {$mysql_tablepre}rank{$type} WHERE uid = %d", $uid);
    $result = mysql_query($sql);
    $line = mysql_fetch_assoc($result);
    $rank = $line ? $line["rank"] : 0;
    $score = $line ? $line["score"] : 0;

    $rankYesterday = 0;
    if ($rank > 0) {
      $sql = sprintf("SELECT rank FROM {$mysql_tablepre}rank{$type}0 WHERE uid = %d", $uid);
      $result = mysql_query($sql);
      $line = mysql_fetch_assoc($result);
      $rankYesterday = $line ? $line["rank"] : 0;
    }
    header("Login-Result: ok " . $score . "|" . $rank . "|" . $rankYesterday);
  } else {
    header("Login-Result: error");
  }
  mysql_close();
?>