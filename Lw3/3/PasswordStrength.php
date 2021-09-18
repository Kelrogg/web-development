<?php
$password = $_GET['password'];
$passwordstrength = 0; 
$array = [];
$length = strlen($password);
$passwordstrength += 4 * $length;
$passwordstrength += 4 * (strlen(preg_replace('/\D/', '', $password)));

if (!(strlen(preg_replace('/[^A-Z]/', '', $password)) === 0)){
    $passwordstrength += ($length - (strlen(preg_replace('/[^A-Z]/', '', $password)))) * 2;
}
if (!(strlen(preg_replace('/[^a-z]/', '', $password)) === 0)){
    $passwordstrength += ($length - (strlen(preg_replace('/[^a-z]/', '', $password)))) * 2;
}
if ($length === (strlen(preg_replace('/[^a-zA-Z]/', '', $password)))) { 
    $passwordstrength -= $length;
}
if ($length === (strlen(preg_replace('/[^0-9]/', '', $password)))) {
    $passwordstrength -= $length;
}
for ($i = 0; $i < $length; ++$i) {        
    $array[] = $password[$i];
}
unset($i);
$associate = array_count_values($array);       
foreach ($associate as $key => $value) {
  if ($value > 1){   
    $passwordstrength -= $value;
  }
}
unset($key);
unset($value);
header("Content-Type: text/plain");
echo $passwordstrength;