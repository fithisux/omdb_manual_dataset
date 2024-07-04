{{ config(materialized='table') }}

with source_movie_abstracts_en_cleansed as (

    select

    *
    
    FROM {{ ref('movie_abstracts_en_with_types') }}
    where movie_id in (select movie_id FROM {{ref('all_movie_aliases_iso_cleansed')}})

)

select * from source_movie_abstracts_en_cleansed