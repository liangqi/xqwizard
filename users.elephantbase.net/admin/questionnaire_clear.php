<?php
  require_once "./admin.php";

  list($uid) = uc_user_login($userdata->username, $_POST["password"]);
  if ($uid > 0) {
    $mysql_link = new MysqlLink;
    $mysql_link->query("TRUNCATE TABLE " . MYSQL_TABLEPRE . "qn_user");
    $mysql_link->query("TRUNCATE TABLE " . MYSQL_TABLEPRE . "qn_answer");
    $mysql_link->query("TRUNCATE TABLE " . MYSQL_TABLEPRE . "qn_comments");
    $mysql_link->close();
    header("Location: close.htm#问卷调查已清空");
  } else {
    header("Location: close.htm#密码错误");
  }
?>