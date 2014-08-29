<!DOCTYPE HTML>
<html>
	<head>
		<title>PokeGuide</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
		<script src="js/jquery.min.js"></script>
		<script src="js/config.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
		<link rel="stylesheet" href="cssmain/table.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
	</head>
	<body>
	<!-- ********************************************************* -->
		<div id="header-wrapper">
			<div class="container">
				<div class="row">
					<div class="12u">
						
						<?php require 'topMenubar.php';?>
					
					</div>
				</div>
			</div>
		</div>
		<div id="main">
			<div class="container">
				<div class="row main-row">
					<div class="12u">
		<h2 style='text-align:center;'>List of Locations</h2>
		
<form name="input" action="location.php" method="get">
Location: <input type="text" name="location">
<input type="submit" value="search">
</form> 

<br>

<?php

//SEARCH
	$location = strtolower($_GET["location"]);
	if($location != null){
		//$pokemon = ucfirst($_POST["pokemon"]);
		$locations = array_map('ucfirst', explode(" " , $location));
		$location = implode(" " , $locations);
		$result = executePlainSQL("SELECT * FROM location WHERE lname = '" . $location . "' OR lname LIKE '%" . $location . "%'");
	}
	else{
		$result = executePlainSQL("SELECT * FROM location");
	}
	printLocation($result);

//Print result	

function printLocation($result){
	echo "<div class='Pokeguide'>";
	echo '<table>';
	echo '<tr><td>Location</td><td>Description</td></tr>';
	while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
		if((strpos($row[0],'Evolve') === false) and (strpos($row[0],'LName') === false)){	  
			echo '<tr>';
			echo '<td>' . $row[0] . '</td>';
			echo '<td>' . $row[1] . '</td>';
			echo '</tr>';
		}
		
							
	}
	echo "</table>";
	echo "</div>";
}

?>
						
					
					</div>
				</div>
			</div>
		</div>
		<div id="footer-wrapper">
			<div class="container">
				<div class="row">
					<div class="8u">
					</div>
					<div class="4u">
					</div>
				</div>
				<div class="row">
					<div class="12u">

						<div id="copyright">
									&copy; CS304 - PokeGuide. All rights reserved. | Design: HTML5 UP | Images: fotogrph
						</div>

					</div>
				</div>
			</div>
		</div>
	<!-- ********************************************************* -->
	</body>
</html>