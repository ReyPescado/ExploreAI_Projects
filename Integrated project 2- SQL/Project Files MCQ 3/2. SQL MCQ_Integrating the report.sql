-- Creating Auditor Report Table (1620 records
DROP TABLE IF EXISTS `auditor_report`;
CREATE TABLE `auditor_report` (
`location_id` VARCHAR(32),
`type_of_water_source` VARCHAR(64),
`true_water_source_score` int DEFAULT NULL,
`statements` VARCHAR(255)
);


-- Viewing Auditor Report Table
SELECT
	*
FROM
	auditor_report;
    

-- Grabbing the location_id and true_water_source_score from Auditor Report Table
SELECT
	location_id,
    true_water_source_score
FROM
	auditor_report
ORDER BY
	location_id;
    
-- Joining the visits table to the Auditor Report Table
SELECT
	auditor_report.location_id AS audit_location,
	auditor_report.true_water_source_score,
	visits.location_id AS visit_location,
	visits.record_id
FROM
	auditor_report
JOIN
	visits
ON 
	auditor_report.location_id = visits.location_id;


-- Joining Visits table and the water_quality table (using record_id as the connecting key)
SELECT
	auditor_report.location_id AS audit_location,
	visits.record_id,
	auditor_report.true_water_source_score AS auditor_score,
	water_quality.subjective_quality_score AS surveyor_score
FROM
	auditor_report
JOIN
	visits
ON 
	auditor_report.location_id = visits.location_id
JOIN
	water_quality
ON 
	visits.record_id = water_quality.record_id;




-- Checking to see if auditor's and exployees' scores agree (Using WHERE)
SELECT
	auditor_report.location_id AS audit_location,
	visits.record_id,
	auditor_report.true_water_source_score AS auditor_score,
	water_quality.subjective_quality_score AS surveyor_score
FROM
	auditor_report
JOIN
	visits
ON 
	auditor_report.location_id = visits.location_id
JOIN
	water_quality
ON 
	visits.record_id = water_quality.record_id
WHERE
	auditor_report.true_water_source_score = water_quality.subjective_quality_score
	AND visits.visit_count = 1
   ;
    
    
    
-- Checking incorrect records (The other 102 records)
SELECT
	auditor_report.location_id AS audit_location,
	visits.record_id,
	auditor_report.true_water_source_score AS auditor_score,
	water_quality.subjective_quality_score AS surveyor_score
FROM
	auditor_report
JOIN
	visits
ON 
	auditor_report.location_id = visits.location_id
JOIN
	water_quality
ON 
	visits.record_id = water_quality.record_id
WHERE
	auditor_report.true_water_source_score != water_quality.subjective_quality_score
	AND visits.visit_count = 1;


/*-- Checking for Errors in the type_of_water_source
SELECT
auditor_report.location_id AS audit_location,
water_source.type_of_water_source AS survey_source,
auditor_report.type_of_water_source AS auditor_source,
visits.record_id,
auditor_report.true_water_source_score AS auditor_score,
water_quality.subjective_quality_score AS surveyor_score
FROM
	auditor_report
JOIN
	visits
ON auditor_report.location_id = visits.location_id
JOIN
	water_quality
ON visits.record_id = water_quality.record_id
JOIN
	water_source
ON
	water_source.source_id = visits.source_id
WHERE
	auditor_report.true_water_source_score != water_quality.subjective_quality_score
	AND visits.visit_count = 1;
*/