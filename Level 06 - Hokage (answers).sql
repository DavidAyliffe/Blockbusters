/*	*******************************************************************************
	*** LEVEL 6 - Hokage                                                        ***
	***                                                                         ***
	*** Focus: 	Creating tables using select; creating tables, altering tables  ***
	***                                                                         ***
	***	Limits: N/A                                                             ***
	***                                                                         ***
	***                                                                         ***
	***	Estimated time: 2 lessons                                               ***
	******************************************************************************* */

use blockbusters;


/*
6.1. Add column 'salary' to table staff between store_id and active.
*/

ALTER TABLE staff
ADD COLUMN salary DECIMAL(10,2)
AFTER store_id;

/*
6.2. Add a boolean 'VIP' column in table customer after last_name
*/

ALTER TABLE customer
ADD COLUMN VIP BOOLEAN
AFTER last_name;

/*
6.3. Alter the table staff to include a new column "password_hash" after password.  This is always 255 characters long.
*/

ALTER TABLE staff
ADD COLUMN password_hash VARCHAR(255)
AFTER password;

/*
6.4. Alter the table staff to include a new column "salt" after hashed password.  This should be CHAR(32).
*/
-- [AI-generated answer]

ALTER TABLE staff
ADD COLUMN salt CHAR(32)
AFTER password_hash;

/*
6.5. Alter the table customer to include a new column "maiden_name" after last_name
*/

ALTER TABLE customer
ADD COLUMN maiden_name VARCHAR(45)
AFTER last_name;

/*
6.6. Add a column "joined_date" to table staff, before 'active'
*/

ALTER TABLE staff
ADD COLUMN joined_date DATE
BEFORE active;

/*
6.7. Alter table address.  Make the field 'district' 20 characters longer than it currently is
*/

ALTER TABLE address
MODIFY COLUMN district VARCHAR(40);

/*
6.8. Add a column "is_capital" to table city after 'name'
*/

ALTER TABLE city
ADD COLUMN is_capital BOOLEAN
AFTER name;

/*
6.9.  We want to store a profile picture for customers in the database, but we don't want to store the file
	  IN the database, instead we want to store the path of the file
	  Add 'profile_picture' as varchar(256) to customer table before created_date and last_update
*/

ALTER TABLE customer
ADD COLUMN profile_picture VARCHAR(256)
AFTER active;

/*
6.10.  We want to store the location of our addresses.  
	  Add longitude (DECIMAL(10,8)) and latitude (DECIMAL(9,6)) to table address
*/

ALTER TABLE address
ADD COLUMN longitude DECIMAL(10,8),
ADD COLUMN latitude  DECIMAL(9,6);

/*
6.11.  Create a table 'locations'.  
 	  Use the file "Level 06 - locations_insert_statements.sql" to understand the structure of the table.  
	  Don't forget to include a last_update field.
	  HINT: use last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
*/

create table locations
(
	address_id SMALLINT UNSIGNED,
    latitude DECIMAL(10,8) NOT NULL,
	longitude DECIMAL(10,8) NOT NULL  
);



/*
6.12. (i)  STEP 1: Alter the table country to have a region_id, there are 6 different regions.
	  
	  (ii) STEP 2: Create a new table called 'region'.
      This should have three columns region id, name and last_update.
	  
	  Name should be one of: North America OR South America OR Europe OR Asia OR Africa OR Oceania
	  	HINT: use ENUM('X', 'XX', 'XXX', 'XXXX', 'XXXX', 'XXXXX') NOT NULL for the datatype;
		HINT: use last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
      
	  STEP 3: Alter table country to create a relationship between region and country
*/



CREATE TABLE region (
    region_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name ENUM('North America', 'South America', 'Europe', 'Asia', 'Africa', 'Oceania') NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



/*
6.13. Create a new table called 'awards'.
	  Look at "Level 06 - awards.csv" to help you.
      We need an an award id, an award ceremony id, a 'status', a year, and last_update
      The status should be either 'nominated' or 'won'
      	HINT:  status ENUM('nominated', 'won') DEFAULT 'nominated';
      
	  Decide on relationships you need for this table
*/


create table award
(
	award_id tinyint unsigned auto_increment primary key,
 	name varchar(50),
	description varchar(100)
);

/*
6.14. Create a new table called 'ceremonies'.
	  Look at "Level 06 - ceremonies.csv" to help you.
      We need a ceremony id, ceremony name, city id, and last_update
      Decide on the best data type for these fields.
	  Look at "Level 06 - ceremonies.csv" to help you understand the fields you need
	  Make sure you create a relationship between this table and city
*/

create table ceremony
(
	ceremony_id tinyint unsigned auto_increment primary key,
	name varchar(100),
	city_id smallint unsigned,
	last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (city_id) REFERENCES city(city_id)
);



/*
6.15. Create a new table called 'award_ceremonies'.
	  We need an award ceremony id, a ceremony id, an award id and a year
      Ceremony ID needs to connect to table ceremony
	  Award ID needs to connect to table awards
*/

create table award_ceremony
(
	award_ceremony_id tinyint unsigned auto_increment primary key,
	ceremony_id tinyint unsigned,
	award_id tinyint unsigned,
	last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (ceremony_id) REFERENCES ceremony(ceremony_id),
	FOREIGN KEY (award_id) REFERENCES award(award_id)
);



/*
6.16. Create a new table called 'actor_award_ceremonies'.
	  We need an actor id, award ceremony id, status
      Status will be either "Nominated" or "Won".  Use an ENUM for this.
      award ceremony id needs to connect to table award_ceremonies
	  actor id needs to connect to table actor
*/


create table actor_award_ceremony
(
	award_ceremony_id tinyint unsigned auto_increment primary key,
	actor_id smallint unsigned,
	status ENUM("Nominated", "Won") NOT NULL,
	last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (ceremony_id) REFERENCES ceremony(ceremony_id),
	FOREIGN KEY (award_id) REFERENCES award(award_id)
);