{{ config(materialized='table') }}

with source_job_gold as (

    select

    distinct *
    
    FROM {{ ref('job_names_cleansed') }}

)

select * from source_job_gold