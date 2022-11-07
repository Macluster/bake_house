

<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$bakerId=intval($_POST['bakerId']);



//echo $radius."/".$Mylat."/".$Mylon;



$con=mysqli_connect('localhost','root','','homebakers');

$sql="select * from cakes where bakerId=$bakerId";
$result=mysqli_query($con,$sql);

$json=array();
$obj=array();

if(mysqli_num_rows($result)>0)
{

$i=0;
while ($row=mysqli_fetch_assoc($result))
{

    $flag=0;

    $obj['cakeId']=$row['cakeId'];
    $obj['cakeName']=$row['cakeName'];
    $obj['cakeFlavour']=$row['cakeFlavour'];
    $obj['bakerId']=$row['bakerId'];
   $image= substr_replace($row['cakeImage'],$_SERVER['SERVER_ADDR'],7,9);
   //echo $image."<br/>";
    $obj['cakeImage']=$image;
    $obj['cakePrice']=$row['cakePrice'];
    $obj['cakeRating']=$row['cakeRating'];
    $obj['cakeIngredients']=$row['cakeIngredients'];
    $obj['cakeCalories']=$row['cakeCalories'];

   
   
    
  
    
   $json[$i++]=$obj;

}
}


echo json_encode($json);


?>