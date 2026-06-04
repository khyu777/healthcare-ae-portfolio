--grain: one row per hospital
select
    hospital_id,
    hospital_name,
    hospital_type,
    ownership_type,
    has_emergency_services,
    is_birthing_friendly,
    overall_rating
from {{ref('stg_hospital_general_info')}}