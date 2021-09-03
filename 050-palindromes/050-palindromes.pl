$n = <STDIN>;
while ($n-- > 0) {
    $s = <STDIN>;
    $s =~ s/[^a-z]//gi;
    $s = lc $s;
    $sr = reverse($s);
    $y = ($s eq $sr) ? "Y" : "N";
    print "$y ";
}