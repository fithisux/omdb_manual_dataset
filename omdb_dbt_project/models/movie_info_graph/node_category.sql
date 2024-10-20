{{ config(materialized='table') }}

with source_category_name_nodes as (

    select

    category_id
    
    FROM {{ ref('category_gold') }}

)

select * from source_category_name_nodes