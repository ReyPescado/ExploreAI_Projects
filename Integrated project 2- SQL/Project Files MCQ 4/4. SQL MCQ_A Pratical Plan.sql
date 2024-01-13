-- Creating a Project_progress table (Understand meaning of some constraints)
CREATE TABLE Project_progress (
Project_id SERIAL PRIMARY KEY,
source_id VARCHAR(20) NOT NULL REFERENCES water_source(source_id) ON DELETE CASCADE ON UPDATE CASCADE,
Address VARCHAR(50), -- Street address
Town VARCHAR(30),
Province VARCHAR(30),
Source_type VARCHAR(50),
Improvement VARCHAR(50), -- What the engineers should do at that place
Source_status VARCHAR(50) DEFAULT 'Backlog' CHECK (Source_status IN ('Backlog', 'In progress', 'Complete')),
Date_of_completion DATE, 
Comments TEXT
);


--  Creating a Project_progress_query
SELECT
location.address,
location.town_name,
location.province_name,
water_source.source_id,
water_source.type_of_water_source,
well_pollution.results
FROM
	water_source
LEFT JOIN
	well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
	visits ON water_source.source_id = visits.source_id
INNER JOIN
	location ON location.location_id = visits.location_id
WHERE
	visits.visit_count = 1
    AND ( well_pollution.results != 'clean'
		OR water_source.type_of_water_source IN ('tap_in_home_broken','river')
        OR (water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30)
	);
    
    
-- Building on the Project_progress_query for Engineers
SELECT
location.address,
location.town_name,
location.province_name,
water_source.source_id,
water_source.type_of_water_source,
well_pollution.results,
CASE		
	WHEN well_pollution.results = 'Contaminated: Biological' THEN 'Install UV Filter'
	WHEN well_pollution.results = 'Contaminated: Chemical' THEN 'Install RO Filter'
    WHEN water_source.type_of_water_source = 'river' THEN 'Drill well'
    WHEN water_source.type_of_water_source = 'shared_tap'AND visits.time_in_queue >= 30 THEN CONCAT("Install ", FLOOR(visits.time_in_queue/30), " taps nearby")
    WHEN water_source.type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
    ELSE null 
END AS Improvement
FROM
	water_source
LEFT JOIN
	well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
	visits ON water_source.source_id = visits.source_id
INNER JOIN
	location ON location.location_id = visits.location_id
WHERE
	visits.visit_count = 1
    AND ( well_pollution.results != 'clean'
		OR water_source.type_of_water_source IN ('tap_in_home_broken','river')
        OR (water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30)
	);
    
    
-- Updating project_progress table with project query results
INSERT INTO project_progress (Address, Town, Province, source_id, Source_type, Improvement)
SELECT
location.address,
location.town_name,
location.province_name,
water_source.source_id,
water_source.type_of_water_source,
CASE		
	WHEN well_pollution.results = 'Contaminated: Biological' THEN 'Install UV Filter'
	WHEN well_pollution.results = 'Contaminated: Chemical' THEN 'Install RO Filter'
    WHEN water_source.type_of_water_source = 'river' THEN 'Drill well'
    WHEN water_source.type_of_water_source = 'shared_tap'AND visits.time_in_queue >= 30 THEN CONCAT("Install ", FLOOR(visits.time_in_queue/30), " taps nearby")
    WHEN water_source.type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
    ELSE null 
END AS Improvement
FROM
	water_source
LEFT JOIN
	well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
	visits ON water_source.source_id = visits.source_id
INNER JOIN
	location ON location.location_id = visits.location_id
WHERE
	visits.visit_count = 1
    AND ( well_pollution.results != 'clean'
		OR water_source.type_of_water_source IN ('tap_in_home_broken','river')
        OR (water_source.type_of_water_source = 'shared_tap' AND visits.time_in_queue >= 30)
	);