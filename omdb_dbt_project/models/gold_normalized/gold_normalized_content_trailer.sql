{{ config(materialized='table') }}

with source_content_trailers as (

    select

    *
    
    FROM {{ ref('silver_cleansed_trailers') }}
)

select movie_id as content_id, trailer_id, language_iso_639_1, source, key from source_content_trailers