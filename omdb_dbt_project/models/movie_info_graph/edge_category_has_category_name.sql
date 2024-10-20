{{ config(materialized='table') }}

with source_category_has_category_name_edges as (

    select

    
    category_id as src_category_id, name as dst_name, language_iso_639_1 as dst_language_iso_639_1
    
    FROM {{ ref('category_name_gold') }}

)

select * from source_category_has_category_name_edges