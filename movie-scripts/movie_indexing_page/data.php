<?php
#
#	Functions
#
$movies = array();
$pmovies = array();

# find movie path
function find_it($tword) {
    $tword = preg_replace("/[^ \w]+/", "", $tword);
	$output = array();
	$found = array();
	exec("find /nfs/Videos/Movies \( -iname \*.m4v -o -iname \*.mp4 \) -type f -print | sort | cut -d / -f 5-9 | grep -v eaDir", $output);
	$wcount = count($tword);
	$wcheck = 0;
	foreach($output as $movie) {
		foreach($tword as $word) {
			if (strpos(strtolower($movie), strtolower($word))) {
				$wcheck++;
			} else {
				$wcheck = 0;
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
    if($dir == "all") {
        $dir="";
    }
	$basedir = "/nfs/Videos/Movies/".$dir;
	$output = array();
	exec("ls -R1 ".$basedir." -I *SynoReso -I @eaDir", $output);
	return $output;
}

#print movies and dirs
function print_movie($base) {
	foreach ($base as $movie) {
		if (strpos($movie,"nfs")) {
			$path = explode('/', $movie);
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
function print_find($base) {
    $list = "";
    foreach ($base as $item) {
        $item = substr($item,0,-4);
        if ($list=="") {
            $list=$item;
        } else {
            $list=$list . "<br />" . $item;
        }
    }
    return $list;
}
?>
