SELECT c.customer_id, 
       c.first_name, 
       c.last_name, 
       s.store_id, 
       s.name, 
       ROUND(
             ST_Distance_Sphere(
                                 POINT(l1.longitude, l1.latitude),
                                 POINT(l2.longitude, l2.latitude)
                               ) 
             / 1000, 1) as distance_in_km

FROM customer c, locations l1, store s, locations l2

WHERE c.address_id = l1.address_id
and s.address_id = l2.address_id
and c.store_id = s.store_id

ORDER BY distance_in_km, customer_id, store_id;
