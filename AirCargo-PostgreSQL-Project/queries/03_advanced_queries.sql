-- 8) Economy Plus passengers
SELECT C.customer_id, C.first_name, C.last_name
FROM passengers P
JOIN customer C ON P.customer_id = C.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name, P.class_id
HAVING P.class_id = 'Economy Plus';

-- 9) Revenue check
SELECT 
    SUM(price_per_ticket) AS total_revenue,
    CASE 
        WHEN SUM(price_per_ticket) > 10000 THEN 'Revenue Crossed 10000'
        ELSE 'Revenue Below 10000'
    END AS revenue_status
FROM ticket_details;

-- 11) Max ticket price per class (Window Function)
SELECT DISTINCT class_id,
MAX(price_per_ticket) OVER (PARTITION BY class_id) AS max_price
FROM ticket_details;

-- 14) Rollup
SELECT aircraft_id, SUM(price_per_ticket) AS total_price
FROM ticket_details
GROUP BY ROLLUP (aircraft_id);