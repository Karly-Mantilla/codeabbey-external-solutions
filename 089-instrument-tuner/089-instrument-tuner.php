<?php


$data = file_get_contents("php://STDIN");


$lines = explode("\n", $data);
array_shift($lines);


$order = explode(" ", "A A# B C C# D D# E F F# G G#");

$notes = array();
$freq = 440;
$const = 2**(1/12);

for($oct = 3; $oct >= 0; $oct--)
{
    for($i = count($order)-1; $i >= 0; $i--)
    {
        $realoct = $i >= 3 ? $oct+1 : $oct;
        $freq = $freq/$const;
        $notes[$order[$i].$realoct] = $freq;
    }
}
$notes = array_reverse($notes);

$freq = 440;
for($oct = 4; $oct < 7; $oct++)
{
    for($i = 0; $i < count($order); $i++)
    {
        $realoct = $i >= 3 ? $oct+1 : $oct;
        $notes[$order[$i].$realoct] = $freq;
        $freq = $freq*$const;
    }
}



foreach($lines as $line)
{
  $line = explode(" ", $line);

  foreach($line as $num)
  {
      $dist = 0;
      $last = 0;
      foreach($notes as $key => $freq)
      {
        if($freq < $num)
        {
          $dist = $freq - $num;
          $last = $key;
        }
        else
        {
          if(abs($dist) < abs($freq - $num))
          {
              echo($last." ");
          }
          else
          {
              echo($key." ");
          }
          break;
        }
      }
  }
}