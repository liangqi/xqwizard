<?php
  require_once "./admin.php";

  $mysql_link = new MysqlLink;
  $tmpfile = "../backup/" . MYSQL_TABLEPRE . "user_" . rand() . ".sql.gz";

  $gz = gzopen($tmpfile, "w");

  $result = $mysql_link->query("SELECT uid, username, password, salt, email FROM " . UC_DBTABLEPRE . "members");
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO " . UC_DBTABLEPRE . "members (uid, username, password, salt, email) " .
        "VALUES (%d, '%s', '%s', '%s', '%s');", $line["uid"], $mysql_link->escape($line["username"]),
        $line["password"], $line["salt"], $mysql_link->escape($line["email"]));
    gzwrite($gz, $sql . "\r\n");
  }

  $result = $mysql_link->query("SELECT uid, usertype, score, points, charged FROM " . MYSQL_TABLEPRE . "user");
  while($line = mysql_fetch_assoc($result)) {
    $sql = sprintf("INSERT INTO " . MYSQL_TABLEPRE . "user (uid, usertype, score, points, charged) " .
        "VALUES (%d, %d, %d, %d, %d);", $line["uid"], $line["usertype"],
        $line["score"], $line["points"], $line["charged"]);
    gzwrite($gz, $sql . "\r\n");
  }

  gzclose($gz);

  header("Content-Type: application/x-gzip");
  header("Content-Disposition: attachment; filename=" . MYSQL_TABLEPRE . "user.sql.gz");
  header("Content-Transfer-Encoding: binary");
  header("Expires: 0");
  header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
  header("Pragma: public");
  header("Content-Length: " . filesize($tmpfile));
  ob_clean();
  flush();
  readfile($tmpfile);
  unlink($tmpfile);

  $mysql_link->close();
?>