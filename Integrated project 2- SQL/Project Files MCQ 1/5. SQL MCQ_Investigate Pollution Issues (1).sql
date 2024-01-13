-- Finding First Few Rows of Well_pollution Tables
SELECT 
	*
FROM 
	well_pollution
LIMIT 5;

-- Check if the results is Clean but the biological column is > 0.01
SELECT 
	*
FROM 
	well_pollution
WHERE
	results = "Clean"
    AND biological > 0.01;
    
-- Searching for the word Clean with additional characters after it in Column: Description
SELECT 
	*
FROM 
	well_pollution
WHERE
	description LIKE "Clean %";
    
-- Checking the Count of (Searching for the word Clean with additional characters after it in Column: Description)
SELECT 
	Count(*)
FROM 
	well_pollution
WHERE
	description LIKE "Clean %";
    
    
-- Updating Results in Description (Ecoli)
UPDATE 
	well_pollution
SET
	description = "Bacteria: E. coli"
WHERE
	description = "Clean Bacteria: E. coli" ;   


-- Updating Results in Description (Giardia)
UPDATE 
	well_pollution
SET
	description = "Bacteria: Giardia Lamblia"
WHERE
	description = "Clean Bacteria: Giardia Lamblia" ;  



-- Updating Results Column from Clean to Contaminted
UPDATE 
	well_pollution
SET 
	results = "Contaminated: Biological"
WHERE
	biological > 0.01
    AND results = "Clean";


-- Testing Changes
SELECT
*
FROM
	well_pollution
WHERE
	description LIKE "Clean_%"
OR (results = "Clean" AND biological > 0.01);
