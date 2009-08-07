<?php
  require_once "./common.php";

  $mysql_link = new MysqlLink;

  $result = $mysql_link->query("SELECT username, savetime, score FROM {$mysql_tablepre}recent " .
      "LEFT JOIN " . UC_DBTABLEPRE . "members USING (uid) ORDER BY savetime DESC LIMIT 10");
  while ($line = mysql_fetch_assoc($result)) {
    $score = $line["score"];
    jsWrite(date("H:i:s ", $line["savetime"]) .
        htmlentities($line["username"], ENT_COMPAT, "GB2312") .
        " 已闯过了" . ($score > 900 ? "超过900" : $score) . "关<br>");
  }

  $mysql_link->close();
?>