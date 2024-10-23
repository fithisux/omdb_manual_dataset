{{ config(materialized='table') }}

with source_edge_has_country as (

    select

    *
    
    FROM {{ ref('silver_cleansed_movie_countries') }}

)

select movie_id as content_id, country_code from source_edge_has_country