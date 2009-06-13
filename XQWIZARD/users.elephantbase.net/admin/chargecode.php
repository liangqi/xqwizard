<?php
  require_once "../mysql_conf.php";
  require_once "../common.php";
  require_once "./admin.php";

  $regname = $_POST["regname"];
  $points = intval($_POST["points"]);
  $num = intval($_POST["num"]);

  header("Content-Type: text/plain");
  header("Content-Disposition: attachment; filename=chargecode.txt");

  mysql_connect($mysql_host, $mysql_username, $mysql_password);
  mysql_select_db($mysql_database);
  for ($i = 0; $i < $num; $i ++) {
    $chargecode = md5(mt_rand() . mt_rand() . mt_rand() . mt_rand());
    $sql = sprintf("INSERT INTO {$mysql_tablepre}chargecode (chargecode, points) " .
        "VALUES ('%s', %d)", $chargecode, $points);
    mysql_query($sql);
    echo $regname . ";" . $chargecode . "\r\n";
  }
  insertLog($_SESSION["userdata"]["username"], EVENT_CHARGECODE, $points * $num);
  mysql_close();
?>