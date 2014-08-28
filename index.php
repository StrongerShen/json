<?php
header('Content-type: application/json');

$rainbow = array("紅色", "橙色", "黃色", "綠色", "藍色", "靛色", "紫色");
$nature = array("rainbow"=>$rainbow);

echo json_encode($nature);

?>
