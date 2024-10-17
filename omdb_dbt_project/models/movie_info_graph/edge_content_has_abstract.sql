{{ config(materialized='table') }}

with source_has_abstract as (

    select

    content_id as src_content_id, content_id as dst_content_id, lang as dst_lang
    
    FROM {{ ref('content_abstract_gold') }}
)

select * from source_has_abstract