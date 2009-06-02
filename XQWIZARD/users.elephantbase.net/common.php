<?php
  // 获得客户端IP地址
  function getRemoteAddr() {
    if (isset($_SERVER["HTTP_CLIENT_IP"])) {
      return $_SERVER["HTTP_CLIENT_IP"];
    }
    if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {
      return $_SERVER["HTTP_X_FORWARDED_FOR"];
    }
    return $_SERVER["REMOTE_ADDR"];
  }

  // 登录
  function login($username, $password) {
    $sql = sprintf("SELECT password, email, retrycount, retrytime, scores, points FROM tb_user WHERE username = '%s'", mysql_real_escape_string($username));
    $result = mysql_query($sql);
    $line = mysql_fetch_array($result, MYSQL_ASSOC);
    // 如果没有查询到用户，则返回“登录失败”
    if (!$line) {
      return "error";
    }
    // 如果当前时间没有达到重试时间，则返回“禁止重试”
    if (time() < $line["retrytime"]) {
      return "noretry";
    }
    // 如果用户名和密码匹配，则返回类型、Email、分数、点数等信息
    if (md5($username . $password) == $line["password"]) {
      $sql = sprintf("UPDATE tb_user SET lastip = '%s', lasttime = %d, retrycount = 0 WHERE username = '%s'", getRemoteAddr(), time(), mysql_real_escape_string($username));
      mysql_query($sql);
      return array("usertype"=>$line["usertype"], "email"=>$line["email"], "scores"=>$line["scores"], "points"=>$line["points"]);
    }
    // 如果重试次数小于5次，则返回“登录失败”
    if ($line["retrycount"] < 5) {
      $sql = sprintf("UPDATE tb_user SET retrycount = retrycount + 1 WHERE username = '%s'", mysql_real_escape_string($username));
      mysql_query($sql);
      return "error";
    }
    // 返回“禁止重试”
    $sql = sprintf("UPDATE tb_user SET retrycount = 0, retrytime = %d WHERE username = '%s'", time() + 300, mysql_real_escape_string($username));
    mysql_query($sql);
    return "noretry";
  }
?>