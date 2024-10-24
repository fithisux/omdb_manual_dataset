{{ config(materialized='table') }}

with source_has_reference_edges as (

    select

    content_id as src_content_id, referenced_id as dst_referenced_id, type as dst_type
    
    FROM {{ ref('gold_normalized_content_reference') }}
)

select * from source_has_reference_edges