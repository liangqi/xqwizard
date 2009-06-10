<?php
  require_once "../mysql_conf.php";

  $lastTime = intval($_GET["timestamp"]);
  $password = $_GET["password"];
  if ($password != $mysql_password) {
    exit;
  }

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $sqlFormat = "INSERT INTO {$mysql_tablepre}rank%s (username) " .
      "SELECT username FROM {$mysql_tablepre}user " .
      "WHERE lasttime > %d ORDER BY scores DESC";
  mysql_query(sprintf($sqlFormat, "w", $lastTime - 86400 * 7));
  mysql_query(sprintf($sqlFormat, "m", $lastTime - 86400 * 30));
  mysql_query(sprintf($sqlFormat, "q", $lastTime - 86400 * 90));

  mysql_query("UPDATE {$mysql_tablepre}user " .
      "LEFT JOIN {$mysql_tablepre}rankw w USING(username) " .
      "LEFT JOIN {$mysql_tablepre}rankm m USING(username) " .
      "LEFT JOIN {$mysql_tablepre}rankq q USING(username) " .
      "SET rankw0 = rankw, rankm0 = rankm, rankq0 = rankq, " .
      "rankw = w.rank, rankm = m.rank, rankq = q.rank");

  mysql_query("TRUNCATE TABLE {$mysql_tablepre}rankw");
  mysql_query("TRUNCATE TABLE {$mysql_tablepre}rankm");
  mysql_query("TRUNCATE TABLE {$mysql_tablepre}rankq");

  mysql_close();
?>