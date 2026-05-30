--Grain: one row per hospital
WITH counts AS (
    SELECT
        hospital_id,
        hospital_name,
        hospital_type,
        overall_rating,
        SUM(CASE WHEN performance_category = 'Better' THEN 1 ELSE 0 END) AS better_count,
        SUM(CASE WHEN performance_category = 'Average' THEN 1 ELSE 0 END) AS average_count,
        SUM(CASE WHEN performance_category = 'Worse' THEN 1 ELSE 0 END) AS worse_count,
        SUM(CASE WHEN performance_category = 'Insufficient Data' THEN 1 ELSE 0 END) AS insufficient_data_count
    FROM {{ref('int_hospital_quality_scores')}}
    GROUP BY hospital_id, hospital_name, hospital_type, overall_rating
)

SELECT
    hospital_id,
    hospital_name,
    hospital_type,
    overall_rating,
    better_count,
    average_count,
    worse_count,
    insufficient_data_count,
    better_count + average_count + worse_count + insufficient_data_count AS total_measures
FROM counts