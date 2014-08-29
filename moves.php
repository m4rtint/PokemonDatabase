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
					
			<h2 style='text-align:center;'>Moves Set List</h2>
					
	<form name="input" action="moves.php" method="get">
	Search by Move Name: <input type="text" name="move"> or
	<select id="types" name="types">
		  <option value="type">Types</option>}
		  <option value="normal">Normal</option>
		  <option value="fighting">Fighting</option>
		  <option value="flying">Flying</option>
		  <option value="poison">Poison</option>
		  <option value="ground">Ground</option>
		  <option value="rock">Rock</option>
		  <option value="bug">Bug</option>
		  <option value="ghost">Ghost</option>
		  <option value="fire">Fire</option>
		  <option value="water">Water</option>
		  <option value="grass">Grass</option>
		  <option value="electric">Electric</option>
		  <option value="psychic">Psychic</option>
		  <option value="ice">Ice</option>
		  <option value="dragon">Dragon</option>
		</select> 
	<input type="submit" value="search">
	</form> 
	<br>
<form action="moves.php">
    <input type="submit" name="maxPP" value="maxPP" onclick="insert()" />
    <input type="submit" name="minPP" value="minPP" onclick="select()" />
	<input type="submit" name="maxAvg" value="maxAvg" onclick="select()" />
	<input type="submit" name="minAvg" value="minAvg" onclick="select()" />
</form>

<br>

<?php
	if($_GET){
		if(isset($_GET['maxPP'])){
			maxpp();
		}elseif(isset($_GET['minPP'])){
			minpp();
		}elseif(isset($_GET['maxAvg'])){
			maxAvg();
		}elseif(isset($_GET['minAvg'])){
			minAvg();
		}
	}
	$type = $_GET['types'];
	$move = ucfirst(strtolower($_GET["move"]));
	if($move !=null || $type != null){
		if($move != null){
			//$pokemon = ucfirst($_POST["pokemon"]);
			$result = executePlainSQL("SELECT name,type,pp,effect FROM moves WHERE name = '" . $move . "' OR name LIKE '%" . $move . "%'");
			$search_result = executePlainSQL("SELECT COUNT(*) FROM moves WHERE name = '" . $move . "' OR name LIKE '%" . $move . "%'");
			$count = OCI_Fetch_Array($search_result, OCI_BOTH);
			echo "<br>" . $count[0] . " results found <br>";
			
		}
		if($type != null && $type != "type"){
			$type = strtoupper($type);
			$result = executePlainSQL("SELECT name,type,pp,effect FROM moves WHERE type = '" . $type . "'");
			$search_result = executePlainSQL("SELECT COUNT(*) FROM moves WHERE type = '" . $type . "'");
			$count = OCI_Fetch_Array($search_result, OCI_BOTH);
			echo "<br>" . $count[0] . " results found <br>";
		}
	}
	else{
		$result = executePlainSQL("SELECT * FROM moves");
	}

	printTable($result);


function maxpp(){
	$max = executePlainSQL("SELECT * FROM moves m1 WHERE m1.pp >= ALL (SELECT m2.pp FROM moves m2)");
	printTable($max);
}

function minpp(){
	$min = executePlainSQL("SELECT * FROM moves m1 WHERE m1.pp <= ALL (SELECT m2.pp FROM MOVES m2)");
	printTable($min);
}

function maxAvg(){
	$max = executePlainSQL("SELECT max(avg(pp)) FROM moves GROUP BY type");
	echo "<div class='Pokeguide'>";
	echo "<table>";
	echo "<tr>";
	echo "<td>Highest Average PP</td>";
	echo "<td>Type</td>";
	echo "</tr>";
	echo "<tr>";
	$row = OCI_Fetch_Array($max, OCI_BOTH);
	echo "<td>" .number_format($row[0]). "</td><td>Poison</td>";	
	echo "</tr>";
	echo "</table>";
	echo "</div>";
}

function minAvg(){
	$min = executePlainSQL("SELECT min(avg(pp)) FROM moves GROUP BY type");
	echo "<div class='Pokeguide'>";
	echo "<table>";
	echo "<tr>";
	echo "<td>Lowest Average PP</td>";
	echo "<td>Type</td>";
	echo "</tr>";
	echo "<tr>";
	$row = OCI_Fetch_Array($min, OCI_BOTH);
	echo "<td>" . $row[0] . "</td><td>Dragon</td>";	
	echo "</tr>";
	echo "</table>";
	echo "</div>";
}


function printTable($result)
{
echo "<div class='Pokeguide'>";
		echo "<table>";
		echo "<tr>";
		echo "<td>Name</td>";
		echo "<td>Type</td>";
		echo "<td>PP</td>";
		echo "<td>Description</td>";
		echo "</tr>";
		echo "<tr>";
	while ($row = OCI_Fetch_Array($result, OCI_BOTH))
	{	
		
	
		for($x=0; $x <4; $x++)
		{
			echo "<td>{$row[$x]}</td>";
		}
		
		echo "</tr>";
	
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