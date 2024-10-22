{{ config(materialized='table') }}

with source_content_abstract_nodes as (

    select

    distinct language_iso_639_1, abstract
    
    FROM {{ ref('content_abstract_gold') }}

)

select * from source_content_abstract_nodes