{{ config(materialized='table') }}

with source_content_link_nodes as (

    select

    *
    
    FROM {{ ref('content_links_gold') }}

)

select * from source_content_link_nodes