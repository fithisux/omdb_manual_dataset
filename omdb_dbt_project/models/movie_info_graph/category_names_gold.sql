{{ config(materialized='table') }}

with source_category_names_gold as (

    select

    *
    
    FROM {{ ref('category_names_cleansed') }}

)

select * from source_category_names_gold