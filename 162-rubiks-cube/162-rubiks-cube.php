<?php

$data = file_get_contents("php://STDIN");
/*
$data = "83
R F D L R D F D D L L U R L F D B D F B R U L F R U R F R U R D B R B R R R R F D F D U D B D L B L R R D L L U D R R F B B U L L B R B B B L D U B B R B R B F L D U";
*/

$lines = explode("\n", $data);
$moves = explode(" ", array_pop($lines));
//array_shift($moves);

//$lines = array_chunk($lines, 1)[0];

$cube = array();
for($i = 0; $i < 5; $i++)
{
  array_push($cube, array());
  for($j = 0; $j < 5; $j++)
  {
    array_push($cube[$i], array());

    for($k = 0; $k < 5; $k++)
    {
      array_push($cube[$i][$j], 0);
    }
  }
}

$cube[1][1][0] = 7;
$cube[2][1][0] = 8;
$cube[3][1][0] = 9;

$cube[1][2][0] = 4;
$cube[2][2][0] = 5;
$cube[3][2][0] = 6;

$cube[1][3][0] = 1;
$cube[2][3][0] = 2;
$cube[3][3][0] = 3;

foreach($moves as $move)
{
    goto skipdebug;


    ?>

    <table style="text-align:center; margin:50px 50px  0; height: 50px; width: 150px; border: 1px solid black">
      <tr style="height: 5px;">
        <td style="min-width: 30px; border: 1px solid black"></td>
        <td style="min-width: 30px; border: 1px solid black"></td>
        <td style="min-width: 30px; border: 1px solid black"></td>

        <td style="min-width: 30px; border: 1px solid black"></td>
        <td style="min-width: 30px; border: 1px solid black"></td>
        <td style="min-width: 30px; border: 1px solid black"></td>

        <td style="min-width: 30px; border: 1px solid black"></td>
        <td style="min-width: 30px; border: 1px solid black"></td>
        <td style="min-width: 30px; border: 1px solid black"></td>

        <td style="min-width: 30px; border: 1px solid black"></td>
        <td style="min-width: 30px; border: 1px solid black"></td>
        <td style="min-width: 30px; border: 1px solid black"></td>
      </tr>


      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][0][3]?></td>
        <td style="border: 1px solid black"><?=$cube[2][0][3]?></td>
        <td style="border: 1px solid black"><?=$cube[3][0][3]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>
      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][0][2]?></td>
        <td style="border: 1px solid black"><?=$cube[2][0][2]?></td>
        <td style="border: 1px solid black"><?=$cube[3][0][2]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>
      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][0][1]?></td>
        <td style="border: 1px solid black"><?=$cube[2][0][1]?></td>
        <td style="border: 1px solid black"><?=$cube[3][0][1]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>


      <tr style="height: 5px;">
      </tr>

      <tr style="height: 30px;">
        <td style="border: 1px solid black"><?=$cube[0][1][3]?></td>
        <td style="border: 1px solid black"><?=$cube[0][1][2]?></td>
        <td style="border: 1px solid black"><?=$cube[0][1][1]?></td>

        <td style="border: 1px solid black"><?=$cube[1][1][0]?></td>
        <td style="border: 1px solid black"><?=$cube[2][1][0]?></td>
        <td style="border: 1px solid black"><?=$cube[3][1][0]?></td>

        <td style="border: 1px solid black"><?=$cube[4][1][1]?></td>
        <td style="border: 1px solid black"><?=$cube[4][1][2]?></td>
        <td style="border: 1px solid black"><?=$cube[4][1][3]?></td>

        <td style="border: 1px solid black"><?=$cube[3][1][4]?></td>
        <td style="border: 1px solid black"><?=$cube[2][1][4]?></td>
        <td style="border: 1px solid black"><?=$cube[1][1][4]?></td>
      </tr>
      <tr style="height: 30px;">
        <td style="border: 1px solid black"><?=$cube[0][2][3]?></td>
        <td style="border: 1px solid black"><?=$cube[0][2][2]?></td>
        <td style="border: 1px solid black"><?=$cube[0][2][1]?></td>

        <td style="border: 1px solid black"><?=$cube[1][2][0]?></td>
        <td style="border: 1px solid black"><?=$cube[2][2][0]?></td>
        <td style="border: 1px solid black"><?=$cube[3][2][0]?></td>

        <td style="border: 1px solid black"><?=$cube[4][2][1]?></td>
        <td style="border: 1px solid black"><?=$cube[4][2][2]?></td>
        <td style="border: 1px solid black"><?=$cube[4][2][3]?></td>

        <td style="border: 1px solid black"><?=$cube[3][2][4]?></td>
        <td style="border: 1px solid black"><?=$cube[2][2][4]?></td>
        <td style="border: 1px solid black"><?=$cube[1][2][4]?></td>
      </tr>
      <tr style="height: 30px;">
        <td style="border: 1px solid black"><?=$cube[0][3][3]?></td>
        <td style="border: 1px solid black"><?=$cube[0][3][2]?></td>
        <td style="border: 1px solid black"><?=$cube[0][3][1]?></td>

        <td style="border: 1px solid black"><?=$cube[1][3][0]?></td>
        <td style="border: 1px solid black"><?=$cube[2][3][0]?></td>
        <td style="border: 1px solid black"><?=$cube[3][3][0]?></td>

        <td style="border: 1px solid black"><?=$cube[4][3][1]?></td>
        <td style="border: 1px solid black"><?=$cube[4][3][2]?></td>
        <td style="border: 1px solid black"><?=$cube[4][3][3]?></td>

        <td style="border: 1px solid black"><?=$cube[3][3][4]?></td>
        <td style="border: 1px solid black"><?=$cube[2][3][4]?></td>
        <td style="border: 1px solid black"><?=$cube[1][3][4]?></td>
      </tr>

      <tr style="height: 5px;">
      </tr>

      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][4][1]?></td>
        <td style="border: 1px solid black"><?=$cube[2][4][1]?></td>
        <td style="border: 1px solid black"><?=$cube[3][4][1]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>
      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][4][2]?></td>
        <td style="border: 1px solid black"><?=$cube[2][4][2]?></td>
        <td style="border: 1px solid black"><?=$cube[3][4][2]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>
      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][4][3]?></td>
        <td style="border: 1px solid black"><?=$cube[2][4][3]?></td>
        <td style="border: 1px solid black"><?=$cube[3][4][3]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>

      <tr style="height: 5px;">
      </tr>

      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][3][4]?></td>
        <td style="border: 1px solid black"><?=$cube[2][3][4]?></td>
        <td style="border: 1px solid black"><?=$cube[3][3][4]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>
      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][2][4]?></td>
        <td style="border: 1px solid black"><?=$cube[2][2][4]?></td>
        <td style="border: 1px solid black"><?=$cube[3][2][4]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>
      <tr style="height: 30px;">
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>

        <td style="border: 1px solid black"><?=$cube[1][1][4]?></td>
        <td style="border: 1px solid black"><?=$cube[2][1][4]?></td>
        <td style="border: 1px solid black"><?=$cube[3][1][4]?></td>

        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
        <td style="border: 1px solid black"></td>
      </tr>

    </table>


    <?php
    echo($move."<br>");
    skipdebug:

    switch($move)
    {
      case "U":
      $a = $cube[1][0][1];//Up corners
      $cube[1][0][1] = $cube[3][0][1];
      $cube[3][0][1] = $cube[3][0][3];
      $cube[3][0][3] = $cube[1][0][3];
      $cube[1][0][3] = $a;

      $a = $cube[2][0][1];//Up middle
      $cube[2][0][1] = $cube[3][0][2];
      $cube[3][0][2] = $cube[2][0][3];
      $cube[2][0][3] = $cube[1][0][2];
      $cube[1][0][2] = $a;

      $a = $cube[1][1][0];//Front up left
      $cube[1][1][0] = $cube[4][1][1];
      $cube[4][1][1] = $cube[3][1][4];
      $cube[3][1][4] = $cube[0][1][3];
      $cube[0][1][3] = $a;

      $a = $cube[2][1][0];//Front up middle
      $cube[2][1][0] = $cube[4][1][2];
      $cube[4][1][2] = $cube[2][1][4];
      $cube[2][1][4] = $cube[0][1][2];
      $cube[0][1][2] = $a;

      $a = $cube[3][1][0];//Front up right
      $cube[3][1][0] = $cube[4][1][3];
      $cube[4][1][3] = $cube[1][1][4];
      $cube[1][1][4] = $cube[0][1][1];
      $cube[0][1][1] = $a;
      break;

      case "F":
      $a = $cube[1][1][0];//Front corners
      $cube[1][1][0] = $cube[1][3][0];
      $cube[1][3][0] = $cube[3][3][0];
      $cube[3][3][0] = $cube[3][1][0];
      $cube[3][1][0] = $a;

      $a = $cube[2][1][0];//Front middle
      $cube[2][1][0] = $cube[1][2][0];
      $cube[1][2][0] = $cube[2][3][0];
      $cube[2][3][0] = $cube[3][2][0];
      $cube[3][2][0] = $a;

      $a = $cube[1][0][1];//Up down left
      $cube[1][0][1] = $cube[0][3][1];
      $cube[0][3][1] = $cube[3][4][1];
      $cube[3][4][1] = $cube[4][1][1];
      $cube[4][1][1] = $a;

      $a = $cube[2][0][1];//Up down middle
      $cube[2][0][1] = $cube[0][2][1];
      $cube[0][2][1] = $cube[2][4][1];
      $cube[2][4][1] = $cube[4][2][1];
      $cube[4][2][1] = $a;

      $a = $cube[3][0][1];//Front up right
      $cube[3][0][1] = $cube[0][1][1];
      $cube[0][1][1] = $cube[1][4][1];
      $cube[1][4][1] = $cube[4][3][1];
      $cube[4][3][1] = $a;
      break;

      case "R":
      $a = $cube[4][1][1];//Right corners
      $cube[4][1][1] = $cube[4][3][1];
      $cube[4][3][1] = $cube[4][3][3];
      $cube[4][3][3] = $cube[4][1][3];
      $cube[4][1][3] = $a;

      $a = $cube[4][1][2];//Right middle
      $cube[4][1][2] = $cube[4][2][1];
      $cube[4][2][1] = $cube[4][3][2];
      $cube[4][3][2] = $cube[4][2][3];
      $cube[4][2][3] = $a;

      $a = $cube[3][1][0];//Front up right
      $cube[3][1][0] = $cube[3][4][1];
      $cube[3][4][1] = $cube[3][3][4];
      $cube[3][3][4] = $cube[3][0][3];
      $cube[3][0][3] = $a;

      $a = $cube[3][2][0];//Front middle right
      $cube[3][2][0] = $cube[3][4][2];
      $cube[3][4][2] = $cube[3][2][4];
      $cube[3][2][4] = $cube[3][0][2];
      $cube[3][0][2] = $a;

      $a = $cube[3][3][0];//Front down right
      $cube[3][3][0] = $cube[3][4][3];
      $cube[3][4][3] = $cube[3][1][4];
      $cube[3][1][4] = $cube[3][0][1];
      $cube[3][0][1] = $a;
      break;


      case "L":
      $a = $cube[0][1][1];//Left corners
      $cube[0][1][1] = $cube[0][1][3];
      $cube[0][1][3] = $cube[0][3][3];
      $cube[0][3][3] = $cube[0][3][1];
      $cube[0][3][1] = $a;

      $a = $cube[0][1][2];//Left middle
      $cube[0][1][2] = $cube[0][2][3];
      $cube[0][2][3] = $cube[0][3][2];
      $cube[0][3][2] = $cube[0][2][1];
      $cube[0][2][1] = $a;

      $a = $cube[1][1][0];//Front up left
      $cube[1][1][0] = $cube[1][0][3];
      $cube[1][0][3] = $cube[1][3][4];
      $cube[1][3][4] = $cube[1][4][1];
      $cube[1][4][1] = $a;

      $a = $cube[1][2][0];//Front middle left
      $cube[1][2][0] = $cube[1][0][2];
      $cube[1][0][2] = $cube[1][2][4];
      $cube[1][2][4] = $cube[1][4][2];
      $cube[1][4][2] = $a;

      $a = $cube[1][3][0];//Front down left
      $cube[1][3][0] = $cube[1][0][1];
      $cube[1][0][1] = $cube[1][1][4];
      $cube[1][1][4] = $cube[1][4][3];
      $cube[1][4][3] = $a;
      break;

      case "D":
      $a = $cube[1][4][1];//Down corners
      $cube[1][4][1] = $cube[1][4][3];
      $cube[1][4][3] = $cube[3][4][3];
      $cube[3][4][3] = $cube[3][4][1];
      $cube[3][4][1] = $a;

      $a = $cube[2][4][1];//Down middle
      $cube[2][4][1] = $cube[1][4][2];
      $cube[1][4][2] = $cube[2][4][3];
      $cube[2][4][3] = $cube[3][4][2];
      $cube[3][4][2] = $a;


      $a = $cube[1][3][0];//Front down left
      $cube[1][3][0] = $cube[0][3][3];
      $cube[0][3][3] = $cube[3][3][4];
      $cube[3][3][4] = $cube[4][3][1];
      $cube[4][3][1] = $a;

      $a = $cube[2][3][0];//Front down middle
      $cube[2][3][0] = $cube[0][3][2];
      $cube[0][3][2] = $cube[2][3][4];
      $cube[2][3][4] = $cube[4][3][2];
      $cube[4][3][2] = $a;

      $a = $cube[3][3][0];//Front down right
      $cube[3][3][0] = $cube[0][3][1];
      $cube[0][3][1] = $cube[1][3][4];
      $cube[1][3][4] = $cube[4][3][3];
      $cube[4][3][3] = $a;
      break;


      case "B":
      $a = $cube[1][1][4];//Back corners
      $cube[1][1][4] = $cube[3][1][4];
      $cube[3][1][4] = $cube[3][3][4];
      $cube[3][3][4] = $cube[1][3][4];
      $cube[1][3][4] = $a;

      $a = $cube[2][1][4];//Back middle
      $cube[2][1][4] = $cube[3][2][4];
      $cube[3][2][4] = $cube[2][3][4];
      $cube[2][3][4] = $cube[1][2][4];
      $cube[1][2][4] = $a;

      $a = $cube[1][0][3];//Up up left
      $cube[1][0][3] = $cube[4][1][3];
      $cube[4][1][3] = $cube[3][4][3];
      $cube[3][4][3] = $cube[0][3][3];
      $cube[0][3][3] = $a;

      $a = $cube[2][0][3];//Up up middle
      $cube[2][0][3] = $cube[4][2][3];
      $cube[4][2][3] = $cube[2][4][3];
      $cube[2][4][3] = $cube[0][2][3];
      $cube[0][2][3] = $a;

      $a = $cube[3][0][3];//Front up right
      $cube[3][0][3] = $cube[4][3][3];
      $cube[4][3][3] = $cube[1][4][3];
      $cube[1][4][3] = $cube[0][1][3];
      $cube[0][1][3] = $a;
      break;
    }
}

for($search = 1; $search <= 9; $search++)
{
  for($i = 0; $i < 5; $i++)
  {
    for($j = 0; $j < 5; $j++)
    {
      for($k = 0; $k < 5; $k++)
      {
        if($cube[$i][$j][$k] == $search)
        {
          if($i == 0)
          {
            echo("L ");
          }
          else if($i == 4)
          {
            echo("R ");
          }
          else if($j == 0)
          {
            echo("U ");
          }
          else if($j == 4)
          {
            echo("D ");
          }
          else if($k == 0)
          {
            echo("F ");
          }
          else if($k == 4)
          {
            echo("B ");
          }
        }
      }
    }
  }
}