-- Step 1: Check query duration before clustering
-- Replace the condition with something like , eg : age > 18

SELECT COUNT(*) FROM YOUR_TABLE_NAME WHERE {CONDITION};

-- Step 2: Apply clustering if not already defined
-- Apply clustering to column name

ALTER TABLE YOUR_TABLE_NAME CLUSTER BY (COLUMN_NAME);

-- Step 3: Trigger reclustering (optional, for immediate effect)

ALTER TABLE YOUR_TABLE_NAME RECLUSTER;

-- Step 4: Check query duration after clustering

SELECT COUNT(*) FROM YOUR_TABLE_NAME WHERE {CONDITION};

-- Step 5: Get query execution time before and after clustering

SELECT query_id, start_time, end_time, total_elapsed_time
FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY)
WHERE query_text LIKE 'SELECT COUNT(*) FROM YOUR_TABLE_NAME WHERE {CONDITION} %';
