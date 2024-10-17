{{ config(materialized='table') }}

with source_category_name_nodes as (

    select

    *
    
    FROM {{ ref('category_names_gold') }}

)

select * from source_category_name_nodes