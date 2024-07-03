{{ config(materialized='table') }}

with source_all_seasons_cleansed as (

    select

    *
    
    FROM {{ ref('all_seasons_with_types') }}

   -- where parent_id in (select id FROM {{ref('all_movie_aliases_iso_cleansed')}})

)

select * from source_all_seasons_cleansed