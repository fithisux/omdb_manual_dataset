{{ config(materialized='table') }}

with source_person_link_nodes as (

    select

    distinct language_iso_639_1, source, key
    
    FROM {{ ref('gold_normalized_content_person_link') }}
)

select * from source_person_link_nodes