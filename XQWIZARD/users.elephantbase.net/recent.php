<?php
  require_once "./mysql_conf.php";
  require_once "./common.php";

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);

  $result = mysql_query("SELECT username, savetime, score FROM {$mysql_tablepre}recent " .
      "ORDER BY savetime DESC LIMIT 10");
  while ($line = mysql_fetch_assoc($result)) {
    jsWrite(date("m/d H:i　", $line["savetime"]) . htmlentities($line["username"]) .
        "已闯过了" . $line["score"] . "关<br>");
  }

  mysql_close();
?>