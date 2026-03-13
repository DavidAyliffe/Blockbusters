/*	*******************************************************************************
	*** LEVEL 9 - Kage                                                          ***
	***                                                                         ***
	*** Focus: 	                                                                ***
	***                                                                         ***
	***	Limits:                                                                 ***
	***                                                                         ***
	***                                                                         ***
	***	Estimated time: 2 lessons                                               ***
	******************************************************************************* */


/*
9.1. Create a view called v_payment_history which shows customer id, name and total amount spent on rentals so far.
*/

create view v_Payment_History as
	select customer.customer_id, concat(first_name, " ", last_name) as cust_name, sum(payment.amount) as spent_on_rentals
	from customer, rental, payment
	where customer.customer_id = rental.customer_id
	and rental.rental_id = payment.rental_id
    group by customer.customer_id
	order by spent_on_rentals desc;

    select * from v_payment_history;



/*
9.2. Create a view called v_currently_on_rent which shows which films are currently out on rent (by whom and in which store).
*/

create view v_On_Rent_Now as
	select film.film_id, title, customer.customer_id, concat(first_name, " ", last_name) as cust_name, store.store_id, store.name, rental.due_date
	from customer, film, inventory, rental, store
	where customer.customer_id = rental.customer_id
	and rental.inventory_id = inventory.inventory_id
	and inventory.film_id = film.film_id
	and inventory.store_id = store.store_id
	order by rental.due_date desc, film.film_id;

	select * from v_On_Rent_Now;

/*
9.3. Create a view called v_store_rentals which shows the number of rentals for the last month for each store
*/

create view v_Store_Rentals as
	select store.store_id, store.name, count(*) as rented_last_month
	from store, inventory, rental
	where store.store_id = inventory.store_id
	and inventory.inventory_id = rental.inventory_id
	and rental.rental_date >= DATE_FORMAT(now() - INTERVAL 6 MONTH, '%Y-%m-01')
	and rental.rental_date < now()
	group by store.store_id
	order by store.store_id;

	select * from v_store_rentals;



/*
9.4. Create a view called v_revenue_by_country which shows the amount of money taken in each country.
*/
-- [AI-generated answer]

CREATE VIEW v_Revenue_By_Country AS
	SELECT country.name AS country, SUM(payment.amount) AS total_revenue
	FROM payment, rental, inventory, store, address, city, country
	WHERE payment.rental_id = rental.rental_id
	AND rental.inventory_id = inventory.inventory_id
	AND inventory.store_id = store.store_id
	AND store.address_id = address.address_id
	AND address.city_id = city.city_id
	AND city.country_id = country.country_id
	GROUP BY country.country_id
	ORDER BY total_revenue DESC;

	SELECT * FROM v_Revenue_By_Country;


/*
9.5. Create a view called v_where_customers_live which shows customer id, customer name, address, district, city, country and region and GPS coordinates (if available).
*/
-- [AI-generated answer]

CREATE VIEW v_Where_Customers_Live AS
	SELECT customer.customer_id,
		   CONCAT(first_name, ' ', last_name) AS cust_name,
		   address.address,
		   address.district,
		   city.name AS city,
		   country.name AS country,
		   region.name AS region,
		   address.latitude,
		   address.longitude
	FROM customer, address, city, country
	LEFT JOIN region ON country.region_id = region.region_id
	WHERE customer.address_id = address.address_id
	AND address.city_id = city.city_id
	AND city.country_id = country.country_id
	ORDER BY customer.customer_id;

	SELECT * FROM v_Where_Customers_Live;

/*
9.6. Create a view called v_My_Rentals.
*/

CREATE VIEW v_My_Rentals AS
SELECT  c.customer_id,
	    concat(c.first_name, ' ', c.last_name) AS customer_name,
	    r.rental_id,
	    r.rental_date,
	    r.due_date,
	    r.returned_date,
	    f.film_id,
	    f.title,
	    ca.name AS category,
	    s.store_id,
	    s.name AS store_name,
	    p.amount
FROM rental r, inventory i, film f, customer c, staff st, store s, film_category fc, category ca, payment p
where r.inventory_id = i.inventory_id
and i.store_id = s.store_id
and i.film_id = f.film_id
and f.film_id = fc.film_id
and fc.category_id = ca.category_id
and r.customer_id = c.customer_id
and r.staff_id = st.staff_id
and r.rental_id = p.rental_id
order by r.rental_date desc;



/*
9.7. Create a view called v_Top_Spending_Customers.
*/

CREATE VIEW v_Top_Spending_Customers AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	s.name,
    SUM(p.amount) AS total_spent
FROM customer c, rental r, inventory i, store s, payment p
WHERE c.customer_id = p.customer_id
and p.rental_id = r.rental_id
and r.inventory_id = i.inventory_id
and i.store_id = s.store_id
GROUP BY c.customer_id, s.store_id
order by total_spent, c.customer_id, s.store_id;


/*
9.8. Create a view called v_category_performance which shows the performance of different categories of films in different stores.
*/
-- [AI-generated answer]

CREATE VIEW v_Category_Performance AS
	SELECT s.store_id,
		   s.name AS store_name,
		   ca.name AS category,
		   COUNT(r.rental_id) AS total_rentals,
		   SUM(p.amount) AS total_revenue
	FROM store s, inventory i, rental r, payment p, film f, film_category fc, category ca
	WHERE s.store_id = i.store_id
	AND i.inventory_id = r.inventory_id
	AND r.rental_id = p.rental_id
	AND i.film_id = f.film_id
	AND f.film_id = fc.film_id
	AND fc.category_id = ca.category_id
	GROUP BY s.store_id, ca.category_id
	ORDER BY s.store_id, total_revenue DESC;

	SELECT * FROM v_Category_Performance;


/*
9.9. Create a view called v_monthly_revenue which shows revenue by year and by month (HINT:  use MONTH(), YEAR() ).
*/
-- [AI-generated answer]

CREATE VIEW v_Monthly_Revenue AS
	SELECT YEAR(payment.payment_date) AS revenue_year,
		   MONTH(payment.payment_date) AS revenue_month,
		   SUM(payment.amount) AS total_revenue
	FROM payment
	GROUP BY YEAR(payment.payment_date), MONTH(payment.payment_date)
	ORDER BY revenue_year, revenue_month;

	SELECT * FROM v_Monthly_Revenue;
