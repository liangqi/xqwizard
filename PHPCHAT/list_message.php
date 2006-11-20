<?
  $room = substr($_GET['room'], 0, 16);
  $message_id = $_GET['message_id'];
  include('./config.php');
  mysql_connect($host, $username, $password);
  mysql_select_db($database);
  $result = mysql_query('SELECT room_id FROM chat_room WHERE room = "' . $room . '"');
  if ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $room_id = $line['room_id'];
    $result = mysql_query('SELECT message_id, message FROM chat_message WHERE room_id = ' . $room_id . ' AND message_id > ' . $message_id);
    while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
      echo('message_id=' . $line['message_id'] . '&message=' . urlencode($line['message']) . "\n");
    }
  }
  mysql_close();
?>
