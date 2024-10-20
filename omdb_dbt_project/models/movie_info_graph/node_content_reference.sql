{{ config(materialized='table') }}

with source_content_references_nodes as (

    select

    distinct referenced_id, type
    
    FROM {{ ref('content_reference_gold') }}

)

select * from source_content_references_nodes