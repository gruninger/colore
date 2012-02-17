#!/usr/bin/perl -w

use feature qw(say);

my $dolfile = $ARGV[0];
(my $hetfile = $dolfile) =~ s/\.dol$/.het/;

say $dolfile;
say $hetfile;

open(INPUT, $dolfile) || die "Cannot open file $dolfile";
open(OUTPUT, ">$hetfile") || die "Cannot create file $hetfile";

while (<INPUT>) {
   print OUTPUT;
}
