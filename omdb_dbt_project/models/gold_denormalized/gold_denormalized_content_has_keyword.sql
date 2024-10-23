{{ config(materialized='table') }}

with source_has_keyword as (

    select

    *
    
    FROM {{ ref('silver_cleansed_movie_keywords') }}

)

select movie_id as content_id, category_id from source_has_keyword