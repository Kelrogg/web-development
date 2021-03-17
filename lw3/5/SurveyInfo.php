<?php
$email = $_GET['email'];
if (strlen($email) != 0){
  $file = fopen("C:\\PHP\\Lw`s\\Lw3\\4\\data\\$email.txt", 'r');
  echo  "First Name: ";
  $firstname = fgets($file);
  $lastname = fgets($file);
  $age = fgets($file);
  if (strpos($firstname, ':')){          
    echo substr($firstname, 11);
  }
  echo "<br/>";
  echo  "Last Name: ";
  if (strpos($lastname, ':')){
    echo substr($lastname, 10);
  }
  echo "<br/>";
  echo  "Email: " . $email . "<br/>";
  echo  "Age: ";
  if (strpos($age, ':')){
    echo substr($age, 4);
  }
  echo "<br/";
}
else{                             
  echo	'email not found';
}