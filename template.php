
		<?php

			$success = True; //keep track of errors so it redirects the page only if there are no errors
			$db_conn = OCILogon("ora_i5a8", "a35832112", "ug");
			 //Parses and executes SQL commands into Oracle
			function executePlainSQL($cmdstr) { 
				global $db_conn, $success;
				$statement = OCIParse($db_conn, $cmdstr); 

				if (!$statement) {
					echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
					$e = OCI_Error($db_conn); // For OCIParse errors pass the       
					// connection handle
					echo htmlentities($e['message']);
					$success = False;
				}

				$r = OCIExecute($statement, OCI_DEFAULT);
				if (!$r) {
					echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
					$e = oci_error($statement); // For OCIExecute errors pass the statementhandle
					echo htmlentities($e['message']);
					$success = False;
				} else {

				}
				return $statement;
			}
			
			function printResult($result) { //prints results from a select statement
				echo "<div class='Pokeguide'>
				echo "<table>";

				while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
					for ($i = 0; $i < 15; $i++){
						echo "<tr><td>" . $row[$i] . "</td></tr>"; //or just use "echo $row[0]" 
					}
					
				}
				echo "</table>";
				echo "</div>";
			}
		?>