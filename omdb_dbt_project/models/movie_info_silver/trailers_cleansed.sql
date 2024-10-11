{{ config(materialized='table') }}

with source_trailers_cleansed as (

    select

    *
    
    FROM {{ ref('trailers_with_types') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})
)

select * from source_trailers_cleansed