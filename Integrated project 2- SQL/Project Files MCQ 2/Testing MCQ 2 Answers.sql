-- Q1
SELECT 
    CONCAT(DAY(time_of_record),
            ' ',
            MONTHNAME(time_of_record),
            ' ',
            YEAR(time_of_record))
FROM
    visits;
    
    
-- Q3
-- Looking at number of records collected by employees.
    SELECT 
		 assigned_employee_id,
         COUNT(visit_count) AS number_of_visits
	FROM 
		md_water_services.visits
	GROUP BY
		assigned_employee_id
	ORDER BY
		number_of_visits
	LIMIT
		2;
        
	-- Name, Email, & Phone No of TOP 3 employees.
	SELECT
		assigned_employee_id,
        employee_name,
        phone_number,
        email
	FROM	
		md_water_services.employee
	WHERE
		assigned_employee_id IN (20,22);

-- Q4
SELECT 
    location_id,
    time_in_queue,
    AVG(time_in_queue) OVER (PARTITION BY location_id ORDER BY visit_count) AS total_avg_queue_time
FROM 
    visits
WHERE 
visit_count > 1 -- Only shared taps were visited > 1
ORDER BY 
    location_id, time_of_record;

-- Q5
SELECT
	employee_name,
    TRIM(address)
FROM
	employee
WHERE
	employee_name = 'Farai Nia'
;
	
    
-- Q6
-- Number of Records per town
    SELECT
        town_name,
        province_name,
        COUNT(town_name) AS records_per_town
	FROM
		md_water_services.employee
	WHERE
		town_name = 'Harare'
        AND province_name = 'Kilimani'
	GROUP BY
		town_name,
        province_name;
        
        
        
-- Q7
SELECT
		type_of_water_source,
        ROUND(AVG(number_of_people_served)) AS Ave_people_per_source
	FROM
		water_source
	WHERE
		type_of_water_source = 'well'
	GROUP BY
		type_of_water_source;
        
-- Q8
SELECT
		type_of_water_source,
        ROUND(AVG(number_of_people_served)) AS Ave_people_per_source
	FROM
		water_source
	GROUP BY
		type_of_water_source;
  
  
-- Q9
SELECT 
    type_of_water_source,
    SUM(number_of_people_served) AS population_served
FROM
    water_source
WHERE 
	type_of_water_source LIKE "%tap%"
GROUP BY type_of_water_source
ORDER BY population_served DESC;

-- Q9 (2)
SELECT 
    type_of_water_source,
    SUM(number_of_people_served) AS population_served
FROM
    water_source
GROUP BY 
type_of_water_source
HAVING 
	type_of_water_source LIKE "%tap%"
ORDER BY population_served DESC;


-- Q10 TABLE IN Analysing queue