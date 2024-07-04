{{ config(materialized='table') }}

with source_movie_content_updates_cleansed as (

    select

    *
    
    FROM {{ ref('movie_content_updates_with_types') }}

)

select * from source_movie_content_updates_cleansed