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


/*
8.1:  Set staff salaries to a random number between 40,000 and 60,000
*/


/*
8.2:  Set VIP on customer to 1 if the customer has rented more than 50 films in the last year. 
*/

UPDATE customer
SET VIP = 1
WHERE customer_id IN (
    SELECT customer_id, count(*)
    FROM rental
    WHERE rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY customer_id
    HAVING COUNT(*) > 50
);

/*
8.2:  Set the encrypted password in staff to be an encrypted version of the password (use SHA2(password, 256))
*/


/*
8.3:  If the customer is female, use "Level 08 - maiden names.csv" to set their maiden_name to their last_name
*/



/*
8.4:  ARLENE HARVEY has recently got married and changed her name to ARLENE SUTTON.  Make this change.
*/



/*
8.5:  Renee Hopkins has left the company.  Make this change.
*/


/*
8.5:  Get a list of capital cities from ChatGPT and use this to update the 'is_capital' field in table city;
*/


/*
8.7:  Set the region based on the country (e.g. China = Asia)
*/






/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */
