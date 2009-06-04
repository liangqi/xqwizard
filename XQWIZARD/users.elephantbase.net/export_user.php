<?php
  require_once "./admin.php";
  require_once "./mysql_conf.php";

  header("Content-Disposition: attachment; filename=tb_user.sql");
  header("Content-Type: text/plain");

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $result = mysql_query("SELECT * FROM tb_user");
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO tb_user (username, usertype, password, email, " .
        "regip, regtime, lastip, lasttime, retrycount, retrytime, scores, points) " .
        "VALUES ('%s', %d, '%s', '%s', '%s', %d, '%s', %d, %d, %d, %d, %d)",
        mysql_real_escape_string($line["username"]), $line["usertype"],
        mysql_real_escape_string($line["password"]), mysql_real_escape_string($line["email"]),
        mysql_real_escape_string($line["regip"]), $line["regtime"],
        mysql_real_escape_string($line["lastip"]), $line["lasttime"],
        $line["retrycount"], $line["retrytime"], $line["scores"], $line["points"]);
    echo $sql . "\r\n";
  }
  mysql_close();
?>