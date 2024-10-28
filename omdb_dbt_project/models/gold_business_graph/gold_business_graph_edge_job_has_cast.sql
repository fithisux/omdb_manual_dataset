{{ config(materialized='table') }}

with source_content_has_cast_edges as (

    select

    job_id as from, (content_id::varchar || '_' || person_id::varchar || '_' || job_id::varchar ) as to
    
    FROM {{ ref('gold_business_cast') }}

)

select * from source_content_has_cast_edges