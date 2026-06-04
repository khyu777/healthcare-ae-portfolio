--grain: one row per hospital/measure combination
SELECT
    hospital_id,
    measure_id,
    performance_category
FROM {{ref('int_complications_categorized')}}