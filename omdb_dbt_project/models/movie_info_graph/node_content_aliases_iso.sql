{{ config(materialized='table') }}

with source_content_aliases_iso_nodes as (

    select

    distinct language_iso_639_1, name, official_translation
    
    FROM {{ ref('content_aliases_iso_gold') }}

)

select * from source_content_aliases_iso_nodes