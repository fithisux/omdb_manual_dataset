{{ config(materialized='table') }}

with source_movie_references as (

    select

    distinct *
    
    FROM {{ ref('silver_cleansed_movie_references') }}

)

select movie_id as content_id, referenced_id, type from source_movie_references