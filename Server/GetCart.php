<?php

$userId=4;



$con=mysqli_connect('localhost','root','','homebakers');


$result=mysqli_query($con,"select * from cart where userId=$userId");

$arr=[];
$json=[];
$i=0;
while($row=mysqli_fetch_assoc($result))
{

    $arr['cartId']=$row['cartId'];
    $arr['userId']=$row['userId'];
    $arr['cakeId']=$row['cakeId'];
    
    $cakeNameResult=mysqli_query($con,"select cakeName,cakeImage from cakes where cakeId=".$row['cakeId']);
    $cakeData=mysqli_fetch_assoc($cakeNameResult);
    $arr['cakeName']=$cakeData['cakeName'];
   
    $image= substr_replace($cakeData['cakeImage'],$_SERVER['SERVER_ADDR'],7,9);
    $arr['cakeImage']=$image;
   //echo $arr['cakeImage'];
    $arr['weight']=$row['weight'];
    $arr['calories']=$row['calories'];
    $arr['eggless']=$row['eggless'];
    $arr['sugarfree']=$row['sugarfree'];
    $arr['candleId']=$row['candleId'];
    $arr['writing']=$row['writing'];
    $arr['date']=$row['date'];
    $arr['time']=$row['time'];
    $arr['bakerId']=$row['bakerId'];

    $json[$i++]=$arr;

}

echo json_encode($json);









?>