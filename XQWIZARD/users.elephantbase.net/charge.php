<?php
  require_once "./mysql_conf.php";
  require_once "./common.php";
  require_once "./user.php";

  $chargecode = $_POST["chargecode"];

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  $sql = sprintf("SELECT points FROM {$mysql_tablepre}chargecode WHERE chargecode = '%s'", $chargecode);
  $result = mysql_query($sql);
  $line = mysql_fetch_assoc($result);
  $info = warn("点卡密码错误");
  if ($line) {
    $points = $line["points"];
    $sql = sprintf("DELETE FROM {$mysql_tablepre}chargecode WHERE chargecode = '%s'", $chargecode);
    mysql_query($sql);
    // 获取点数后，别的线程也可能会把记录删掉，所以要检查是否确实删掉了
    if (mysql_affected_rows() > 0) {
      $sql = sprintf("UPDATE {$mysql_tablepre}user SET points = points + %d, charged = charged + %d WHERE username = '%s'",
          $points, $points, mysql_real_escape_string($username));
      mysql_query($sql);
      insertLog($username, EVENT_CHARGE, $points);
      $_SESSION["userdata"]["points"] += $points;
      $_SESSION["userdata"]["charged"] += $points;
      $charged = $_SESSION["userdata"]["charged"];
      $info = info("您刚才补充了 " . $points . " 点，现在共有 " . $_SESSION["userdata"]["points"] . " 点可用") .
          ($charged < USER_PLATINUM ? "" : "<br>" .
          info($charged < USER_DIAMOND ? "您已经升级为：白金会员用户" : "您已经升级为：钻石会员用户"));
    }
  }

  $_SESSION["userdata"]["info"] = $info;    
  header("Location: info.php");
  mysql_close();
?>