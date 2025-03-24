-- Step 1: Run a query before result caching is used
SELECT COUNT(*) FROM table_name WHERE column_name >= '2024-01-01';

-- Step 2: Run the same query again to check if result caching is applied
-- Snowflake should return the cached result, making it much faster
SELECT COUNT(*) FROM table_name WHERE column_name >= '2024-01-01';

-- Step 3: Force result cache to be cleared (optional, for testing)
ALTER SESSION SET USE_CACHED_RESULT = FALSE;

-- Step 4: Run the query again after clearing the cache to measure the difference
SELECT COUNT(*) FROM table_name WHERE column_name >= '2024-01-01';

-- Step 5: Check query execution time before and after caching
SELECT query_id, start_time, end_time, total_elapsed_time, query_text
FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY)
WHERE query_text LIKE 'SELECT COUNT(*) FROM table_name WHERE column_name%';

-- Note:
-- Snowflake automatically caches query results for 24 hours if the underlying data hasn’t changed.
-- Running the same query should return results instantly without scanning the table again.
