#!/usr/bin/perl
use strict;
use warnings;

open (IN, "input.txt");
<IN>;
my @output = ();
while (my ($a, $b, $m) = split (/\s+/, <IN>)) {
    my $c = 1;
    $a %= $m;
    while ($b > 0) {
        if ($b % 2 == 1) {
            $c = ($c * $a) % $m;
        }
        $b >>= 1;
        $a = ($a ** 2) % $m;
    }
    push (@output, $c);
}
close (IN);

open (OUT, ">output.txt");
print OUT join (" ", @output);
close (OUT);