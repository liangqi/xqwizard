<?php
  session_start();
  session_register("userdata");
  if (!isset($_SESSION["userdata"])) {
    header("Location: login.htm#timeout");
    exit;
  }
  $username = $_SESSION["userdata"]["username"];
?>