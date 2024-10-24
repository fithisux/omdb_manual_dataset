{{ config(materialized='table') }}

with source_content_references_nodes as (

    select

    distinct referenced_id, type
    
    FROM {{ ref('gold_normalized_content_reference') }}

)

select * from source_content_references_nodes