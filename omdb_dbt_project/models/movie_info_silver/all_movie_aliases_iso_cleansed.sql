{{ config(materialized='table') }}

with source_all_movie_aliases_iso_cleansed as (

    select

    *
    
    FROM {{ ref('all_movie_aliases_iso_with_types') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})

)

select distinct movie_id, language_iso_639_1, name, official_translation from source_all_movie_aliases_iso_cleansed