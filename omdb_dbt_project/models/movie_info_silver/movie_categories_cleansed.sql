{{ config(materialized='table') }}

with source_movie_categories_cleansed as (

    select

    *
    
    FROM {{ ref('movie_categories_with_types') }}

   -- where parent_id in (select id FROM {{ref('all_movie_aliases_iso_cleansed')}})

)

select * from source_movie_categories_cleansed