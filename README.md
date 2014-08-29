CPSC 304 - Database Project
=====

Just to make sure, is everyone alright to use PHP/HTML/MySql?

I think it is a lot easier than using JDBC, and Jquery.


Requirements 

    At least 5 entities and 5 relationships
    The ability to handle multiple users
    At least 10 queries that users will be able to ask via the application interface. 
    
Must include the following types of relationships


    (DONE(any search bar) - 1 point) Selection and projection query: pick one query of this category and provide an interface for the user to specify the selection condition and the attributes to be returned.
    (DONE 1 point) Join query: pick one query of this category and provide an interface for the user to choose this query.
    (ALISON(picking type out of all pokemon and showing it - 1 point) Division query: pick one query of this category and provide an interface for the user to choose this query.
    (DONE(counting returned search results - 1 point) Aggregation query: pick one query that requires the use of aggregation (min, max, average, or count are all fine).
    (DONE(max/min on moves) 2 points) Nested aggregation with group-by: pick one query that finds some aggregated value for each group and then rerun with a different aggregation. Provide an interface for the user to specify whether the minimum or maximum is requested.
    (DONE (delete party) -  point) Delete operation: implement a cascade-on-delete situation. Provide an interface for the user to specify some input for the deletion operation.  Some input values would fail the cascade specification but others would successfully follow the cascade specification. Provide an interface for the user to display the relation instance after the operation.
    (DONE(updating party) - 1 point) Update operation: implement a constraint using the check statement. Provide an interface for the user to specify some input for the update operation. Some input values would successfully satisfy a constraint while others would fail. Provide an interface for the user to display the relation relation after the operation. Note that MySQL 5.5 does not support the Check constraint. If your team is using MySQL 5.5, keep the check in the SQL statement, but actually do the check at the application level (and comment it in the code).
    (ALISON/MARTIN 2 points)  Graphical user interface: create an easy to use GUI  that allows the users to execute all the above operations and transactions. Use the menu facility provided by the graphics environment you use to define appropriate menus and submenus. Make sure to design your interface in such a way that all the error messages appear in separate pop-up boxes, or in a designated area of the main window, so that they do not interfere with the other activities. Whenever user input is requested, make sure that there is sufficient type checking.
    (3(View(done - preston, pokemon two type drop down), union/interest, trigger(preston)) points) Extra features that your application supports. You can really be creative about this. 
