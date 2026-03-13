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
-- [AI-generated answer]
-- Run the file directly in MySQL Workbench, or use SOURCE:

SOURCE Level 06 - locations_insert_statements.sql;

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
-- [AI-generated answer]

-- Step 1: Add St. Petersburg as a city (Russia has country_id 80)
INSERT INTO city (name, country_id) VALUES ('St. Petersburg', 80);

-- Step 2: Add an address in St. Petersburg
INSERT INTO address (address, district, city_id, postal_code, phone)
VALUES ('25 Nevsky Prospekt', 'Admiralteysky', LAST_INSERT_ID(), '190000', '+7 812 555 1234');

-- Step 3: Add a new customer at that address
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active)
VALUES (1, 'IVAN', 'PETROV', 'IVAN.PETROV@example.org', LAST_INSERT_ID(), 1);

-- Step 4: Create a rental for that customer
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id, due_date)
VALUES (NOW(), 1, LAST_INSERT_ID(), 1, DATE_ADD(NOW(), INTERVAL 7 DAY));

/*
7.6. Insert the data in "Level 06 - ceremonies.csv" into the table you have created.
	HINT:  ChatGPT will help you format the rows as insert statements.
*/
-- [AI-generated answer]
-- Note: Some rows in the CSV have city names instead of city_ids. These need city_ids looked up or inserted first.
-- The rows below use the city_ids provided in the CSV where available.

INSERT INTO ceremony (name, city_id) VALUES ('AACTA Awards (Australian Academy of Cinema and Television Arts)', 604);
INSERT INTO ceremony (name, city_id) VALUES ('BAFTA Awards', 312);
INSERT INTO ceremony (name, city_id) VALUES ('Berlin International Film Festival (Berlinale)', 198);
INSERT INTO ceremony (name, city_id) VALUES ('Blue Dragon Film Awards', 113);
INSERT INTO ceremony (name, city_id) VALUES ('British Independent Film Awards', 312);
INSERT INTO ceremony (name, city_id) VALUES ('Csar Awards', 543);
INSERT INTO ceremony (name, city_id) VALUES ('David di Donatello Awards', 93);
INSERT INTO ceremony (name, city_id) VALUES ('Filmfare Awards', 336);
INSERT INTO ceremony (name, city_id) VALUES ('Goya Awards', 1);
INSERT INTO ceremony (name, city_id) VALUES ('Indian National Film Awards', 75);
INSERT INTO ceremony (name, city_id) VALUES ('Japan Academy Prize', 552);
INSERT INTO ceremony (name, city_id) VALUES ('Moscow International Film Festival', 343);
INSERT INTO ceremony (name, city_id) VALUES ('Shanghai International Film Festival', 46);
INSERT INTO ceremony (name, city_id) VALUES ('Toronto International Film Festival (TIFF)', 179);

-- These rows reference cities added in 7.3 — use the city_ids from those inserts:
-- INSERT INTO ceremony (name, city_id) VALUES ('Asia Pacific Screen Awards', <brisbane_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Cannes Film Festival', <cannes_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Hong Kong Film Awards', <hong_kong_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Karlovy Vary International Film Festival', <karlovy_vary_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Magritte Awards', <brussels_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Primetime Emmy Awards', <los_angeles_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Academy Awards (Oscars)', <los_angeles_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Independent Spirit Awards', <los_angeles_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Golden Globe Awards', <los_angeles_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Critics Choice Television Awards', <los_angeles_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Screen Actors Guild (SAG) Awards', <los_angeles_city_id>);
-- INSERT INTO ceremony (name, city_id) VALUES ('Venice Film Festival Awards', <venice_city_id>);

/*
7.7. Insert the data in "Level 06 - awards.csv" into the table you have created.
	HINT:  ChatGPT will help you format the rows as insert statements.
*/
-- [AI-generated answer]

INSERT INTO award (name, description) VALUES ('Best Actor', 'Given to the best male lead performance.');
INSERT INTO award (name, description) VALUES ('Best Actress', 'Given to the best female lead performance.');
INSERT INTO award (name, description) VALUES ('Best Supporting Actor', 'Recognizes a standout performance in a supporting role (male).');
INSERT INTO award (name, description) VALUES ('Best Supporting Actress', 'Recognizes a standout performance in a supporting role (female).');

/*
7.8. Insert some random data into your new 'awards' table.
*/
-- [AI-generated answer]
-- Example: link award ceremonies to awards with random years

INSERT INTO award_ceremony (ceremony_id, award_id) VALUES (1, 1);
INSERT INTO award_ceremony (ceremony_id, award_id) VALUES (1, 2);
INSERT INTO award_ceremony (ceremony_id, award_id) VALUES (2, 1);
INSERT INTO award_ceremony (ceremony_id, award_id) VALUES (2, 2);
INSERT INTO award_ceremony (ceremony_id, award_id) VALUES (3, 3);
INSERT INTO award_ceremony (ceremony_id, award_id) VALUES (3, 4);

-- Example: nominate/award some actors
INSERT INTO actor_award_ceremony (actor_id, status) VALUES (1, 'Won');
INSERT INTO actor_award_ceremony (actor_id, status) VALUES (2, 'Nominated');
INSERT INTO actor_award_ceremony (actor_id, status) VALUES (3, 'Won');
INSERT INTO actor_award_ceremony (actor_id, status) VALUES (10, 'Nominated');
INSERT INTO actor_award_ceremony (actor_id, status) VALUES (20, 'Won');


