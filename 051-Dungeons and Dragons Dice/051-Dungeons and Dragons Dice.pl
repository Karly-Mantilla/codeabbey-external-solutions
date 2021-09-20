#!/usr/bin/perl
use strict;
use warnings;

my %dmin = ();
my %dmax = ();
for (my $sides = 2; $sides <= 12; $sides +=2) {
    for (my $dice = 1; $dice <= 5; $dice++) {
        my $min = $dice;
        my $max = $dice * $sides;
        $dmin{$dice."d".$sides} .= $min;
        $dmax{$dice."d".$sides} .= $max;
    }
}

my @output = ();
open (IN, "input.txt");
while (my @input = split (/\s+/, <IN>)) {
    pop (@input);
    my ($min, $max) = ($input[0], 0);
    foreach my $input (@input) {
        $min = $input if ($input < $min);
        $max = $input if ($input > $max);
    }
    my ($best, $best_dist) = ("", 60);
    foreach my $cand (keys %dmin) {
        if (($dmin{$cand} <= $min) && ($dmax{$cand} >= $max)) {
            my $dist = ($min - $dmin{$cand}) + ($dmax{$cand} - $max);
            if ($dist < $best_dist) {
                $best = $cand;
                $best_dist = $dist;
            }
        }
    }
    push (@output, $best);
}

open (OUT, ">output.txt");
print OUT join (" ", @output);
close (OUT);