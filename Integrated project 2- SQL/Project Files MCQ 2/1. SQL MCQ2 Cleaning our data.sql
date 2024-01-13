SET SQL_SAFE_UPDATES = 0;


SELECT * FROM md_water_services.employee;


/* sample email: amara.jones@ndogowater.gov

E.g Amara Jones
1. change to lower case = amara jones
2. add a '.' betw names = amara.jones  
3. add amara.jones to @ngodowater.gov
*/
SELECT
	CONCAT(REPLACE(LOWER(employee_name), " ", "."), '@ndogowater.gov')
FROM
	employee;





SELECT
	employee_name,
    REPLACE(LOWER(CONCAT(employee_name, '@ngodowater.gov' )), ' ', '.')
FROM
	employee;
	

SELECT * FROM md_water_services.employee;

-- Creating Emails for employees
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
'@ndogowater.gov');


-- Checking length of phone Number
SELECT
	phone_number,
	LENGTH(phone_number)
FROM
	employee;
    
-- Trimming Phone Number
SELECT
	TRIM(phone_number)
FROM
	employee;
    
    
-- Updating Phone Number Columns
UPDATE
	employee
SET
	phone_number = TRIM(phone_number);
