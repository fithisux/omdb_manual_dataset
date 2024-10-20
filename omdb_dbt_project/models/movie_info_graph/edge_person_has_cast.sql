{{ config(materialized='table') }}

with source_person_has_cast_edges as (

    select

     person_id as src_person_id, content_id as dst_content_id, person_id as dst_person_id, job_id as dst_job_id
    
    FROM {{ ref('cast_gold') }}

)

select * from source_person_has_cast_edges