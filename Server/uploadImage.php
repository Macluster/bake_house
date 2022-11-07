

<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");

$bytes=$_POST['image'];
$name=$_POST['folderName'];
$bakerId=$_POST['bakerId'];
$imageName=$_POST['imageName'];

$real=base64_decode($bytes);


if(!mkdir('assets/cakes/'.$bakerId)) {
    print_r(error_get_last());
}

chown('assets/cakes/'.$bakerId,"deepu");

if(!mkdir('assets/cakes/'.$bakerId.'/'.$name)) {
    print_r(error_get_last());
}


file_put_contents("assets/cakes/$bakerId/$name/$imageName.png",$real);

echo $name.$bakerId;



?>  





