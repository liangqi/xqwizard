<?php
  require_once dirname(__FILE__) . "/config.php";
  require_once dirname(__FILE__) . "/uc_client/client.php";

  // 返回提示的HTML(蓝色)
  function info($msg) {
    return "<font size=\"2\" color=\"blue\">" . htmlentities($msg, ENT_COMPAT, "GB2312") . "</font>";
  }

  // 返回警告的HTML(红色)
  function warn($msg) {
    return "<font size=\"2\" color=\"red\">" . htmlentities($msg, ENT_COMPAT, "GB2312") . "</font>";
  }

  // 用JavaScript输出HTML
  function jsWrite($html) {
    echo "document.write(\"{$html}\");\r\n";
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

  // 获得salt
  function getSalt() {
    return substr(md5(mt_rand()), 0, 6);
  }

  class MysqlLink {
    var $link;

    function MysqlLink() {
      global $mysql_host, $mysql_username, $mysql_password, $mysql_database;
      $this->link = mysql_connect($mysql_host, $mysql_username, $mysql_password);
      mysql_select_db($mysql_database, $this->link);
    }

    function query($sql) {
      return mysql_query($sql, $this->link);
    }

    function affected_rows() {
      return mysql_affected_rows($this->link);
    }

    function insert_id() {
      return mysql_insert_id($this->link);
    }

    function escape($str) {
      return mysql_real_escape_string($str, $this->link);
    }

    function close() {
      mysql_close($this->link);
    }
  }

  // 用户类型
  define("USERTYPE_ADMIN", 128);

  class UserData {
    var $uid, $username, $email, $usertype, $score, $points, $charged, $info;

    function UserData($uid, $username, $email, $line = null) {
      $this->uid = $uid;
      $this->username = $username;
      $this->email = $email;
      if ($line) {
        $this->usertype = $line["usertype"];
        $this->score = $line["score"];
        $this->points = $line["points"];
        $this->charged = $line["charged"];
      } else {
        $this->usertype = $this->score = $this->points = $this->charged = 0;
      }
    }

    function isAdmin() {
      return $this->usertype >= USERTYPE_ADMIN;
    }
  }

  // 登录
  function login($username, $password) {
    global $mysql_tablepre, $mysql_link;

    // 首先检查"retry"表中是否有密码重试记录
    $sql = sprintf("SELECT retrycount, retrytime FROM {$mysql_tablepre}retry " .
        "WHERE username = '%s'", $mysql_link->escape($username));
    $result = $mysql_link->query($sql);
    $retry = mysql_fetch_assoc($result);
    if ($retry) {
      // 如果未达到允许重试时间，则禁止重试
      if (time() < $retry["retrytime"]) {
        return "noretry";
      }
    }

    // 登录
    list($uid, $dummy, $password, $email) = uc_user_login($username, $password);

    // 如果没有查询到用户，则返回“登录失败”
    if ($uid == -1) {
      return "error";
    }

    // 如果密码不对，则检查用户是否在“暴力破解”
    if ($uid == -2) {
      // 如果"retry"表中没有密码重试记录，则增加该记录
      if (!$retry) {
        $sql = sprintf("INSERT INTO {$mysql_tablepre}retry (username, retrycount, retrytime) " .
            "VALUES ('%s', 1, 0)", $mysql_link->escape($username));
        $mysql_link->query($sql);
        return "error";
      }
      // 如果密码重试少于5次，则重试次数加1，允许重试
      if ($retry["retrycount"] < 5) {
        $sql = sprintf("UPDATE {$mysql_tablepre}retry SET retrycount = retrycount + 1 " .
            "WHERE username = '%s'", $mysql_link->escape($username));
        $mysql_link->query($sql);
        return "error";
      }
      // 重试次数达到5次，设置重试时间，禁止重试
      $sql = sprintf("UPDATE {$mysql_tablepre}retry SET retrycount = 0, retrytime = %d " .
          "WHERE username = '%s'", time() + 300, $mysql_link->escape($username));
      $mysql_link->query($sql);
      return "noretry";
    }

    // 其他错误情况
    if ($uid <= 0) {
      return "error";
    }

    // 登录成功，删除密码重试记录
    if ($retry) {
      $sql = sprintf("DELETE FROM {$mysql_tablepre}retry " .
          "WHERE username = '%s'", $mysql_link->escape($username));
      $mysql_link->query($sql);
    }

    $sql = sprintf("SELECT * FROM {$mysql_tablepre}user WHERE uid = %d", $uid);
    $result = $mysql_link->query($sql);
    $line = mysql_fetch_assoc($result);
    // 如果"user"表中没有记录，则建立记录
    if (!$line) {
      $sql = sprintf("INSERT INTO {$mysql_tablepre}user (uid, lastip, lasttime) " .
          "VALUES (%d, '%s', %d)", $uid, getRemoteAddr(), time());
      $mysql_link->query($sql);
      return new UserData($uid, $username, $email);
    }
    // 更新"user"表
    $sql = sprintf("UPDATE {$mysql_tablepre}user SET lastip = '%s', lasttime = %d " .
        "WHERE uid = %d", getRemoteAddr(), time(), $uid);
    $mysql_link->query($sql);
    return new UserData($uid, $username, $email, $line);
  }

  // 事件类型
  define("EVENT_REGISTER", 101);
  define("EVENT_LOGIN", 102);
  define("EVENT_CHARGE", 105);
  define("EVENT_EMAIL", 106);
  define("EVENT_PASSWORD", 107);
  define("EVENT_GETPASSWORD", 109);
  define("EVENT_SAVE", 111);
  define("EVENT_RETRACT", 121);
  define("EVENT_HINT", 122);
  define("EVENT_CHARGECODE", 150);
  define("EVENT_ADMIN_CHARGE", 201);
  define("EVENT_ADMIN_PASSWORD", 202);
  define("EVENT_ADMIN_DELETE", 299);

  // 用户类型
  define("USER_PLATINUM", 2800);
  define("USER_DIAMOND", 8800);

  // 记录日志
  function insertLog($uid, $eventtype, $detail = 0) {
    global $mysql_tablepre, $mysql_link;
    $sql = sprintf("INSERT INTO {$mysql_tablepre}log (uid, eventip, eventtime, eventtype, detail) " .
        "VALUES (%d, '%s', %d, %d, %d)", $uid, getRemoteAddr(), time(), $eventtype, $detail);
    $mysql_link->query($sql);
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
    global $mysql_tablepre, $mysql_link;
    $result = $mysql_link->query("SELECT nexttime, lasttime FROM {$mysql_tablepre}task WHERE taskname = 'dailytask'");
    return mysql_fetch_assoc($result);
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
    global $mysql_tablepre, $mysql_link, $mysql_password;
    $currTime = time();
    // 第一次检查
    $taskTime = getTaskTime();
    if ($taskTime["nexttime"] < $currTime) {
      // 加锁
      $mysql_link->query("UPDATE {$mysql_tablepre}task SET tasklock = 1 WHERE taskname = 'dailytask'", $mysql_link);
      if ($mysql_link->affected_rows() > 0) {
        // 第二次检查，防止在第一次检查和加锁之间，数据被别的线程改掉了
        $taskTime = getTaskTime();
        if ($taskTime["nexttime"] < $currTime) {
          // 下一时刻在GMT-4:00
          $lastTime2 = $taskTime["lasttime"];
          $nextTime = nextDailyTime($currTime, -14400);
          $lastTime = $nextTime - 86400;
          // 更新记录的同时解锁，防止runPhpTask时程序崩溃，也保证了之后加锁的线程得到新的数据
          $sql = sprintf("UPDATE {$mysql_tablepre}task SET lasttime = %d, nexttime = %d, tasklock = 0 " .
              "WHERE taskname = 'dailytask'", $lastTime, $nextTime);
          $mysql_link->query($sql);
          // 备份数据
          sleep(1);
          runPhpTask("/task/backup.php?password=" . $mysql_password .
              "&timestamp=" . $lastTime . "&timestamp2=" . $lastTime2);
          // 刷新排名
          sleep(1);
          runPhpTask("/task/updaterank.php?password=" . $mysql_password .
              "&timestamp=" . $lastTime);
        } else {
          // 解锁
          $mysql_link->query("UPDATE {$mysql_tablepre}task SET tasklock = 0 WHERE taskname = 'dailytask'");
        }
      }
    }
  }

  // 棋谱类型
  $score_catagory = array("全部", "全局", "开局", "中局", "残局", "排局", "比赛", "古谱", "教材");
?>