#!/usr/bin/perl -w
#
# simple-minded conversion from DOL to HetCASL
# by stripping features that HetCASL does not yet support

use feature qw(say);

my $dolfile = $ARGV[0];
(my $hetfile = $dolfile) =~ s/\.dol$/.het/;

open(INPUT, $dolfile) || die "Cannot open file $dolfile";
open(OUTPUT, ">$hetfile") || die "Cannot create file $hetfile";

my %prefixes;

while (<INPUT>) {
    # remove DOL syntactic namespace prefix declarations
    next if /^prefix/;
    # output logic names without prefix
    s/^logic         # the logic keyword
      [[:space:]]+   # whitespace
      (?:[^:]*:)?    # an optional prefix
      ([[:alnum:]]+) # the unprefixed name of the logic
      /logic $1/x;
    # replace keyword "interpretation" with "view"
    s/^interpretation/view/;
    # strip conservativity annotations of views
    s/^view                     # the view keyword
      [[:space:]]+              # whitespace
      ([[:alpha:]][[:alnum:]]*) # the view name
      [[:space:]]+              # whitespace
      \%[[:alpha:]]+            # the conservativity annotation (we don't care about its exact name)
      [[:space:]]+:             # whitespace and colon
      /view $1 :/x;
    
    print OUTPUT;
}
