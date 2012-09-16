#! /opt/local/bin/perl
#
#   vars
#
my @movielisting = glob("*.mp4 *.m4v *.mov *.avi");
#
#   Body
#
foreach $movie(@movielisting) {
    $original = $movie;
    @inprocess = split(/\./, $movie);
    print "original: $original\n";
    print "inprocess: @inprocess[0]\n";
    print `HandBrakeCLI -Z AppleTV 3 -i "$original" -o "@inprocess[0].tmp"`;
    print `mv -v "@inprocess[0].tmp" "@inprocess[0].m4v"
}
