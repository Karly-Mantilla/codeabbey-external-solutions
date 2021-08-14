#!/usr/bin/perl
use strict;
use warnings;

open (IN, "input.txt");
<IN>;
my @output = ();
while (my $input = <IN>) {
    my ($a, $b, $c) = sort {$a <=> $b} split (/\s+/, $input);
    push (@output, ($a + $b >= $c) ? 1 : 0);
}
close (IN);
open (OUT, ">output.txt");
print OUT join (" ", @output);
close (OUT);