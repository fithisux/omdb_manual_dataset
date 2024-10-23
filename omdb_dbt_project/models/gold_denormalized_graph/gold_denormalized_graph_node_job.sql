{{ config(materialized='table') }}

with source_job_description_nodes as (

    select

    distinct job_id
    
    FROM {{ ref('gold_denormalized_job') }}

)

select * from source_job_description_nodes