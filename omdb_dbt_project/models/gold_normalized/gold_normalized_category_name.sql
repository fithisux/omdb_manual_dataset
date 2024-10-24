{{ config(materialized='table') }}

with source_category_names as (

    select

    *
    
    FROM {{ ref('silver_cleansed_category_names') }}

)

select * from source_category_names