/*
# Data cleaning steps

1. Remove unnecessary columns by selecting the ones we need
2. Extract youtube channel names from first columns
3. Rename the columns names
 

*/


select 
	NOMBRE,
	total_subscribers,
	total_videos,
	total_views
from 
	top_uk_youtubers_2024


 -- CHAIRINDEX

 SELECT CHARINDEX('@', NOMBRE), NOMBRE FROM top_uk_youtubers_2024

 -- SUBSTRING

 CREATE VIEW view_top_uk_youtubers_2024 AS

 SELECT 
	CAST (SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) -1) AS varchar(100)) AS channel_name,
	total_subscribers,
	total_videos,
	total_views
 FROM 
	top_uk_youtubers_2024