-- Getting a list of all tables in DB.
SHOW TABLES;

-- Retriving first five records from each table.
-- DATA DICTIONARY TABLE
SELECT 
	*
FROM 
	data_dictionary
LIMIT 5;


-- Employee TABLE
SELECT 
	*
FROM 
	employee
LIMIT 5;


-- global_water_access TABLE
SELECT 
	*
FROM 
	global_water_access
LIMIT 5;

-- Location Tables
SELECT 
	*
FROM 
	location
LIMIT 5;


-- Visits Tables
SELECT 
	*
FROM 
	visits
LIMIT 5;


-- Water_quality Tables
SELECT 
	*
FROM 
	water_quality
LIMIT 5;


-- Water_source Tables
SELECT 
	*
FROM 
	water_source
LIMIT 5;


-- well_pollution TABLES
SELECT 
	*
FROM 
	well_pollution
LIMIT 5;