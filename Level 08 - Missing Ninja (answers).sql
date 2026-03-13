/*	*******************************************************************************
	*** LEVEL 8 - Missing Ninja                                                 ***
	***                                                                         ***
	*** Focus: 	Updating rows                                                   ***
	***                                                                         ***
	***	Limits:                                                                 ***
	***                                                                         ***
	***                                                                         ***
	***	Estimated time: 2 lessons                                               ***
	******************************************************************************* */

use blockbusters;


/*
8.0:  Inflation is real!  Increase the price of all rentals by 10%
*/
-- [AI-generated answer]

UPDATE film
SET rental_rate = rental_rate * 1.1
WHERE film_id > 0;

/*
8.1:  Set staff salaries to a random number between 40,000 and 60,000
*/
-- [AI-generated answer]

UPDATE staff
SET salary = FLOOR(40000 + RAND() * 20001)
WHERE staff_id > 0;

/*
8.2:  Set VIP on customer to 1 if the customer has rented more than 50 films in the last year.
*/

UPDATE customer
SET VIP = 1
WHERE customer_id IN (
    SELECT customer_id
    FROM rental
    WHERE rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY customer_id
    HAVING COUNT(*) > 50
);

/*
8.3:  Set the hashed password in staff to be an encrypted version of the password (use SHA2(password, 256))
*/
-- [AI-generated answer]

UPDATE staff
SET password_hash = SHA2(password, 256)
WHERE staff_id > 0;

/*
8.4:  Set the salt for staff.
*/
-- [AI-generated answer]

UPDATE staff
SET salt = HEX(RANDOM_BYTES(32))
WHERE staff_id > 0;

/*
8.5:  Now, set the hashed password in staff to be a hashed version of the password AND THE SALT (use SHA2(CONCAT(password, salt), 256))
*/
-- [AI-generated answer]

UPDATE staff
SET password_hash = SHA2(CONCAT(password, salt), 256)
WHERE staff_id > 0;

/*
8.6:  Using "Level 08 - maiden names.csv", set their maiden_name in table customer.  Get ChatGPT to do the grunt work for you!
*/
-- [AI-generated answer]

UPDATE customer SET maiden_name = last_name WHERE customer_id = 6;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 13;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 16;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 24;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 33;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 35;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 37;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 44;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 46;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 51;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 54;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 55;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 63;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 64;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 80;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 85;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 93;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 104;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 107;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 108;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 112;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 114;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 115;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 127;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 138;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 140;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 141;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 142;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 143;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 151;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 156;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 162;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 163;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 165;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 177;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 178;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 191;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 195;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 196;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 197;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 201;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 204;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 206;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 221;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 227;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 229;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 237;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 240;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 242;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 247;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 249;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 267;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 268;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 277;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 283;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 286;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 482;
UPDATE customer SET maiden_name = last_name WHERE customer_id = 588;

