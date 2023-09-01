-- count number of total bike rides which are: 6,547,094
SELECT COUNT(*) AS total_rides
FROM radiant-ion-397303.cyclistic_dataset.combined_data;

-- count number of distinct bike rides which are 6,547,094. 
-- Since COUNT (above) and COUNT DISTINCT are both 6,547,094 This lets us verify that there are no duplicates.
SELECT COUNT(DISTINCT ride_id) AS distinct_rides
  FROM radiant-ion-397303.cyclistic_dataset.combined_data;

-- 3 unique types of bikes
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS num_of_rides
FROM radiant-ion-397303.cyclistic_dataset.combined_data
GROUP BY rideable_type;

-- number of rides per month and year 
SELECT
  DATE_TRUNC(started_at, MONTH) AS month,
  COUNT(*) AS num_of_rides
FROM
  radiant-ion-397303.cyclistic_dataset.combined_data
GROUP BY
  month
ORDER BY
  month;

-- the number of rides with bikes not moving from start to end long/lat: 337,598 (this data will be cleaned)
-- this query also allowed me to see how long these "rides" were in seconds, many were NOT 0 seconds.
  SELECT 
  *, 
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_length_seconds,
FROM radiant-ion-397303.cyclistic_dataset.combined_data
WHERE start_lat = end_lat 
  AND start_lng = end_lng;

-- finding how many bike rides ended before the start time: (A small quantity of rides detected, need to decide whether to remove or fix data. Likely just switch the start and end times)
SELECT
  *  
FROM
  radiant-ion-397303.cyclistic_dataset.combined_data
WHERE
  ended_at < started_at;

-- find how many bike rides lasted less than 60 seconds: 169,535 (riding for less than a minute could be data that needs to be removed, it is questionably short amount of time and likely to alter analysis results, average riding time)
SELECT
  COUNT(*)
FROM radiant-ion-397303.cyclistic_dataset.combined_data
WHERE TIMESTAMP_DIFF(ended_at, started_at,SECOND)<60;

-- find how many bike rides were greater than 24 hours: 2,248 (riding for longer than a day is questionable, full-day passes are sold, but not multi-day passes)
SELECT 
  COUNT(*)
FROM radiant-ion-397303.cyclistic_dataset.combined_data
WHERE TIMESTAMP_DIFF(ended_at, started_at,HOUR)>24;

-- finding the number of rides that don't have a starting station name/ID OR ending station name/ID, grouped by member or casual rider
SELECT 
  DISTINCT member_casual, COUNT(member_casual)
FROM radiant-ion-397303.cyclistic_dataset.combined_data
WHERE start_station_name IS NULL 
  OR start_station_id IS NULL
  OR end_station_name IS NULL
  OR end_station_ID IS NULL
GROUP BY member_casual

