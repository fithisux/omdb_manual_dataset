{{ config(materialized='table') }}

with source_edge_has_country_gold as (

    select

    *
    
    FROM {{ ref('movie_countries_cleansed') }}

)

select movie_id as content_id, country_code from source_edge_has_country_gold