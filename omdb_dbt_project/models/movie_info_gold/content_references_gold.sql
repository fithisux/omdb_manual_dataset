{{ config(materialized='table') }}

with source_movie_references_cleansed as (

    select

    distinct *
    
    FROM {{ ref('movie_references_cleansed') }}

)

select * from source_movie_references_cleansed