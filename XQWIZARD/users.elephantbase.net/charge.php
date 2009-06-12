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
  if ($line) {
    $points = $line["points"];
    $sql = sprintf("DELETE FROM {$mysql_tablepre}chargecode WHERE chargecode = '%s'", $chargecode);
    mysql_query($sql);
    $sql = sprintf("UPDATE {$mysql_tablepre}user SET points = points + %d WHERE username = '%s'",
        $points, mysql_real_escape_string($username));
    mysql_query($sql);
    $_SESSION["userdata"]["points"] += $points;
    $info = info("您刚才补充了 " . $points . " 点，现在共有 " . $_SESSION["userdata"]["points"] . " 点可用");
  } else {
    $info = warn("点卡密码错误");
  }

  $_SESSION["userdata"]["info"] = $info;    
  header("Location: info.php");
  mysql_close();
?>