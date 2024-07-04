/*

1. Define the vairables
2. Create a CTE that round the average views per video
3. Select colums the are required for the analysis
4. Filter the results by the YouTube channels with the highest subscribers bases 
5. Order by net_profit (from highest to lowest)

*/


-- 1.
DECLARE @conversionRate FLOAT = 0.02;       -- The conversion rate @ 2%
DECLARE @productCost MONEY = 5.0;           -- The product cost @ $5
DECLARE @campaignCost MONEY = 50000.0;      -- The campaign cost @ $50,000


-- 2.
WITH channelData AS (
	SELECT 
		channel_name,
		total_views,
		total_videos,
		ROUND((CAST(total_views as FLOAT) / total_videos), -4) AS rounded_avg_views_per_video
	FROM 
		youtube_db.dbo.view_top_uk_youtubers_2024


)

-- 3.

SELECT 
	channel_name,
	rounded_avg_views_per_video,
	(rounded_avg_views_per_video * @conversionRate) AS potential_unit_sold_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost) - @campaignCost AS net_profit
FROM channelData


-- 4.
WHERE channel_name IN ('NoCopyrightSounds', 'DanTDM', 'Dan Rhodes')


-- 5.
ORDER BY net_profit DESC