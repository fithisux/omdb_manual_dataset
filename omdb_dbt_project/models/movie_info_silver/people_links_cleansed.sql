{{ config(materialized='table') }}

with source_people_links_cleansed as (

    select

    *
    
    FROM {{ ref('people_links_with_types') }}
    where movie_id in (select movie_id from {{ref('with_cleansing_all_ids_of_original_movies_and_series')}})
)

select * from source_people_links_cleansed