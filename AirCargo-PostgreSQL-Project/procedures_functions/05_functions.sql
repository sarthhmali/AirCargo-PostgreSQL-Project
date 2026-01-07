-- 19) Complimentary services function
CREATE OR REPLACE FUNCTION complimentary(class_id VARCHAR)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
BEGIN
    IF class_id IN ('Business','Economy Plus') THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
END;
$$;