

<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$bakerId=$_POST['bakerId'];

$con=mysqli_connect('localhost','root','','homebakers');


$result=mysqli_query($con,"select * from orders where bakerId=$bakerId");

$arr=[];
$json=[];
$i=0;
if(mysqli_num_rows($result)>0)

while($row=mysqli_fetch_assoc($result))
{


    $res=mysqli_query($con,"select cakeName,cakeImage from cakes where cakeId=".$row['cakeId']);
    $crow=mysqli_fetch_assoc($res);
    $arr['orderId']=$row['orderId'];
    $arr['cakeId']=$row['cakeId'];
    $arr['bakerId']="$bakerId";
    $arr['cakeName']=$crow['cakeName'];
    $arr['cakeImage']=$crow['cakeImage'];
    $arr['userId']=$row['userId'];
    $arr['weight']=$row['weight'];
    $arr['calories']=$row['calories'];
    $arr['eggless']=$row['eggless'];
    $arr['sugarfree']=$row['sugarfree'];
    $arr['candleId']=$row['candleId'];
    $arr['writing']=$row['writing'];
    $arr['date']=$row['date'];
    $arr['time']=$row['time'];
    $arr['status']=$row['status'];
    $arr['location']=$row['location'];

    $json[$i++]=$arr;
    

}

echo json_encode($json);







?>