-- Create database for cyclist trip data
CREATE SCHEMA IF NOT EXISTS Cylistics;
USE Cylistics;

-- Create 12 tables for 12 months in 2022
-- January 2022
create table tripdata_2022_01
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202112-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_01 
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);
        
-- February 2022
create table tripdata_2022_02
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202201-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_02
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);
        
-- March 2022
create table tripdata_2022_03
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202202-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_03 
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);

-- April 2023
create table tripdata_2022_04
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202203-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_04 
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);

-- May 2022
create table tripdata_2022_05
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202204-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_05
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);
        
-- June 2022
create table tripdata_2022_06
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202205-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_06
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);

-- July 2022
create table tripdata_2022_07
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202206-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_07
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);
        
-- August 2022
create table tripdata_2022_08
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202207-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_08
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);
        
-- September 2022
create table tripdata_2022_09
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202208-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_09
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);
        
-- October 2022
create table tripdata_2022_10
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202209-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_10
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);
        
-- November 2022
create table tripdata_2022_11
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202210-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_11
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);
        
-- December 2022
create table tripdata_2022_12
(
	ride_id char(16) primary key,
    rideable_type varchar(13),
    started_at datetime,
    ended_at datetime,
    start_station_name varchar(100),
    start_station_id varchar(100),
    end_station_name varchar(100),
    end_station_id varchar(100),
    start_lat float,
    start_lng float, 
    end_lat float,
    end_lng float,
    member_casual char(6)
);

LOAD DATA INFILE 'D:/capstone/cyclistic_data/202211-divvy-tripdata.csv' 
	INTO TABLE tripdata_2022_12
    COLUMNS 
		TERMINATED BY ','
		OPTIONALLY ENCLOSED BY '"'
	LINES 
		TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, @start_lat, @start_lng, @end_lat, @end_lng, member_casual)
    SET start_lat           = IF(@start_lat='', NULL, @start_lat),
		start_lng           = IF(@start_lng='', NULL, @start_lng),
        end_lat           	= IF(@end_lat='', NULL, @end_lat),
        end_lng           	= IF(@end_lng='', NULL, @end_lng);