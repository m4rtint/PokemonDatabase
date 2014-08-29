<!DOCTYPE HTML>

<html>
	<head>
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
						<?php require 'topMenubar.php';?>
					</div>
				</div>
			</div>
		</div>
		<div id="banner-wrapper">
			<div class="container">
				<div class="row">
					<div class="12u">
					
						<div id="banner" width=100%>
					<h2 style='top:10%;'> Login Here </h2>
					<div style='position:fixed;top:42%;left:40%;color:white;'>
					
<form name="input" action="login.php" method="post">
UserName: <br><input type="text" name="username"><br>
Password: <br><input type="password" name="password"><br>
<input type="submit" value="login">
</form> 	

<button onclick="location.href = 'register.php';">Register Here</button>
				
<?php
global $db_conn;

//IF FORM IS SUBMITTED ALREADY
if (isset($_POST['username']) and isset($_POST['password'])){
$username = $_POST['username'];
$password = $_POST['password'];

//CHECK IF VALUES ARE IN THE DATABASE

$results = executePlainSQL("select * from users where userid='{$username}' and password='{$password}'");
OCICommit($db_conn);
$arrayResults = OCI_Fetch_Array($results,OCI_BOTH);
OCILogoff($db_conn);

if($arrayResults[0] != null)
{
$_SESSION["username"] = $_POST["username"];
$_SESSION["login"]= true;
header("Location: user.php");

}
else
{
echo "<br>Wrong password or username<br>";
}
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