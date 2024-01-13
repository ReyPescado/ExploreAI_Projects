-- Finding which Employees (ID) made incorrect records
SELECT
	auditor_report.location_id AS audit_location,
	visits.record_id,
	visits.assigned_employee_id,
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



-- Finding which Employees (Names) made incorrect records
SELECT
	auditor_report.location_id AS audit_location,
	visits.record_id,
	employee.employee_name,
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
JOIN
	employee
ON 
	employee.assigned_employee_id = visits.assigned_employee_id
WHERE
	auditor_report.true_water_source_score != water_quality.subjective_quality_score
	AND visits.visit_count = 1;
    
    
-- Converting to CTE
WITH
	Incorrect_records AS (SELECT
								auditor_report.location_id AS audit_location,
								visits.record_id,
								employee.employee_name,
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
							JOIN
								employee
							ON 
								employee.assigned_employee_id = 	visits.assigned_employee_id
							WHERE
								auditor_report.true_water_source_score != water_quality.subjective_quality_score
								AND visits.visit_count = 1
)
   -- Testing CTE
   /*SELECT
		* 
	FROM	
		Incorrect_records;*/
	
   /* -- Selecting Distinct Employee Names (17 names)
	SELECT
		DISTINCT(employee_name)
	FROM
		Incorrect_records;*/
        
	-- Counting incorrect records by employees
	SELECT
		employee_name,
        COUNT(employee_name) AS No_of_mistakes
	FROM
		Incorrect_records
	GROUP BY
		employee_name
	ORDER BY
		No_of_mistakes DESC;

