{{ config(materialized='table') }}

with source_job_description_nodes as (

    select

    distinct job_id
    
    FROM {{ ref('job_gold') }}

)

select * from source_job_description_nodes