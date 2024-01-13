-- Viewing Visits table
SELECT 
    *
FROM
    md_water_services.visits;
    
-- How long did the survey take
SELECT
    MAX(time_of_record),
    MIN(time_of_record)
FROM
	visits;
    
SELECT
    DATEDIFF(MAX(time_of_record), MIN(time_of_record)) AS Days_taken
FROM
	visits;


-- Average total queue time for water
SELECT 
    ROUND(AVG(time_in_queue))
FROM
    md_water_services.visits
WHERE
	time_in_queue <> 0;
 
 -- Using NULLIF: Average total queue time for water
SELECT 
    ROUND(AVG(NULLIF(time_in_queue, 0)))
FROM
    md_water_services.visits;



-- Average queue time on different days
SELECT 
    DAYNAME(time_of_record) AS day_of_week,
    ROUND(AVG(NULLIF(time_in_queue,0))) AS avg_queue_time
FROM
    md_water_services.visits
GROUP BY
	DAYNAME(time_of_record)
ORDER BY
	avg_queue_time DESC;
    
    
-- Average queue time at different times
SELECT 
    TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
    ROUND(AVG(NULLIF(time_in_queue,0))) AS avg_queue_time
FROM
    md_water_services.visits
GROUP BY
	hour_of_day
ORDER BY
	hour_of_day;

-- How can we communicate this information efficiently
SELECT
TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
DAYNAME(time_of_record),
CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END AS Sunday
FROM
visits
WHERE
time_in_queue != 0; -- this exludes other sources with 0 queue times.



SELECT
TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
-- Sunday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END
),0) AS Sunday,
-- Monday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
ELSE NULL
END
),0) AS Monday,
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
ELSE NULL
END
),0) AS Tuesday,
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
ELSE NULL
END
),0) AS Wednesday,
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue
ELSE NULL
END
),0) AS Thursday,
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue
ELSE NULL
END
),0) AS Friday,
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue
ELSE NULL
END
),0) AS Saturday
FROM
visits
WHERE
time_in_queue != 0 -- this excludes other sources with 0 queue times
GROUP BY
hour_of_day
ORDER BY
hour_of_day;