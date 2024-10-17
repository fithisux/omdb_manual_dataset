{{ config(materialized='table') }}

with source_has_person_linkedges as (

    select

    content_id as src_content_id, content_id as dst_content_id, lang as dst_lang
    
    FROM {{ ref('content_abstact_gold') }}
)

select * from source_person_link_nodes