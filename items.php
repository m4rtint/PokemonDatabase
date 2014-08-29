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
						
						<h2 style='text-align:center;'>Table of Items</h2>
						<form name="search" action="items.php" method="post">
Search Items: <input type="text" name="item"> with
<select id = "options" name = "options">
<option value= "IID"> IID</option>
<option value= "Type"> Type </option>
<option value= "Description">  Description </option>
</select>
<input type="submit" value="search">
</form> 
<br>


<?php
		if(isset($_POST['item'])){
                 $item = $_POST ['options'];
//              echo $item;
         }
         $item = ucfirst(strtolower($_POST["item"]));
		 if($item !==null){
			 $result = executePlainSQL("SELECT * FROM item WHERE type = '" . $item . "' OR iid = '" . $item ."' OR Description LIKE '%" . $item . "%'");
		}else{
			$result = executePlainSQL("SELECT * FROM item");
		}
		printItem($result);
	
function printItem($result){
	echo "<div class='Pokeguide'>";
	echo "<table>";
	echo "<tr><td>IID</td><td>Type</td><td>Description</td></tr>";
	while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
		echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td></tr>";																	
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