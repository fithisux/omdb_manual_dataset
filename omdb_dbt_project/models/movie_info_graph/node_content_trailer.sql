{{ config(materialized='table') }}

with source_content_trailers_nodes as (

    select

    *
    
    FROM {{ ref('content_trailers_gold') }}
)

select * from source_content_trailers_nodes