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
Level 10 – Master Ninja:  Worksheet
1. Adding New Tables
•	Employee Management: Add tables for employees, roles, and salaries to manage staff who work at the rental stores.
o	Columns in employees: employee_id, first_name, last_name, role_id, store_id, email, phone_number.
o	Columns in roles: role_id, role_name, description.
•	Film Inventory Maintenance: Add a maintenance table to track repairs or maintenance of damaged discs.
o	Columns: maintenance_id, inventory_id, issue_description, repair_date, repair_cost.

2. Creating Relationships
•	Store Promotions: Add a promotions table and link it to stores and rentals to track discounts and special offers.
o	Columns in promotions: promotion_id, store_id, discount_percentage, start_date, end_date.
•	Event Screenings: Create a screenings table for special events or in-store film screenings.
o	Columns: screening_id, film_id, store_id, event_date, tickets_sold.

3. Implementing Additional Functionality
•	Dynamic Pricing: Add a table for pricing_rules that adjusts rental costs based on factors like demand or time of year.
o	Columns: rule_id, film_category, pricing_factor, start_date, end_date.
•	Film Recommendations: Add a recommended_films table to suggest films based on customer rental history.
o	Columns: recommendation_id, customer_id, film_id, reason.

4. Integrating External Data
•	Streaming Platforms: Add a table for streaming_availability to show if a film is available on streaming services.
o	Columns: film_id, platform_name, availability_status, link.
•	Social Media Popularity: Include a social_media_metrics table to track film popularity on platforms like Twitter or Instagram.
o	Columns: film_id, platform, mentions, likes, shares.

5. Gamification Features
•	Leaderboards: Create a leaderboard table to gamify rentals, where customers earn points for frequent rentals or high spending.
o	Columns: customer_id, points_earned, rank. 
*/

