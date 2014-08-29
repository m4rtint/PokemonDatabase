<html>
<h>Creating Tables</h>
	<p>
		<?php
			include 'template.php';
			
			if($db_conn){
				
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
				
				executePlainSQL ("CREATE TABLE moves (name varchar(30), 
														type varchar(30), 
														pp number(2,0), 
														effect varchar(255), 
														pid varchar(255),
														PRIMARY KEY (name))");
							
				executePlainSQL ("CREATE TABLE train_poke (tid varchar(255) REFERENCES trainer(tid),
															pid varchar(255),
															PRIMARY KEY (tid, pid))");
				
				executePlainSQL ("CREATE TABLE pokemon (pid number(3,0),
														tname varchar(30),
														picture varchar(255),
														type1 varchar(10),
														type2 varchar(10),
														PRIMARY KEY (pid),
														FOREIGN KEY (type1) REFERENCES type_is(tname),
														FOREIGN KEY (type2) REFERENCES type_is(tname)");

				
				
				
				executePlainSQL ("CREATE TABLE evolve (pid number(3,0),
														requirement varchar(255),
														pid2 number,
														PRIMARY KEY (pid),
														FOREIGN KEY (pid2) REFERENCES pokemon)
																ON DELETE CASCADE");
				
				executePlainSQL ("CREATE TABLE poke_found (pid number(3,0),
															lname varchar(255),
															PRIMARY KEY (pid),
															FOREIGN KEY (lname) REFERENCES location)");
				
				executePlainSQL ("CREATE TABLE used_on (entry number(20,0),
														iid varchar(255),
														pid number(3,0),
														tid varchar(255),
														PRIMARY KEY (entry),
														FOREIGN KEY (iid) REFERENCES item,
														FOREIGN KEY (pid) REFERENCES pokemon,
														FOREIGN KEY (tid) REFERENCES trainer)");
			
				executePlainSQL ("CREATE TABLE trainer (tid varchar(255),
												party varchar(255) NOT NULL,
												PRIMARY KEY (tid))");
				
				executePlainSQL ("CREATE TABLE challenge (entry number(20,0),
															tid varchar(255) REFERENCES trainer(tid),
															tid2 varchar(255) REFERENCES trainer(tid),
															PRIMARY KEY  (entry))");
				
				
				executePlainSQL ("CREATE TABLE gymleader (tid varchar(255) REFERENCES trainer(tid),
															type varchar(255),
															badge varchar(255),
															PRIMARY KEY (badge),
															FOREIGN KEY (tid) REFERENCES trainer
																	ON DELETE CASCADE)");
				
				
				executePlainSQL ("CREATE TABLE live (tid varchar(255),
													lname varchar(255),
													PRIMARY KEY (tid, lname),
													FOREIGN KEY (tid) REFERENCES trainer,
													FOREIGN KEY (lname) REFERENCES location
															ON DELETE SET NULL)");
				
				executePlainSQL ("DROP TABLE item");
				executePlainSQL ("CREATE TABLE item (iid varchar(255),
													type varchar(255),
													Description varchar(255),
													PRIMARY KEY (iid))");
				
				
				
				executePlainSQL ("CREATE TABLE item_loc (iid varchar(255),
														lname varchar(255),
														PRIMARY KEY (iid,lname))");
				
				
				executePlainSQL ("CREATE TABLE location (lname varchar(255),
														description varchar(255),
														PRIMARY KEY (lname),
														FOREIGN KEY (lname) REFERENCES location
																ON DELETE CASCADE)");
																
				executePlainSQL ("CREATE TABLE users (userid varchar(255),
														password varchar(255),
														partyid varchar(255),
														PRIMARY KEY (userid),
														foreign key (partyid) references party(partyid)
																on delete cascade)");
				
				executePlainSQL ("CREATE TABLE party (partyid varchar(255),
														party varchar(255),
														PRIMARY KEY (partyid))");
														
				executePlainSQL ("CREATE VIEW legendary AS 
										SELECT *
										FROM pokemon
										WHERE pid=144 or pid=145 or pid=146 or pid=150");
				
																
				
														
			 	OCILogoff($db_conn);
			} 
			else {
				echo "cannot connect";
				$e = OCI_Error(); // For OCILogon errors pass no handle
				echo htmlentities($e['message']);
			}
		?>
	</p>
</html>
