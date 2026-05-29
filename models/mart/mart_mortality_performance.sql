--Grain: one row per hospital
WITH counts AS (
    SELECT
        hospital_id,
        hospital_name,
        SUM(CASE WHEN performance_category = 'Better' THEN 1 ELSE 0 END) AS better_count,
        SUM(CASE WHEN performance_category = 'Average' THEN 1 ELSE 0 END) AS average_count,
        SUM(CASE WHEN performance_category = 'Worse' THEN 1 ELSE 0 END) AS worse_count,
        SUM(CASE WHEN performance_category = 'Insufficient Data' THEN 1 ELSE 0 END) AS na_count
    FROM {{ref('int_hospital_quality_scores')}}
    GROUP BY hospital_id, hospital_name
)

SELECT
    hospital_id,
    hospital_name,
    better_count,
    average_count,
    worse_count,
    na_count,
    better_count + average_count + worse_count + na_count AS total_measures
FROM counts