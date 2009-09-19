<?php
  require_once "./common.php";

  session_start();
  session_register("userdata");
  if (!isset($_SESSION["userdata"])) {
    header("Location: login.htm?location=" . urlencode(requestUrl()) . "#timeout");
    exit;
  }
  $userdata = &$_SESSION["userdata"];
?>