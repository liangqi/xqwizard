<?
  echo '4.4';

  include './counter_conf.php';
  mysql_connect($host, $username, $password);
  mysql_select_db($database);
  $result = mysql_query('SELECT value FROM ' . $table . ' WHERE name = "' . $name . '"');
  if (mysql_fetch_array($result, MYSQL_ASSOC)) {
    mysql_query('UPDATE ' . $table . ' SET value = value + 1 WHERE name = "' . $name . '"');
  } else {
    mysql_query('INSERT INTO ' . $table . ' (name, value) VALUES ("' . $name . '", 1)');
  }
  // mysql_close();
?>