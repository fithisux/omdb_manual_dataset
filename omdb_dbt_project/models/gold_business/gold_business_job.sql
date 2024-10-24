{{ config(materialized='table') }}

with source_job as (
    
    select job_id, array_agg(ROW(name, language_iso_639_1)::omdb_name_type) as names
    FROM {{ref('gold_normalized_job')}}
    group by job_id

)

select * from source_job