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


/*
Example: GetFilmsByActor (provided in the question file)
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS GetFilmsByActor$$
CREATE PROCEDURE GetFilmsByActor(IN target_actor_name VARCHAR(100))
BEGIN
	SELECT f.film_id, f.title
	FROM film f, film_actor fa, actor a
	WHERE f.film_id = fa.film_id
	AND fa.actor_id = a.actor_id
	AND CONCAT(a.first_name, ' ', a.last_name) = target_actor_name;
END$$

DELIMITER ;

CALL GetFilmsByActor('NICK WAHLBERG');


/* ============================================================================
   ALL STORED PROCEDURE ANSWERS BELOW
   [AI-generated answers]
   ============================================================================ */


/*
GetRentalsByCustomer - Show all rentals for one customer
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS GetRentalsByCustomer$$
CREATE PROCEDURE GetRentalsByCustomer(IN target_customer_id INT)
BEGIN
	SELECT r.rental_id, r.rental_date, r.due_date, r.returned_date,
		   f.title, p.amount
	FROM rental r, inventory i, film f, payment p
	WHERE r.inventory_id = i.inventory_id
	AND i.film_id = f.film_id
	AND r.rental_id = p.rental_id
	AND r.customer_id = target_customer_id
	ORDER BY r.rental_date DESC;
END$$

DELIMITER ;

CALL GetRentalsByCustomer(1);


/*
GetTotalPaidByCustomer - Total money paid by a customer
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS GetTotalPaidByCustomer$$
CREATE PROCEDURE GetTotalPaidByCustomer(IN target_customer_id INT)
BEGIN
	SELECT c.customer_id,
		   CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		   SUM(p.amount) AS total_paid
	FROM customer c, payment p
	WHERE c.customer_id = p.customer_id
	AND c.customer_id = target_customer_id
	GROUP BY c.customer_id;
END$$

DELIMITER ;

CALL GetTotalPaidByCustomer(1);


/*
GetOverdueRentalsByStore - Find late rentals by branch
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS GetOverdueRentalsByStore$$
CREATE PROCEDURE GetOverdueRentalsByStore(IN target_store_id INT)
BEGIN
	SELECT r.rental_id,
		   CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		   f.title,
		   r.rental_date,
		   r.due_date
	FROM rental r, customer c, inventory i, film f
	WHERE r.customer_id = c.customer_id
	AND r.inventory_id = i.inventory_id
	AND i.film_id = f.film_id
	AND i.store_id = target_store_id
	AND r.returned_date IS NULL
	AND r.due_date < NOW()
	ORDER BY r.due_date;
END$$

DELIMITER ;

CALL GetOverdueRentalsByStore(1);


/*
CountFilmRentals - Return count of rentals for a given film title (uses OUT parameter)
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS CountFilmRentals$$
CREATE PROCEDURE CountFilmRentals(IN target_film_title VARCHAR(255), OUT total_rentals INT)
BEGIN
	SELECT COUNT(*) INTO total_rentals
	FROM rental r, inventory i, film f
	WHERE r.inventory_id = i.inventory_id
	AND i.film_id = f.film_id
	AND f.title = target_film_title;
END$$

DELIMITER ;

CALL CountFilmRentals('ACADEMY DINOSAUR', @total);
SELECT @total AS total_rentals;


/*
GetFilmsByRating - Show all films with a given rating
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS GetFilmsByRating$$
CREATE PROCEDURE GetFilmsByRating(IN target_rating VARCHAR(5))
BEGIN
	SELECT film_id, title, description, release_year, rental_rate
	FROM film
	WHERE rating = target_rating
	ORDER BY title;
END$$

DELIMITER ;

CALL GetFilmsByRating('PG-13');


/*
GetCustomersByCity - Show customers in a given city
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS GetCustomersByCity$$
CREATE PROCEDURE GetCustomersByCity(IN target_city_name VARCHAR(100))
BEGIN
	SELECT c.customer_id,
		   CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		   a.address,
		   ci.name AS city
	FROM customer c, address a, city ci
	WHERE c.address_id = a.address_id
	AND a.city_id = ci.city_id
	AND ci.name = target_city_name
	ORDER BY c.last_name;
END$$

DELIMITER ;

CALL GetCustomersByCity('London');


/*
GetRevenueByDateRange - Total revenue between two dates
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS GetRevenueByDateRange$$
CREATE PROCEDURE GetRevenueByDateRange(IN start_date DATE, IN end_date DATE)
BEGIN
	SELECT SUM(amount) AS total_revenue,
		   COUNT(*) AS total_payments
	FROM payment
	WHERE payment_date >= start_date
	AND payment_date <= end_date;
END$$

DELIMITER ;

CALL GetRevenueByDateRange('2005-01-01', '2005-12-31');


/*
TopSpendingCustomers - Top X spenders
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS TopSpendingCustomers$$
CREATE PROCEDURE TopSpendingCustomers(IN top_n INT)
BEGIN
	SELECT c.customer_id,
		   CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
		   SUM(p.amount) AS total_spent
	FROM customer c, payment p
	WHERE c.customer_id = p.customer_id
	GROUP BY c.customer_id
	ORDER BY total_spent DESC
	LIMIT top_n;
END$$

DELIMITER ;

CALL TopSpendingCustomers(10);


/*
GetFilmsByCategory - Find all films by category
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS GetFilmsByCategory$$
CREATE PROCEDURE GetFilmsByCategory(IN target_category_name VARCHAR(50))
BEGIN
	SELECT f.film_id, f.title, f.release_year, f.rental_rate
	FROM film f, film_category fc, category ca
	WHERE f.film_id = fc.film_id
	AND fc.category_id = ca.category_id
	AND ca.name = target_category_name
	ORDER BY f.title;
END$$

DELIMITER ;

CALL GetFilmsByCategory('Action');


/*
UpdateCategoryRentalRate - Modify prices for a category by a percentage
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateCategoryRentalRate$$
CREATE PROCEDURE UpdateCategoryRentalRate(IN target_category_name VARCHAR(50), IN percentage_increase DECIMAL(5,2))
BEGIN
	UPDATE film f
	INNER JOIN film_category fc ON f.film_id = fc.film_id
	INNER JOIN category ca ON fc.category_id = ca.category_id
	SET f.rental_rate = f.rental_rate * (1 + percentage_increase / 100)
	WHERE ca.name = target_category_name;
END$$

DELIMITER ;

-- Example: increase Action films by 15%
CALL UpdateCategoryRentalRate('Action', 15);


/*
UpdateCustomerEmail - Set new email address for a customer
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateCustomerEmail$$
CREATE PROCEDURE UpdateCustomerEmail(IN target_customer_name VARCHAR(100), IN new_email_address VARCHAR(100))
BEGIN
	UPDATE customer
	SET email = new_email_address
	WHERE CONCAT(first_name, ' ', last_name) = target_customer_name;
END$$

DELIMITER ;

-- Example:
CALL UpdateCustomerEmail('MARY SMITH', 'mary.smith@newemail.com');
