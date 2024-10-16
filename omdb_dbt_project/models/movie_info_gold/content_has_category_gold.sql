{{ config(materialized='table') }}

with source_content_categories_gold as (

    select

    *
    
    FROM {{ ref('movie_categories_cleansed') }}

)

select movie_id as content_id, category_id from source_content_categories_gold