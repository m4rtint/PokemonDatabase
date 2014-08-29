<?php

//Choose the file to parse
$url = "Pokemon.xml";
$contents = file_get_contents($url);
$xml = new SimpleXMLElement($contents);
//==============================
//Grabs Each row/Tuple
//var_dump($xml->row);

//Grab 2nd Tuple
//var_dump($xml->row[1]);
//==============================

//Create First Multi Array Here
$Att = array();

//Create array for each attribute 
//* EDIT THIS PART FOR ATTRIBUTES
$PID = array();
$Name = array();
$Picture = array();


//===============Parsing into MultiDimensional Array====

function parseType(){
global $Att,$xml;
//EDIT THIS TO THE ATTRIBUTES
global $PID,$Name,$Picture;

$x=0;
foreach($xml as $key)
{
//Every Attribute - 
// EDIT THIS PART TO PARSE EVERYTHING/ ANYTHING

$PID[$x] = $key->PID;
$Name[$x] = $key->Name;
$Picture[$x] = $key->Picture;

$x++;
}

//Adding all arrays into $Att

//CHANGE THE PART ACCORDING TO THE ATTRIBUTES.
	$Att[0] = $PID;
	$Att[1] = $Name;
	$Att[2] = $Picture;

}



function sendtoTable()
{
global $Att;


	//Populate Each row at a time
	for($y=0; $y <  count($Att[0]); $y++)
	{

	//INSERT INTO TYPE_IN (TNAME,NORMAL,FIGHTING....) 
	//VALUES ( $Att[0][$y], $Att[1][$y].......)

	}
}

function printAll(){
global $Att;
	for($y = 0; $y < count($Att[0]); $y++)
	{
	
	echo $Att[0][$y]." ".$Att[1][$y]." ".$Att[2][$y];
	}

}

//=============================================
parseType();
sendtoTable();
printAll()



?>