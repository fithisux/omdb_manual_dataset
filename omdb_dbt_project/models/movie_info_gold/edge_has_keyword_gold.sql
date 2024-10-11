{{ config(materialized='table') }}

with source_has_keyword_gold as (

    select

    *
    
    FROM {{ ref('movie_keywords_cleansed') }}

)

select * from source_has_keyword_gold