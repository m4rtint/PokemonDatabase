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

<?php					

	if(isset($_SESSION["username"]))
	{	
		echo "<h2 style='text-align:center;'>Welcome to your Pokemon Party<br> PokeMaster {$_SESSION["username"]}</h2>";
		$trainer_info = executePlainSQL("SELECT * FROM party WHERE partyid = '{$_SESSION["username"]}'");
		$row = OCI_Fetch_Array($trainer_info, OCI_BOTH); 
		$party = explode("," , $row[1]);
		
		echo "<div class='Pokeguide'>";
	//================LIST OF POKEMON	
		for($i = 0; $i < count($party); $i++)
		{
			echo "<table>";
			$result = executePlainSQL("SELECT * FROM pokemon WHERE pid = '{$party[$i]}'");
			printPoke($result);
			echo "<td>";
			echo "<form action='deletePoke.php' method='get'>";
			echo "<button name='submit' value='{$party[$i]}'>Remove Pokemon</button></form>";
			echo "</td>";
			echo "</tr>";
		
	//========================================
		}
	echo "<tr>";
	echo "<td colspan='2'>";
		//DELETE USER BUTTON
		echo "<form action='deleteUser.php'>";
		echo "<button name='delete'>DELETE USER</button></form>";
	echo "</td>";
	echo "</tr>";
		echo "</table>";
		echo "</div>";
	}
	else{
		echo "Please <a href = login.php>Login</a> / <a href = register.php>Register</a> to view Trainer profile";
	}

function printPoke($result)
{
	while ($row = OCI_Fetch_Array($result, OCI_BOTH)) 
	{
	echo "<tr>";
	echo "<td><font size='5px'>Pokedex Number<br>{$row[0]}</font></td>";
	echo "<td><font size='5px'>Name<br><a href = profile.php?name={$row[1]}>{$row[1]}</a></font></td>";
	echo "</tr>";
	echo "<tr>";
	echo "<td><img src='{$row[2]}' alt='picture'></td>";
	}
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