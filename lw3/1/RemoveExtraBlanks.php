<?php
$text = $_GET['text'];     
header("Content-Type: text/plain");
function RemoveExtraBlanks(string $str): ?string{
  trim($str);
  $res = '';
  $prevblank = false;
  foreach($str as $symbol){
    if ($symbol !== ' '){ 
      if ($prevblank){
        $res .= ' ';
      }
      $res .= $symbol;
      $prevblank = false;
    }
    else{
      $prevblank = true;
    }                                                     
  }
  return $res;
}
if (isset($text)){
  echo $text;
}
else{
  echo 'Empty string' . PHP_EOL;
}