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


-- Adding Water Source to locationa and Visits Tables
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
    
    
-- Adding Columns type of water and No of people served
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
    
    
-- Adding Well polution table(Results)
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
    
    
-- Creating View Combined Analysis
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