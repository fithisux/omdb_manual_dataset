{{ config(materialized='table') }}

with source_movie_abstracts_de as (

    select

    movie_id, string_agg(abstract, ' ;;; ') as abstract
    
    FROM {{ ref('silver_casted_movie_abstracts_de') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}}) and abstract is not null

    group by movie_id

)

select * from source_movie_abstracts_de