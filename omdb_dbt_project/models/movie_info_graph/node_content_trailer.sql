{{ config(materialized='table') }}

with source_content_trailers_nodes as (

    select

    *
    
    FROM {{ ref('content_trailer_gold') }}
)

select * from source_content_trailers_nodes