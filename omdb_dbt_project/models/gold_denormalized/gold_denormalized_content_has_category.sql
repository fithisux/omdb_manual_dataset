{{ config(materialized='table') }}

with source_content_categories as (

    select

    *
    
    FROM {{ ref('silver_cleansed_movie_categories') }}

)

select movie_id as content_id, category_id from source_content_categories