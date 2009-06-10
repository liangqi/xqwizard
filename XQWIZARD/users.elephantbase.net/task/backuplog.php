<?php
  require_once "../mysql_conf.php";

  $lastTime = intval($_GET["timestamp"]);
  $password = $_GET["password"];
  if ($password != $mysql_password) {
    exit;
  }

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
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