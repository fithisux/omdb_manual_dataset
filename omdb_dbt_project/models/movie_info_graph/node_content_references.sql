{{ config(materialized='table') }}

with source_content_references_nodes as (

    select

    distinct *
    
    FROM {{ ref('content_references_gold') }}

)

select * from source_content_references_nodes