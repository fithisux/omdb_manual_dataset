{{ config(materialized='table') }}

with source_category_has_parent_edges as (

    select

    
    category_id as src_category_id, parent_id as dst_category_id
    
    FROM {{ ref('category_gold') }}

    where parent_id is not null

)

select * from source_category_has_parent_edges