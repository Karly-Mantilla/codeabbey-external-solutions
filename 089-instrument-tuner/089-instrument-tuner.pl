#!/usr/bin/perl
use strict;
use warnings;

my @notes = ("C","C#","D","D#","E","F","F#","G","G#","A","A#","B");

my (@freq, @note) = ((), ());
for (my $i = 0; $i < 84; $i++) {
    my $note = $notes[$i % 12];
    my $octave = int ($i / 12);
    my $freq = 2 ** (($i - 33) / 12) * 110;
    push (@freq, $freq);
    push (@note, $note.$octave);
}

open (IN, "input.txt");
<IN>;
my @input = (split (/\s+/, <IN>));
my @output = ();
foreach my $input (@input) {
    my $i = 0;
    while ($freq[$i] < $input) {
        $i++;
    }
    push (@output, ($freq[$i] - $input < $input - $freq[$i - 1]) ? $note[$i] : $note[$i - 1]);
}
close (IN);

open (OUT, ">output.txt");
print OUT join (" ", @output);
close (OUT);