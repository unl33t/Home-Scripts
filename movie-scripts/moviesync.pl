#!/usr/bin/perl
$src = "/Users/g33k/Desktop/Archived Movies/Prepped";
$dst = "/Volumes/Videos/Movies/Pending";
sub is_folder_empty {
    my $dirname = shift;
    opendir(my $dh, $dirname) or die "Not a directory";
    return scalar(grep { $_ ne "." && $_ ne ".." } readdir($dh)) == 0;
}
if (is_folder_empty($src)) {
    print "Empty, you forgot to put the files into Prepped!\n";
    exit;
} else {
    print "Files found, carry on...\n";
}
system "rsync -avzh --progress --include=\"*.m4v\" --exclude=\"*\" \"$src/\" $dst/";
$getlist = "ls \"$src\" | grep .m4v";
@movielist = `$getlist`;
chomp @movielist;
$allgood = "0";
foreach $movie (@movielist) {
    if ( -e "$dst/$movie" ) {
        print "$movie fond! Removing local copy.\n";
        system "rm \"$src/$movie\"";
        $allgood = "1";
    } else {
        print "$movie not found in Pending, skipping.\n";
    }
}
if ( $allgood == 1 ) {
    print ("Go forth and sort thy movies!  ( cd $dst )i\n\n");
}
