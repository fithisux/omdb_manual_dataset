{{ config(materialized='table') }}

with source_movie_references_cleansed as (

    select

    distinct *
    
    FROM {{ ref('movie_references_cleansed') }}

)

select movie_id as content_id, referenced_id, type from source_movie_references_cleansed