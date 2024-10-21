{{ config(materialized='table') }}

with source_content_has_cast_edges as (

    select

    job_id as src_job_id, name as dst_name, language_iso_639_1 as dst_language_iso_639_1
    
    FROM {{ ref('job_gold') }}

)

select * from source_content_has_cast_edges