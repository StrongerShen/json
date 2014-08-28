<?php
header('Content-type: application/json');

$rainbow = array("紅", "橙", "黃", "綠", "藍", "靛", "紫");
$tiangans = array("甲","乙","丙","丁","戊","己","庚","辛","壬","癸");
$dizhi = array("子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥");

$nature = array("rainbow"=>$rainbow,"tiangans"=>$tiangans,"dizhi"=>$dizhi);

echo json_encode($nature);
?>
