{{ config(materialized='table') }}

with source_movie_links_cleansed as (

    select

    *
    
    FROM {{ ref('movie_links_with_types') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})

)

select * from source_movie_links_cleansed