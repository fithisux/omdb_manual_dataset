{{ config(materialized='table') }}

with source_content_aliases_iso_nodes as (

    select

    distinct language_iso_639_1, name, official_translation
    
    FROM {{ ref('gold_denormalized_content_alias') }}

)

select * from source_content_aliases_iso_nodes