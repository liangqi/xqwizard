<?php
  require_once "./user.php";

  $chargecode = $_POST["chargecode"];

  $mysql_link = new MysqlLink;
  $sql = sprintf("SELECT points FROM " . MYSQL_TABLEPRE . "chargecode WHERE chargecode = '%s'",
      $mysql_link->escape($chargecode));
  $result = $mysql_link->query($sql);
  $line = mysql_fetch_assoc($result);
  $info = warn("点卡密码错误");
  if ($line) {
    $points = $line["points"];
    $sql = sprintf("DELETE FROM " . MYSQL_TABLEPRE . "chargecode WHERE chargecode = '%s'",
        $mysql_link->escape($chargecode));
    $mysql_link->query($sql);
    // 获取点数后，别的线程也可能会把记录删掉，所以要检查是否确实删掉了
    if (mysql_affected_rows() > 0) {
      $sql = sprintf("UPDATE " . MYSQL_TABLEPRE . "user SET points = points + %d, charged = charged + %d " .
          "WHERE uid = %d", $points, $points, $userdata->uid);
      $mysql_link->query($sql);
      insertLog($userdata->uid, EVENT_CHARGE, $points);
      $userdata->points += $points;
      $userdata->charged += $points;
      $info = info("您刚才补充了 " . $points . " 点，现在共有 " . $userdata->points . " 点可用");
      if ($userdata->charged >= USER_DIAMOND) {
         $info .= "<br>" . info("您已经升级为：钻石会员用户");
      } else if ($userdata->charged >= USER_PLATINUM) {
         $info .= "<br>" . info("您已经升级为：白金会员用户");
      }
    }
  }

  $userdata->info = $info;    
  header("Location: info.php");
  $mysql_link->close();
?>