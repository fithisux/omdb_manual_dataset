{{ config(materialized='table') }}

with source_person as (

    select *
    FROM {{ref('gold_denormalized_person')}}
)

select * from source_person