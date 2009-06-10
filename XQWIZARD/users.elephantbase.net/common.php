<?php
  // 返回提示的HTML(蓝色)
  function info($msg) {
    return "<font size=\"2\" color=\"blue\">" . htmlentities($msg, ENT_COMPAT, "GB2312") . "</font>";
  }

  // 返回警告的HTML(红色)
  function warn($msg) {
    return "<font size=\"2\" color=\"red\">" . htmlentities($msg, ENT_COMPAT, "GB2312") . "</font>";
  }

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
    global $mysql_tablepre;
    $sql = sprintf("SELECT * FROM {$mysql_tablepre}user WHERE username = '%s'",
        mysql_real_escape_string($username));
    $result = mysql_query($sql);
    $line = mysql_fetch_assoc($result);
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
      $sql = sprintf("UPDATE {$mysql_tablepre}user SET lastip = '%s', lasttime = %d, retrycount = 0 " .
          "WHERE username = '%s'", getRemoteAddr(), time(), mysql_real_escape_string($username));
      mysql_query($sql);
      return array("usertype"=>$line["usertype"], "email"=>$line["email"],
          "scores"=>$line["scores"], "points"=>$line["points"]);
    }
    // 如果重试次数小于5次，则返回“登录失败”
    if ($line["retrycount"] < 5) {
      $sql = sprintf("UPDATE {$mysql_tablepre}user SET retrycount = retrycount + 1 " .
          "WHERE username = '%s'", mysql_real_escape_string($username));
      mysql_query($sql);
      return "error";
    }
    // 返回“禁止重试”
    $sql = sprintf("UPDATE {$mysql_tablepre}user SET retrycount = 0, retrytime = %d " .
        "WHERE username = '%s'", time() + 300, mysql_real_escape_string($username));
    mysql_query($sql);
    return "noretry";
  }

  // 事件类型
  define("EVENT_REGISTER", 101);
  define("EVENT_LOGIN", 101);
  define("EVENT_EMAIL", 102);
  define("EVENT_PASSWORD", 103);
  define("EVENT_SAVE", 111);
  define("EVENT_RETRACT", 121);
  define("EVENT_HINT", 122);
  define("EVENT_CHARGE", 201);
  define("EVENT_RESET", 202);
  define("EVENT_DELETE", 299);

  // 记录日志
  function insertLog($username, $eventtype, $detail = 0) {
    global $mysql_tablepre;
    $sql = sprintf("INSERT INTO {$mysql_tablepre}log (username, eventip, eventtime, eventtype, detail) " .
        "VALUES ('%s', '%s', %d, %d, %d)",
        mysql_real_escape_string($username), getRemoteAddr(), time(), $eventtype, $detail);
    mysql_query($sql);
  }

  // 运行PHP任务
  function runPhpTask($path) {
    $fp = fsockopen("127.0.0.1", 80);
    fwrite($fp, "GET $path HTTP/1.1\r\n" .
      "Host: users.elephantbase.net\r\n" .
      "Connection: Close\r\n\r\n");
    fclose($fp);
  }

  // 获取任务表中的时间
  function getTaskTime() {
    $result = mysql_query("SELECT tasktime FROM {$mysql_tablepre}task WHERE taskname = 'dailytask'");
    $line = mysql_fetch_assoc($result);
    return $line["tasktime"];
  }

  // 下一时刻
  function nextDailyTime($currTime, $timeOffset) {
    $nextTime = floor($currTime / 86400) * 86400 + $timeOffset;
    if ($timeOffset < 0) {
      $nextTime += 86400;
    }
    if ($nextTime < $currTime) {
      $nextTime += 86400;
    }
    return $nextTime;
  }

  // 检查是否该运行每日任务
  function checkDailyTask() {  
    $currTime = time();
    // 第一次检查
    if (getTaskTime() < $currTime) {
      // 加锁
      mysql_query("LOCK TABKE {$mysql_tablepre}task WRITE");
      // 第二次检查，防止在第一次检查和加锁之间，数据被改掉了
      if (getTaskTime() < $currTime) {
        // 下一时刻在GMT-4:00
        $nextTime = nextDailyTime($currTime, -14400);
        $sql = sprintf("UPDATE {$mysql_tablepre}task SET tasktime = %d " .
            "WHERE taskname = 'dailytask'", $nextTime);
        mysql_query($sql);
        $lastTime = $nextTime - 86400;
        // 备份日志
        runPhpTask("/task/backuplog.php?password=" . $mysql_password . "&timestamp=" . $lastTime);
        // 刷新排名
        runPhpTask("/task/updaterank.php?password=" . $mysql_password . "&timestamp=" . $lastTime);
      }
      mysql_query("UNLOCK TABLE");
    }
  }
?>