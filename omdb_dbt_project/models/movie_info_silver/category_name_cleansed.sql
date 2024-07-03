{{ config(materialized='table') }}

with source_category_names_cleansed as (

    select

    *
    
    FROM {{ ref('category_names_with_types') }}

   -- where parent_id in (select id FROM {{ref('all_movie_aliases_iso_cleansed')}})

)

select * from source_category_names_cleansed