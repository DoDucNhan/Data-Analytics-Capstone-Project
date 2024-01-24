USE Cylistics;

-- Cleaning and create new table
CREATE TABLE IF NOT EXISTS `2022_total_tripdata_cleaned` AS (
  SELECT 
    a.ride_id, rideable_type, started_at, ended_at, 
    ride_length,
    CASE DAYOFWEEK(started_at) 
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'    
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name, end_station_name, 
    start_lat, start_lng, end_lat, end_lng, member_casual
  FROM `total_tripdata` a
  JOIN (
    SELECT ride_id, (
      EXTRACT(HOUR FROM TIMEDIFF(ended_at, started_at)) * 60 +
      EXTRACT(MINUTE FROM TIMEDIFF(ended_at, started_at)) +
      EXTRACT(SECOND FROM TIMEDIFF(ended_at, started_at)) / 60) AS ride_length
    FROM `total_tripdata`
  ) b 
  ON a.ride_id = b.ride_id
  WHERE 
    start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_length > 1 AND ride_length < 1440
);

-- set ride_id as primary key
ALTER TABLE `2022_total_tripdata_cleaned` ADD PRIMARY KEY (ride_id);    

SELECT COUNT(ride_id) AS no_of_rows       -- returned 4,333,169 from 4,410,259 so 77,090 rows removed
	FROM `2022_total_tripdata_cleaned`;
    
-- Use query to export data to csv file
SELECT *
	INTO OUTFILE 'D:/capstone/cleaned_tripdata.csv'
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	ESCAPED BY '\\'
	LINES TERMINATED BY '\n'
FROM 2022_total_tripdata_cleaned;

-- ANALYSE ---------------------------------------------------------------------------------------------------------------
-- trip time (minute) 
	-- average trip time of total users
	SELECT  ROUND(AVG(ride_length), 2) 
		FROM `2022_total_tripdata_cleaned`;

	-- average trip time of each group. this shows 12.67 minutes for members and 24.14 for casual riders
	SELECT ROUND(AVG(ride_length), 2) AS average, member_casual
		FROM `2022_total_tripdata_cleaned` 
		group by member_casual;

	-- max trip time of each group
	SELECT  ROUND(max(ride_length), 2) AS max_trip_time, member_casual
		FROM `2022_total_tripdata_cleaned` 
		group by member_casual;
        
	-- min trip time of each group
	SELECT  ROUND(min(ride_length), 2) AS max_trip_time, member_casual
		FROM `2022_total_tripdata_cleaned` 
		group by member_casual;
	
-- trip time (day)
	-- checks what days are the most popular within the week 
	SELECT  count(day_of_week) AS count, day_of_week
		FROM `2022_total_tripdata_cleaned` 
		GROUP BY day_of_week;
	
	-- checks for the most popular and least popular day for casual riders
	SELECT  count(day_of_week) AS count, day_of_week
		FROM `2022_total_tripdata_cleaned` 
		WHERE member_casual = 'casual'
		GROUP BY day_of_week;
	
	-- checks for the most popular and least popular day for members riders
	SELECT  count(day_of_week) AS count, day_of_week
		FROM `2022_total_tripdata_cleaned` 
		WHERE member_casual = 'member'
		GROUP BY day_of_week;

 -- trip time (month)
	-- selects the number of frequency of rides per month for members
	SELECT  count(month) AS count, month
		FROM `2022_total_tripdata_cleaned` 
		WHERE member_casual = 'member'
		group by month;
	
	-- selects the number of frequency of rides per month for casual riders
	SELECT  count(month) AS count, month
		FROM `2022_total_tripdata_cleaned` 
		WHERE member_casual = 'casual'	
		group by month;
            
-- trip time (hour)
	SELECT 
	  EXTRACT(HOUR from started_at) AS time_of_day, count(*) AS occurances, member_casual
	FROM `2022_total_tripdata_cleaned`
	GROUP BY
	  time_of_day, member_casual
	ORDER BY
	  time_of_day DESC;
              
-- shows the least and most frequented start station name for casual riders
SELECT count(*) AS frequency, start_station_name
  FROM `2022_total_tripdata_cleaned`
WHERE member_casual = 'casual'
GROUP BY 
  start_station_name
ORDER BY
  frequency DESC;

-- shows the least and most frequented start station name for members riders
SELECT count(*) AS frequency, start_station_name
  FROM `2022_total_tripdata_cleaned`
WHERE member_casual = 'member'
GROUP BY 
  start_station_name
ORDER BY
  frequency DESC;
  
-- shows least and most frequented end station name for members
SELECT count(*) AS frequency, end_station_name
  FROM `2022_total_tripdata_cleaned`
WHERE member_casual = 'member'
GROUP BY 
  end_station_name
ORDER BY
  frequency DESC;

-- shows least and most frequented end station name for casual riders
SELECT count(*) AS frequency, end_station_name
  FROM `2022_total_tripdata_cleaned`
WHERE member_casual = 'casual'
GROUP BY 
  end_station_name
ORDER BY
  frequency DESC;

-- Checks the most popular routes
SELECT
  COUNT(*) AS frequency,
  end_station_name,
  start_station_name
FROM
  `2022_total_tripdata_cleaned`
GROUP BY
  start_station_name,
  end_station_name
ORDER BY
  frequency DESC LIMIT 2;

-- checks the most popular routes for casual riders
SELECT
  COUNT(*) AS frequency,
  end_station_name,
  start_station_name
FROM
  `2022_total_tripdata_cleaned`
WHERE
  member_casual = 'casual'
GROUP BY
  start_station_name,
  end_station_name
ORDER BY
  frequency DESC LIMIT 2;

-- checks the most popular routes for members
SELECT
  COUNT(*) AS frequency,
  end_station_name,
  start_station_name
FROM
  `2022_total_tripdata_cleaned`
WHERE
  member_casual = 'member'
GROUP BY
  start_station_name,
  end_station_name
ORDER BY
  frequency DESC LIMIT 2;

-- checks the least popular route for member
SELECT
  COUNT(*) AS frequency,
  end_station_name,
  start_station_name
FROM
  `2022_total_tripdata_cleaned`
WHERE
  member_casual = 'member'
GROUP BY
  start_station_name,
  end_station_name
ORDER BY
  frequency ASC LIMIT 2;

-- checks the least popular route for casual riders
SELECT
  COUNT(*) AS frequency,
  end_station_name,
  start_station_name
FROM
  `2022_total_tripdata_cleaned`
WHERE
  member_casual = 'casual'
GROUP BY
  start_station_name,
  end_station_name
ORDER BY
  frequency ASC LIMIT 2;