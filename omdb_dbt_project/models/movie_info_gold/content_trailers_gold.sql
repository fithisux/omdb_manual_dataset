{{ config(materialized='table') }}

with source_content_trailers_gold as (

    select

    *
    
    FROM {{ ref('trailers_cleansed') }}
)

select movie_id as content_id, trailer_id, language_iso_639_1, source, key from source_content_trailers_gold