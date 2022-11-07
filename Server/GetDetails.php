



<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$radius=doubleval($_POST['rad']);
$Mylat=doubleval($_POST['lat']);
$Mylon=doubleval($_POST['lon']);


//echo $radius."/".$Mylat."/".$Mylon;



$con=mysqli_connect('localhost','root','','homebakers');

$sql="select * from cakes";
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

    $res=mysqli_query($con,"select location from bakers where bakerId=".$row['bakerId']);
    $loc=mysqli_fetch_assoc($res);

     $bakerlat= doubleval(explode('&',$loc['location'])[0]);
     $bakerlon= doubleval(explode('&',$loc['location'])[1]);
   
    
   
     if($Mylat!=0 && $Mylon!=0)
     {
   
        
        if($bakerlat<($Mylat+$radius)&& $bakerlat>($Mylat-$radius))
        {
      
    
            if($bakerlon<($Mylon+$radius)&& $bakerlon>($Mylon-$radius))
            {
             
      
               $flag=1;
            }
        }
        
        
       if($flag==0)
       {
        continue;
       }
    
     }
   
    
  
    
   $json[$i++]=$obj;

}
}


echo json_encode($json);


?>