<?php
  require_once "../mysql_conf.php";
  require_once "./admin.php";


  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $tmpfile = "../backup/{$mysql_tablepre}user_" . rand() . ".sql.gz";

  $gz = gzopen($tmpfile, "w");
  $result = mysql_query("SELECT * FROM {$mysql_tablepre}user");
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO {$mysql_tablepre}user (username, usertype, password, email, " .
        "regip, regtime, lastip, lasttime, retrycount, retrytime, scores, points) " .
        "VALUES ('%s', %d, '%s', '%s', '%s', %d, '%s', %d, %d, %d, %d, %d)",
        mysql_real_escape_string($line["username"]), $line["usertype"],
        mysql_real_escape_string($line["password"]), mysql_real_escape_string($line["email"]),
        mysql_real_escape_string($line["regip"]), $line["regtime"],
        mysql_real_escape_string($line["lastip"]), $line["lasttime"],
        $line["retrycount"], $line["retrytime"], $line["scores"], $line["points"]);
    gzwrite($gz, $sql . "\r\n");
  }
  gzclose($gz);

  header("Content-Type: application/x-gzip");
  header("Content-Disposition: attachment; filename={$mysql_tablepre}user.sql.gz");
  header("Content-Transfer-Encoding: binary");
  header("Expires: 0");
  header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
  header("Pragma: public");
  header("Content-Length: " . filesize($tmpfile));
  ob_clean();
  flush();
  readfile($tmpfile);
  unlink($tmpfile);

  mysql_close();
?>