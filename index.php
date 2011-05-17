<?php
include "db_connect.php";

$request = trim($_SERVER['REQUEST_URI'], '/');
$params  = split("/", $request);

$lang = $params[0];

if($params[1] == 'catalog') {
  include "catalog.php";
} elseif($params[1] == 'product') {
  include "product.php";
} else {
  include '404Error.php';
}

?>
