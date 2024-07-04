{{ config(materialized='table') }}

with source_movie_abstracts_fr_cleansed as (

    select

    *
    
    FROM {{ ref('movie_abstracts_fr_with_types') }}

)

select * from source_movie_abstracts_fr_cleansed