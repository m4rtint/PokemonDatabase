<?php
	require 'template.php';
	global $db_conn;
	ini_set('session.save_path', '/home/i/i5a8/');
	session_start();

	//GRAB STRING OF NUMBERS
	$PID = executePlainSQL("SELECT party FROM party WHERE partyid = '{$_SESSION["username"]}'");
	$row = OCI_Fetch_Array($PID, OCI_BOTH);
	
	var_dump($row[0]);
	

	//GET POKEMON NUMBER TO ADD
	$pokeNum = $_GET['submit'];
	//=================
	
	$pokeList=$row[0].",".$pokeNum;


//INSERT INTO DATABASE
	executePlainSQL("UPDATE party SET party='{$pokeList}' WHERE partyid = '{$_SESSION["username"]}'");
	OCICommit($db_conn);
	OCILogoff($db_conn);
	header('Location: user.php');
?>