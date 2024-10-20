{{ config(materialized='table') }}

with source_content_abstract_nodes as (

    select

    distinct lang, abstract
    
    FROM {{ ref('content_abstract_gold') }}

)

select * from source_content_abstract_nodes