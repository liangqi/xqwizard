<?php
  require_once "../common.php";

  $mysql_link = new MysqlLink;
  $type = $_GET["type"];
  if ($type == "w" || $type == "m" || $type == "q") {
    $result = $mysql_link->query("SELECT username, score FROM " . MYSQL_TABLEPRE . "rank{$type} " .
        "LEFT JOIN " . UC_DBTABLEPRE . "members USING (uid) ORDER BY rank LIMIT 100");
    while ($line = mysql_fetch_assoc($result)) {
      echo $line["score"] . "|" . $line["username"] . "\r\n";
    }
  }
  $mysql_link->close();
?>