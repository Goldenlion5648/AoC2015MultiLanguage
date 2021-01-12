use strict;
use warnings;
use diagnostics;
use feature 'say';
use File::Slurp ;

# open my $file, "<", "input.txt"
#     or die "Can't open file $_";
my $content = read_file("input1.txt");
# $content = "()())";
# say $content;
# close $file;
# say $content;
my @each_char =(split //, $content);
# say join ", ", @each_char;
my $count_left = grep {$_ eq "("} @each_char;
my $count_right = grep {$_ eq ")"} @each_char;
say "part 1: ", $count_left - $count_right;

my $depth = 0;
my $eaten = 0;
do {
    $depth += @each_char[0] eq "(" ? 1 : -1;
    shift @each_char;
    # say $depth;
    $eaten += 1;
} until($depth lt 0);

say "part2 $eaten";