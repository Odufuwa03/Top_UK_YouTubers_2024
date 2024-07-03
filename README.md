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
