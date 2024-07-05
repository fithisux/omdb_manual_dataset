{{ config(materialized='table') }}


with source_all_casts_cleansed as (

    select

    distinct *
    
    FROM {{ref('all_casts_with_types')}}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})
)

select * from source_all_casts_cleansed