<?php
  require_once "./admin.php";
  require_once "./mysql_conf.php";

  header("Content-Disposition: attachment; filename=tb_log.sql");
  header("Content-Type: text/plain");

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $sql = sprintf("SELECT * FROM tb_log WHERE eventtime < %d", floor(time() / 86400) * 86400);
  $result = mysql_query($sql);
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO tb_user (username, eventip, eventtime, eventtype, detail) " .
        "VALUES ('%s', '%s', %d, %d, %d)",
        mysql_real_escape_string($line["username"]), mysql_real_escape_string($line["eventip"]),
        $line["eventtime"], $line["eventtype"], $line["detail"]);
    echo $sql . "\r\n";
  }
  mysql_close();
?>