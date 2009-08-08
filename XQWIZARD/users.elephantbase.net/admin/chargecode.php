<?php
  require_once "../common.php";
  require_once "./admin.php";

  $regname = $_POST["regname"];
  $points = intval($_POST["points"]);
  $num = intval($_POST["num"]);

  header("Content-Type: text/plain");
  header("Content-Disposition: attachment; filename=chargecode.txt");

  $mysql_link = new MysqlLink;
  for ($i = 0; $i < $num; $i ++) {
    $chargecode = md5(mt_rand() . mt_rand() . mt_rand() . mt_rand());
    $sql = sprintf("INSERT INTO {$mysql_tablepre}chargecode (chargecode, points) " .
        "VALUES ('%s', %d)", $chargecode, $points);
    $mysql_link->query($sql);
    echo $regname . ";" . $chargecode . "\r\n";
  }
  insertLog($userdata->uid, EVENT_CHARGECODE, $points * $num);
  $mysql_link->close();
?>