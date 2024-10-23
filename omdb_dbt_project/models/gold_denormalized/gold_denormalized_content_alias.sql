{{ config(materialized='table') }}

with source_content_aliases_iso as (

    select

    *
    
    FROM {{ ref('silver_cleansed_all_movie_aliases_iso') }}

)

select movie_id as content_id, language_iso_639_1, name, official_translation from source_content_aliases_iso