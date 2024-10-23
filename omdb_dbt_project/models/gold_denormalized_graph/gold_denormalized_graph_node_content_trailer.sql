{{ config(materialized='table') }}

with source_content_trailers_nodes as (

    select

    trailer_id, language_iso_639_1, source, key
    
    FROM {{ ref('gold_denormalized_content_trailer') }}
)

select * from source_content_trailers_nodes