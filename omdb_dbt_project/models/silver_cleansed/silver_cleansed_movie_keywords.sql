{{ config(materialized='table') }}

with source_movie_keywords as (

    select

    *
    
    FROM {{ ref('silver_casted_movie_keywords') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})
    and category_id in  (select category_id from {{ref('silver_casted_category_names')}})

)

select * from source_movie_keywords