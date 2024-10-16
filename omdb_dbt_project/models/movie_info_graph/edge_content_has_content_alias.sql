{{ config(materialized='table') }}

with source_has_alias_edges as (

    select

    content_id as src_content_id, content_id as dst_content_id, language_iso_639_1 as dst_language_iso_639_1, name as dst_name
    
    FROM {{ ref('content_aliases_iso_gold') }}
)

select * from source_has_alias_edges