-- Now update their last_name to the new married name from the CSV:
UPDATE customer SET last_name = 'Anderson' WHERE customer_id = 6;
UPDATE customer SET last_name = 'Çelik' WHERE customer_id = 13;
UPDATE customer SET last_name = 'O''Sullivan' WHERE customer_id = 16;
UPDATE customer SET last_name = 'García' WHERE customer_id = 24;
UPDATE customer SET last_name = 'Rossi' WHERE customer_id = 33;
UPDATE customer SET last_name = 'Moreau' WHERE customer_id = 35;
UPDATE customer SET last_name = 'Zhu' WHERE customer_id = 37;
UPDATE customer SET last_name = 'Ivanova' WHERE customer_id = 44;
UPDATE customer SET last_name = 'Petrova' WHERE customer_id = 46;
UPDATE customer SET last_name = 'Carter' WHERE customer_id = 51;
UPDATE customer SET last_name = 'Sato' WHERE customer_id = 54;
UPDATE customer SET last_name = 'Smirnova' WHERE customer_id = 55;
UPDATE customer SET last_name = 'Thompson' WHERE customer_id = 63;
UPDATE customer SET last_name = 'Li' WHERE customer_id = 64;
UPDATE customer SET last_name = 'Adebayo' WHERE customer_id = 80;
UPDATE customer SET last_name = 'Gallagher' WHERE customer_id = 85;
UPDATE customer SET last_name = 'Zhang' WHERE customer_id = 93;
UPDATE customer SET last_name = 'Laurent' WHERE customer_id = 104;
UPDATE customer SET last_name = 'Fernández' WHERE customer_id = 107;
UPDATE customer SET last_name = 'Chávez' WHERE customer_id = 108;
UPDATE customer SET last_name = 'Bennett' WHERE customer_id = 112;
UPDATE customer SET last_name = 'Schmidt' WHERE customer_id = 114;
UPDATE customer SET last_name = 'Ríos' WHERE customer_id = 115;
UPDATE customer SET last_name = 'Mikhailova' WHERE customer_id = 127;
UPDATE customer SET last_name = 'Chen' WHERE customer_id = 138;
UPDATE customer SET last_name = 'Edwards' WHERE customer_id = 140;
UPDATE customer SET last_name = 'Fujimoto' WHERE customer_id = 141;
UPDATE customer SET last_name = 'Davies' WHERE customer_id = 142;
UPDATE customer SET last_name = 'Yılmaz' WHERE customer_id = 143;
UPDATE customer SET last_name = 'Wang' WHERE customer_id = 151;
UPDATE customer SET last_name = 'Akinsola' WHERE customer_id = 156;
UPDATE customer SET last_name = 'Petit' WHERE customer_id = 162;
UPDATE customer SET last_name = 'Takahashi' WHERE customer_id = 163;
UPDATE customer SET last_name = 'Liu' WHERE customer_id = 165;
UPDATE customer SET last_name = 'Méndez' WHERE customer_id = 177;
UPDATE customer SET last_name = 'Rodríguez' WHERE customer_id = 178;
UPDATE customer SET last_name = 'Pavlova' WHERE customer_id = 191;
UPDATE customer SET last_name = 'Müller' WHERE customer_id = 195;
UPDATE customer SET last_name = 'Schneider' WHERE customer_id = 196;
UPDATE customer SET last_name = 'Huang' WHERE customer_id = 197;
UPDATE customer SET last_name = 'Fischer' WHERE customer_id = 201;
UPDATE customer SET last_name = 'Şahin' WHERE customer_id = 204;
UPDATE customer SET last_name = 'Morales' WHERE customer_id = 206;
UPDATE customer SET last_name = 'Bianchi' WHERE customer_id = 221;
UPDATE customer SET last_name = 'Weber' WHERE customer_id = 227;
UPDATE customer SET last_name = 'Vega' WHERE customer_id = 229;
UPDATE customer SET last_name = 'Kim' WHERE customer_id = 237;
UPDATE customer SET last_name = 'Nakamura' WHERE customer_id = 240;
UPDATE customer SET last_name = 'Zhao' WHERE customer_id = 242;
UPDATE customer SET last_name = 'Jiménez' WHERE customer_id = 247;
UPDATE customer SET last_name = 'Zhou' WHERE customer_id = 249;
UPDATE customer SET last_name = 'Gao' WHERE customer_id = 267;
UPDATE customer SET last_name = 'Patel' WHERE customer_id = 268;
UPDATE customer SET last_name = 'Eze' WHERE customer_id = 277;
UPDATE customer SET last_name = 'Deng' WHERE customer_id = 283;
UPDATE customer SET last_name = 'Nwachukwu' WHERE customer_id = 286;
UPDATE customer SET last_name = 'Gómez' WHERE customer_id = 482;
UPDATE customer SET last_name = 'Miao' WHERE customer_id = 588;

/*
8.7:  In 7.4 we created some new stores and assigned managers to them.  Make sure the staff we assigned are active.
*/
-- [AI-generated answer]

UPDATE staff
SET active = 1
WHERE staff_id > 0;

/*
8.8:  Set the latitude and longitude in table 'address' to the values in table 'location', make sure you match on address_id
*/
-- [AI-generated answer]

UPDATE address a
INNER JOIN locations l ON a.address_id = l.address_id
SET a.latitude = l.latitude,
    a.longitude = l.longitude;

/*
8.9:  Get a list of capital cities from ChatGPT and use this to update the 'is_capital' field in table city
*/
-- [AI-generated answer]

