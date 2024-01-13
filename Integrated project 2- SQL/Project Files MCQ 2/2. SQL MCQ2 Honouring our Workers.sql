SELECT * FROM md_water_services.visits;

-- Counting how many Employees live in each town.
SELECT
     town_name,
     COUNT(town_name)
FROM
	employee
GROUP BY
	town_name;
    
    
-- Looking at number of records collected by employees.
    SELECT 
		 assigned_employee_id,
         COUNT(visit_count) AS number_of_visits
	FROM 
		md_water_services.visits
	GROUP BY
		assigned_employee_id
	ORDER BY
		number_of_visits DESC
	LIMIT
		3;
        
	-- Name, Email, & Phone No of TOP 3 employees.
	SELECT
		employee_name,
        phone_number,
        email
	FROM	
		md_water_services.employee
	WHERE
		assigned_employee_id IN (1, 30, 34);
        
        
 -- Not so Cool Way       
SELECT
		employee_name,
        phone_number,
        email
	FROM	
		md_water_services.employee
	WHERE
		assigned_employee_id = '1'
       OR assigned_employee_id = 30
       OR assigned_employee_id = 34;