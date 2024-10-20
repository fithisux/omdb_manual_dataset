{{ config(materialized='table') }}

with source_all_characters_cleansed as (

    select

    *
    
    FROM {{ ref('all_characters_cleansed') }}

)

select * from source_all_characters_cleansed