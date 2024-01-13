-- Looking at water_sources Tables
	SELECT
		*
	FROM
		water_source;
        
-- Total Number of People Surveyed 
	SELECT
		SUM(number_of_people_served) AS Total_number_of_residents
	FROM 
		water_source;
        
-- Number of wells, taps and rivers
	SELECT
		type_of_water_source,
        COUNT(type_of_water_source) AS Number_of_Sources
	FROM
		water_source
	GROUP BY
		type_of_water_source
	ORDER BY
		Number_of_Sources DESC;
        
        
-- Average Number of people sharing each water sources
SELECT
		type_of_water_source,
        ROUND(AVG(number_of_people_served)) AS Ave_people_per_source
	FROM
		water_source
	GROUP BY
		type_of_water_source;

-- NUmber of people getting water from each type of source
	SELECT
		type_of_water_source,
        ROUND(SUM(number_of_people_served)) AS Popuation_served
	FROM
		water_source
	GROUP BY
		type_of_water_source
	ORDER BY
		Popuation_served DESC;
        
        
-- Converting to Percentages: Number of people getting water from each type of source
	SELECT
		type_of_water_source,
        round((sum(number_of_people_served) * 100) / (select sum(number_of_people_served) from water_source)) as percentage
	FROM
		water_source
	GROUP BY
		type_of_water_source
	ORDER BY
		percentage DESC;