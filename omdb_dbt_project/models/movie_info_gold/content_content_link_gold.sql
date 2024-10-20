{{ config(materialized='table') }}

with source_content_links_gold as (

    select

    *
    
    FROM {{ ref('movie_links_cleansed') }}

)

select movie_id as content_id, language_iso_639_1, source, key from source_content_links_gold