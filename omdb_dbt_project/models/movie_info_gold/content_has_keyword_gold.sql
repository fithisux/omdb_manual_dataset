{{ config(materialized='table') }}

with source_has_keyword_gold as (

    select

    *
    
    FROM {{ ref('movie_keywords_cleansed') }}

)

select movie_id as content_id, category_id from source_has_keyword_gold