<?php
/**
 * @file
 * Manige the connection to the DB
 */

$host = 'localhost';
$user = 'root';
$password = '';
$db_name  = 'catalog';

$link = mysql_connect($host, $user, $password) or die('<br/> Error in opening link ' . mysql_error());

mysql_query('SET NAMES utf8');
mysql_select_db($db_name, $link) or die('<br/> Error in opening database ' . $db_name . '<br/>' . mysql_error());

?>
