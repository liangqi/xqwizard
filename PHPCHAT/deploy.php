<?
  include './config.php';
  mysql_connect($host, $username, $password);
  mysql_select_db($database);
  // mysql_query('DROP VIEW IF EXISTS chat_room_message');
  mysql_query('DROP TABLE IF EXISTS chat_room');
  mysql_query('CREATE TABLE chat_room (room_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, message_id INTEGER UNSIGNED NOT NULL, room CHAR(16) NOT NULL, INDEX (room ASC))');
  mysql_query('DROP TABLE IF EXISTS chat_message');
  mysql_query('CREATE TABLE chat_message (room_id INTEGER UNSIGNED NOT NULL, message_id INTEGER UNSIGNED NOT NULL, MESSAGE TEXT NOT NULL, INDEX (room_id ASC, message_id ASC))');
  // mysql_query('CREATE VIEW chat_room_message (room, message) AS SELECT chat_room.room, chat_message.message FROM chat_room, chat_message WHERE chat_room.room_id = chat_message.room_id');
  mysql_close();
?>
