{{ config(materialized='table') }}

with source_job as (

    select

    distinct *
    
    FROM {{ ref('silver_cleansed_job_names') }}

)

select * from source_job