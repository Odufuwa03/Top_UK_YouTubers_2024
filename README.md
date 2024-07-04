# Top_UK_YouTubers_2024


![kaggle_to_powerbi](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/0e708025-424f-45db-ac1e-58ffd7c4fd9b)

# Table of Contents

- [Objective](#objective)
- [Data Source](#data-source)
- [Stages](#stages)
- [Design](#design)
  - [Tools](#tools)
- [Development](#development)
  - [Pseudocode](#pseudocode)
  - [Data Exploration](#data-Exploration)
  - [Data Cleaning](#data-cleaning)
  - [Transform the Data](#transform-the-data)
  - [Create the SQL View](#create-the-SQL-view)
- [Testing](#testing)
  - [Data Quality Tests](#data-quality-test)
- [Visualization](#visualization)
  - [Results](#results)
  - [DAX Measures](#dax-measures)
- [Analysis](#analysis)
  - [Findings](#findings)
  - [Validation](#validation)
  - [Discovery](#discovery)
- [Recommendations](#recommendation)
  - [Potential ROI](#potential-roi)
  - [Potential Courses of Actions](#potential-courses-os-actions)
- [Conclusion](#conclusion)

# Objective

### Key Pain Point

The Head of Marketing needs to identify the top YouTubers in 2024 to determine the best influencers for marketing campaigns throughout the year.

### Ideal Solution

Develop a dashboard that offers insights into the leading UK YouTubers in 2024, including:

- Subscriber count
- Total views
- Total videos
- Engagement metrics

This dashboard will enable the marketing team to make informed decisions about which YouTubers to collaborate with for their campaigns.

# User Story

As the Head of Marketing, I seek to utilize a dashboard that analyzes YouTube channel data in the UK.

This dashboard should enable the identification of top-performing channels based on metrics such as subscriber count and average views.

Armed with this information, I can make more informed decisions about selecting the right YouTubers for collaborations, thereby maximizing the effectiveness of each marketing campaign.

# Data Source

What data is needed to achieve our objective?
We need data on the top UK YouTubers in 2024 that includes their

- channel names

- total subscribers

- total views

- total videos uploaded

Where is the data coming from? The data is sourced from Kaggle (an Excel extract), [see here to find it](https://www.kaggle.com/datasets/bhavyadhingra00020/top-100-social-media-influencers-2024-countrywise?resource=download)

# Stages

- Design
- Developement
- Testing
- Analysis

# Design

## Dashboard components required

- What should the dashboard contain based on the requirements provided?

To understand what it should contain, we need to figure out what questions we need the dashboard to answer:

1. Who are the top 10 YouTubers with the most subscribers?
2. Which 3 channels have uploaded the most videos?
3. Which 3 channels have the most views?
4. Which 3 channels have the highest average views per video?
5. Which 3 channels have the highest views per subscriber ratio?
6. Which 3 channels have the highest subscriber engagement rate per video uploaded?

For now, these are some of the questions we need to answer, this may change as we progress down our analysis.

# Tools

| Tools     | Purpose |
| --------- | ------- |
| Excel|Exploring the data|
| SQL Server|Cleaning, testing, and analyzing the data|
| Power BI | Visualizing the data via interactive dashboards|

# Development

## Pseudocode

- What's the general approach in creating this solution from start to finish?
1. Get the data
2. Explore the data in Excel
3. Load the data into SQL Server
4. Clean the data with SQL
5. Test the data with SQL
6. Visualize the data in Power BI
7. Generate the findings based on the insights
8. Write the documentation + commentary
9. Publish the data to GitHub Pages

## Data exploration notes

### Initial Data Assessment

This is the stage where we scan the data for errors, inconsistencies, bugs, and any unusual or corrupted characters.

**Initial Observations:**
1. **Relevant Columns:** There are at least four columns containing the necessary data for our analysis, indicating that we have all required information without needing to contact the client for additional data.
2. **Channel IDs:** The first column contains channel IDs, separated by an @ symbol. We need to extract the channel names from these IDs.
3. **Language Discrepancies:** Some cells and header names are in a different language. We need to verify if these columns are essential for our analysis and address any language-related issues if they are.
4. **Excess Data:** The dataset contains more columns than needed. We will need to remove the extraneous columns to streamline our analysis.

## Data Cleaning

- What do we expect the clean data to look like? (What should it contain? What contraints should we apply to it?)
The aim is to refine our dataset to ensure it is structured and ready for analysis.

The cleaned data should meet the following criteria and constraints:

- Only relevant columns should be retained.
- All data types should be appropriate for the contents of each column.
- No column should contain null values, indicating complete data for all records.
Below is a table outlining the constraints on our cleaned dataset:

| Property    | Description |
| --------- | ------- |
| Number of Rows|100|
| Number of Columns|4|

And here is a tabular representation of the expected schema for the clean data:

| Column Name    | Data Type | Nullable |
| --------- | ------- | ------- |
| channel_name|VARCHAR|NO|
| total_subscribers|INTEGER|NO|
| total_views|INTEGER|NO|
| total_videos|INTEGER|NO|

- What steps are needed to clean and shape the data into the desired format?
1. Remove unnecessary columns by only selecting the ones you need
2. Extract Youtube channel names from the first column
3. Rename columns using aliases

## Transform the data

```sql
/*
# Data cleaning steps

1. Remove unnecessary columns by selecting the ones we need
2. Extract youtube channel names from first columns
3. Rename the columns names
 

*/

-- 1.
select 
	NOMBRE,
	total_subscribers,
	total_videos,
	total_views
from 
	top_uk_youtubers_2024

-- 2.
 -- CHAIRINDEX

 SELECT CHARINDEX('@', NOMBRE), NOMBRE FROM top_uk_youtubers_2024

 -- SUBSTRING

 
-- 3.
 SELECT 
	CAST (SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) -1) AS varchar(100)) AS channel_name,
	total_subscribers,
	total_videos,
	total_views
 FROM 
	top_uk_youtubers_2024

## Create the SQL view

```sql
 CREATE VIEW view_top_uk_youtubers_2024 AS

 SELECT 
	CAST (SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) -1) AS varchar(100)) AS channel_name,
	total_subscribers,
	total_videos,
	total_views
 FROM 
	top_uk_youtubers_2024
```

 ## Testing

- What data quality and validation checks are you going to create?
Here are the data quality tests conducted:
### Row count check

```sql
--- Row count check
SELECT COUNT(*) as no_of_rows
FROM [youtube_db].[dbo].[view_top_uk_youtubers_2024]
```
#### Output
![row count](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/b94abc9f-aa69-4bf7-bd52-7f18fc862f35)

![row count 1](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/2673c9b7-5860-422c-92fb-a38822175d97)

### Column count check

```sql
-- 2. Column count check

SELECT 
	COUNT (*) AS column_count 
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_top_uk_youtubers_2024'
```
#### Output
![column count](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/b99b233a-2f9a-4d19-b092-952af322ef61)

![column count 1](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/a89f3d74-1c89-4177-a126-29dfb4654ba2)

### Data type check

```sql
-- 3. Data types check

SELECT 
	COLUMN_NAME,
	DATA_TYPE
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_top_uk_youtubers_2024'
```
#### Output
![Data type](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/1b78ddfe-61c8-46e7-a28a-2e6c10c80920)

![Data type1](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/d5a61a08-b438-4cf6-8ddc-6c6e08bfc786)

### Duplicate count check

```sql
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
```

#### Output
![duplicate](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/a6b492aa-c6be-4fde-8992-b1e097867132)

![duplicate1](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/d4cdec96-7c0c-4555-84be-bb340e27aa25)

# Visualization

## Results
- What does the visualization look like?

![ec915a1621754f299bdf106885955d70-ezgif com-video-to-gif-converter (1)](https://github.com/Odufuwa03/Top_UK_YouTubers_2024/assets/169449929/761982ab-0f0a-499c-9451-2de077cb7645)

This shows the Top UK Youtubers in 2024 so far.

## DAX Measures

### 1. Total Subscribers (M)

```dax
Total Subscribers (M) = 
VAR million = 1000000
VAR sumOfSubscribers = SUM(view_top_uk_youtubers_2024[total_subscribers])
VAR totalSubscribers = DIVIDE(sumOfSubscribers, million)

RETURN totalSubscribers
```

### 2. Total Videos

```dax
Total Videos = 
VAR totalVideos = SUM(view_top_uk_youtubers_2024[total_videos])

RETURN totalVideos
```

### 3. Total Views (B)

```dax
Total Views (B) = 
VAR billion = 1000000000
VAR sumOfTotalViews = SUM(view_top_uk_youtubers_2024[total_views])
VAR totalViews = DIVIDE(sumOfTotalViews, billion)

RETURN totalViews
```

### 4. Views Per subscriber

```dax
Views Per subscriber = 
VAR sumOfTotalViews = SUM(view_top_uk_youtubers_2024[total_views])
VAR sumOfTotalsubscribers = SUM(view_top_uk_youtubers_2024[total_subscribers])
VAR viewsPerSubscribers = DIVIDE(sumOfTotalViews, sumOfTotalsubscribers, BLANK())

RETURN viewsPerSubscribers
```

### 5. Avg Views per Videos (M)

```dax
Avg Views per Videos (M) = 
VAR sumOfTotalViews = SUM(view_top_uk_youtubers_2024[total_views])
VAR sumOfTotalVideos = SUM(view_top_uk_youtubers_2024[total_videos])
VAR avgViewsPerVideo = DIVIDE(sumOfTotalViews, sumOfTotalVideos, BLANK())
VAR finalAvgViewsPerVideo = DIVIDE(avgViewsPerVideo, 1000000, BLANK())

RETURN finalAvgViewsPerVideo
```

### 6.Subscriber Engagement Rate

```dax
Subscriber Engagement Rate = 
VAR sumOfTotalSubscribers = SUM(view_top_uk_youtubers_2024[total_subscribers])
VAR sumOfTotalvideos = SUM(view_top_uk_youtubers_2024[total_videos])
VAR subscriberEngRate =DIVIDE(sumOfTotalSubscribers, sumOfTotalvideos, BLANK())

RETURN subscriberEngRate
```

# Analysis

## Findings
- What did we find?
For this analysis, we're going to focus on the questions below to get the information we need for our marketing client -

Here are the key questions we need to answer for our marketing client:

1. Who are the top 10 YouTubers with the most subscribers?
2. Which 3 channels have uploaded the most videos?
3. Which 3 channels have the most views?
4. Which 3 channels have the highest average views per video?
5. Which 3 channels have the highest views per subscriber ratio?
6. Which 3 channels have the highest subscriber engagement rate per video uploaded?

#### 1. Who are the top 10 YouTubers with the most subscribers?
|Rank |Channel Name    |Subscribers (M)|
| --------- | ------- | ------- |
|1 |NoCopyrightSounds  |33.60|
|2 |DanTDM             |28.60|
|3 |Dan Rhodes         |26.50|
|4 |Miss Katy          |24.50|
|5 |Mister Max         |24.40|
|6 |KSI                |24.10|
|7 |Jelly              |23.50|
|8 |Dua Lipa           |23.30|
|9 |Sidemen            |21.00|
|10 |Ali-A             |18.90|

#### 2. Which 3 channels have uploaded the most videos?
|Rank |Channel Name    |Videos Uploaded|
| --------- | ------- | ------- |
|1 |GRM Daily  |14,696|
|2 |Manchester City   |8,248|
|3 |Yogscast    |6,435|

#### 3. Which 3 channels have the most views?
|Rank |Channel Name    |Total Views (B)|
| --------- | ------- | ------- |
|1 |DanTDM  |19.78|
|2 |Dan Rhodes   |18.56|
|3 |Mister Max   |15.97|

#### 4. Which 3 channels have the highest average views per video?
|Rank |Channel Name    |Averge Views per Video (M)|
| --------- | ------- | ------- |
|1 |Mark Ronson  |32.27|
|2 |Jessie J  |5.97|
|3 |Dua Lipa   |5.76|

#### 5. Which 3 channels have the highest views per subscriber ratio?
|Rank |Channel Name    |Views per Subscriber|
| --------- | ------- | ------- |
|1 |GRM Daily  |1185.79|
|2 |Nickelodeon  |1061.04|
|3 |Disney Junior UK   |1031.97|

#### 6. Which 3 channels have the highest subscriber engagement rate per video uploaded?
|Rank |Channel Name    |Subscriber Engagement Rate|
| --------- | ------- | ------- |
|1 |Mark Ronson  |343,000|
|2 |Jessie J  |110,416.67|
|3 |Dua Lipa   |104,954.95|

### Notes
For this analysis, we’ll prioritize analysing the metrics that are important in generating the expected ROI for our marketing client, which are the YouTube channels wuth the most

  - subscribers
  - total views
  - videos uploaded

# Validation

### 1. Youtubers with the most subscribers
#### Calculation breakdown
Campaign idea = product placement

a. NoCopyrightSounds
- Average views per video = 6.92 million
- Product cost = $5
- Potential units sold per video = 6.92 million x 2% conversion rate = 138,400 units sold
- Potential revenue per video = 138,400 x $5 = $692,000
- Campaign cost (one-time fee) = $50,000
- ##### Net profit = $692,000 - $50,000 = $642,000

b. DanTDM

- Average views per video = 5.34 million
- Product cost = $5
- Potential units sold per video = 5.34 million x 2% conversion rate = 106,800 units sold
- Potential revenue per video = 106,800 x $5 = $534,000
- Campaign cost (one-time fee) = $50,000
- ##### Net profit = $534,000 - $50,000 = $484,000

c. Dan Rhodes

- Average views per video = 11.15 million
- Product cost = $5
- Potential units sold per video = 11.15 million x 2% conversion rate = 223,000 units sold
- Potential revenue per video = 223,000 x $5 = $1,115,000
- Campaign cost (one-time fee) = $50,000
- ##### Net profit = $1,115,000 - $50,000 = $1,065,000

Best option from category: Dan Rhodes

### 2. Youtubers with the most videos uploaded
#### Calculation breakdown
Campaign idea = sponsored video series

a. GRM Daily
- Average views per video = 510,000
- Product cost = $5
- Potential units sold per video = 510,000 x 2% conversion rate = 10,200 units sold
- Potential revenue per video = 10,200 x $5= $51,000
- Campaign cost (11-videos @ $5,000 each) = $55,000
- ##### Net profit = $51,000 - $55,000 = -$4,000 (potential loss)

b. Manchester City

- Average views per video = 240,000
- Product cost = $5
- Potential units sold per video = 240,000 x 2% conversion rate = 4,800 units sold
- Potential revenue per video = 4,800 x $5= $24,000
- Campaign cost (11-videos @ $5,000 each) = $55,000
- ##### Net profit = $24,000 - $55,000 = -$31,000 (potential loss)

b. Yogscast

- Average views per video = 710,000
- Product cost = $5
- Potential units sold per video = 710,000 x 2% conversion rate = 14,200 units sold
- Potential revenue per video = 14,200 x $5= $71,000
- Campaign cost (11-videos @ $5,000 each) = $55,000
- ##### Net profit = $71,000 - $55,000 = $16,000 (profit)

Best option from category: Yogscast

### 3. Youtubers with the most views
#### Calculation breakdown
Campaign idea = Influencer marketing

a. DanTDM

- Average views per video = 5.34 million
- Product cost = $5
- Potential units sold per video = 5.34 million x 2% conversion rate = 106,800 units sold
- Potential revenue per video = 106,800 x $5 = $534,000
- Campaign cost (3-month contract) = $130,000
- ##### Net profit = $534,000 - $130,000 = $404,000

b. Dan Rhodes

- Average views per video = 11.15 million
- Product cost = $5
- Potential units sold per video = 11.15 million x 2% conversion rate = 223,000 units sold
- Potential revenue per video = 223,000 x $5 = $1,115,000
- Campaign cost (3-month contract) = $130,000
- ##### Net profit = $1,115,000 - $130,000 = $985,000

c. Mister Max

- Average views per video = 14.06 million
- Product cost = $5
- Potential units sold per video = 14.06 million x 2% conversion rate = 281,200 units sold
- Potential revenue per video = 281,200 x $5 = $1,406,000
- Campaign cost (3-month contract) = $130,000
- ##### Net profit = $1,406,000 - $130,000 = $1,276,000

Best option from category: Mister Max
