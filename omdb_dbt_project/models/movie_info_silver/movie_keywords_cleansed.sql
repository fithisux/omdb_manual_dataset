{{ config(materialized='table') }}

with source_movie_keywords_cleansed as (

    select

    *
    
    FROM {{ ref('movie_keywords_with_types') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})
    and category_id in  (select category_id from {{ref('category_names_cleansed')}})

)

select * from source_movie_keywords_cleansed