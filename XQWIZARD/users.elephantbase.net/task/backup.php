<?php
  require_once "../config.php";

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
  $sql = sprintf("SELECT uid, usertype, score, points, charged, username, email, password, salt " .
        "FROM {$mysql_tablepre}user LEFT JOIN " . UC_DBTABLEPRE. " USING (uid) WHERE lasttime >= %d", $lastTime2);
  $result = mysql_query($sql);
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("REPLACE INTO " . UC_DBTABLEPRE . "members (uid, username, email, password, salt) " .
        "VALUES (%d, '%s', '%s', '%s', '%s')", $line["uid"], mysql_real_escape_string($line["username"]),
        mysql_real_escape_string($line["email"]), $line["password"], $line["salt"]);
    gzwrite($gz, $sql . "\r\n");
    $sql = sprintf("REPLACE INTO {$mysql_tablepre}user (uid, usertype, score, points, charged) " .
        "VALUES (%d, %d, %d, %d, %d)", $line["uid"]), $line["usertype"],
        $line["score"], $line["points"], $line["charged"]);
    gzwrite($gz, $sql . "\r\n");
  }

  $sql = sprintf("SELECT uid, usertype, lasttime, score, points, charged " .
      "FROM {$mysql_tablepre}user WHERE lasttime >= %d", $lastTime2);
  $result = mysql_query($sql);
  while($line = mysql_fetch_assoc($result)) {
  }
  gzclose($gz);

  // 备份日志表(增量，备份后清空)
  $gz = gzopen("../backup/log_" . date("Ymd", $lastTime) . "_" . rand() . ".sql.gz", "w");
  $sql = sprintf("SELECT uid, eventip, eventtime, eventtype, detail " .
      "FROM {$mysql_tablepre}log WHERE eventtime < %d", $lastTime);
  $result = mysql_query($sql);
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO {$mysql_tablepre}user (uid, eventip, eventtime, eventtype, detail) " .
        "VALUES (%d, '%s', %d, %d, %d)", $line["uid"], $line["eventip"],
        $line["eventtime"], $line["eventtype"], $line["detail"]);
    gzwrite($gz, $sql . "\r\n");
  }
  gzclose($gz);
  $sql = sprintf("DELETE FROM {$mysql_tablepre}log WHERE eventtime < %d", $lastTime);
  mysql_query($sql);
  mysql_query("OPTIMIZE TABLE {$mysql_tablepre}log");

  mysql_close();
?>