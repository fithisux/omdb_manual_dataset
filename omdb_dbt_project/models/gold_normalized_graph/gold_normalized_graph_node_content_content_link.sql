{{ config(materialized='table') }}

with source_content_link_nodes as (

    select

    distinct language_iso_639_1, source, key
    
    FROM {{ ref('gold_normalized_content_content_link') }}

)

select * from source_content_link_nodes