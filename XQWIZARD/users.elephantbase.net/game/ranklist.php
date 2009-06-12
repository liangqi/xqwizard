<?php
  require_once "../mysql_conf.php";

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $type = $_GET["type"];
  if ($type == "w" || $type == "m" || $type == "q") {
    $result = mysql_query("SELECT username FROM {$mysql_tablepre}rank{$type} " .
        "ORDER BY rank LIMIT 100");
    while ($line = mysql_fetch_assoc($result)) {
      echo $line["username"] . "\r\n";
    }
  }
  mysql_close();
?>