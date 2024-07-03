{{ config(materialized='table') }}

with source_all_movies_cleansed as (

    select

    *
    
    FROM {{ ref('all_movies_with_types') }}

   -- where parent_id in (select id FROM {{ref('all_movie_aliases_iso_cleansed')}})

)

select * from source_all_movies_cleansed