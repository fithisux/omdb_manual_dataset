{{ config(materialized='table') }}

with source_movie_details_cleansed as (

    select

    *
    
    FROM {{ ref('movie_details_with_types') }}

)

select * from source_movie_details_cleansed