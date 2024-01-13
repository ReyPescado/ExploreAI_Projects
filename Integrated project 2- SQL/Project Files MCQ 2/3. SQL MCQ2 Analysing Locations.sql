-- looking at location tables
	SELECT
		province_name,
        town_name,
        location_type
	FROM
		md_water_services.location;
        
	-- Number of Records per town (Like a COUNTIF Formula)
    SELECT
        town_name,
        COUNT(town_name) AS records_per_town
	FROM
		md_water_services.location
	GROUP BY
		town_name
	ORDER BY
		records_per_town DESC;
        
	-- Number of Records per Province
    SELECT
        province_name,
        COUNT(province_name) AS records_per_province
	FROM
		md_water_services.location
	GROUP BY
		province_name
	ORDER BY
		records_per_province DESC;
        
        
	-- Results showing Province_name, Town_name and Number of Records per town
    SELECT
        province_name,
        town_name,
        COUNT(town_name) AS records_per_town
	FROM
		md_water_services.location
	GROUP BY
		 province_name,
        town_name
    ORDER BY
		province_name,
		records_per_town DESC;
        
        
	-- Number of records per location type
    SELECT
       location_type,
        COUNT(location_type) AS num_sources
	FROM
		md_water_services.location
	GROUP BY
		location_type;
        
        
	-- Converting to percentges: Number of records per location type (might a windows function work here)
   SELECT 
	ROUND(15910 / (15910 + 23740) * 100) AS 'Percent_Urban',
    ROUND(23740 / (15910 + 23740) * 100) AS 'Percent_Rural';
    