{{ config(materialized='table') }}

with source_category_has_root_edges as (

    select

    
    category_id as from, root_id as to
    
    FROM {{ ref('gold_business_category') }}

    where root_id is not null

)

select * from source_category_has_root_edges