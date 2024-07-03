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

Who are the top 10 YouTubers with the most subscribers?

Which 3 channels have uploaded the most videos?

Which 3 channels have the most views?

Which 3 channels have the highest average views per video?

Which 3 channels have the highest views per subscriber ratio?

Which 3 channels have the highest subscriber engagement rate per video uploaded?

For now, these are some of the questions we need to answer, this may change as we progress down our analysis.
