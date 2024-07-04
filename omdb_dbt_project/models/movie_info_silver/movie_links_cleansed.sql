{{ config(materialized='table') }}

with source_movie_links_cleansed as (

    select

    *
    
    FROM {{ ref('movie_links_with_types') }}

)

select * from source_movie_links_cleansed