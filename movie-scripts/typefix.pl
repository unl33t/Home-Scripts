#! /usr/bin/perl
#
#   vars
#
my @movielisting = glob("*.mp4 *.m4v *.mov *.avi *.mkv");
#
#   Body
#
foreach $movie(@movielisting) {
    $original = $movie;
    @inprocess = split(/\./, $movie);
    print "original: $original\n";
    print "inprocess: @inprocess[0]";
    print `HandBrakeCLI -Z AppleTV 3 -i "$original" -o "@inprocess[0].tmp" 2>&1`;
    print `mv -v "@inprocess[0].tmp" "@inprocess[0].m4v"`;
    print "@inprocess[0].m4v complete\n";
}
