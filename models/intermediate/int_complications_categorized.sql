-- Grain: one row per hospital-measure combination
SELECT
    hospital_id,
    measure_id,
    measure_name,
    compared_to_national,
    CASE
        WHEN compared_to_national LIKE 'Better%'
            THEN 'Better'
        WHEN compared_to_national LIKE 'No Different%'
            THEN 'Average'
        WHEN compared_to_national LIKE 'Worse%'
            THEN 'Worse'
        ELSE 'Insufficient Data'
    END AS performance_category
FROM {{ref('stg_complications_and_deaths')}}