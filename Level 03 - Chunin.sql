/*	*******************************************************************************
	*** LEVEL 3 - Chunin                                                        ***
	***                                                                         ***
	***	Focus:  Joining not more than six tables                                ***
	***			Multi parameter WHERE clause                                    ***
	***			Functions beyond count(*) (having, now)                         ***
	***                                                                         ***
	***	Estimated time: 2 classes (excluding 'extra practice')                  ***
	***************************************************************************** */

use blockbusters;

/*
3.0. How many films are suitable for children
	 at the Bangkok store?
(about 8 lines, 5 tables)
Answer: ??
*/

select count(*) as ok_for_kids
from film, inventory, store, address, city
where film.film_id = inventory.film_id
and inventory.store_id = store.store_id
and store.address_id = address.address_id
and address.city_id = city.city_id
and city.name = 'Bangkok'
and film.rating = 'PG';




/*
3.1. Which actor has starred in the most films?
(about 6 lines; 2 or 3 tables; the answer is *NOT* 'DAVID KING')
Answer:
*/





/*
3.2. Which DVD was most often returned late?
(about 5 lines, 3 tables, hint: ">" )
Answer:
*/




/*
3.3. Who has lost/stolen the most DVD(s) they rented?
(about 8 lines, 2 tables, hint: use the now() function; is null)
Answer:
*/





/*
3.4. Which is the most popular film to steal?
(about 8 lines, 3 tables, hint: use the now() function; is null)
Answer:
*/







/*
3.5. Which category of film is the most popular?
(about 8 lines, 5 tables; hint: see question 2.10 )
Answer:
*/








/*
3.6. Pick ONE:
     How many scary Vietnamese films are there?
     How many Russian porn films are there?
     How many Chinese science fiction films are there?
     How many Arabic documentaries are there?
(about 8 lines, 4 tables)
Answer:
*/






/*
3.7. Which customers have spent more than $15,000 on film rentals?
(about 8 lines, 3 tables; hint:use the sum( something ) function; use having() )
Answer:
*/






/*
3.8. Which male customers have rented 100 or more horror movies?
(about 10 lines; 6 tables; hint: use having() )
Answer:
*/






/*
3.9. Which film category generated the highest rental income?
(about 9 lines, 6 tables; hint use the 'sum( something )' function)
Answer:
*/




/*
3.10. Which actor has earned blockbusters the most money?
(about 9 lines, 6 tables; hint use the 'sum( something )' function; see Question 3.1 for help)
Answer:
*/





/* ************************************************************** */
/* ***** ***** ***** ***** EXTRA PRACTICE ***** ***** ***** ***** */
/* ************************************************************** */

/*
3.11. Calculate the total rental revenue for each city.
*/



/*
3.12. Which store has the most films to make you laugh?
*/




/*
3.13. Who has been the most active customer in the last 90 days?
(Hint: use DATE_SUB())
*/




/*
3.14. What's the most popular film in the last 90 days?
(Hint: use DATE_SUB())
*/




/*
3.15. What's the most popular film this year?
(Hint: use DATE_FORMAT() OR YEAR())
*/




/*
3.16. Find customers who have the same last name?  Which is the most popular last name?
(Hint: use HAVING())
*/

