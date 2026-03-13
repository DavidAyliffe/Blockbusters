/*	*******************************************************************************
	*** LEVEL 7 - Minato                                                        ***
	***                                                                         ***
	*** Focus: 	Inserting rows                                                  ***
	***                                                                         ***
	***	Limits:                                                                 ***
	***                                                                         ***
	***                                                                         ***
	***	Estimated time: 2 lessons                                               ***
	******************************************************************************* */


use blockbusters;

/*
7.1. Populate the new 'regions' table.
     HINT:  Name should be one of: North America OR South America OR Europe OR Asia OR Africa OR Oceania
*/

insert into region(name) values ('SOMETHING GOES HERE');		-- use this example to help you

/*
7.2. Run "Level 06 - locations_insert_statements.sql" and populate the new 'locations' table.
*/



/*
7.3. Add these cities to the database:  Venice in Italy
										Cannes in France
										Karlovy Vary in Czech Republic
										Los Angeles in USA
										Brisbane in Australia
										Hong Kong in Hong Kong
										Brussels in Belgium (you will need to add Belgium first!)
	
*/



/*
7.4. Insert these new stores:
	Store ID is 26, CineWorld Bazaar, 		Address ID is 643.  Manager is Naledi Mokoena 	(ID is 124)
	Store ID is 27, Desert Reel, 			Address ID is 644.  Manager is Omar El-Sayed 	(ID is 125)
	Store ID is 28, Nordic Lights Cinema, 	Address ID is 645.  Manager is Katrín Jónsdóttir(ID is 126)
	Store ID is 29, Oceanic Odyssey, 		Address ID is 646.  Manager is Made Wirawan 	(ID is 127)
	Store ID is 30, Pixel Palisade, 		Address ID is 647.  Manager is Aiko Tanaka 		(ID is 128)
	Store ID is 31, Reel Retro Haven, 		Address ID is 648.  Manager is Dilshod Karimov 	(ID is 129)
	
	HINT: ChatGPT can help you format these as insert statements which will save you a TON of time!
		  Tell ChatGPT you want the output in this format (e.g):
			insert into store (store_id, name, manager_staff_id, address_id) values (99, "CineWorld Bazaar", *MANAGER_ID*, *ADDRESS_ID*)	
*/





/*
7.6. Insert the data in "Level 06 - ceremony.csv" into the table you have created. 
	HINT:  ChatGPT will help you format the rows as insert statements.
*/



/*
7.7. Insert the data in "Level 06 - award.csv" into the table you have created. 
	HINT:  ChatGPT will help you format the rows as insert statements.
*/



/*
7.8. Insert the data in "Level 06 - awards ceremony.csv" into the table award_ceremony you have created
	HINT:  ChatGPT will help you format the rows as insert statements.
*/



/*
7.9. Insert the data in "Level 06 - actor awards ceremony.csv" into the table actor_award_ceremony you have created
	HINT:  ChatGPT will help you format the rows as insert statements.
*/



