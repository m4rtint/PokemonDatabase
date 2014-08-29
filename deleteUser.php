<?php
//THIS PHP FILE IS TO DELETE USER OR LOG OUT
	require 'template.php';
	ini_set('session.save_path', '/home/i/i5a8/');
	session_start();

if(isset($_SESSION['username']))
{
	if(isset($_GET['logout']))
	session_destroy();
	else
	{
	executePlainSQL("delete from party where partyid='{$_SESSION['username']}'");
	OCICommit($db_conn);
	OCILogoff($db_conn);
	session_destroy();
	}
}
header('Location: user.php');
?>