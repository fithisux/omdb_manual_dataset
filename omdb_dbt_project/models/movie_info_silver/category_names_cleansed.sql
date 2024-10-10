{{ config(materialized='table') }}

with source_category_names_cleansed as (

    select

    *
    
    FROM {{ ref('category_names_with_types') }}

)

select * from source_category_names_cleansed