{{ config(materialized='table') }}

with source_has_abstract as (

    select

    content_id as src_content_id, language_iso_639_1 as dst_language_iso_639_1, abstract as dst_abstract
    
    FROM {{ ref('gold_denormalized_content_abstract') }}
)

select * from source_has_abstract