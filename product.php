<?php
include "db_connect.php";

$lang = isset($_GET['lang']) ? $_GET['lang'] : 'bg';
$pid  = isset($_GET['pid']) ? $_GET['pid'] : 0;

if(!$pid or !is_numeric($pid)) {
  echo 'Not valid or missig product id';
  exit(0);
}

$sql = 'SELECT name, price, description, created_at FROM product AS p 
        JOIN product_lang AS pl ON p.pid = pl.pid AND pl.lang = %d
        WHERE p.pid = %d';

$sql = sprintf($sql, $lang, $pid);

$result = mysql_query($sql);
echo $result;
?>
