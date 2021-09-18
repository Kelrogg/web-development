<?php
$email = $_GET['email'];
header("Content-Type: text/plain");
if (strlen($email) != 0){
  $firstname = $_GET['first_name'];
  $lastname = $_GET['last_name'];
  $age = $_GET['age'];
  $file = fopen("data\\$email.txt", 'w');       // 'a' - запись ТОЛЬКО в конец файла

  if (isset($firstname)){
    fwrite($file, 'First Name: ' . $firstname . PHP_EOL);
  }
  else{
    fwrite($file, 'First Name not stated' . PHP_EOL);                
  }

  if (isset($lastname)){
    fwrite($file, 'Last Name: ' . $lastname . PHP_EOL);
  }
  else{
    fwrite($file, 'Last Name not stated' . PHP_EOL);
  }

  if (isset($age)){
    fwrite($file, 'Age: ' . $age . PHP_EOL);
  }
  else{
    fwrite($file, 'Age not stated' . PHP_EOL);
  }
  fclose($file);
  echo  "Account created";
}
else{
  echo	"E-mail not found";
}