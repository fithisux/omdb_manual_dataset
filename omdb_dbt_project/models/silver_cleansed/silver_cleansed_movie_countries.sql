{{ config(materialized='table') }}

with source_movie_countries as (

    select

    *
    
    FROM {{ ref('silver_casted_movie_countries') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})

)

select * from source_movie_countries