<?php
  require_once "./common.php";

  $mysql_link = new MysqlLink;
  if ($data = uc_get_user($_POST["username"])) {
    list($uid, $username, $email) = $data;
    if ($email == $_POST["email"]) {

      $password = substr(md5(mt_rand()), 0, 6);
      uc_user_edit($username, "", $password, "", true);
      $sql = sprintf("REPLACE INTO {$mysql_tablepre}password (username, email, password, eventip, eventtime) " .
          "VALUES ('%s', '%s', '%s', '%s', %d)", $mysql_link->escape($username),
          $mysql_link->escape($email), $password, getRemoteAddr(), time());
      $mysql_link->query($sql);
      insertLog($uid, EVENT_GETPASSWORD);

    }
  }
  $mysql_link->close();
  header("Location: getpassword2.htm");
?>