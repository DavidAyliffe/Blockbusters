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
*/

insert into region (name) values ('North America');
insert into region (name) values ('South America');
insert into region (name) values ('Europe');
insert into region (name) values ('Asia');
insert into region (name) values ('Africa');
insert into region (name) values ('Oceania');
	

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
										Denpasar in Indonesia
										Brussels in Belgium (you will need to add Belgium first!)
*/


insert into city (name, country_id) values ("Venice", 49);
insert into city (name, country_id) values ("Cannes", 34);
insert into city (name, country_id) values ("Karlovy Vary", 26);
insert into city (name, country_id) values ("Los Angeles", 103);
insert into city (name, country_id) values ("Brisbane", 8);
insert into city (name, country_id) values ("Hong Kong", 42);
	
	
/*
7.4. Insert these new stores [Store Name, Address, District, City, Country, Postal Code, Phone Number]:
	CineWorld Bazaar, 123 Rivonia Road, Sandton, Johannesburg, South Africa, 2196, +27 11 123 4567
	Desert Reel, 45 El Tahrir Street, Dokki, Cairo, Egypt, 12611, +20 2 3334 5678
	Nordic Lights Cinema, Skólavörðustígur 12, Miðborg, Reykjavík, Iceland, 101, +354 551 1234
	Oceanic Odyssey, Jl. Gatot Subroto Barat No.301, Denpasar Barat, Denpasar, Indonesia, 80117, +62 361 234 567
	Pixel Palisade, 3-11-6 Shibuya, Shibuya-ku, Tokyo, Japan, 150-0002, +81 3-1234-5678
	Reel Retro Haven, 12 Amir Temur Avenue, Yunusabad District, Tashkent, Uzbekistan, 100010, +998 71 200 1234
	
	HINT: You will need to insert the addresses FIRST
	HINT: ChatGPT can help you format these as insert statements which will save you a TON of time!
*/
	
insert into address (address, district, city_id, postal_code, phone) values ("123 Rivonia Road", "Sandton", 244, 2196, "+27 11 123 4567");	
insert into store (name, address_id) values ("CineWorld Bazaar", LAST_INSERT_ID())

insert into address (address, district, city_id, postal_code, phone) values ("45 El Tahrir Street", "Dokki", ???, 12611, "+20 2 3334 5678");	
insert into store (name, address_id) values ("Desert Reel", LAST_INSERT_ID())

insert into address (address, district, city_id, postal_code, phone) values ("Skólavörðustígur 12", "Miðborg", ???, 101, "+354 551 1234");	
insert into store (name, address_id) values ("Nordic Lights Cinema", LAST_INSERT_ID())

insert into address (address, district, city_id, postal_code, phone) values ("Jl. Gatot Subroto Barat No.301", "Denpasar Barat", ???, 80117, "+62 361 234 567");	
insert into store (name, address_id) values ("Oceanic Odyssey", LAST_INSERT_ID())
		
insert into address (address, district, city_id, postal_code, phone) values ("3-11-6 Shibuya", "Shibuya-ku", ???, 150-0002, "+81 3-1234-5678");	
insert into store (name, address_id) values ("Pixel Palisade", LAST_INSERT_ID())
			
insert into address (address, district, city_id, postal_code, phone) values ("12 Amir Temur Avenue", "Yunusabad District", ???, 100010, "+998 71 200 1234");	
insert into store (name, address_id) values ("Reel Retro Haven", LAST_INSERT_ID())


/*
7.5. Create a new rental for a new customer who lives in St. Petersburg, Russia
	 HINT: Add St. Petersburg as a city first.
*/



/*
7.6. Insert the data in "Level 06 - ceremonies.csv" into the table you have created. 
	HINT:  ChatGPT will help you format the rows as insert statements.
*/



/*
7.7. Insert the data in "Level 06 - awards.csv" into the table you have created. 
	HINT:  ChatGPT will help you format the rows as insert statements.
*/



/*
7.8. Insert some random data into your new 'awards' table.
*/



