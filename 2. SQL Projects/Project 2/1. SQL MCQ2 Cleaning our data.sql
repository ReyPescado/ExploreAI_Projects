SET SQL_SAFE_UPDATES = 0;

-- Creating Emails for employees

/* sample email: amara.jones@ndogowater.gov

E.g Amara Jones
1. change to lower case = amara jones
2. add a '.' between names = amara.jones  
3. add amara.jones to @ngodowater.gov
*/


SELECT * FROM md_water_services.employee;

-- Updating Email column for employees
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
'@ndogowater.gov');


-- Checking length of phone Numbers  of employees
SELECT
	phone_number,
	LENGTH(phone_number)
FROM
	employee;
    
-- Trimming whitespaces from Phone Number column
SELECT
	TRIM(phone_number)
FROM
	employee;
    
    
-- Updating Phone Number Columns
UPDATE
	employee
SET
	phone_number = TRIM(phone_number);
