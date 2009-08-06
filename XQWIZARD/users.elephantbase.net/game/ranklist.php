<?php
  require_once "../config.php";

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $type = $_GET["type"];
  if ($type == "w" || $type == "m" || $type == "q") {
    $result = mysql_query("SELECT username, score FROM {$mysql_tablepre}rank{$type} " .
        "LEFT JOIN {UC_DBTABLEPRE}members USING (uid) ORDER BY rank LIMIT 100");
    while ($line = mysql_fetch_assoc($result)) {
      echo $line["score"] . "|" . $line["username"] . "\r\n";
    }
  }
  mysql_close();
?>