{{ config(materialized='table') }}

with source_has_person_linkedges as (

    select

    content_id as src_content_id, language_iso_639_1 as dst_language_iso_639_1, source as dst_source, key as dst_key
    
    FROM {{ ref('gold_normalized_content_content_link') }}
)

select * from source_has_person_linkedges