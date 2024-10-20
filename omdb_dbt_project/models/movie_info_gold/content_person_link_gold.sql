{{ config(materialized='table') }}

with source_content_people_links_gold as (

    select

    *
    
    FROM {{ ref('people_links_cleansed') }}
)

select movie_id as content_id, language_iso_639_1, source, key from source_content_people_links_gold