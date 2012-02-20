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

# libraries for which we need "from ... get ..." declarations (a hash used as a set)
my %download_items;

# all the other HetCASL output, which we can only write after %download_items
my @buffered_output;

my %prefixes;

my $NAME = '\b[[:alpha:]_][[:alnum:]_]*\b';
# a very ad hoc notion of what might come after a prefix; see PN_LOCAL in  http://www.w3.org/TR/2008/REC-rdf-sparql-query-20080115/#sparqlGrammar for really getting this right
my $LOCALNAME = '\b[[:alnum:]/._-]+\b';

while (<INPUT>) {
    # skip all-comment lines
    next if /^\%\%/;

    # TODO remove other comments (including nested ones)
    
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
    
    # no need to strip conservativity annotations of views – Hets ignores them anyway if they are not supported

    # newline after %annotations
    s/(\%[[:alpha:]]+)/$1\n/g;
    
    # expand prefixes to namespace URIs
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
    
    if (defined $prefixes{''}) {
      # strip URI from anything that is a fragment in the local DOL file
      # we assume that the empty namespace prefix refers to the local DOL file
      s/<\Q$prefixes{''}\E # the empty namespace (assumed to refer to the local DOL file)
         ([^>]+)>          # the fragment ID
         /$1/gx;
    }

    # strip namespace URIs from anything that is known to be in the HETS library
    s{<([^>]+)>}{
      my $path;
      if (grep {
          ($1 =~ /^\Q$_\E(.*)$/) &&
          ($path = $1)              # this is $1 matched in the line above!
        } @IN_HETS_LIB) {
        if ($path =~ m{/([^/]+)$}) {
          # as $1 is a function of $path, this assignment will result in the same value in subsequent executions
          $download_items{$path} = $1;
          $1
        } else {
          $path
        }
      } else {
        print STDERR "Warning: <$1>\n         does not have a local copy within the HETS_LIB path.\n         Please check the \@IN_HETS_LIB variable in this script.\n";
        "<$1>"
      }
    }egx;

    push @buffered_output, $_;
}

# do the actual output
while (my ($library, $spec) = each %download_items) {
    print OUTPUT "from $library get $spec\n";
}

print OUTPUT foreach (@buffered_output);

# # for debugging
# use Data::Dumper;
# print Dumper(\%download_items);
