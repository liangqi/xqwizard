<?php
  header("Content-Type: text/plain");
  header("Content-Disposition: attachment; filename=" . md5(rand()) . ".pgn");
  $content = (isset($_GET["content"]) ? $_GET["content"] : $_POST["content"]);
  echo gzuncompress(base64_decode($content));
?>