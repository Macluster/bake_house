<form  method="post" enctype="multipart/form-data">  
    Select File:  
    <input type="file" name="image1"/>  
    <input type="submit" value="Upload Image" name="submit"/>  
</form>  

<?php
if(isset($_POST['submit']))
{

echo "afaf";

$target_path = "C:\Deepuploads\deep.png";  
//$target_path = $target_path.basename( $_FILES['image1']['deep.png']);   
  
if(move_uploaded_file($_FILES['image1']['tmp_name'], $target_path)) {  
    echo "File uploaded successfully!";  
} else{  
    echo "Sorry, file not uploaded, please try again!";  
}  


}
?>  