<?
  echo '4.65';

  include './counter_conf.php';
  mysql_connect($host, $username, $password);
  mysql_select_db($database);
  $result = mysql_query('SELECT value FROM ' . $table . ' WHERE name = "' . $name . '"');
  if (mysql_fetch_array($result, MYSQL_ASSOC)) {
    mysql_query('UPDATE ' . $table . ' SET value = value + 1 WHERE name = "' . $name . '"');
  } else {
    mysql_query('INSERT INTO ' . $table . ' (name, value) VALUES ("' . $name . '", 1)');
  }
  // $referer = $_GET['referer'];
  // $version = $_GET['version'];
  // $userid = $_GET['userid'];
  // mysql_query(sprintf('INSERT INTO tb_tracker (time, ip, referer, version, userid) VALUES (%d, "%s", "%s", "%s", "%s")', time(), $_SERVER['REMOTE_ADDR'], $referer, $version, $userid));
  // mysql_close();
?>