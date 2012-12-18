#!/opt/local/bin/perl
#
#	packages you'll need
#
use Text::Capitalize 0.2;
use IMDB::Film;
#
#	vars
#
my $tobefixed = "";
my $original = "";
my @inprocess;
my $fixed = "";
my @movielisting = glob("*.m4v");					# Gather all the .m4vs, that's what i rip in
#
#	let us begin...
#
foreach $tobefixed (@movielisting) {
	$original = $tobefixed;							# preserver orig for comparison later
	@inprocess = split(/\./, $tobefixed);					# break it up to preserver the file extension
	@inprocess[0] =~ s/_/ /gi;						# strip _ from title
	my $imdbObj = new IMDB::Film(crit => $inprocess[0]);			# query IMDB
	if ($imdbObj->status) {							# Check with IMDB for movie title
		$fixed = $imdbObj->title().".".@inprocess[1];			# set the new title
		if ( $original eq $fixed ) {					# do we NEED to change it?
			print "Title correct, no change needed\n";
		} else {
			print "\n\nWhat IMDB Found:\n";
			print "Title: ".$imdbObj->title()."\n";			# what did IMDB find?
			print "Year: ".$imdbObj->year()."\n";			# list year to verify film
                	print "Plot: ".$imdbObj->plot()."\n";			# list plot summery to verify film
			name_change($original, $fixed, @inprocess[1]);		# call the sub
		}
	} else {								# IMDB failed, fall back to text manipulation
	        print "Something went wrong with IMDB: ".$imdbObj->error()."\n";
		$fixed = capitalize_title( "$nprocess[0]").".".@inprocess[1];	# fix capitilization and append file type
		name_change($original, $fixed, @inprocess[1]);			# call the sub
	}
}
#
#	Subs (iTalian, Provalone, Lettice, Pickle on White)
#
sub name_change {
	my $original = @_[0];
	my $fixed = @_[1];
	my $ext = @_[2];
	print "\n\n$original -> $fixed\n";					# list whats going to be done
	print "Will this work for you? [Y|n]: ";			# verify change
	chomp(my $approval1 = <STDIN>);					# get approval/denial
	if ($approval1 =~ /^[Y]?$/i) {					# match Yy or blank
		system("mv", $original, $fixed);			# change the name
	} elsif ($approval1 =~ /^[N]$/i) {				# Match Nn
		print "Want to make a suggestion? [Y|n]: ";		# offer a solution
		chomp(my $approval2 = <STDIN>);				# get approval/denial
		if ($approval2 =~ /^[Y]?$/i) {				# match Yy or blank
			print "\nSuggested Title (don't bother with the extention ie: .m4v): ";
			chomp($fixed = <STDIN>);			# get users title
			$fixed = $fixed.".".$ext;
			print "$original -> $fixed\n";		
			system("mv", $original, $fixed);
		} elsif ($approval2 =~ /^[N]$/i) {			# Match Nn
			print "Title NOT changed\n";
		}
	}
}
