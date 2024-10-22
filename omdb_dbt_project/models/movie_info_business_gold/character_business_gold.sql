{{ config(materialized='table') }}

with source_all_characters_cleansed as (

    select

    *
    
    FROM {{ ref('character_gold') }}

)

select * from source_all_characters_cleansed