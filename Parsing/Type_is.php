<?php

//Choose the file to parse
$url = "type_is.xml";
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
$Tname = array();
$Normal = array();
$Fighting = array();
$Flying = array();
$Poison = array();
$Ground = array();
$Rock  = array();
$Bug = array();
$Ghost = array();
$Fire = array();
$Water = array();
$Grass = array();
$Electric = array();
$Psychic = array();
$Ice = array();
$Dragon = array();


//===============Parsing into MultiDimensional Array====

function parseType(){
global $Att,$xml;
//EDIT THIS TO THE ATTRIBUTES
global $Tname,$Normal,$Fighting,$Flying,$Poison,$Ground,$Rock,$Bug,$Ghost,$Fire,$Water,$Grass,$Electric,$Psychic,$Ice,$Dragon;

$x=0;
foreach($xml as $key)
{
//Every Attribute - 
// EDIT THIS PART TO PARSE EVERYTHING/ ANTHING

$TName[$x] = $key->TName;
$Normal[$x] = $key->Normal;
$Fighting[$x] = $key->Fighting;
$Flying[$x] = $key->Flying;
$Poison[$x] = $key->Poison;
$Ground[$x] = $key->Ground;
$Rock[$x]  = $key->Rock;
$Bug[$x] = $key->Bug;
$Ghost[$x] = $key->Ghost;
$Fire[$x] = $key->Fire;
$Water[$x] = $key->Water;	
$Grass[$x] = $key->Grass;
$Electric[$x] = $key->Electric;
$Psychic[$x] = $key->Psychic;
$Ice[$x] = $key->Ice;
$Dragon[$x] = $key->Dragon;
$x++;
}

//Adding all arrays into $Att

//CHANGE THE PART ACCORDING TO THE ATTRIBUTES.
	$Att[0] = $TName;
	$Att[1] = $Normal;
	$Att[2] = $Fighting;
	$Att[3] = $Flying;
	$Att[4] = $Poison;
	$Att[5] = $Ground;
	$Att[6] = $Rock;
	$Att[7] = $Bug;
	$Att[8] = $Ghost;
	$Att[9]= $Fire;
	$Att[10] = $Water;
	$Att[11] = $Grass;
	$Att[12] =  $Electric;
	$Att[13] = $Psychic;
	$Att[14] = $Ice;
	$Att[15] = $Dragon;
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