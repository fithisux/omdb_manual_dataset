{{ config(materialized='table') }}

with source_job_gold as (
    
    select job_id, array_agg(ROW(name, language_iso_639_1)::omdb_name_type) as names
    FROM {{ref('job_gold')}}
    group by job_id

)

select * from source_job_gold