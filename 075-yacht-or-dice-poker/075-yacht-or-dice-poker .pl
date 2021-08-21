#!/usr/bin/perl
use strict;
use warnings;

open (IN, "input.txt");
<IN>;
my @output = ();
while (my @input = split (/\s+/, <IN>)) {
    my %freq = ();
    foreach my $input (@input) {
        $freq{$input}++;
    }
    my $f = join ("", sort values %freq);
    my $output = "none";
    if ($f eq "1112") { $output = "pair"; }
    elsif ($f eq "113") { $output = "three"; }
    elsif ($f eq "14") { $output = "four"; }
    elsif ($f eq "5") { $output = "yacht"; }
    elsif ($f eq "122") { $output = "two-pairs"; }
    elsif ($f eq "23") { $output = "full-house"; }
    elsif ($f eq "11111") {
        if (!$freq{"6"}) { $output = "small-straight"; }
        elsif (!$freq{"1"}) { $output = "big-straight"; }
    }
    push (@output, $output);
}
close (IN);

open (OUT, ">output.txt");
print OUT "@output";
close (OUT);