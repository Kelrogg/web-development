<?php
$identifier = $_GET['identifier'];
$index = 0;

header("Content-Type: text/plain");
if (strlen($identifier) != 0){
  if (!preg_match("/^[a-zA-Zà-ÿÀ-ß]/", $identifier[0])){
    $error[$index] = 'No, error founded in first char " ' . $identifier[0] . ' " identifier can only start with letter!';
    ++$index;
  }
  else{
    for ($i = 1; $i < strlen($identifier); ++$i){
      if (!preg_match("/^[a-zA-Zà-ÿÀ-ß0-9]/", $identifier[$i])){
        $error[$index] = 'No, error founded in ' . ($i + 1) . ' char " ' . $identifier[$i] . ' " identifier can only include numbers and letters!';
        ++$index;
      }
    }
    unset($i);
  }
} 
else{
  $error[$index] = 'Please enter Identifier!';
}

if (!empty($error)) {              
  foreach ($error as $response){
    echo $response . PHP_EOL;
  }
  unset($response);
} 
else{
  echo 'Yes';
}


// echo 'test: $a'  - test: $a
// echo "test: $a"  - test: 100