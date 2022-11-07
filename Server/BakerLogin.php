<?php


$email=$_POST['userName'];

$password=$_POST['password'];


header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");




$con=mysqli_connect('localhost','root','','homebakers');

$sql="select bakerId,bakerName,email,password from bakers";

$result=mysqli_query($con,$sql);

$usernameFlag=0;
$passwordFlag=0;
if(mysqli_num_rows($result)>0)
{
    while($row=mysqli_fetch_assoc($result))
    {
        if($email==$row['email'])
        {
            $usernameFlag=1;
           if($password==$row['password']) 
           {
            $passwordFlag=1;
            $arr=array();
            $arr["bakerName"]=$row['bakerName'];
            $arr["bakerId"]=$row['bakerId'];   
            echo json_encode($arr);
           
           }
           break;
        }
     
        
        
    }

    if($usernameFlag==0)
    {
        echo "Incorrect UserName";
    }
    if($passwordFlag==0)
    {
        echo "Incorrect password";
    }
}






?>