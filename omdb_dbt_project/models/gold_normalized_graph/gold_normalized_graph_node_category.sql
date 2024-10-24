{{ config(materialized='table') }}

with source_category_name_nodes as (

    select

    category_id
    
    FROM {{ ref('gold_normalized_category') }}

)

select * from source_category_name_nodes