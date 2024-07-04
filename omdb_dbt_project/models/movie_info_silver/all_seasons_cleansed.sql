{{ config(materialized='table') }}

with source_all_seasons_cleansed as (

    select

    *
    
    FROM {{ ref('all_seasons_with_types') }}

)

select * from source_all_seasons_cleansed