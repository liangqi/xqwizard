<?php
  require_once "../mysql_conf.php";
  require_once "./admin.php";

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $tmpfile = "../backup/{$mysql_tablepre}user_" . rand() . ".sql.gz";

  $gz = gzopen($tmpfile, "w");

  $result = mysql_query("SELECT uid, username, password, salt, email FROM " . UC_DBTABLEPRE . "members");
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO " . UC_DBTABLEPRE . "members (uid, username, password, salt, email) " .
        "VALUES (%d, '%s', '%s', '%s', '%s')", $line["uid"], mysql_real_escape_string($line["username"]),
        $line["password"], $line["salt"], mysql_real_escape_string($line["email"]));
    gzwrite($gz, $sql . "\r\n");
  }

  $result = mysql_query("SELECT uid, usertype, score, points, charged FROM {$mysql_tablepre}user");
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO {$mysql_tablepre}user (uid, usertype, score, points, charged) " .
        "VALUES (%d, %d, %d, %d, %d, %d)", $line["uid"], $line["usertype"],
        $line["score"], $line["points"], $line["charged"]);
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