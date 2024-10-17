{{ config(materialized='table') }}

with source_content_movie_gold as (

    select

*
    
    FROM {{ ref('content_movie_gold') }}



)

select * from source_content_movie_gold