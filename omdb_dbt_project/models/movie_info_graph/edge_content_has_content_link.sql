{{ config(materialized='table') }}

with source_has_person_linkedges as (

    select

    content_id as src_content_id, content_id as dst_content_id, language_iso_639_1 as dst_language_iso_639_1, source as dst_source
    
    FROM {{ ref('content_links_gold') }}
)

select * from source_person_link_nodes