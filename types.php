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
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="cssmain/types.css" />
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
					<h2 style='text-align:center;'>Pokemon Weakness Type Chart</h2>
						<div class="Pokeguide">
					
					
						<?php
					
					//EXTRACT DATA FROM TYPES TABLE
					$Type_is = executePlainSQL("SELECT * from type_is");
					echo "<table>";
						echo "<tr><td>Attack\Defense</td>";
					//=============FIRST ROW FOR THE TABLES
					while($row = OCI_Fetch_Array($Type_is,OCI_BOTH))
					{
						if($row[0] !='Nothing')
						echo "<td>$row[0]</td>";
					}
					//=========================
						echo "</tr>";
					//=============REST OF ROWS
					$RestType = executePlainSQL("SELECT * from type_is");
					//REST OF THE TABLE
					while($row = OCI_Fetch_Array($RestType,OCI_BOTH))
					{
						if($row[0] !='Nothing')
						{
							echo "<tr>";
							for($x=0; $x < 16; $x++)
							{

								if($row[$x]==2)
								echo "<td bgcolor='#00CC00'>{$row[$x]}</td>";
								else if($row[$x]==.5)
								echo "<td bgcolor='#FF0000'>{$row[$x]}</td>";
								else if($row[$x]==0)
								echo "<td bgcolor='#C2C2A3'>{$row[$x]}</td>";
								else
								echo "<td>{$row[$x]}</td>";
								
							}
							echo "</tr>";
						}
					}
					//=============================
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