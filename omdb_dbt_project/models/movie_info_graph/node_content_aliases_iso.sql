{{ config(materialized='table') }}

with source_content_aliases_iso_nodes as (

    select

    *
    
    FROM {{ ref('content_alisases_iso_gold') }}

)

select * from source_content_aliases_iso_nodes