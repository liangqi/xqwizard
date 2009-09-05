<?php
  require_once "../common.php";

  $mysql_link = new MysqlLink;
  $sql = sprintf("INSERT INTO {$mysql_tablepre}questionnaire " .
      "(eventip, eventtime, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, comments) VALUES " .
      "('%s', %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, '%s')", getRemoteAddr(), time(),
      $_POST["a1"], $_POST["a2"], $_POST["a3"], $_POST["a4"], $_POST["a5"], $_POST["a6"], $_POST["a7"], $_POST["a8"], $_POST["a9"], $_POST["a10"],
      $_POST["a11"], $_POST["a12"], $_POST["a13"], $_POST["a14"], $_POST["a15"], $_POST["a16"], $_POST["a17"], $_POST["a18"], $_POST["a19"], $_POST["a20"],
      $mysql_link->escape($_POST["comments"]));
  $mysql_link->query($sql);
  $mysql_link->close();

  header("Location: thanks.htm");
?>