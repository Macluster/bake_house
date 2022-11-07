<?php

$date=$_POST['date'];
$time=$_POST['time'];
$flag=intval($_POST['flag']) ;
$orderId= intval($_POST['orderId']) ;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");




$con=mysqli_connect('localhost','root','','homebakers');

if($flag==0)
{
    echo "succes0000";
    $result=mysqli_query($con,"update orders set status='accepted' where orderId=$orderId");

}

else if($flag==1)
{
    echo "succestt1111";
    $result=mysqli_query($con,"update orders  set status='rejected' where orderId=$orderId");
    echo "id=". $orderId;
}

else if($flag==2)
{
    echo "succestt22222s";
    $result=mysqli_query($con,"update orders set date='$date',time='$time', status='reschedule' where orderId=$orderId");
}

else
{
    echo "succestt3333";
    $result=mysqli_query($con,"update orders set  status='finished' where orderId=$orderId");
}




echo "success";



?>