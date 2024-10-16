{{ config(materialized='table') }}

with source_job_description_nodes as (

    select

    job_id, name, language_iso_639_1
    
    FROM {{ ref('job_names_gold') }}

)

select * from source_job_description_nodes