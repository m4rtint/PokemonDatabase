<?php
require 'template.php';
ini_set('session.save_path', '/home/i/i5a8/');
session_start();
	
if(isset($_SESSION["username"]))
{
$topMenuBar = "<header id='header'>
							<h1><a href='index.php' id='logo'>PokeGuide</a></h1>
							<nav id='nav'>
								<a href='pokemon.php'>Pokemon</a>
								<a href='user.php'>User Profile</a>
								<a href='location.php'>Location</a>
								<a href='trainers.php'>Trainers</a>
								<a href='items.php'>Items</a>
								<a href='moves.php'>Moves</a>
								<a href='types.php'>Types</a>
								<a href='logout.php'>Logout</a>
							</nav>
						</header>";
}
else
{
$topMenuBar = "<header id='header'>
							<h1><a href='index.php' id='logo'>PokeGuide</a></h1>
							<nav id='nav'>
								<a href='pokemon.php'>Pokemon</a>
								<a href='user.php'>User Profile</a>
								<a href='location.php'>Location</a>
								<a href='trainers.php'>Trainers</a>
								<a href='items.php'>Items</a>
								<a href='moves.php'>Moves</a>
								<a href='types.php' class='current-page-item'>Types</a>
								<a href='login.php'>login</a>
							</nav>
						</header>";
}
echo $topMenuBar;
?>
				