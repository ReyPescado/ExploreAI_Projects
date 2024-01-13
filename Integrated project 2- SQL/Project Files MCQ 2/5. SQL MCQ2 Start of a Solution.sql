-- Ranking type of source by Total Number of people using it.
SELECT
		type_of_water_source,
        ROUND(SUM(number_of_people_served)) AS People_served,
        RANK() OVER(
			ORDER BY ROUND(SUM(number_of_people_served)) DESC) AS rank_by_population
	FROM
		water_source
	WHERE
		type_of_water_source NOT IN ('tap_in_home')
	GROUP BY
		type_of_water_source
	ORDER BY
		People_served DESC;
        
-- Ranking most used sources to be fixed first
SELECT
	source_id,
    type_of_water_source,
	number_of_people_served,
	RANK() OVER(
		PARTITION BY type_of_water_source
        ORDER BY number_of_people_served DESC) AS priority_rank
	FROM
		water_source
	WHERE
		type_of_water_source NOT IN ('tap_in_home')
	;
        

-- DENSE Ranking most used sources to be fixed first
SELECT
	source_id,
    type_of_water_source,
	number_of_people_served,
	 DENSE_RANK() OVER(
		PARTITION BY type_of_water_source
        ORDER BY number_of_people_served DESC) AS Dense_priority_rank
	FROM
		water_source;
        
        
        
-- ROW_Number most used sources to be fixed first
SELECT
	source_id,
    type_of_water_source,
	number_of_people_served,
	 ROW_NUMBER() OVER(
		PARTITION BY type_of_water_source
        ORDER BY number_of_people_served DESC) AS Row_rank
	FROM
		water_source
	WHERE
		type_of_water_source NOT IN ('tap_in_home')
	;
