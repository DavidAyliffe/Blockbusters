/*	*******************************************************************************
	*** LEVEL 10 - Master Ninja                                                 ***
	***                                                                         ***
	*** Focus:  Stored Procedures	                                            ***
	***                                                                         ***
	***	Limits:                                                                 ***
	***                                                                         ***
	***                                                                         ***
	***	Estimated time: 2 lessons                                               ***
	******************************************************************************* */

use blockbusters;


DELIMITER $$

DROP PROCEDURE IF EXISTS GetFilmsByActor$$
CREATE PROCEDURE GetFilmsByActor(IN target_actor_name VARCHAR(100))
BEGIN
	SELECT f.film_id, f.title
	FROM film f, film_actor fa, actor a
	WHERE f.film_id = fa.film_id
	AND fa.actor_id = a.actor_id
	AND CONCAT(a.first_name, ' ', a.last_name) = target_actor_name;  -- does UPPERCASE/lowercase/Proper Case/RanDoM cASe make a difference???
END$$

DELIMITER ;


CALL GetFilmsByActor('NICK WAHLBERG');


/*
Create THREE of these stored procedures:

| -------------------------- | ------------------------------------------ | --------------------------------- |
| Procedure                  | Parameters                                 | Purpose                           |
| -------------------------- | ------------------------------------------ | --------------------------------- |
| GetRentalsByCustomer       | IN customer_id                             | Show all rentals for one customer |
| GetTotalPaidByCustomer     | IN customer_id                             | Total money paid                  |
| GetOverdueRentalsByStore   | IN store_id                                | Find late rentals by branch       |
| CountFilmRentals           | IN film_title, OUT total_rentals           | Return count                      |
| GetFilmsByRating           | IN film_rating                             | To show all films with that rating|
| GetCustomersByCity         | IN city_name                               | Show customers in that city       |
| GetRevenueByDateRange      | IN start_date, IN end_date                 | Total revenue                     |
| TopSpendingCustomers       | IN top_n                                   | Top X spenders                    |
| GetFilmsByCategory         | IN category_name                           | Find all films by category        |
|                            |                                            |                                   |
| UpdateCategoryRentalRate   | IN category_name, IN percentage_increase   | Modify prices                     |
| UpdateCustomerEmail        | IN customer_name, IN new_email_address     | Set new email address             |
| -------------------------- | ------------------------------------------ | --------------------------------- |

*/




