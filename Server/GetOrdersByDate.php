
<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$bakerId=intval($_POST['bakerId']);
$sdate=$_POST['sdate'];
$edate=$_POST['edate'];
//$bakerId=$_POST['bakerId'];
//$sdate=$_POST['sdate'];
//$edate=$_POST['edate'];

$con=mysqli_connect('localhost','root','','homebakers');


$result=mysqli_query($con,"select * from orders where bakerId=$bakerId");

$arr=[];
$json=[];
$i=0;
if(mysqli_num_rows($result)>0)

while($row=mysqli_fetch_assoc($result))
{


    $res=mysqli_query($con,"select cakeName,cakeImage from cakes where cakeId=".$row['cakeId']);
    $crow=mysqli_fetch_assoc($res);

    $arr['orderId']=$row['orderId'];
    $arr['cakeId']=$row['cakeId'];
    $arr['bakerId']="$bakerId";
    $arr['cakeName']=$crow['cakeName'];
    $arr['cakeImage']=$crow['cakeImage'];
    $arr['userId']=$row['userId'];
    $arr['weight']=$row['weight'];
    $arr['calories']=$row['calories'];
    $arr['eggless']=$row['eggless'];
    $arr['sugarfree']=$row['sugarfree'];
    $arr['candleId']=$row['candleId'];
    $arr['writing']=$row['writing'];
    $arr['date']=$row['date'];
    $arr['time']=$row['time'];
    $arr['status']=$row['status'];
    $arr['location']=$row['location'];

    $day=intval(explode('/',$row['date'])[0]);
    $mon=intval( explode('/',$row['date'])[1]);
    $yea=intval(explode('/',$row['date'])[2]);

    $sday=intval( explode('/',$sdate)[0]);
    $smon=intval( explode('/',$sdate)[1]);
    $syea=intval( explode('/',$sdate)[2]);

    
    $eday= intval(  explode('/',$edate)[0]);
    $emon= intval( explode('/',$edate)[1]);
    $eyea=intval( explode('/',$edate)[2]);


    $flag = 0;
    if($yea==$syea)
    {
        if($mon==$smon)
        {
            if($day>=$sday)
            {
                    $flag = 1;  
            }
        }
        else if($mon>$smon)
        {
                $flag = 1;
        }
    }
    else if($yea>$syea)
    {
        $flag = 1;  
    }




    $flag2 = 0;
    if($yea==$eyea)
    {
        if($mon==$emon)
        {
            if($day<=$eday)
            {
                    $flag2 = 1;  
            }
        }
        else if($mon<$emon)
        {
                $flag2 = 1;
        }
    }
    else if($yea<$eyea)
    {
        $flag2 = 1;  
    }


    if($flag==1&&$flag2==1)
    {
        $json[$i++]=$arr;
    }






   

 
    

}

echo json_encode($json);







?>