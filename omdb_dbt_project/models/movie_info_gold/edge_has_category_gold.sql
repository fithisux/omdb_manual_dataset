{{ config(materialized='table') }}

with source_content_categories_gold as (

    select

    *
    
    FROM {{ ref('movie_categories_cleansed') }}

)

select * from source_content_categories_gold