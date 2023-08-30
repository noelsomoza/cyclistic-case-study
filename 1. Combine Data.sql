--combining 13 months of data from July 2022 to July 2023

CREATE TABLE radiant-ion-397303.cyclistic_dataset.combined_data AS (
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202207_tripdata
  UNION ALL 
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202208_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202209_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202210_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202211_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202212_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202301_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202302_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202303_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202304_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202305_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202306_tripdata
  UNION ALL
  SELECT * FROM radiant-ion-397303.cyclistic_dataset.202307_tripdata

)
;
-- count number of rides which are 6,547,094
SELECT COUNT(*) AS total_rides
FROM radiant-ion-397303.cyclistic_dataset.combined_data
