/*

Data quality tests

1. The data needs be 100 records of YouTube channels (row count test) ---(passed!!!)
2. The data needs 4 fields (column count test)  ---(passed!!!)
3. The channel name column must be string format and the other columns must be numerical data types (data types check)  ---(passed!!!)
4. Each records must be unique in thier dataset (duplicate count check)  ---(passed!!!) 

Row count - 100
Column count - 4

Data types
channel_name = VARCHAR
total_subscribers = INTEGER
total_videos = INTEGER
total_views = INTEGER

Duplicate count = 0

*/

-- 1. Row count check
SELECT COUNT(*) as no_of_rows
FROM view_top_uk_youtubers_2024

-- 2. Column count check

SELECT 
	COUNT (*) AS column_count 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_top_uk_youtubers_2024'


-- 3. Data types check

SELECT 
	COLUMN_NAME,
	DATA_TYPE
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_top_uk_youtubers_2024'


-- 4. Duplicate records check

SELECT
	channel_name,
	COUNT(*) AS duplicat_count
FROM 
	view_top_uk_youtubers_2024
GROUP BY 
	channel_name
HAVING 
	COUNT(*) > 1
	
	