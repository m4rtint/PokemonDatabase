<?php
	require 'template.php';
	global $db_conn;
	ini_set('session.save_path', '/home/i/i5a8/');
	session_start();

	$PID = executePlainSQL("SELECT party FROM party WHERE partyid = '{$_SESSION["username"]}'");
	$row = OCI_Fetch_Array($PID, OCI_BOTH);

	$updatedParty = explode(",", $row[0]);
	
	$stringParty;

	//Substitute number
	$pokeNum = $_GET['submit'];
	//=================
	
	//var_dump($pokeNum);
//DELETE FROM ARRAY PARTY
	
	$num = array_search("{$pokeNum}", $updatedParty);
	unset($updatedParty[$num]);

//INSERT INTO STRING

	$stringParty = implode(",",$updatedParty);
	
//INSERT INTO DATABASE
	var_dump($stringParty);
	echo "<br><br>";
	executePlainSQL("UPDATE party SET party='{$stringParty}' WHERE partyid = '{$_SESSION["username"]}'");
	OCICommit($db_conn);
	OCILogoff($db_conn);
	header("Location: user.php");

?>