UPDATE city SET is_capital = 1 WHERE name IN (
    'Kabul', 'Algiers', 'Luanda', 'Buenos Aires', 'Yerevan', 'Canberra', 'Vienna',
    'Baku', 'Manama', 'Dhaka', 'Minsk', 'La Paz', 'Brasilia', 'Bandar Seri Begawan',
    'Sofia', 'Phnom Penh', 'Yaound', 'Ottawa', 'N''Djamena', 'Santiago', 'Beijing',
    'Bogot', 'Kinshasa', 'Prague', 'Copenhagen', 'Santo Domingo', 'Quito', 'Cairo',
    'Tallinn', 'Addis Ababa', 'Trshavn', 'Helsinki', 'Paris', 'Banjul', 'Berlin',
    'Athens', 'Nuuk', 'Vatican City', 'Budapest', 'New Delhi', 'Jakarta',
    'Tehran', 'Baghdad', 'Jerusalem', 'Rome', 'Tokyo', 'Astana', 'Nairobi',
    'Kuwait City', 'Riga', 'Vaduz', 'Vilnius', 'Antananarivo', 'Lilongwe',
    'Kuala Lumpur', 'Mexico City', 'Chisinau', 'Rabat', 'Maputo', 'Naypyidaw',
    'Kathmandu', 'Amsterdam', 'Wellington', 'Abuja', 'Pyongyang', 'Muscat',
    'Islamabad', 'Asuncin', 'Lima', 'Manila', 'Warsaw', 'San Juan', 'Bucharest',
    'Moscow', 'Riyadh', 'Dakar', 'Belgrade', 'Bratislava', 'Pretoria', 'Seoul',
    'Madrid', 'Colombo', 'Khartoum', 'Stockholm', 'Bern', 'Taipei', 'Dodoma',
    'Bangkok', 'Nuku''alofa', 'Tunis', 'Ankara', 'Ashgabat', 'Funafuti', 'Kyiv',
    'Abu Dhabi', 'London', 'Washington', 'Caracas', 'Hanoi', 'Sana''a', 'Lusaka',
    'Hong Kong', 'Reykjavik', 'Tashkent', 'Singapore', 'Tbilisi', 'Dili'
);

/*
8.10:  Set the region based on the country (e.g. China = Asia)
*/
-- [AI-generated answer]
-- Assumes region table was populated in 7.1 with: 1=North America, 2=South America, 3=Europe, 4=Asia, 5=Africa, 6=Oceania

UPDATE country SET region_id = 1 WHERE name IN ('Canada', 'United States', 'Mexico', 'Dominican Republic', 'Puerto Rico', 'Virgin Islands, U.S.', 'American Samoa', 'Saint Vincent and the Grenadines');
UPDATE country SET region_id = 2 WHERE name IN ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'French Guiana', 'Paraguay', 'Peru', 'Venezuela');
UPDATE country SET region_id = 3 WHERE name IN ('Austria', 'Belarus', 'Bulgaria', 'Czech Republic', 'Estonia', 'Faroe Islands', 'Finland', 'France', 'French Polynesia', 'Germany', 'Greece', 'Greenland', 'Holy See (Vatican City State)', 'Vatican City', 'Hungary', 'Italy', 'Latvia', 'Liechtenstein', 'Lithuania', 'Moldova', 'Netherlands', 'Poland', 'Romania', 'Réunion', 'Russian Federation', 'Serbia', 'Slovakia', 'Spain', 'Sweden', 'Switzerland', 'Turkey', 'Turkmenistan', 'Ukraine', 'United Kingdom');
UPDATE country SET region_id = 4 WHERE name IN ('Afghanistan', 'Armenia', 'Azerbaijan', 'Bahrain', 'Bangladesh', 'Brunei', 'Cambodia', 'China', 'Hong Kong', 'India', 'Indonesia', 'Iran', 'Iraq', 'Israel', 'Japan', 'Kazakstan', 'Kuwait', 'Malaysia', 'Myanmar', 'Nepal', 'North Korea', 'Oman', 'Pakistan', 'Philippines', 'Saudi Arabia', 'South Korea', 'Sri Lanka', 'Sudan', 'Taiwan', 'Thailand', 'Tonga', 'United Arab Emirates', 'Vietnam', 'Yemen');
UPDATE country SET region_id = 5 WHERE name IN ('Algeria', 'Angola', 'Cameroon', 'Chad', 'Congo, The Democratic Republic of the', 'Egypt', 'Ethiopia', 'Gambia', 'Kenya', 'Madagascar', 'Malawi', 'Morocco', 'Mozambique', 'Nigeria', 'Senegal', 'South Africa', 'Tanzania', 'Tunisia', 'Zambia');
UPDATE country SET region_id = 6 WHERE name IN ('Australia', 'New Zealand', 'Nauru', 'Tuvalu', 'Anguilla');

-- Now add the relationship column and index:
ALTER TABLE country
ADD COLUMN region_id TINYINT UNSIGNED,
ADD KEY idx_region_id (region_id);


/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */
