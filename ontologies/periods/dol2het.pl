#!/usr/bin/perl -w
#
# simple-minded conversion from DOL to HetCASL
# by stripping features that HetCASL does not yet support

use strict;

# this assumes (hard-coded so far) that the "ontologies" directory of COLORE is in the HETS_LIB path variable
my @IN_HETS_LIB = qw(http://code.google.com/p/colore/source/browse/trunk/ontologies/);

my @KEYWORDS = qw(logic view to end then);

my $dolfile = $ARGV[0];
(my $hetfile = $dolfile) =~ s/\.dol$/.het/;

open(INPUT, $dolfile) || die "Cannot open file $dolfile";
open(OUTPUT, ">$hetfile") || die "Cannot create file $hetfile";

my %prefixes;

my $NAME = '\b[[:alpha:]_][[:alnum:]_]*\b';
# a very ad hoc notion of what might come after a prefix; see PN_LOCAL in  http://www.w3.org/TR/2008/REC-rdf-sparql-query-20080115/#sparqlGrammar for really getting this right
my $LOCALNAME = '\b[[:alnum:]/._-]+\b';

while (<INPUT>) {
    
    # remove DOL syntactic namespace prefix declarations
    if (/^prefix                  # the prefix keyword
        [[:space:]]+              # whitespace
        ($NAME)?                  # optional prefix name
        [[:space:]]*=[[:space:]]+ # =
        <([^>]+)>                 # the URI
        /x) {
        $prefixes{defined $1 ? $1 : ''} = $2;
        next;
    }
    
    # replace keyword "interpretation" with "view"
    s/^interpretation/view/;
    
    # strip conservativity annotations of views
    s/^view          # the view keyword
      [[:space:]]+   # whitespace
      ($NAME)        # the view name
      [[:space:]]+   # whitespace
      \%[[:alpha:]]+ # the conservativity annotation (we don't care about its exact name)
      [[:space:]]+:  # whitespace and colon
      /view $1 :/x;
    
    # semi-smart stripping of prefixes from ontology names
    s/(?<!%)        # if this is no %cons-like annotation
      (?:($NAME):)? # optional prefix
      ($LOCALNAME)  # local name
      /
      my $prefix = defined $1 ? $1 : '';
      my $localname = $2;
      if ($prefix eq '' && grep { $_ eq $localname } @KEYWORDS) {
        # leave HetCASL keywords in place
        $localname
      } elsif (my $nsuri = $prefixes{$prefix}) {
        # expand prefix to namespace URI
        "<$nsuri$localname>"
      } else {
        print STDERR "Warning: use of undefined namespace prefix $prefix; outputting unprefixed name $localname\n";
        "<$localname>"
      }
      /egx;
    
    # output logic names without namespace
    s{^logic                      # the logic keyword
      [[:space:]]+                # whitespace
      <http://purl.net/dol/logic/ # DOL logic namespace URI
      ($NAME)>                    # the unprefixed name of the logic
      }{logic $1}x;
    
    print OUTPUT;
}
