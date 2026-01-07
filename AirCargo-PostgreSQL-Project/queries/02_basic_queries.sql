-- 3) Passengers travelled in routes 1 to 25
SELECT P.customer_id, P.route_id, C.first_name, C.last_name
FROM passengers P
JOIN customer C ON P.customer_id = C.customer_id
WHERE P.route_id BETWEEN 1 AND 25;

-- 4) Business class passengers & revenue
SELECT 
    COUNT(customer_id) AS total_passengers,
    SUM(price_per_ticket * no_of_tickets) AS total_revenue
FROM ticket_details
WHERE class_id = 'Business';

-- 5) Full name of customers
SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM customer;

-- 6) Customers who registered and booked
SELECT DISTINCT C.customer_id, C.first_name, C.last_name
FROM customer C
JOIN ticket_details T ON C.customer_id = T.customer_id;

-- 7) Emirates brand customers
SELECT C.first_name, C.last_name
FROM ticket_details T
JOIN customer C ON T.customer_id = C.customer_id
WHERE T.brand = 'Emirates';