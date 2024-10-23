{{ config(materialized='table') }}

with source_trailers as (

    select

    *
    
    FROM {{ ref('silver_casted_trailers') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})
)

select * from source_trailers