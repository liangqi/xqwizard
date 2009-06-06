<?php
  require_once "./mysql_conf.php";
  require_once "./admin.php";

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $sql = sprintf("DELETE FROM {$mysql_tablepre}log WHERE eventtime < %d", floor(time() / 86400) * 86400);
  mysql_query(sql);
  mysql_close();
  header("Location: admin.htm");
?>