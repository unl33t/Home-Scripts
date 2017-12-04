<?php
include 'data.php';

if ($_GET["q"]=="") {
    $q="Space 2001";
} else {
    $q=$_GET["q"];
}
$q = explode(" ",$q);  // turn q into an array as that's what the next function expects

$hint = find_it($q);
$found=print_find($hint);

// or to the correct values
if ($found=="") {
    $response="no suggestion";
} else {
    $response=print_find($hint);
}
echo $response;
?>
