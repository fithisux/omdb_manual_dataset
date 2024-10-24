{{ config(materialized='table') }}

with source_job_description_nodes as (

    select

    distinct name, language_iso_639_1
    
    FROM {{ ref('gold_normalized_job') }}

)

select * from source_job_description_nodes