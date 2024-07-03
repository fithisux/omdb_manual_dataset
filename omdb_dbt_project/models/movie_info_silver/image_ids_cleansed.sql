{{ config(materialized='table') }}

with source_image_ids_cleansed as (

    select

    *
    
    FROM {{ ref('image_ids_with_types') }}

   -- where parent_id in (select id FROM {{ref('all_movie_aliases_iso_cleansed')}})

)

select * from source_image_ids_cleansed