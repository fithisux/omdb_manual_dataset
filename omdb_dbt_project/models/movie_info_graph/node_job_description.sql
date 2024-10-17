{{ config(materialized='table') }}

with source_job_description_nodes as (

    select

    *
    
    FROM {{ ref('job_names_gold') }}

)

select * from source_job_description_nodes