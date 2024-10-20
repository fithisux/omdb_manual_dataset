{{ config(materialized='table') }}

with source_content_trailers_nodes as (

    select

    trailer_id, language_iso_639_1, source, key
    
    FROM {{ ref('content_trailer_gold') }}
)

select * from source_content_trailers_nodes