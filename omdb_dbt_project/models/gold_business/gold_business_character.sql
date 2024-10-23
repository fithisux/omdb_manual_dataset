{{ config(materialized='table') }}

with source_all_characters as (

    select

    *
    
    FROM {{ ref('gold_denormalized_character') }}

)

select * from source_all_characters