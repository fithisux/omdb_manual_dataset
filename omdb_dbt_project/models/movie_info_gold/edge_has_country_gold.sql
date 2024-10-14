{{ config(materialized='table') }}

with source_edge_has_country_gold as (

    select

    *
    
    FROM {{ ref('movie_countries_cleansed') }}

)

select * from source_edge_has_country_gold