<?php

$num=trim(fgets(STDIN));

function cnk($n,$k) { $res=gmp_init(1); for($i=$n-$k+1;$i<=$n;$i++) $res=gmp_mul($res,gmp_init($i)); for($i=2;$i<=$k;$i++) $res=gmp_div($res,gmp_init($i)); return $res; }

$max=0; for($i=1;$i<strlen($num);$i++) if ($num[$i]=='1') $max++; $parents=gmp_init(0); for($i=0;$i<=$max;$i++) $parents=gmp_add($parents,cnk($max,$i));

$step=0; while ($num!='10')
{ $q=''; $pos=0; $cnt=0; $dig=1;
  while ($pos<strlen($num)) if (intval($num[$pos++])==$dig) $cnt++; else { $dig^=1; $q.=decbin($cnt); $cnt=1; } if ($cnt) $q.=decbin($cnt);
  $num=$q; $step++; }

echo $step.' '.gmp_strval($parents);

?>
