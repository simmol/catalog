<?php
$pid  = $params[2]; // Retrieve the product id from the url

if(!$pid or !is_numeric($pid)) {
  echo 'Not valid or missig product id';
  exit(0);
}

# Retrieve product
$sql = 'SELECT p.pid as id, name, price, description, created_at FROM product AS p 
        LEFT JOIN product_lang AS pl ON p.pid = pl.pid AND pl.lang = "%s"
        WHERE p.pid = %d limit 1';

$sql = sprintf($sql, $lang, $pid);
$result = mysql_query($sql);
$product = mysql_fetch_assoc($result);
var_dump($sql);
$published_days_stamp = time() - strtotime($product['created_at']);
$published_days = round($published_days_stamp / 86400);

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
$nt  = '\n\t';

echo '<?xml version="1.0" encoding="utf-8"?>'."\n";

echo "\n<catalogue>";

# Sidebar with categories
echo "\n\t<sidebar>";
foreach($category as $cat) {
  echo "\n\t\t".'<cat title="' . htmlentities($cat['title']) . '" id="' . $cat['id'] . '">';
  $subcategory = $cat['subcategories'];
  foreach($subcategory as $subcat) {
    echo "\n\t\t\t".'<subcat title="' . htmlentities($subcat['title']) . '" id="' . $subcat['id'] . '">' . "\n\t\t\t</subcat>";
  }
  echo "\n\t\t" . '</cat>';
}
echo "\n\t</sidebar>";

# Main area
echo "\n\t<mainbar>";
echo "\n\t\t" . '<product id="'.$product['id'].'" title="' .htmlentities($product['name']). '" price="'.$product['price'].'" description="'.$product['description'].'" published_days="'.$published_days.'">';
echo "\n\t\t</product>";
echo "\n\t</mainbar>";

echo "\n</catalogue>";
?>
