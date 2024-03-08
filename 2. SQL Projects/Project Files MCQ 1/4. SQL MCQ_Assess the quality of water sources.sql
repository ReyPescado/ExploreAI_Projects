-- Finding the Water Quality Table
SELECT 
	*
FROM 
	water_quality;
    
-- Find records where the subject_quality_score is 10 and Visit count = 2
SELECT 
	*
FROM 
	water_quality
WHERE
	subjective_quality_score = 10
    AND visit_count = 2;
   
 -- Counting records where the subject_quality_score is 10 and Visit count = 2  
SELECT 
	Count(*)
FROM 
	water_quality
WHERE
	subjective_quality_score = 10
    AND visit_count = 2;

    