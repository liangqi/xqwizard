<?php
  require_once "../common.php";

  $mysql_link = new MysqlLink;

  $sql = sprintf("INSERT INTO " . MYSQL_TABLEPRE . "qn_user (eventip, eventtime) " .
      "VALUES ('%s', %d)", getRemoteAddr(), time());
  $mysql_link->query($sql);
  $uid = $mysql_link->insert_id();
  for ($i = 1; $i <= 100; $i ++) {
    if (!isset($_POST["a" . $i])) {
      continue;
    }
    $sql = sprintf("INSERT INTO " . MYSQL_TABLEPRE . "qn_answer (uid, qid, answer) " .
        "VALUES (%d, %d, %d)", $uid, $i, $answer = $_POST["a" . $i]);
    $mysql_link->query($sql);
  }
  $comments = $_POST["comments"];
  if (strlen($comments) > 0) {
    $sql = sprintf("INSERT INTO " . MYSQL_TABLEPRE . "qn_comments (uid, comments) " .
        "VALUES (%d, '%s')", $uid, $mysql_link->escape($comments));
    $mysql_link->query($sql);
  }
  $mysql_link->close();

  header("Location: thanks.htm");
?>