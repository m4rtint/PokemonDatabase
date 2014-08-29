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
		<link rel="stylesheet" href="cssmain/type.css" />
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
						
						
					<?php
					$name = $_GET['name'];
					echo "<h2 style='text-align:center;'>{$name} Profile</h2>";
					$result = executePlainSQL("SELECT * 
				FROM pokemon p
				INNER JOIN type_is t ON p.type1 = t.tname OR type2 = t.tname
				WHERE p.tname = '" . $name . "'");
				
				$row= OCI_Fetch_Array($result, OCI_BOTH);
				
				echo "<div class='Pokeguide'>";
				echo "<table>";
				echo "<tr>";
				echo "<td><font size='5px'>Name<br>{$row[1]}</font></td>";
				echo "<td><font size='5px'>Pokedex Number<br>{$row[0]}</font></td>";
				echo "<td><font size='5px'>Type 1<br>{$row[3]}</font></td>";
				echo "<td><font size='5px'>Type 2<br>{$row[4]}</font></td>";
				echo "</tr>";
				echo "<tr>";
				echo "<td colspan='4'><img src='{$row[2]}' alt=picture></td>";
				echo "</tr>";
				echo "</table>";
				
				echo "<table>";
				echo "<tr><td colspan='16'><center><font size='5px'>Damage Chart</font></center></td></tr>";
				echo "<tr><td>Attack\Defense</td><td>Normal</td><td>Fighting</td><td>Flying</td><td>Poison</td><td>Ground</td><td>Bug</td><td>Ghost</td><td>Fire</td><td>Water</td><td>Grass</td><td>Electric</td><td>Psychic</td><td>Ice</td><td>Dragon</td></tr>";
				echo "<tr>";
				for($i = 5; $i <20; $i++)
				{
				echo "<td>" . $row[$i] . "</td>";
				}
				echo "</tr>";
				printResult2($result);
				echo "</table>";
					
					?>
					</div>
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