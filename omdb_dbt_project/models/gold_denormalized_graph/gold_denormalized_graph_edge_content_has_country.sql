{{ config(materialized='table') }}

with source_content_has_countries_edges as (

    select

    content_id as src_country_id, country_code as dst_alpha2
    
    FROM {{ ref('gold_denormalized_content_has_country') }}

)

select * from source_content_has_countries_edges