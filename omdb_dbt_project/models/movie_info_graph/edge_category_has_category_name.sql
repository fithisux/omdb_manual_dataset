{{ config(materialized='table') }}

with source_category_has_category_name_edges as (

    select

    
    category_id as src_category_id, category_id as dst_category_id
    
    FROM {{ ref('category_name_gold') }}

)

select * from source_category_has_category_name_edges