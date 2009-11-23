<?php
  require_once "../common.php";

  $header = getallheaders();
  $username = $header["Login-UserName"];
  $password = $header["Login-Password"];

  $mysql_link = new MysqlLink;
  $result = login($username, $password);
  if ($result == "error") {
    header("Login-Result: error");
  } else if ($result == "noretry") {
    header("Login-Result: noretry");
  } else {
    $sql = sprintf("SELECT rank, score FROM xq_rank WHERE uid = %d", $result->uid);
    $result2 = $mysql_link->query($sql);
    $line = mysql_fetch_assoc($result2);
    $rank = $line ? $line["rank"] : 0;
    $score = $line ? $line["score"] : 0;

    $rankYesterday = 0;
    if ($rank > 0) {
      $sql = sprintf("SELECT rank FROM xq_rank0 WHERE uid = %d", $result->uid);
      $result = $mysql_link->query($sql);
      $line = mysql_fetch_assoc($result);
      $rankYesterday = $line ? $line["rank"] : 0;
    }
    header("Login-Result: ok " . $score . "|" . $rank . "|" . $rankYesterday);
  }
  $mysql_link->close();
?>