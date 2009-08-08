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
    $sql = sprintf("UPDATE {$mysql_tablepre}user SET score = %d WHERE uid = %d", $score, $result->uid);
    $mysql_link->query($sql);
    insertLog($result->uid, EVENT_SAVE, $score);
    header("Login-Result: ok");
    // 更新最近提交列表
    $sql = sprintf("REPLACE INTO {$mysql_tablepre}recent (uid, savetime, score) " .
        "VALUES ('%s', %d, %d)", $result->uid, time(), $score);
    $mysql_link->query($sql);
    $result2 = $mysql_link->query("SELECT COUNT(*) FROM {$mysql_tablepre}recent");
    $line = mysql_fetch_assoc($result2);
    $count = $line["COUNT(*)"];
    if ($count > 100) {
      $sql = sprintf("DELETE FROM {$mysql_tablepre}recent ORDER BY savetime " .
          "LIMIT %d", $count - 100);
      $mysql_link->query($sql);
    }
    // 检查是否该运行每日任务
    checkDailyTask();
  } else {
    header("Login-Result: nosave");
  }
  $mysql_link->close();
?>