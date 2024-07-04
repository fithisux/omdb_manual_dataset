{{ config(materialized='table') }}

with source_movie_countries_cleansed as (

    select

    *
    
    FROM {{ ref('movie_countries_with_types') }}

)

select * from source_movie_countries_cleansed