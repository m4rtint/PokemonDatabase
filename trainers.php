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
						
						<h2 style='text-align:center;'>List Of Trainers</h2>
						
						<form name="input" action="trainers.php" method="get">
						Trainer Name: <input type="text" name="trainer">
						<input type="submit" value="search">
						</form> 
						<br>
						<?php
						
	$trainer = ucfirst(strtolower($_GET["trainer"]));
	if($trainer != null)
	{
		$trainers = array_map('ucfirst',explode(" ", $trainer));
		$trainer = implode(" ", $trainers);
		echo "<br>Search for " . $_GET["trainer"] . "<br>";  
		//Finds trainers 	
		$search_result = executePlainSQL("SELECT COUNT(*) FROM trainer WHERE tid = '" . $trainer ."' OR tid LIKE '%" . $trainer . "%'");
		$count = OCI_Fetch_Array($search_result, OCI_BOTH);
		echo "<br>" . $count[0] . " results found <br>";
		
		//FIND TRAINER VALUES - GRAB THE LIST OF POKEMON
		$trainer_info = executePlainSQL("SELECT * FROM trainer WHERE tid = '" . $trainer ."' OR tid LIKE '%" . $trainer . "%'");
		$name = OCI_Fetch_Array($trainer_info, OCI_BOTH);
		//echo $name[0];


		
		//FIND TRAINER LOCATIONS
		$loc = executePlainSQL("SELECT lname FROM live l WHERE l.tid LIKE '%"  . $trainer . "%' OR l.tid = '" . $trainer . "'");
		$location = OCI_Fetch_Array($loc, OCI_BOTH);
		//echo $location[0];
	
		//$party = explode("," , $name[1]);
		
		
		//Display information of each trainer that contains %trainer%
		if($count[0] == 1){
			$party = explode("," , $name[1]);
			echo "<div class='Pokeguide'>";
			echo "<table>";
			echo "<tr>";
			echo "<td>Name<br><br><u>{$name[0]}</u></td>";
			echo "<td>Location<br><br><u>{$location[0]}</u></td>";
			for($i = 0; $i < count($party); $i++){
				echo "<tr>";
				echo "<td colspan = '2'>";
				$result = executePlainSQL("SELECT * FROM pokemon WHERE pid = '" . $party[$i] . "'");
				printPoke($result);
				echo "</td>";
				echo "</tr>";
			}
			echo "</table>";
			echo "</div>";
		}			
		if($count[0] > 1){
			while($row = OCI_Fetch_Array($trainer_info, OCI_BOTH)){
				echo "<div class='Pokeguide'>";
				echo "<table>";
				echo "<tr>";
				echo "<td>Name<br><br><u>{$row[0]}</u></td>";
				echo "<td>Location<br><br><u>{$location[0]}</u></td>";
				$party = explode(',' , $row[1]);
				for($i = 0; $i < count($party); $i++){
					echo "<tr>";
					echo "<td colspan='2'>";
					$result = executePlainSQL("SELECT * FROM pokemon WHERE pid = '" . $party[$i] . "'");
					printPoke($result);
					echo "</td>";
					echo "</tr>";
					}
				echo "</table>";
				echo "</div>";
			}
		}
		
	}
	else{
		$regular = executePlainSQL("SELECT tid FROM trainer ORDER BY tid");
		printTable($regular);
	}
	
function printPoke($result)
{
	while ($row = OCI_Fetch_Array($result, OCI_BOTH)) 
	{
		echo "<font size='15px'><a href = profile.php?name='{$row[1]}'>{$row[1]}</a></font><br><br><img src='{$row[2]}' alt='picture'>";
									
	}
}

function printTable($result){
echo "<div class='Pokeguide'>";
		echo "<table>";
		echo "<tr>";
		echo "<td>Trainer Name</td>";
		echo "</tr>";
		
	while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
					for ($i = 0; $i < 15; $i++){
					if($row[$i] != null)
						echo "<tr><td>" . $row[$i] . "</td></tr>"; //or just use "echo $row[0]" 
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