{{ config(materialized='table') }}

with source_content_has_cast_edges as (

    select

    content_id as src_content_id, content_id as dst_content_id, person_id as dst_person_id, job_id as dst_job_id
    
    FROM {{ ref('all_casts_gold') }}

)

select * from source_content_has_cast_edges