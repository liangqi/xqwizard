<?
  include './counter_conf.php';
  mysql_connect($host, $username, $password);
  mysql_select_db($database);
  $result = mysql_query('SELECT value FROM ' . $table . ' WHERE name = "' . $name . '"');
  if ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $value = $line['value'];
  } else {
    mysql_query('INSERT INTO ' . $table . ' (name, value) VALUES ("' . $name . '", 0)');
    $value = 0;
  }
  echo $value;
  // mysql_close();
?>