{{ config(materialized='table') }}

with source_all_votes as (

    select

    *
    
    FROM {{ ref('silver_casted_all_votes') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})

)

select * from source_all_votes