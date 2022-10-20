
<?php
$showalert=false;
if($_SERVER["REQUEST_METHOD"]=="POST"){
  
 
  $username="root";
  $password=" ";
  $database="user";
  $conn=  mysqli_connect($server,$username,$database);
  if($conn){
    echo"success";
}
else{
    die("error".mysqli_connect_error());
}

$username=$_POST["username"];
  $password=$_POST["password"];
  $cpassword=$_POST["cpassword"];

$exis=false;
if(($password==$cpassword)&& $exist=false){
$sql="INSERT INTO `users` ( `username`, `password`, `date`) VALUES ( '$username', '$password', current_timestamp());";
$result=mysqli_query($conn,$sql);
if($result){
 $showalert=true;
}
else {
die("cant insert due to ".mysqli_connect_error());
}
}




}

?>
 <?php
require'\xampp\htdocs\project\php\loginsystem\nav.php';

  ?>
  

    <!-- Bootstrap CSS -->
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body>
  

    <title>signup</title>
 
    <?php
if($showalert){
echo`<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Success</strong> Your account is now created.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>`;
}
?>
    <div class="container col-sm-8 my-4">
  <form>
  <div class="form-group ">
    <label for="username">Username</label>
    <input type="text" class="form-control" id="username" aria-describedby="username" placeholder="Enter the user name">
    
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="cpassword"> Confirm Password</label>
    <input type="password" class="form-control" id="cpassword" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
       <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
 