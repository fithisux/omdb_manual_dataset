{{ config(materialized='table') }}

with source_category_has_parent_edges as (

    select

    
    category_id as from, parent_id as to
    
    FROM {{ ref('gold_business_category') }}

    where parent_id is not null

)

select * from source_category_has_parent_edges