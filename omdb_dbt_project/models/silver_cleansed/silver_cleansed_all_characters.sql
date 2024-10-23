{{ config(materialized='table') }}

with source_all_characters as (

    select

    *
    
    FROM {{ ref('silver_casted_all_characters') }}

)

select * from source_all_characters