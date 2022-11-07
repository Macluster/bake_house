<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$bakerId=intval($_POST['bakerId']);



//echo $radius."/".$Mylat."/".$Mylon;



$con=mysqli_connect('localhost','root','','homebakers');

$sql="select * from bakers where bakerId=$bakerId";
$result=mysqli_query($con,$sql);

$json=array();
$obj=array();

if(mysqli_num_rows($result)>0)
{

$i=0;
while ($row=mysqli_fetch_assoc($result))
{

    $flag=0;

    $obj['bakerId']=$row['bakerId'];
    $obj['bakerName']=$row['bakerName'];
    $obj['bakerCompany']=$row['bakerCompany'];
    $obj['bakerAddress']=$row['bakerAddress'];
 
    $obj['location']=$row['location'];
    $obj['number']=$row['number'];
    $obj['email']=$row['email'];
    $obj['password']=$row['password'];

   
   
    
  
    
   $json[$i++]=$obj;

}
}


echo json_encode($json);


?>