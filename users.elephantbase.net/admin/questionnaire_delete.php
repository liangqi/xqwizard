<?php
  require_once "./admin.php";

  $uid = $_GET["uid"];

  $mysql_link = new MysqlLink;
  $sql = sprintf("DELETE FROM {$mysql_tablepre}qn_comments WHERE uid = %d", $uid);
  $mysql_link->query($sql);
  $mysql_link->close();

  header("Location: questionnaire.php");
?>