<?php
  date_default_timezone_set('America/New_York'); 
  $date = date('Y-m-d H:i:s');
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $date; ?> School Closings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script>
      setTimeout(function() {
        location.reload();
      }, 600000);
    </script>
  </head>
  <body>
    <a href="../">Back</a>
    <?php
      echo "<p>Last Refresh:  $date</p>";
      $totalschools = file_get_contents("http://www.timesunion.com/closings/");
      preg_match_all('/<ul class="school-closings-2">(.*?)<\/ul>/s', $totalschools, $match);
      $newlist = array();
      $newlist = explode("<li", $match[0][0]);
      // echo "<br>Cohoes Schools:<br>";
      // echo "<ul>";
      // foreach ( $newlist as $school ) {
      //   if (preg_match('/Cohoes/',$school) ) {
      //     echo "<li".$school;
      //   }
      // }
      echo "</ul>";
      echo "<br>Niskayuna Schools:<br>";
      echo "<ul>";
      foreach ( $newlist as $school ) {
        if (preg_match('/Niskayuna/',$school) ) {
          echo "<li".$school;
        }
      }
      echo "</ul>";
      echo "<br>RPI Schools:<br>";
      echo "<ul>";
      foreach ( $newlist as $school ) {
        if (preg_match('/RPI/',$school) ) {
          echo "<li".$school;
        }
      }
      echo "</ul>";
      echo "<br>All Schools:<br>";
      echo "<ul>";
      foreach ( $newlist as $school ) {
        echo "<li".$school;
      }
    ?>
  </body>
</html>
