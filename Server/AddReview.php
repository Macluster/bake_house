<?php
$cakeId=$_POST['cakeId'];
$userId=$_POST['userId'];
$rating=$_POST['rating'];
$review=$_POST['review'];

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");




$con=mysqli_connect('localhost','root','','homebakers');

mysqli_query($con,"insert into review values('$userId','$cakeId',$rating,'$review')");
echo "success";



?>