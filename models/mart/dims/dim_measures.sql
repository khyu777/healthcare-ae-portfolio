--grain: one row per measure
SELECT DISTINCT
    measure_id,
    measure_name
FROM {{ref('stg_complications_and_deaths')}}