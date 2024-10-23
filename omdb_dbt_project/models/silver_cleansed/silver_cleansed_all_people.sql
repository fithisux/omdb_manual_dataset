{{ config(materialized='table') }}

with source_all_people as (

    select

    *
    
    FROM {{ ref('silver_casted_all_people') }}

)

select * from source_all_people