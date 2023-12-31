# Cyclistic-Case-Study

## Introduction
In this case study, I am tasked to perform job roles as a junior data analyst for a fictional company known as _Cyclistic_. I will be following the data analysis process: **ask, prepare, process, analyze, share, and act**

### Data Source
[divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 08/21/23]

[Include quick links to your SQL codes and Tableau later on in the project here]

## Background
Cyclistic is a bike-share program that features more than _5,800_ bicycles and _600_ docking stations. Cyclistic sets itself apart by offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can't use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

Until now, Cyclistic's marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: **Design marketing strategies aimed at converting casual riders into annual members**. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cylystic historical bike trip data to identify trends.

## Scenario 
The director of marketing believes the company's future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use _Cyclistic_ biles differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Ask
Three questions will guide the future marketing program:
1) How do annual members and casual riders use Cyclistic bikes differently?
2) Why would casual riders buy Cyclistic annual memberships?
3) How can Cyclistic use digital media to influence casual riders to become members?

_Moreno has assigned you the first question to answer:_ **How do annual members and casual riders use Cyclistic bikes differently?**

### Business Task
Convert Cyclistics’ casual riders into annual members.

## Prepare

### Data Source
I will use Cyclistic's historical trip [data](https://divvy-tripdata.s3.amazonaws.com/index.html) from July 2022 to July 2023 to analyze rider trends. The data was made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement).

### Data Organization
13 CSV files, each file containing the trip data for the month. The naming convention of each file is the following: YYYYMM-divvy-tripdata.csv

There are 13 columns in each csv file. The column names in each data set are the following: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

**R**eliable: Some issues here. Several columns have missing/NULL data, including start_station_name, start_station_id, end_station_name, end_station_id, end_lat, end_lng.

**O**riginal: No issues here. Data is stored in Cyclistic databases after collecting directly from their bikes. 

**C**omprehensive: Some issues here. Much of the location data (as mentioned earlier) is missing, makes it difficult to run geographic analyses.  

**C**urrent: No issues here. Data is current up to most recent completed month, to date (July 2023)

**C**ited: No issues here. Data is first-party data collected by Cyclistic. 

## Process
Excel has a limit of 1,048,567 rows. The data for 13 months of bike trips has over 6.5 million rows. Needed to use BigQuery to be able to combine and clean the entire dataset from July 2022 to July 2023.
I couldn't upload directly onto BigQuery due to file size limits of 100 MB so I Uploaded 13 CVS files into a Google Cloud Storage Bucket labeled: cyclistic_data_set.
From there I was able to create 13 tables in BigQuery with the format YYYYMM_tripdata.


