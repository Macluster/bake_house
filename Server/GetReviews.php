<?php


$cakeId=$_POST['cakeId'];

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$con=mysqli_connect('localhost','root','','homebakers');


$sql="select * from review where cakeId='$cakeId'";
$result=mysqli_query($con,$sql);


$userName="";
$userDp="";
$rating=0;
$review="";

$arr=array();
$json=array();
$i=0;
if(mysqli_num_rows($result)>0)
{
    while($row=mysqli_fetch_assoc($result))
    {
        $id=$row['userId'];
        $name=mysqli_query($con,"select userName from user where userId='$id'");
          

        $arr['userName']=mysqli_fetch_assoc($name)['userName'];
        $arr['userDp']="image";
        $arr['rating']=$row['rating'];
        $arr['review']=$row['review'];
        
        $json[$i++]=$arr;


        
    }
}



echo json_encode($json);






?>