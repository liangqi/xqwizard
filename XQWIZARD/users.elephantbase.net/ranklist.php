<?php
  require_once "./mysql_conf.php";
  require_once "./common.php";

  $type = $_GET["type"];

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);

  if ($type == "w" || $type == "m" || $type == "q") {
    jsWrite("<table>");
    jsWrite("<tr><th>排名</th><th>用户名</th><th>成绩</th></tr>");
    $result = mysql_query("SELECT username, score, rank FROM {$mysql_tablepre}rank{$type} " .
        "ORDER BY rank LIMIT 10");
    while ($line = mysql_fetch_assoc($result)) {
      jsWrite("<tr><td>" . $line["rank"] . "</td><td>" . $line["username"] .
            "</td><td>" . $line["score"] . "</td></tr>");
    }
    jsWrite("</table>");
  }

  mysql_close();
?>