{{ config(materialized='table') }}

with source_content_aliases_iso_gold as (

    select

    *
    
    FROM {{ ref('all_movie_aliases_iso_cleansed') }}

)

select movie_id as id, language_iso_639_1, name, official_translation from source_content_aliases_iso_gold