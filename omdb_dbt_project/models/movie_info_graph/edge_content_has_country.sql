{{ config(materialized='table') }}

with source_content_has_countries_edges as (

    select

    content_id as src_content_id, content_id as dst_content_id, country_code as dst_country_code
    
    FROM {{ ref('edge_has_country_gold') }}

)

select * from source_content_has_countries_edges