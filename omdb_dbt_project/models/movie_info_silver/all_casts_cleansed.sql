{{ config(materialized='table') }}


with source_all_casts_cleansed as (

    select

    distinct *
    
    FROM {{ref('all_casts_with_types')}}

    --where movie_id in (select id FROM {{ref('all_movies_cleansed')}})
)

select * from source_all_casts_cleansed