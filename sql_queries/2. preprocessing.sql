USE Cylistics;

-- Merge all tables into one
CREATE TABLE total_tripdata AS
	SELECT * FROM tripdata_2022_01
	UNION ALL
	SELECT * FROM tripdata_2022_02
	UNION ALL
	SELECT * FROM tripdata_2022_03
	UNION ALL
	SELECT * FROM tripdata_2022_04
	UNION ALL
	SELECT * FROM tripdata_2022_05
	UNION ALL 
    SELECT * FROM tripdata_2022_06
	UNION ALL
	SELECT * FROM tripdata_2022_07
	UNION ALL
	SELECT * FROM tripdata_2022_08
	UNION ALL
	SELECT * FROM tripdata_2022_09
	UNION ALL
	SELECT * FROM tripdata_2022_10
	UNION ALL
	SELECT * FROM tripdata_2022_11
	UNION ALL
	SELECT * FROM tripdata_2022_12;
-- New table has 5733451 rows

-- Check duplicates (no duplicate since count distinct returns 5733451)
SELECT COUNT(DISTINCT ride_id) FROM total_tripdata;

-- No wrong value in ridable_type and member_casual fields
SELECT DISTINCT rideable_type FROM total_tripdata;
SELECT DISTINCT member_casual FROM total_tripdata;

-- Delete null in start and end station name
DELETE FROM total_tripdata WHERE start_station_name = '' OR end_station_name = '';

-- Delete samples that have start date/time larger than end date/time
DELETE FROM total_tripdata WHERE DATE(started_at) > DATE(ended_at);
DELETE FROM total_tripdata WHERE DATE(started_at) = DATE(ended_at) AND TIME(started_at) > TIME(ended_at);

-- Check number of instances after preprocessing -> 4410259 instances
SELECT COUNT(DISTINCT ride_id) FROM total_tripdata;

-- Use query to export data to csv file
SELECT *
	INTO OUTFILE 'D:/capstone/tripdata.csv'
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	ESCAPED BY '\\'
	LINES TERMINATED BY '\n'
FROM total_tripdata
