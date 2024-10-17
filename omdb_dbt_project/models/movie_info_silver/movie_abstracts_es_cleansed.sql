{{ config(materialized='table') }}

with source_movie_abstracts_es_cleansed as (

    select

    movie_id, string_agg(abstract, ' ;;; ') as abstract
    
    FROM {{ ref('movie_abstracts_es_with_types') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})

    group by movie_id

)

select * from source_movie_abstracts_es_cleansed