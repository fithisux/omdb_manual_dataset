{{ config(materialized='table') }}

with source_movie_categories_cleansed as (

    select

    *
    
    FROM {{ ref('movie_categories_with_types') }}

)

select * from source_movie_categories_cleansed