#! /usr/bin/perl
use Time::Piece;
#
#   vars
#
my @movielisting = glob("*.mp4 *.mov *.avi *.mkv");
#
#   Body
#
foreach $movie(@movielisting) {
    my $str1 = localtime;
    print "Staring Rip:		" . $str1 . "\n";
    $original = $movie;
    @inprocess = split(/\./, $movie);
    print "original: $original\n";
    print "inprocess: " . @inprocess[0] . ".tmp\n";
    print `HandBrakeCLI -Z "HQ 1080p30 Surround" -i "$original" -o "@inprocess[0].tmp" 2>&1`;
    print `mv -v "@inprocess[0].tmp" "@inprocess[0].m4v"`;
    print "@inprocess[0].m4v complete\n";

    my $str2 = localtime;
    my $delta = $str2 - $str1;
    print "Rip Time:  " . $delta->pretty . "\n"; 
}
