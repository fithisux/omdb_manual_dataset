{{ config(materialized='table') }}

with source_job_names as (

    select

    distinct *
    
    FROM {{ ref('silver_casted_job_names') }}

)

select * from source_job_names