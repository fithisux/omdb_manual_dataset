{{ config(materialized='table') }}

with source_category_name_has_category_edges as (

    select

    
    category_id as src_category_id, name as src_name, language_iso_639_1 as src_language_iso_639_1, category_id as dst_category_id
    
    FROM {{ ref('category_name_gold') }}

)

select * from source_category_name_has_category_edges