#! /opt/local/bin/perl
#
#   vars
#
my @movielisting = glob("*.mp4 *.mov *.avi");
#
#   Body
#
foreach $movie(@movielisting) {
    $original = $movie;
    @inprocess = split(/\./, $movie);
    @inprocess =~ s/_/ /gi;
    print "original: $original\n";
    print "inprocess: @inprocess[0]\n";
    print `HandBrakeCLI -Z AppleTV 3 -i "$original" -o "tmp/@inprocess[0].m4v"`;
}
