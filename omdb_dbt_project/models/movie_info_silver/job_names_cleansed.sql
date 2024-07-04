{{ config(materialized='table') }}

with source_job_names_cleansed as (

    select

    distinct *
    
    FROM {{ ref('job_names_with_types') }}

)

select * from source_job_names_cleansed