{{ config(materialized='table') }}

with source_all_votes_cleansed as (

    select

    *
    
    FROM {{ ref('all_votes_with_types') }}

   -- where parent_id in (select id FROM {{ref('all_movie_aliases_iso_cleansed')}})

)

select * from source_all_votes_cleansed