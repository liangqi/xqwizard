<?php
  require_once "./common.php";

  $mysql_link = new MysqlLink;
  if ($data = uc_get_user($_POST["username"])) {
    list($uid, $username, $email) = $data;
    if ($email == $_POST["email"]) {

      $password = substr(md5(mt_rand()), 0, 6);
      uc_user_edit($username, "", $password, "", true);
      $sql = sprintf("REPLACE INTO {$mysql_tablepre}password (username, password) " .
          "VALUES ('%s', '%s')", $mysql_link->escape($username), $password);
      $mysql_link->query($sql);

    }
  }
  $mysql_link->close();
  header("Location: getpassword2.htm");
?>