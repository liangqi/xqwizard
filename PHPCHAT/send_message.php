<?
  $room = substr($_GET['room'], 0, 16);
  $message = $_GET['message'];
  include('./config.php');
  mysql_connect($host, $username, $password);
  mysql_select_db($database);
  $result = mysql_query('SELECT room_id, message_id FROM chat_room WHERE room = "' . $room . '"');
  if (!($line = mysql_fetch_array($result, MYSQL_ASSOC))) {
    mysql_query('INSERT INTO chat_room (message_id, room) VALUES (1, "' . $room . '")');
    $result = mysql_query('SELECT room_id, message_id FROM chat_room WHERE room = "' . $room . '"');
    $line = mysql_fetch_array($result, MYSQL_ASSOC);
  }
  $room_id = $line['room_id'];
  $message_id = $line['message_id'];
  mysql_query('UPDATE chat_room SET message_id = ' . ($message_id + 1) . ' WHERE room_id = ' . $room_id);
  mysql_query('INSERT INTO chat_message (room_id, message_id, message) VALUES (' . $room_id . ', ' . $message_id . ', "'. $message . '")');
  mysql_query('DELETE FROM chat_message WHERE room_id = ' . $room_id . ' AND message_id + ' . $max_messages . ' = ' . $message_id);
  mysql_close();
?>
