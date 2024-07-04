{{ config(materialized='table') }}

with source_movie_keywords_cleansed as (

    select

    *
    
    FROM {{ ref('movie_keywords_with_types') }}

)

select * from source_movie_keywords_cleansed