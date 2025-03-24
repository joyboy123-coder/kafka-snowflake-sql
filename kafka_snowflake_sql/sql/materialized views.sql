-- Step 1: Check query duration before using a materialized view

SELECT COLUMN_NAME, SUM(COLUMN_NAME) AS NEW_COLUMN_NAME
FROM TABLE_NAME
GROUP BY COLUMN_NAME;


-- Step 2: Create a materialized view to optimize the query
-- You can replace M_VIEW with any of ur name


CREATE MATERIALIZED M_VIEW AS
SELECT COLUMN_NAME, SUM(COLUMN_NAME) AS NEW_COLUMN_NAME
FROM TABLE_NAME
GROUP BY COLUMN_NAME;

-- Step 3: Query the materialized view instead of the base table

SELECT * FROM M_VIEW;

-- Step 4: Refresh the materialized view if needed (Snowflake updates automatically)

ALTER MATERIALIZED VIEW M_VIEW REFRESH;

-- Step 5: Check query execution time before and after using the materialized view

SELECT query_id, start_time, end_time, total_elapsed_time
FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY)
WHERE query_text LIKE 'SELECT COLUMN_NAME, SUM(COLUMN_NAME)%';
