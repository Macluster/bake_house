<?php
$cakeId=$_POST['cakeId'];
$userId=$_POST['userId'];

$weight=$_POST['weight'];
$calories=$_POST['calories'];
$eggless=$_POST['eggless'];
$sugarfree=$_POST['sugarfree'];
$candleId=$_POST['candleId'];
$writing=$_POST['writing'];
$date=$_POST['date'];
$time=$_POST['time'];
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");




$con=mysqli_connect('localhost','root','','homebakers');

$result=mysqli_query($con,"select bakerId from cakes where cakeId=$cakeId");

$bakerId=mysqli_fetch_assoc($result)['bakerId'];

mysqli_query($con,"insert into cart(cakeId,bakerId,userId,weight,calories,eggless,sugarfree,candleId,writing,date,time) values('$cakeId','$bakerId','$userId',$weight,'$calories','$eggless','$sugarfree','$candleId','$writing','$date','$time')");
echo "success";



?>