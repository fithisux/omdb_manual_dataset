{{ config(materialized='table') }}

with source_has_abstract as (

    select

    content_id as src_content_id, lang as dst_lang, abstract as dst_abstract
    
    FROM {{ ref('content_abstract_gold') }}
)

select * from source_has_abstract