<?php
  require_once "../common.php";

  $lastTime = intval($_GET["timestamp"]);
  $password = $_GET["password"];
  if ($password != $mysql_password) {
    exit;
  }

  $mysql_link = new MysqlLink;

  $sqlTruncate = "TRUNCATE TABLE {$mysql_tablepre}rank%s";
  $sqlInsert1 = "INSERT INTO {$mysql_tablepre}rank%s (uid, rank)" .
      "SELECT uid, rank FROM {$mysql_tablepre}rank%s";
  $sqlInsert2 = "INSERT INTO {$mysql_tablepre}rank%s (uid, score) " .
      "SELECT uid, score FROM {$mysql_tablepre}user " .
      "WHERE lasttime > %d ORDER BY score DESC, lasttime DESC";

  $mysql_link->query(sprintf($sqlTruncate, "w0"));
  $mysql_link->query(sprintf($sqlInsert1, "w0", "w"));
  $mysql_link->query(sprintf($sqlTruncate, "w"));
  $mysql_link->query(sprintf($sqlInsert2, "w", $lastTime - 86400 * 7));

  $mysql_link->query(sprintf($sqlTruncate, "m0"));
  $mysql_link->query(sprintf($sqlInsert1, "m0", "m"));
  $mysql_link->query(sprintf($sqlTruncate, "m"));
  $mysql_link->query(sprintf($sqlInsert2, "m", $lastTime - 86400 * 30));

  $mysql_link->query(sprintf($sqlTruncate, "q0"));
  $mysql_link->query(sprintf($sqlInsert1, "q0", "q"));
  $mysql_link->query(sprintf($sqlTruncate, "q"));
  $mysql_link->query(sprintf($sqlInsert2, "q", $lastTime - 86400 * 90));

  $mysql_link->close();
?>