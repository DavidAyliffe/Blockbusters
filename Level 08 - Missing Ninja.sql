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


/*
8.0:  Inflation is real!  Increase the price of all *future* rentals by 10%
*/

update film
	set rental_rate = rental_rate * 1.1
	where film_id > 0;		-- we need this where clause otherwise the query won't run and will complain about 'SAFE MODE' which prevents us from doing block updates


/*
8.1:  Set staff salaries to a random number between 40,000 and 60,000.  ChatGPT can help you :-)
*/


/*
8.2:  Set VIP on customer to 1 if the customer has rented more than 50 films in the last year. 
      HINT:  update ... set ... where customer_id in ( ... );
*/



/*
8.3:  Set the hashed password in staff to be an encrypted version of the password (use SHA2(password, 256))
      (Now, WITHOUT looking at the plaintext password, do any staff have the same hashed password?)
*/




/*
8.4:  Set the salt for staff.
	  HINT:  UPDATE staff SET salt = HEX(RANDOM_BYTES(32));
*/



/*
8.5:  Now, set the hashed password in staff to be an hashed version of the password **AND THE SALT** (use SHA2(CONCAT(password, salt), 256))
      (Now, WITHOUT looking at the password hint, do any staff have the same hashed password?)
*/
	


/*
8.6:  Using "Level 08 - maiden names.csv", set their maiden_name in table customer.  Get ChatGPT to do the grunt work for you!
*/


/*
8.7:  In 7.4 we created some new stores and assigned managers to them.  Make sure the staff we assigned are active.
*/


/*
8.8:  Set the latitude and longitude in table 'address' to the values in table 'location', make sure you match on address_id 
*/


/*
8.9:  Get a list of capital cities from ChatGPT and use this to update the 'is_capital' field in table city;
*/


/*
8.10:  Set the region based on the country (e.g. China = Asia).  Use this (and ChatGPT) to help you:

North America =
"Canada", "United States", "Mexico", "Belize", "Costa Rica", "El Salvador", "Guatemala", "Honduras", "Nicaragua", "Panama", "The Bahamas", 
"Barbados", "Cuba", "Dominica", "Dominican Republic", "Grenada", "Haiti", "Jamaica", "Saint Kitts and Nevis", "Saint Lucia", 
"Saint Vincent and the Grenadines", "Trinidad and Tobago"

South America =
"Argentina", "Bolivia", "Brazil", "Chile", "Colombia", "Ecuador", "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela"

Europe =
"Albania", "Andorra", "Austria", "Belarus", "Belgium", "Bosnia and Herzegovina", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", 
"Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Kosovo", "Latvia", 
"Liechtenstein", "Lithuania", "Luxembourg", "Malta", "Moldova", "Monaco", "Montenegro", "Netherlands", "North Macedonia", "Norway", 
"Poland", "Portugal", "Romania", "Russia", "San Marino", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "Ukraine", 
"United Kingdom", "Vatican City"

Asia =
"Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cambodia", "China", "Georgia", "India", "Indonesia", 
"Iran", "Iraq", "Israel", "Japan", "Jordan", "Kazakhstan", "Kuwait", "Kyrgyzstan", "Laos", "Lebanon", "Malaysia", "Maldives", "Mongolia", 
"Myanmar", "Nepal", "North Korea", "Oman", "Pakistan", "Palestine", "Philippines", "Qatar", "Saudi Arabia", "Singapore", "South Korea", 
"Sri Lanka", "Syria", "Taiwan", "Tajikistan", "Thailand", "Timor-Leste", "Turkey", "Turkmenistan", "UAE", "Uzbekistan", "Vietnam", 
"Yemen"

Africa =
"Algeria", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "Cape Verde", "Cameroon", "CAR", "Chad", "Comoros", "DRC", 
"Djibouti", "Egypt", "Equatorial Guinea", "Eritrea", "Eswatini", "Ethiopia", "Gabon", "Gambia", "Ghana", "Guinea", "Guinea-Bissau", 
"Ivory Coast", "Kenya", "Lesotho", "Liberia", "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", 
"Mozambique", "Namibia", "Niger", "Nigeria", "Congo", "Rwanda", "Sao Tome and Principe", "Senegal", "Seychelles", "Sierra Leone", 
"Somalia", "South Africa", "South Sudan", "Sudan", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe"

Oceania =
"Australia", "Fiji", "Kiribati", "Marshall Islands", "Micronesia", "Nauru", "New Zealand", "Palau", "Papua New Guinea", "Samoa", 
"Solomon Islands", "Tonga", "Tuvalu", "Vanuatu"

	  
NOW: Alter table country to create a relationship between region and country.
	** The new 'region_id' in table 'country' needs to be indexed using: ADD KEY idx_region_id (region_id) **

		e.g., 	ALTER TABLE example
				ADD COLUMN example_id TINYINT UNSIGNED NOT NULL,
				ADD KEY idx_example_id (example_id);
*/
