<?php
  require_once "../common.php";

  $mysql_link = new MysqlLink;
  $sql = sprintf("INSERT INTO {$mysql_tablepre}questionnaire " .
      "(eventip, eventtime, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, comments) VALUES " .
      "('%s', %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, '%s')", getRemoteAddr(), time(),
      $_POST["a1"], $_POST["a2"], $_POST["a3"], $_POST["a4"], $_POST["a5"], $_POST["a6"], 
      $_POST["a7"], $_POST["a8"], $_POST["a9"], $_POST["a10"], $_POST["a11"], $_POST["a12"],
      $mysql_link->escape($_POST["comments"]));
  $mysql_link->query($sql);
  $mysql_link->close();

  header("Location: thanks.htm");
?>