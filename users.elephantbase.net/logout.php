<?php
  session_start();
  session_register("userdata");
  unset($_SESSION["userdata"]);
  header("Location: login.htm");
?>