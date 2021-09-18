<?php
$email = $_GET['email'];
header("Content-Type: text/plain");

if (strlen($email) != 0){
  $file = fopen("data\\$email.txt", 'r');
  echo  "First Name: ";
  $firstname = fgets($file);
  $lastname = fgets($file);
  $age = fgets($file);
  if (strpos($firstname, ':')){          
    echo substr($firstname, 11);
  }
  echo  "Last Name: ";
  if (strpos($lastname, ':')){
    echo substr($lastname, 10);
  }
  echo PHP_EOL;
  echo  "Email: " . $email . PHP_EOL;
  echo  "Age: ";
  if (strpos($age, ':')){
    echo substr($age, 4);
  }
}
else{                             
  echo	'email not found';
}