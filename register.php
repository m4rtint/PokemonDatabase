<!DOCTYPE HTML>

<html>
	<head>
	<?php
require 'template.php';
session_start();
?>
		<title>PokeGuide</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="http://fonts.googleapis.com/css?family=Ubuntu+Condensed" rel="stylesheet">
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
	</head>
	<body>
	<!-- ********************************************************* -->
		<div id="header-wrapper">
			<div class="container">
				<div class="row" style='width:100%;'>
					<div class="12u">
						
						<header id="header">
							<h1><a href="index.php" id="logo">PokeGuide</a></h1>
							<nav id="nav">
								<a href="pokemon.php">Pokemon</a>
								<a href="user.php">User Profile</a>
								<a href="location.php">Location</a>
								<a href="trainers.php">Trainers</a>
								<a href="items.php">Items</a>
								<a href="moves.php">Moves</a>
								<a href="types.php">Types</a>
								<a href="login.php" class="current-page-item">Login</a>
							
							
								
								
							</nav>
						</header>
					
					</div>
				</div>
			</div>
		</div>
		<div id="banner-wrapper">
			<div class="container">
				<div class="row">
					<div class="12u">
					
						<div id="banner" width=100%>
<h2 style='top:10%;'> Register Here </h2>
					<div style='position:fixed;top:42%;left:40%;color:white;'>
					
<form name="input" action="register.php" method="post">
UserName:<br> <input type="text" name="username"><br>
Password:<br> <input type="password" name="password"><br>
<input type="submit" value="register">
</form> 

<button onclick="location.href = 'login.php';">Login Here</button>

<?php
global $db_conn;
if (isset($_POST['username']) and isset($_POST['password'])){
$username = $_POST['username'];
$password = $_POST['password'];


$results = executePlainSQL("select userid from users where userid= '{$username}'");
$arrayResults = OCI_Fetch_Array($results,OCI_BOTH);


if($arrayResults[0] != null)
{
echo '<br>The username has already been taken, Try another username';
}
else
{
executePlainSQL("insert into party values ('{$username}','1')");
executePlainSQL("insert into users values ('{$username}','{$password}','{$username}')");
header("Location: login.php");
}
OCICommit($db_conn);
OCILogoff($db_conn);

}
?>





				</div>
 

						</div>
				
					</div>
				</div>
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