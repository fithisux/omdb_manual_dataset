{{ config(materialized='table') }}

with source_content_link_nodes as (

    select

    *
    
    FROM {{ ref('content_content_link_gold') }}

)

select * from source_content_link_nodes