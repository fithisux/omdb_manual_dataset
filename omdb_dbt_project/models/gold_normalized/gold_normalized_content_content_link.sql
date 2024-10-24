{{ config(materialized='table') }}

with source_content_links as (

    select

    *
    
    FROM {{ ref('silver_cleansed_movie_links') }}

)

select movie_id as content_id, language_iso_639_1, source, key from source_content_links