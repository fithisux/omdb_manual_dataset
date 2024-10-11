{{ config(materialized='table') }}

with source_content_links_gold as (

    select

    *
    
    FROM {{ ref('movie_links_cleansed') }}

)

select * from source_content_links_gold