-- Join locationa and Visits Tables
SELECT
	location.province_name,
   location.town_name,
   visits.visit_count,
   location.location_id
FROM
	location
JOIN
	visits
ON
	location.location_id = visits.location_id
;


-- Joining the Water Source table to location and Visits Tables
SELECT
	location.province_name,
   location.town_name,
   -- visits.visit_count,
   -- location.location_id,
   water_source.type_of_water_source,
   water_source.number_of_people_served
FROM
	location
JOIN
	visits
ON
	location.location_id = visits.location_id
JOIN
	water_source
ON
	visits.source_id = water_source.source_id
-- WHERE visits.location_id = 'AkHa00103'
WHERE
	visits.visit_count = 1;
    
    
-- Adding type_of_water_source and number_of_people_served columns from the water_soruce table
SELECT
	location.province_name,
   location.town_name,
   water_source.type_of_water_source,
   water_source.number_of_people_served,
   location.location_type,
   visits.time_in_queue
FROM
	location
JOIN
	visits
ON
	location.location_id = visits.location_id
JOIN
	water_source
ON
	visits.source_id = water_source.source_id
-- WHERE visits.location_id = 'AkHa00103'
WHERE
	visits.visit_count = 1;
    
    
-- Adding the results column form the Well polution table
SELECT
	location.province_name,
   location.town_name,
   water_source.type_of_water_source,
   water_source.number_of_people_served,
   location.location_type,
   visits.time_in_queue,
   well_pollution.results
FROM
	location
JOIN
	visits
ON
	location.location_id = visits.location_id
JOIN
	water_source
ON
	visits.source_id = water_source.source_id
LEFT JOIN
	well_pollution
ON 
	well_pollution.source_id = visits.source_id
WHERE
	visits.visit_count = 1;
    
    
-- Converting above quert into a View
CREATE VIEW combined_analysis AS (SELECT
	location.province_name,
   location.town_name,
   water_source.type_of_water_source,
   water_source.number_of_people_served,
   location.location_type,
   visits.time_in_queue,
   well_pollution.results
FROM
	location
JOIN
	visits
ON
	location.location_id = visits.location_id
JOIN
	water_source
ON
	visits.source_id = water_source.source_id
LEFT JOIN
	well_pollution
ON 
	well_pollution.source_id = visits.source_id
WHERE
	visits.visit_count = 1
    );