<html>
<h>Creating Tables</h>
	<p>
		<?php
			include 'template.php';
			
			if($db_conn){
				/*echo "<br> CREATING TABLES <br>";
				echo "<br> 1 <br>";
				executePlainSQL ("DROP TABLE type_is");
				executePlainSQL("CREATE TABLE type_is (tname varchar(30),
														normal number(2,1),
														fighting number(2,1),
														flying number(2,1),
														poison number(2,1),
														ground number(2,1),
														rock number(2,1),
														bug number(2,1),
														ghost number(2,1),
														fire number(2,1),
														water number(2,1),
														grass number(2,1),
														electric number(2,1),
														psychic number(2,1),
														ice number(2,1),
														dragon number(2,1),
														PRIMARY KEY (tname))");
				echo "<br> 2 <br>";
				executePlainSQL ("DROP TABLE moves");
				executePlainSQL ("CREATE TABLE moves (name varchar(30), 
														type varchar(30), 
														pp number(2,0), 
														effect varchar(255), 
														pid varchar(255),
														PRIMARY KEY (name))");
				echo "<br> 3 <br>";			
				executePlainSQL ("DROP TABLE train_poke");					
				executePlainSQL ("CREATE TABLE train_poke (tid varchar(255) REFERENCES trainer(tid),
															pid varchar(255) ,
															PRIMARY KEY (tid, pid))");
				echo "<br> 4 <br>";		
				executePlainSQL ("DROP TABLE pokemon");
				executePlainSQL ("CREATE TABLE pokemon (pid number(3,0),
														tname varchar(30),
														picture varchar(255),
														PRIMARY KEY (pid),
														FOREIGN KEY (tname) REFERENCES type_is(tname))");
				//executePlainSQL ("insert into pokemon values (1,1,1)");	
				//executePlainSQL ("delete from pokemon where pid = 1");
				echo "<br> all tables <br>";
				$result = executePlainSQL ("SELECT table_name FROM all_tables");
				printResult($result);
				echo "<br> pid form pokemon <br>";
				$result2 = executePlainSQL ("select pid  from pokemon ");
				
				echo "<br> 5 <br>";
				executePlainSQL ("DROP TABLE evolve");
				executePlainSQL ("CREATE TABLE evolve (pid number(3,0),
														requirement varchar(255),
														pid2 number,
														PRIMARY KEY (pid),
														FOREIGN KEY (pid2) REFERENCES pokemon)");
				echo "<br> 6 <br>";
				executePlainSQL ("DROP TABLE poke_found");
				executePlainSQL ("CREATE TABLE poke_found (pid number(3,0),
															lname varchar(255),
															PRIMARY KEY (pid),
															FOREIGN KEY (lname) REFERENCES location)");
				echo "<br> 7 <br>";
				executePlainSQL ("DROP TABLE used_on");
				executePlainSQL ("CREATE TABLE used_on (entry number(20,0),
														iid varchar(255),
														pid number(3,0),
														tid varchar(255),
														PRIMARY KEY (entry),
														FOREIGN KEY (iid) REFERENCES item,
														FOREIGN KEY (pid) REFERENCES pokemon,
														FOREIGN KEY (tid) REFERENCES trainer)");
				echo "<br> 8 <br>";
				executePlainSQL ("DROP TABLE trainer");
				executePlainSQL ("CREATE TABLE trainer (tid varchar(255),
												party varchar(255) NOT NULL,
												PRIMARY KEY (tid))");
				executePlainSQL ("insert into trainer values (1,1)");
				echo "<br> 9 <br>";
				executePlainSQL ("DROP TABLE challenge");
				executePlainSQL ("CREATE TABLE challenge (entry number(20,0),
															tid varchar(255) REFERENCES trainer(tid),
															tid2 varchar(255) REFERENCES trainer(tid),
															PRIMARY KEY  (entry))");
				echo "<br> 10 <br>";
				executePlainSQL ("DROP TABLE gymleader");
				executePlainSQL ("CREATE TABLE gymleader (tid varchar(255) REFERENCES trainer(tid),
															type varchar(255),
															badge varchar(255),
															PRIMARY KEY (badge))");
				echo "<br> 11 <br>";
				executePlainSQL ("DROP TABLE live");
				executePlainSQL ("CREATE TABLE live (tid varchar(255),
													lname varchar(255),
													PRIMARY KEY (tid, lname),
													FOREIGN KEY (tid) REFERENCES trainer,
													FOREIGN KEY (lname) REFERENCES location)");
				echo "<br> 12 <br>";
				executePlainSQL ("DROP TABLE item");
				executePlainSQL ("CREATE TABLE item (iid varchar(255),
													type varchar(255),
													Description varchar(255),
													PRIMARY KEY (iid))");
				executePlainSQL ("insert into item values (1,1,1)");
				echo "<br> 13 <br>";
				executePlainSQL ("DROP TABLE item_loc");
				executePlainSQL ("CREATE TABLE item_loc (iid varchar(255),
														lname varchar(255),
														PRIMARY KEY (iid,lname))");
				echo "<br> 14 <br>";
				executePlainSQL ("DROP TABLE location");
				executePlainSQL ("CREATE TABLE location (lname varchar(255),
														description varchar(255),
														PRIMARY KEY (lname))");
				executePlainSQL ("insert into location values (1,1)");
														
			 	OCILogoff($db_conn);*/
			} 
			else {
				echo "cannot connect";
				$e = OCI_Error(); // For OCILogon errors pass no handle
				echo htmlentities($e['message']);
			}
		?>
	</p>
</html>