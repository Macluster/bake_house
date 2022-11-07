<?php



header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");


$name=$_POST['name'];
$email=$_POST['email'];
$number=$_POST['number'];
$address=$_POST['address'];
$password=$_POST['password'];
$con=mysqli_connect('localhost','root','','homebakers');

$sql="insert into user(userName,userEmail,userNumber,userAddress,userPassword) values('$name','$email','$number','$address','$password')";

if($name!="")
if(mysqli_query($con,$sql))
{

   $max= mysqli_query($con,"select Max(userId) from user");
    echo  mysqli_fetch_row($max)[0];
}
echo "";






?>