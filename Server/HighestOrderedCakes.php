


<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$bakerId=1;

$k=0;

$json=array();

//echo $radius."/".$Mylat."/".$Mylon;
$con=mysqli_connect('localhost','root','','homebakers');


$sql="select count(cakeId) from cakes where bakerId=$bakerId";
$result0=mysqli_query($con,$sql);
$row0=mysqli_fetch_assoc($result0);
$noOfCakes= $row0['count(cakeId)'];

$sql="select Distinct(cakeId) from cakes where bakerId=$bakerId";
$result=mysqli_query($con,$sql);

$i=0;
if(mysqli_num_rows($result)>0)
{
while ($row=mysqli_fetch_assoc($result))
{
//echo $row['cakeId'];


    $sql="select  count(cakeId) from orders where cakeId=".$row['cakeId'];
    $result2=mysqli_query($con,$sql);
    $row2=mysqli_fetch_assoc($result2);
    
     //echo $row2['count(cakeId)'];
    
            $sql="select * from cakes where cakeId=".$row['cakeId'];
            $result3=mysqli_query($con,$sql);

            $obj=array();

            if(mysqli_num_rows($result3)>0)
            {

            
            while ($row3=mysqli_fetch_assoc($result3))
            {

                $flag=0;

                $obj['cakeId']=$row3['cakeId'];
                $obj['cakeName']=$row3['cakeName'];
                $obj['cakeFlavour']=$row3['cakeFlavour'];
                $obj['bakerId']=$row3['bakerId'];
                $image= substr_replace($row3['cakeImage'],$_SERVER['SERVER_ADDR'],7,9);
            //echo $image."<br/>";
                $obj['cakeImage']=$image;
                $obj['cakePrice']=$row3['cakePrice'];
                $obj['cakeRating']=$row3['cakeRating'];
                $obj['cakeIngredients']=$noOfCakes;
                $obj['cakeCalories']=$row2['count(cakeId)'];

                $json[$k++]=$obj;

            }
            }


        

}

}


echo json_encode($json);




 