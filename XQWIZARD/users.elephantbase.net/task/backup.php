<?php
  require_once "../mysql_conf.php";

  $lastTime = intval($_GET["timestamp"]);
  $lastTime2 = intval($_GET["timestamp2"]);
  $password = $_GET["password"];
  if ($password != $mysql_password) {
    exit;
  }

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);

  // 备份用户表(增量)
  $gz = gzopen("../backup/user_" . date("Ymd", $lastTime) . "_" . rand() . ".sql.gz", "w");
  $sql = sprintf("SELECT * FROM {$mysql_tablepre}user WHERE lasttime >= %d", $lastTime2);
  $result = mysql_query($sql);
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("REPLACE INTO {$mysql_tablepre}user (username, usertype, password, salt, email, " .
        "regip, regtime, lastip, lasttime, retrycount, retrytime, score, points, charged) " .
        "VALUES ('%s', %d, '%s', '%s', '%s', '%s', %d, '%s', %d, %d, %d, %d, %d, %d)",
        mysql_real_escape_string($line["username"]), $line["usertype"],
        mysql_real_escape_string($line["password"]), mysql_real_escape_string($line["salt"]), mysql_real_escape_string($line["email"]),
        mysql_real_escape_string($line["regip"]), $line["regtime"],
        mysql_real_escape_string($line["lastip"]), $line["lasttime"],
        $line["retrycount"], $line["retrytime"], $line["score"], $line["points"], $line["charged"]);
    gzwrite($gz, $sql . "\r\n");
  }
  gzclose($gz);

  // 备份日志表(增量，备份后清空)
  $gz = gzopen("../backup/log_" . date("Ymd", $lastTime) . "_" . rand() . ".sql.gz", "w");
  $sql = sprintf("SELECT * FROM {$mysql_tablepre}log WHERE eventtime < %d", $lastTime);
  $result = mysql_query($sql);
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO {$mysql_tablepre}user (username, eventip, eventtime, eventtype, detail) " .
        "VALUES ('%s', '%s', %d, %d, %d)",
        mysql_real_escape_string($line["username"]), mysql_real_escape_string($line["eventip"]),
        $line["eventtime"], $line["eventtype"], $line["detail"]);
    gzwrite($gz, $sql . "\r\n");
  }
  gzclose($gz);
  $sql = sprintf("DELETE FROM {$mysql_tablepre}log WHERE eventtime < %d", $lastTime);
  mysql_query($sql);
  mysql_query("OPTIMIZE TABLE {$mysql_tablepre}log");

  mysql_close();
?>