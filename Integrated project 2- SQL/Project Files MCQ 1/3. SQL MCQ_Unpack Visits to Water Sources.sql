-- Retrieving all records where the time_in_queue > 500 min. 
SELECT
	*
FROM
	visits
WHERE
	time_in_queue > 500;
    
    
-- Checking type of Water Sources that take time to Queue
SELECT
	*
FROM
	water_source
WHERE
	source_id IN ("HaZa21742224", "AkRu05234224", "SoRu36096224", "SoRu37635224", "AkKi00881224");
    
    
-- Checking type of Water Sources that take time to Queue (With Extra)
SELECT
	*
FROM
	water_source
WHERE
	source_id IN ("HaZa21742224", "AkRu05234224", "SoRu36096224", "SoRu37635224", "AkKi00881224", "AkLu01628224", "HaRu19601224", "SoRu38776224");