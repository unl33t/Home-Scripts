<?php
include 'data.php';
?>
<html>
<head>
<script>
    function showResult(str) {
        if (str.length==0) {
            document.getElementById("livesearch").innerHTML="";
            document.getElementById("livesearch").style.border="0px";
            return;
        }
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        } else {  // code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function() {
            if (this.readyState==4 && this.status==200) {
                document.getElementById("livesearch").innerHTML=this.responseText;
                document.getElementById("livesearch").style.border="1px solid #A5ACB2";
                document.getElementById("livesearch").style.Width="25%";
                document.getElementById("livesearch").style.maxWidth="50%";
                document.getElementById("livesearch").style.marginLeft="100px";
            }
        }
        xmlhttp.open("GET","livesearch.php?q="+str,true);
        xmlhttp.send();
    }
</script>
<style type='text/css'>
	table { table-layout:fixed; }
	table.topalign td { vertical-align: top; }
	.tab { text-indent: 20px; }
	.head { font-size: 100%; font-weight: bold; }
</style>
</head>
<body>

<br><h2 align="center">Movie Listing</h2><br>

<form>
    Movie Search: <input type="text" size="50px" onkeyup="showResult(this.value)" autofocus>
    <div id="livesearch"></div>
</form>

<?php
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
