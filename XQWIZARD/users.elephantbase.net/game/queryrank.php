<?php
  require_once "../mysql_conf.php";
  require_once "../common.php";

  function getRank($suffix, $username) {
    global $mysql_tablepre;
    $sql = sprintf("SELECT rank FROM {$mysql_tablepre}rank{$suffix} " .
        "WHERE username = '%s'", mysql_real_escape_string($username));
    $result = mysql_query($sql);
    $line = mysql_fetch_assoc($result);
    return $line ? ($line["rank"] ? $line["rank"] : 0) : 0;
  }

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
      $rank = getRank($type, $username);
      $rankYesterday = $rank > 0 ? getRank($type . "0", $username) : 0;
      header("Login-Result: ok " . $result["score"] . "|" . $rank . "|" . $rankYesterday);
    }
  }
  mysql_close();
?>