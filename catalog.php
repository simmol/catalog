<?php

$cid  = is_numeric($params[2]) ? $params[2] : 0;
$scid = is_numeric($params[3]) ? $params[3] : 0;

# FIXME not very optimised
if($cid == 0) {
  $sort = isset($params[2])   ? $params[2] : '';
  $sort_order = isset($params[3])  ? $params[3] : 'desc';
  $page = isset($params[4]) ? $params[4] : 1;
} else if ($scid == 0) {
  $sort = isset($params[3])   ? $params[3] : '';
  $sort_order = isset($params[4])  ? $params[4] : 'desc';
  $page = isset($params[5]) ? $params[5] : 1;
} else {
  $sort = isset($params[4])   ? $params[4] : '';
  $sort_order = isset($params[5])  ? $params[5] : 'desc';
  $page = isset($params[6]) ? $params[6] : 1;
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

# Products
$perPage = 5;
$products = array();

$sql = 'SELECT product_lang.name as title, product.pid as id, product.price as price, count(product.pid) as count FROM product
  LEFT JOIN product_lang ON product.pid = product_lang.pid AND lang = "%s" WHERE 1=1 ';

$sql = sprintf($sql, $lang);
if ($cid) {
  $sql .= " AND cid = $cid ";
}

if ($scid) {
  $sql .= " AND scid = $scid ";
}

if ($sort) {
  $sql .= ' ORDER BY '. $sort . ' ' . $sort_order;
}

$cur_page = $page;
$page--;
$page = $page * $perPage;

$sql .= ' LIMIT ' . $page . ', ' . $perPage;
$result = mysql_query($sql);

while($row = mysql_fetch_assoc($result)) {
  $products[] = $row;
}

$max_pages = 0;
if( isset($products[0]) ){
  $max_pages = ceil($products[0]['count'] / $perPage);
}

# Output
echo '<?xml version="1.0" encoding="utf-8"?>'."\n";

echo "\n<catalogue>";

# Sidebar with categories
echo "\n\t<sidebar>";
foreach($category as $cat) {
  echo "\n\t\t".'<cat title="' . $cat['title'] . '" id="' . $cat['id'] . '">';
  $subcategory = $cat['subcategories'];
  foreach($subcategory as $subcat) {
    echo "\n\t\t\t".'<subcat title="' . $subcat['title'] . '" id="' . $subcat['id'] . '">' . "\n\t\t\t</subcat>";
  }
  echo "\n\t\t" . '</cat>';
}
echo "\n\t</sidebar>";

# Products
echo "\n\t" . '<mainbar sort="'. $sort .'" order="' . $sort_order . '" current_page="' . $cur_page . '" pages="' . $max_pages . '">';
foreach($products as $product) {
  echo "\n\t\t" . '<product id="' . $product['id']. '" title="' . $product['title'] . '" price="' . $product['price'] . '">';
  echo "\n\t\t" . '</product>';
}
echo "\n\t</mainbar>";

echo "\n</catalog>";
?>
