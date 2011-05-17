<?php

$cid  = is_numeric($params[2]) ? $params[2] : 0;
$scid = is_numeric($params[3]) ? $params[3] : 0;

if(!$cid or !$scid) {
  include "404Error.php";
  exit(0);
}

# Retrieve categories
$category = array();
$subcategory = array();

$sql = 'SELECT cid as id, name as title FROM category_lang WHERE lang = "%s"';

$sub_sql = 'SELECT cid, subcat.scid as id, name as title FROM subcategory subcat JOIN subcategory_lang ON subcat.scid = subcategory_lang.scid AND lang = "%s" WHERE cid = %s';

$res = mysql_query(sprintf($sql, $lang));
while($row = mysql_fetch_assoc($res)) {
  $sql = sprintf($sub_sql, $lang, $row['id']);
  $sub_res = mysql_query($sql);
  while( $sub = mysql_fetch_assoc($sub_res)) {
    $row['subcategories'][] = $sub;
  }
  $category[] = $row;
}

# Output
?>
