
-- create a function when trigger happens
    CREATE OR REPLACE FUNCTION {{FUNCTION NAME}}()
        returns trigger 
        language plpgsql
    AS $$
    BEGIN 
            PERFORM pg_notify('{{LISTENER NAME}}',row_to_json(NEW) :: text);
            RETURN NEW;
    END
    $$
 
-- create a trigger and assigned to a function above
    CREATE TRIGGER {{TRIGGER NAME}} AFTER INSERT OR UPDATE ON {{TABLE NAME}} FOR EACH ROW EXECUTE PROCEDURE {{FUNCTION NAME}}();

-- Drop a function query
    -- DROP FUNCTION {{FUNCTION NAME}}

-- Drop a trigger query
    -- DROP TRIGGER {{trigger NAME}} ON {{TABLE NAME}}

