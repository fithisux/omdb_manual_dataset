{{ config(materialized='table') }}

with source_category_name_nodes as (

    select

    *
    
    FROM {{ ref('category_name_gold') }}

)

select * from source_category_name_nodes