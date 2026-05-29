-- Grain: one row per hospital-measure combination
WITH cad AS (
    SELECT
        hospital_id,
        measure_id,
        measure_name,
        compared_to_national
    FROM {{ref('stg_complications_and_deaths')}}
),

hgi AS (
    SELECT
        hospital_id,
        hospital_name,
        hospital_type,
        ownership_type,
        has_emergency_services,
        is_birthing_friendly,
        overall_rating
    FROM {{ref('stg_hospital_general_info')}}
)

SELECT
    hgi.hospital_id,
    hgi.hospital_name,
    hgi.hospital_type,
    hgi.ownership_type,
    hgi.has_emergency_services,
    hgi.is_birthing_friendly,
    hgi.overall_rating,
    cad.measure_name,
    CASE
        WHEN compared_to_national LIKE 'Better%'
            THEN 'Better'
        WHEN compared_to_national LIKE 'No Different%'
            THEN 'Average'
        WHEN compared_to_national LIKE 'Worse%'
            THEN 'Worse'
        ELSE 'Insufficient Data'
    END AS performance_category
FROM hgi
JOIN cad
ON hgi.hospital_id = cad.hospital_id