{{ config(materialized='table') }}

with source_content_has_cast_edges as (

    select

    job_id as src_job_id, (content_id::varchar || '_' || person_id::varchar || '_' || job_id::varchar ) as dst_cast_id
    
    FROM {{ ref('gold_denormalized_cast') }}

)

select * from source_content_has_cast_edges