<?php
$text = $_GET['text'];     
header("Content-Type: text/plain");
echo $text . PHP_EOL;

function removeExtraBlanks(string $str): string{
  trim($str);
  $res = '';
  $prevblank = false;
  for($i = 0; $i < strlen($str); ++$i){
    if ($str[$i] !== ' '){ 
      if ($prevblank){
        $res .= ' ';
      }
      $res .= $str[$i];
      $prevblank = false;
    }
    else{
      $prevblank = true;
    }                                                     
  }
  return $res;
}
if (isset($text)){
  echo removeExtraBlanks($text) . PHP_EOL;
}
else{
  echo 'Empty string' . PHP_EOL;
}