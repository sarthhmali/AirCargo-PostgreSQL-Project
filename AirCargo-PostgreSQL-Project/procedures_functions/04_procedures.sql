-- 16) Range routes procedure
CREATE OR REPLACE PROCEDURE range_routes(r1 INT, r2 INT)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT C.customer_id, C.first_name, C.last_name, R.*
    FROM routes R
    JOIN passengers P ON R.route_id = P.route_id
    JOIN customer C ON P.customer_id = C.customer_id
    WHERE R.route_id BETWEEN r1 AND r2;
END;
$$;

-- 17) Distance > 2000 miles
CREATE OR REPLACE PROCEDURE travel_distance()
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT * FROM routes WHERE distance_miles > 2000;
END;
$$;