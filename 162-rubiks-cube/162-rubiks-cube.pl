#!/usr/bin/perl
use strict;
use warnings;

my @cube = (0) x 54;
$cube[30] = 1; $cube[31] = 2; $cube[32] = 3;
$cube[21] = 4; $cube[22] = 5; $cube[23] = 6;
$cube[12] = 7; $cube[13] = 8; $cube[14] = 9;

my @tf_a = qw( 6  7  8 11 12 13 14 15 20 21 23 24 29 30 31 32 33 36 37 38);
my @tf_b = qw(15 24 33  8 14 23 32 38  7 13 31 37  6 12 21 30 36 11 20 29);

my @tl_a = qw( 0  3  6  9 10 11 12 18 20 21 27 28 29 30 36 39 42 45 48 51);
my @tl_b = qw(12 21 30 11 20 29 36 10 28 39  9 18 27 42 45 48 51  0  3  6);

my @tr_a = qw( 2  5  8 14 15 16 17 23 24 26 32 33 34 35 38 41 44 47 50 53);
my @tr_b = qw(47 50 53  2 17 26 35  5 16 34  8 15 24 33 14 23 32 38 41 44);

my @tu_a = qw( 0  1  2  3  5  6  7  8  9 10 11 12 13 14 15 16 17 51 52 53);
my @tu_b = qw( 2  5  8  1  7  0  3  6 53 52 51  9 10 11 12 13 14 17 16 15);

my @td_a = qw(27 28 29 30 31 32 33 34 35 36 37 38 39 41 42 43 44 45 46 47);
my @td_b = qw(30 31 32 33 34 35 47 46 45 38 41 44 37 43 36 39 42 29 28 27);

my @tb_a = qw( 0  1  2  9 17 18 26 27 35 42 43 44 45 46 47 48 50 51 52 53);
my @tb_b = qw(27 18  9 42  0 43  1 44  2 35 26 17 47 50 53 46 52 45 48 51);

my %ta = ("F"=>\@tf_a,"R"=>\@tr_a,"B"=>\@tb_a,"L"=>\@tl_a,"U"=>\@tu_a,"D"=>\@td_a);
my %tb = ("F"=>\@tf_b,"R"=>\@tr_b,"B"=>\@tb_b,"L"=>\@tl_b,"U"=>\@tu_b,"D"=>\@td_b);

open (IN, "input.txt");
<IN>;
my @output;
while (my @input = split (/\s+/, <IN>)) {
    foreach my $move (@input) {
        turn ($ta{$move}, $tb{$move});
    }
    get_output();
}
close (IN);

open (OUT, ">output.txt");
print OUT join (" ", @output);
close (OUT);

sub turn {
    my ($ta, $tb) = @_;
    my @new = @cube;
    for (my $i = 0; $i < @$ta; $i++) {
        $new[$$tb[$i]] = $cube[$$ta[$i]];
    }
    @cube = @new;
}

sub get_output {
    my $map = ("U" x 9).("LLLFFFRRR" x 3).("D" x 9).("B" x 9);
    @output = (0) * 9;
    for (my $i = 0; $i < @cube; $i++) {
        if ($cube[$i] > 0) {
            $output[$cube[$i] - 1] = substr ($map, $i, 1);
        }
    }
}

