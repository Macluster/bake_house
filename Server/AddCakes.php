<?php
$cakeId=$_POST['cakeId'];
$cakeName=$_POST['cakeName'];
$cakeFlavour=$_POST['cakeFlavour'];
$bakerId=$_POST['bakerId'];
$cakeImage=$_POST['cakeImage'];
$cakePrice=$_POST['cakePrice'];
$cakeRating=$_POST['cakeRating'];
$cakeIngredients=$_POST['cakeIngredients'];
$cakeCalories=$_POST['cakeCalories'];

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");




$con=mysqli_connect('localhost','root','','homebakers');


$id=intval($bakerId);
$price=intval($cakePrice);
$rating=intval($cakeRating);
$cal=intval($cakeCalories);

if($price!=0)
mysqli_query($con,"insert into cakes(cakeName,cakeFlavour,bakerId,cakeImage,cakePrice,cakeRating,cakeIngredients,cakeCalories) values('$cakeName','$cakeFlavour',$id,'$cakeImage',$price,0,'$cakeIngredients',$cal)");
echo "success";



?>