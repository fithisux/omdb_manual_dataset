{{ config(materialized='table') }}

with source_person as (

    select *
    FROM {{ref('gold_business_person')}}
)

select * from source_person