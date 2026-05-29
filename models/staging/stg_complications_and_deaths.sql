with source as (
    select * from {{ source('raw', 'complications_and_deaths') }}
),

renamed as (
    select
        -- identifiers
        `Facility ID`           as hospital_id,
        `Facility Name`         as hospital_name,

        -- location
        `Address`               as address,
        `City_Town`             as city,
        `State`                 as state,
        `ZIP Code`              as zip_code,
        `County_Parish`         as county,

        -- contact
        `Telephone Number`      as phone_number,

        -- measure
        `Measure ID`            as measure_id,
        `Measure Name`          as measure_name,
        `Compared to National`  as compared_to_national,

        -- values
        `Denominator`           as denominator,
        `Score`                 as score,
        `Lower Estimate`        as lower_estimate,
        `Higher Estimate`       as higher_estimate,
        `Footnote`              as footnote,

        -- dates
        `Start Date`            as start_date,
        `End Date`              as end_date

    from source
)

select * from renamed