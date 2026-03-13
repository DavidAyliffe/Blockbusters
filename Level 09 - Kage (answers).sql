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

	select * from v_not_available_for_rent;

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
9.4. Create a view called v_where_customers_live which shows customer id, customer name, address, district, city and country.
*/


create view v_Where_Customers_Live as
	select customer_id, concat(first_name, " ", last_name) as cust_name, 
		   address, district, city.name as city, country.name as country
	from customer, address, city, country
	where customer.address_id = address.address_id
	and address.city_id = city.city_id
	and city.country_id = country.country_id
	order by customer.customer_id;
	
	select * from v_where_customers_live;
    
	
/*
9.5. Create a view called v_My_Details.
*/
	

/*
9.6. Create a view called v_My_Rentals.
*/
	
SELECT  c.customer_id,
	    concat(c.first_name, ' ', c.last_name) AS customer_name,
	    r.rental_id,
	    r.rental_date,
	    r.due_date,
	    r.returned_date,
	    f.film_id,
	    f.title,
	    ca.name,
	    s.store_id,
	    s.name,
	    p.amount
FROM rental r, inventory i, film f, customer c, staff st, store s, film_category fc, category ca, payment p
where r.inventory_id = i.inventory_id
and i.inventory_id = s.store_id
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


















