<?php
  header("Content-Type: text/plain");
  header("Content-Disposition: attachment; filename=" . md5(rand()) . ".fen");
  echo $_GET["fen"];
?>