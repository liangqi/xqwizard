<?php
  $mysql_host = "localhost";
  $mysql_database = "test";
  $mysql_username = "root";
  $mysql_password = "****";
  $mysql_tablepre = "tb_";

  define("UC_CONNECT", "mysql");
  define("UC_DBHOST", $mysql_host);
  define("UC_DBUSER", $mysql_username);
  define("UC_DBPW", $mysql_password);
  define("UC_DBNAME", $mysql_database);
  define("UC_DBCHARSET", "gbk");
  define("UC_DBTABLEPRE", UC_DBNAME . ".uc_");

  define("UC_KEY", "****");
  define("UC_API", "http://localhost/ucenter/");
  define("UC_CHARSET", "gbk");
  define("UC_IP", "");
  define("UC_APPID", 1);

  define("SMTP_HOST", "smtp.elephantbase.net");
  define("SMTP_USERNAME", "root");
  define("SMTP_PASSWORD", "****");
  define("SMTP_FROM", "webmaster@elephantbase.net");
  define("SMTP_FROMNAME", "象棋巫师用户中心");
?>