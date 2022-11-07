
<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");


$con=mysqli_connect('localhost','root','','homebakers');

$result=mysqli_query($con,"Select * from candles ");

$arr=array();
$json=array();
$i=0;
while($row=mysqli_fetch_assoc($result))
{
  
 $arr['candleId']=$row['candleId'];
 $arr['candleName']=$row['candleName'];
 $arr['candleType']=$row['candleType'];
 $image= substr_replace($row['candleImage'],$_SERVER['SERVER_ADDR'],7,9);
 $arr['candleImage']=$image;
 $arr['candlePrice']=$row['candlePrice'];

 $json[$i++]=$arr;

}



echo json_encode($json);





?>


