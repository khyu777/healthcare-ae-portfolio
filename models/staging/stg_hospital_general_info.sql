with source as (
    select * from {{ source('raw', 'hospital_general_info') }}
),

renamed as (
    select
        -- identifiers
        `Facility ID`                           as hospital_id,
        `Facility Name`                         as hospital_name,

        -- location
        `Address`                               as address,
        `City_Town`                             as city,
        `State`                                 as state,
        `ZIP Code`                              as zip_code,
        `County_Parish`                         as county,

        -- contact
        `Telephone Number`                      as phone_number,

        -- hospital attributes
        `Hospital Type`                         as hospital_type,
        `Hospital Ownership`                    as ownership_type,
        `Emergency Services`                    as has_emergency_services,
        `Meets criteria for birthing friendly designation`
                                                as is_birthing_friendly,
        -- overall rating
        `Hospital overall rating`               as overall_rating,

        -- readmission measure counts
        `READM Group Measure Count`             as readm_measure_count,
        `Count of Facility READM Measures`      as readm_facility_measure_count,
        `Count of READM Measures Better`        as readm_count_better,
        `Count of READM Measures No Different`  as readm_count_no_different,
        `Count of READM Measures Worse`         as readm_count_worse,

        -- mortality measure counts
        `MORT Group Measure Count`              as mort_measure_count,
        `Count of Facility MORT Measures`       as mort_facility_measure_count,
        `Count of MORT Measures Better`         as mort_count_better,
        `Count of MORT Measures No Different`   as mort_count_no_different,
        `Count of MORT Measures Worse`          as mort_count_worse,

        -- safety measure counts
        `Safety Group Measure Count`            as safety_measure_count,
        `Count of Facility Safety Measures`     as safety_facility_measure_count,
        `Count of Safety Measures Better`       as safety_count_better,
        `Count of Safety Measures No Different` as safety_count_no_different,
        `Count of Safety Measures Worse`        as safety_count_worse

    from source
)

select * from renamed