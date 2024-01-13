CREATE TABLE split
AS(SELECT 
    employee_name,
    phone_number,
    position,
    SUBSTRING(employee_name, 1, TRIM(POSITION(" " IN employee_name))-1) AS Firstname,
    SUBSTRING(employee_name, TRIM(POSITION(" " IN employee_name)+1)) AS Lastname
FROM
    employee);


SELECT 
    Lastname,
    phone_number,
    position
FROM
    md_water_services.split
WHERE
	position = "Field Surveyor"
    AND (Lastname LIKE "M%" OR Lastname LIKE "A%")
    AND (phone_number LIKE "%86%" OR phone_number LIKE "%11%");
    
    
    
    
-- SUBSTRING_INDEX(String, Delimiter type, Split at which occurence of delimiter
SELECT 
	employee_name,
    phone_number,
    position,
    SUBSTRING_INDEX(employee_name, " ", 1) AS Firstname,
    SUBSTRING_INDEX(employee_name, " ", -1) AS Lastname
FROM
    md_water_services.employee;
