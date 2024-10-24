{{ config(materialized='table') }}

with source_job as (
    select *
    FROM {{ref('gold_business_job')}}
)

select * from source_job