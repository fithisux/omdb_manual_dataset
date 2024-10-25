{{ config(materialized='table') }}

with source_content_movie as (

    select

    id as movie_id, parent_id as movieseries_id
    
    FROM {{ ref('silver_cleansed_all_movies') }}

)

select * from source_content_movie