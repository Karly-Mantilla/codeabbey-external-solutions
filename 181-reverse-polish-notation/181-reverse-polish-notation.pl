use strict;
use warnings;

my %uni_ops = (
    'sqrt' => sub { sqrt(shift) },
);
my %bin_ops = (
    'add' => sub { my ($a, $b) = @_; $a + $b },
    'sub' => sub { my ($a, $b) = @_; $a - $b },
    'mul' => sub { my ($a, $b) = @_; $a * $b },
    'div' => sub { my ($a, $b) = @_; $a / $b },
    'mod' => sub { my ($a, $b) = @_; $a % $b },
);
my @stack;

sub op {
    my ($op) = @_;
    my $result;

    if ($uni_ops{$op}) {
        $result = $uni_ops{$op}(pop @stack);
    } elsif ($bin_ops{$op}) {
        my $b = pop @stack;
        my $a = pop @stack;
        $result = $bin_ops{$op}($a, $b);
    }

    push @stack, $result;
}

chomp(my $input = <>);
for (split / /, $input) {
    if (/^\d+$/) {
        push @stack, $_;
    } else {
        op($_);
    }
}

print pop @stack;