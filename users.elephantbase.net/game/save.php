<?php
  require_once "../common.php";

  $header = getallheaders();
  $username = $header["Login-UserName"];
  $password = $header["Login-Password"];
  $score = intval($_POST["score"]);

  $mysql_link = new MysqlLink;
  $result = login($username, $password);
  if ($result == "error") {
    header("Login-Result: error");
  } else if ($result == "noretry") {
    header("Login-Result: noretry");
  } else if ($score > $result->score) {
    $sql = sprintf("UPDATE " . MYSQL_TABLEPRE . "user SET score = %d WHERE uid = %d", $score, $result->uid);
    $mysql_link->query($sql);
    insertLog($result->uid, EVENT_SAVE, $score);
    header("Login-Result: ok");
    // 检查是否该运行每日任务
    checkDailyTask();
  } else {
    header("Login-Result: nosave");
  }
  $mysql_link->close();
?>