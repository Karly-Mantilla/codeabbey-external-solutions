<?php

$m=strval(trim(fgets(STDIN)));

for($i=0;$i<$m;$i++)
{ fscanf(STDIN,"%d %d\n",$b,$n);
  $vars=0; gen('',$n);
  echo $vars.' '; }


function gen($s,$k)
{ global $vars,$b,$n;
  if ($k) for($j=0;$j<$b;$j++) gen($s.chr($j),$k-1);
  else
  { $cur=ord($s[0]); for($j=1;$j<$n;$j++) $cur=$cur*$b+ord($s[$j]);
    $add=1; for($i=0;$i<$n-1;$i++)
    { $s=substr($s,1,$n-1).$s[0]; $id=ord($s[0]); for($j=1;$j<$n;$j++) $id=$id*$b+ord($s[$j]);
      if ($id<$cur) { $add=0; break; } }
    if ($add) { $vars++; } } } 

?>