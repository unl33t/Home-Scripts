#!/usr/bin/perl
#
use Text::Capitalize 0.2;
#
my $tobefixed = "";
my $original = "";
my @inprocess;
my $fixed = "";
my @movielisting = glob("*.m4v");
#
foreach $tobefixed (@movielisting) {
	$original = $tobefixed;
	$tobefixed =~ s/_/ /gi;						# replace _ with " "
	@inprocess = split(/\./, $tobefixed);				# break off the file type
	$fixed = capitalize_title( "$inprocess[0]").".".@inprocess[1];	# fix capitilization and append file type
	#
	print "$original -> $fixed\n";					# list whats going to be done
	system("mv", $original, $fixed);				# change the name
	}
