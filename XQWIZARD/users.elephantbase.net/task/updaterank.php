<?php
  require_once "../mysql_conf.php";

  $lastTime = intval($_GET["timestamp"]);
  $password = $_GET["password"];
  if ($password != $mysql_password) {
    exit;
  }

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);

  $sqlTruncate = "TRUNCATE TABLE {$mysql_tablepre}rank%s";
  $sqlInsert1 = "INSERT INTO {$mysql_tablepre}rank%s (username, rank)" .
      "SELECT username, rank FROM {$mysql_tablepre}rank%s";
  $sqlInsert2 = "INSERT INTO {$mysql_tablepre}rank%s (username, score) " .
      "SELECT username, score FROM {$mysql_tablepre}user " .
      "WHERE lasttime > %d ORDER BY score DESC";

  mysql_query(sprintf($sqlTruncate, "w0"));
  mysql_query(sprintf($sqlInsert1, "w0", "w"));
  mysql_query(sprintf($sqlTruncate, "w"));
  mysql_query(sprintf($sqlInsert2, "w", $lastTime - 86400 * 7));

  mysql_query(sprintf($sqlTruncate, "m0"));
  mysql_query(sprintf($sqlInsert1, "m0", "w"));
  mysql_query(sprintf($sqlTruncate, "m"));
  mysql_query(sprintf($sqlInsert2, "m", $lastTime - 86400 * 30));

  mysql_query(sprintf($sqlTruncate, "q0"));
  mysql_query(sprintf($sqlInsert1, "q0", "q"));
  mysql_query(sprintf($sqlTruncate, "q"));
  mysql_query(sprintf($sqlInsert2, "q", $lastTime - 86400 * 90));

  mysql_close();
?>