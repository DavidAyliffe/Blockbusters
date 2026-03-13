/*	*******************************************************************************
	*** LEVEL 5 - Jonin                                                         ***
	***                                                                         ***
	*** Focus: 	in()/not in()                                                   ***
	***                                                                         ***
	***	Limits: Negation                                                        ***
	***                                                                         ***
	***                                                                         ***
	***	Estimated time: 2 lessons                                               ***
	******************************************************************************* */

/*
SOURCE /Users/ydo/Google Drive/AGU/GD Docs/Blockbusters/Level 5 - Jonin.sql
*/

use blockbusters;

/* save as CRLF for windows */

/*
5.0. How many customers have not rented a movie from:
     "Flicks" or "Cinefile" or "La Dolce Video"?
(±14 lines, 5 tables, hint: not in(); )
Answer: ??? customers
*/
select count(*) as cust_no_rental
from customer
where customer_id not in
(
	select distinct customer.customer_id
	from rental, customer, inventory, store
	where rental.customer_id = customer.customer_id
	and rental.inventory_id = inventory.inventory_id
	and inventory.store_id = store.store_id
	and store.name in ( 'Flicks', 'Cinefile', 'La Dolce Video' )
);



/*
5.1. Which country(ies) do(es) not have any customers?
(±10 lines, 4 or 5 tables, hint: not in)
Answer: ??
*/






/*
5.2. Which actresses have not acted in any Adult films or Dramas?
(±10 lines, 5 or 6 tables, hint: not in)
Answer: ??
*/






/*
5.3. List the cities that have no customers.
(±7 lines, ±3 tables, hint: not in)
Answer: ??
*/





/*
5.4. Which film(s) does "Rentertainment" not have any copies of?
(±10 lines, ±4 tables, hint: not in)
Answer: ??
*/






/*
5.5. Which film(s) is/are exclusive to "Mr. Video"?
(±10 lines, ±3 tables, hint: not in)
Answer: ??
*/






/*
5.6. Which rentals have not been paid for?
(±7 lines, 3 tables, hint: not in)
Answer: ??
*/





/*
5.7. Which store(s) doesn't have any customers from Egypt?
(±11 lines, 5 tables, hint: not in)
Answer: ??
*/




/*
5.8. Per store, which films have not been rented yet?
(±9 lines, 6 tables (BONUS: only 4 tables is possible), hint: not in)
Answer: ??
*/






/*
5.9. Which actors have never worked together?
(±13 lines, 4 tables, hint: not in)
Answer: ??
*/








/*
5.10. Which actresses have not worked with JOHN SUVARI or RUSSELL CLOSE or BURT PHOENIX?
(±11 lines, 4 tables, hint: not in; be careful with your () )
Answer: ??
*/




/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */

/*
5.11. Which customer(s) have never returned a film late?
(±11 lines, 2 tables, hint: not in)
Answer: ??
*/




/*
5.12. Which film(s) have never been lost/stolen?
(±11 lines, 5 tables, hint: not in)
Answer: ??
*/



/*
5.13. Which film(s) have not been rented so far this year?
(±? lines, ? tables, hint: DATE_FORMAT() or YEAR())
Answer: ??
*/



/*
5.14. Which female customer(s) have never rented any Hindi War films or Turkish Comedies?
(±27 lines, ±15 tables, hint: not in x 2)
Answer: ??
*/


