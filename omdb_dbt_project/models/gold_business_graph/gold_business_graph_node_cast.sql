{{ config(materialized='table') }}


with source_cast as (

    select

    (content_id::varchar || '_' || person_id::varchar || '_' || job_id::varchar ) as cast_id, roles
    
    FROM {{ref('gold_business_cast')}}
)

select * from source_cast