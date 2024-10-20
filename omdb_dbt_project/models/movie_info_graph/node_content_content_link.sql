{{ config(materialized='table') }}

with source_content_link_nodes as (

    select

    distinct language_iso_639_1, source, key
    
    FROM {{ ref('content_content_link_gold') }}

)

select * from source_content_link_nodes