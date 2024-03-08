-- Calculating the number of times an employee's name comes up. (How many time did an employee make mistakes)
WITH
	Incorrect_records AS (SELECT
							auditor_report.location_id AS audit_location,
							visits.record_id,
							employee.employee_name,
							auditor_report.true_water_source_score AS auditor_score,
							water_quality.subjective_quality_score AS surveyor_score,
							auditor_report.statements
							FROM
								auditor_report
							JOIN
								visits
							ON 
								auditor_report.location_id = visits.location_id
							JOIN
								water_quality
							ON visits.record_id = water_quality.record_id
							JOIN
								employee
							ON 
								employee.assigned_employee_id = 	visits.assigned_employee_id
							WHERE
								auditor_report.true_water_source_score != water_quality.subjective_quality_score
								AND visits.visit_count = 1
)
	SELECT
		employee_name,
        COUNT(employee_name) AS number_of_mistakes
	FROM
		Incorrect_records
	GROUP BY
		employee_name
	ORDER BY
		number_of_mistakes DESC;
        
        
        
-- Creating a View for Incorrect Records
CREATE VIEW Incorrect_records AS
    (SELECT 
        auditor_report.location_id AS audit_location,
        visits.record_id,
        employee.employee_name,
        auditor_report.true_water_source_score AS auditor_score,
        water_quality.subjective_quality_score AS surveyor_score,
        auditor_report.statements
    FROM
        auditor_report
	JOIN
        visits ON auditor_report.location_id = visits.location_id
	JOIN
        water_quality ON visits.record_id = water_quality.record_id
	JOIN
        employee 
	ON 
        employee.assigned_employee_id = visits.assigned_employee_id
    WHERE
        auditor_report.true_water_source_score != water_quality.subjective_quality_score
		AND visits.visit_count = 1);
            
-- Testing View	of Incorrect Records
SELECT 
    *
FROM
    Incorrect_records;
    

-- Converting Query (Number of mistakes) to CTE
WITH error_count AS ( -- This CTE calculates the number of mistakes each employee made
					SELECT
							employee_name,
							COUNT(employee_name) AS number_of_mistakes
						FROM
							Incorrect_records
                            
			/*
			Incorrect_records is a view that joins the audit report to the database
			for records where the auditor and
			employees scores are different*/

						GROUP BY
							employee_name),
                            
                 
			-- Identifying which employees made more mistakes than average
						suspect_list AS (-- This CTE SELECTS the employees with above−average mistakes
							SELECT
								employee_name,
								number_of_mistakes
							FROM
								error_count
							WHERE
								number_of_mistakes > (SELECT AVG(number_of_mistakes) FROM error_count))
                                
                                
-- This query filters all of the records where the "corrupt" employees gathered data.
SELECT
	employee_name,
	statements
FROM
	Incorrect_records
WHERE
	employee_name in (SELECT employee_name FROM suspect_list);
    
    
-- This query filters all of the records where the "corrupt" employees statements have "cash"
SELECT
	employee_name,
	statements
FROM
	Incorrect_records
WHERE
	employee_name in (SELECT employee_name FROM suspect_list)
    AND statements LIKE "%cash%";
    
    
-- Checking if other employees have "cash" in their statements 
SELECT
	employee_name,
	statements
FROM
	Incorrect_records
WHERE
	employee_name NOT IN (SELECT employee_name FROM suspect_list)
    AND statements LIKE "%cash%";
    