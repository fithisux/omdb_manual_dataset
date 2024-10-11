{{ config(materialized='table') }}

with source_all_votes_cleansed as (

    select

    *
    
    FROM {{ ref('all_votes_with_types') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})

)

select * from source_all_votes_cleansed