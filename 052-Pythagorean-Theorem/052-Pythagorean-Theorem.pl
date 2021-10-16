#! /usr/local/bin/perl
 $numtr = <STDIN>;
for ($n=0; $n<$numtr; $n++)
{
$abc=<STDIN>;

@abc1=split(" ", $abc);
$c2= sqrt($abc1[0]** 2 + $abc1[1]** 2);
if($c2 == $abc1[2])
{
@res[$n]="R";
}
elsif($c2 < $abc1[2])
{
@res[$n]="O";
}
else{
@res[$n]="A";
}

}
for($n=0;$n<$numtr;$n++)
{
print $res[$n]." ";
}

print "\n";