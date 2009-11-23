<?php
  require_once "../common.php";

  $mysql_link = new MysqlLink;
  $result = $mysql_link->query("SELECT username, score FROM xq_rank " .
      "LEFT JOIN uc_members USING (uid) ORDER BY rank LIMIT 100");
  while ($line = mysql_fetch_assoc($result)) {
    echo $line["score"] . "|" . $line["username"] . "\r\n";
  }
  $mysql_link->close();
?>