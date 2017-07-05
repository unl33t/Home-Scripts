<html>
<head>
	<style type='text/css'>
		table { table-layout:fixed; }
		table.topalign td { vertical-align: top; }
		.tab { text-indent: 20px; }
		.head { font-size: 100%; font-weight: bold; }
	</style>
</head>
<body>

<br><h2 align="center">Movie Listing</h2><br>

<?php
#
#	Functions
#
$movies = array();
$pmovies = array();

# find movie path
function find_it($tword) {
	$output = array();
	$found = array();
	exec("find /nfs/Videos/Movies -iname *.m4v -type f -print | sort | cut -d / -f 5-9 | grep -v eaDir", $output);
	$wcount = count($tword);
	$wcheck = 0;
	foreach($output as $movie) {
		foreach($tword as $word) {
			if (strpos(strtolower($movie), strtolower($word))) {
				$wcheck++;
			}
		}
		if($wcount == $wcheck) {
			array_push($found, $movie);
			$wcheck = 0;
		}
	}
	return array_unique($found);
}

# get list contents of movie dir
function get_movies($dir) {
	$basedir = "/nfs/Videos/Movies/".$dir;
	$output = array();
	exec("ls -R1 ".$basedir." -I *SynoReso -I @eaDir 2>&1", $output);
	return $output;
}

#print movies and dirs
function print_movie($base) {
	foreach ($base as $movie) {
		if (strpos($movie,"nfs")) {
			$path = explode("/", $movie);
			echo "<div class=\"head\">";
			foreach ($path as $element => $part) {
				if ($element >= 4) {		# where to strt from
					if (strpos($part, "m4v")) {
						$npart = substr($part,0,-4);
					} else {
						$npart = $part;
					}
					echo " > ".$npart;
				}
			}
			echo "</div>";
		} else {
			if (strpos($movie, ".")) {
				$mparts = substr($movie,0,-4);		# remove .m4v
				echo "<div class=\"tab\">".$mparts."</div>";
			}
		}
	}
	echo "<br><br>";
}
#
#					Page Content
#
#
#	Movie Search
#
echo "<form action=\".\" method=\"post\">";
echo "Movie Search: <input type=\"text\" name=\"tword\"> <input type=\"submit\"> <a href=\".\">Reset</a>";
echo "</form>";

$terms = explode(" ",$_POST["tword"]);
$pmovies = find_it($terms);
if($pmovies) {
	print_movie($pmovies);
} else {
	echo "No maches found.";
}
echo "<br><br>";
#
#	Actual Listing
#
echo "<dive align=\"center\">";
echo "<table border=\"0\" width=\"80%\" cellpadding=\"5\" cellspacing=\"3\" class=\"topalign\">";
echo "<tr>";

echo "<td>";
	$dir = "General";
	#echo "<br><div class=\"head\">".$dir."</div>";
	$movies = get_movies($dir);
	print_movie($movies);

        $dir = "Mommy";
        #echo "<br><div class=\"head\">".$dir."</div>";
        $movies = get_movies($dir);
        print_movie($movies);

        $dir = "Daddy";
        #echo "<br><div class=\"head\">".$dir."</div>";
        $movies = get_movies($dir);
        print_movie($movies);
echo "</td>";

echo "<td>";
	$dir = "Family";
        #echo "<br><div class=\"head\">".$dir."</div>";
	$movies = get_movies($dir);
	print_movie($movies);
echo "</td>";

echo "</tr>";
echo "<table>";
echo "</div>"
?>

</body>
</html>
