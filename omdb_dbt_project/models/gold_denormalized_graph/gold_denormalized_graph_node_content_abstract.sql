{{ config(materialized='table') }}

with source_content_abstract_nodes as (

    select

    distinct language_iso_639_1, abstract
    
    FROM {{ ref('gold_denormalized_content_abstract') }}

)

select * from source_content_abstract_nodes