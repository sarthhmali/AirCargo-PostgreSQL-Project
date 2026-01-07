-- 15) Business class customers view
CREATE OR REPLACE VIEW luxury AS
SELECT 
    T.customer_id,
    C.first_name,
    C.last_name,
    T.class_id,
    T.brand
FROM ticket_details T
JOIN customer C ON T.customer_id = C.customer_id
WHERE T.class_id = 'Business';